require 'openssl'
require 'tempfile'
require 'time'
require 'uri'
require 'set'
require 'cgi'

module Aws
  module Sigv4

    # Utility class for creating AWS signature version 4 signature. This class
    # provides two methods for generating signatures:
    #
    # * {#sign_request} - Computes a signature of the given request, returning
    #   the hash of headers that should be applied to the request.
    #
    # * {#presign_url} - Computes a presigned request with an expiration.
    #   By default, the body of this request is not signed and the request
    #   expires in 15 minutes.
    #
    # ## Configuration
    #
    # To use the signer, you need to specify the service, region, and credentials.
    # The service name is normally the endpoint prefix to an AWS service. For
    # example:
    #
    #     ec2.us-west-1.amazonaws.com => ec2
    #
    # The region is normally the second portion of the endpoint, following
    # the service name.
    #
    #     ec2.us-west-1.amazonaws.com => us-west-1
    #
    # It is important to have the correct service and region name, or the
    # signature will be invalid.
    #
    # ## Credentials
    #
    # The signer requires credentials. You can configure the signer
    # with static credentials:
    #
    #     signer = Aws::Sigv4::Signer.new(
    #       service: 's3',
    #       region: 'us-east-1',
    #       # static credentials
    #       access_key_id: 'akid',
    #       secret_access_key: 'secret'
    #     )
    #
    # You can also provide refreshing credentials via the `:credentials_provider`.
    # If you are using the AWS SDK for Ruby, you can use any of the credential
    # classes:
    #
    #     signer = Aws::Sigv4::Signer.new(
    #       service: 's3',
    #       region: 'us-east-1',
    #       credentials_provider: Aws::InstanceProfileCredentials.new
    #     )
    #
    # Other AWS SDK for Ruby classes that can be provided via `:credentials_provider`:
    #
    # * `Aws::Credentials`
    # * `Aws::SharedCredentials`
    # * `Aws::InstanceProfileCredentials`
    # * `Aws::AssumeRoleCredentials`
    # * `Aws::ECSCredentials`
    #
    # A credential provider is any object that responds to `#credentials`
    # returning another object that responds to `#access_key_id`, `#secret_access_key`,
    # and `#session_token`.
    #
    class Signer

      # @overload initialize(service:, region:, access_key_id:, secret_access_key:, session_token:nil, **options)
      #   @param [String] :service The service signing name, e.g. 's3'.
      #   @param [String] :region The region name, e.g. 'us-east-1'.
      #   @param [String] :access_key_id
      #   @param [String] :secret_access_key
      #   @param [String] :session_token (nil)
      #
      # @overload initialize(service:, region:, credentials:, **options)
      #   @param [String] :service The service signing name, e.g. 's3'.
      #   @param [String] :region The region name, e.g. 'us-east-1'.
      #   @param [Credentials] :credentials
      #
      # @overload initialize(service:, region:, credentials_provider:, **options)
      #   @param [String] :service The service signing name, e.g. 's3'.
      #   @param [String] :region The region name, e.g. 'us-east-1'.
      #   @param [#credentials] :credentials_provider An object that responds
      #     to `#credentials`, returning an instance of {Credentials} or
      #     an object that responds to:
      #
      #     * `#access_key_id`
      #     * `#secret_access_key`
      #     * `#session_token`
      #
      # @option options [Array<String>] :unsigned_headers ([]) A list of
      #   headers that should not be signed. This is useful when a proxy
      #   modifies headers, such as 'User-Agent', invalidating a signature.
      #
      # @option options [Boolean] :uri_escape_path (true) When `true`,
      #   the request URI path is uri-escaped as part of computing the canonical
      #   request string. This is required for every service, except Amazon S3,
      #   as of late 2016.
      #
      # @option options [Boolean] :apply_checksum_header (true) When `true`,
      #   the computed content checksum is returned in the hash of signature
      #   headers. This is required for AWS Glacier, and optional for
      #   every other AWS service as of late 2016.
      #
      def initialize(options = {})
        @service = extract_service(options)
        @region = extract_region(options)
        @credentials_provider = extract_credentials_provider(options)
        @unsigned_headers = Set.new((options[:unsigned_headers] || []).map(&:downcase))
        @unsigned_headers << 'authorization'
        [:uri_escape_path, :apply_checksum_header].each do |opt|
          instance_variable_set("@#{opt}", options.key?(opt) ? !!options[:opt] : true)
        end
      end

      # @return [String]
      attr_reader :service

      # @return [String]
      attr_reader :region

      # @return [#credentials] Returns an object that responds
      #   to `#credentials` returning a {Credentials} object.
      attr_reader :credentials_provider

      # Computes a version 4 signature signature. Returns the resultant
      # signature as a hash of headers to apply to your HTTP request. The given
      # request is not modified.
      #
      #     signature = signer.sign(
      #       http_method: 'PUT',
      #       url: 'https://domain.com',
      #       headers: {
      #         'Abc' => 'xyz',
      #       },
      #       body: 'body' # String or IO object
      #     )
      #
      #     # Apply the following hash of headers to your HTTP request
      #     signature.headers['Host']
      #     signature.headers['X-Amz-Date']
      #     signature.headers['X-Amz-Security-Token']
      #     signature.headers['X-Amz-Content-Sha256']
      #     signature.headers['Authorization']
      #
      # In addition to computing the signature headers, the canonicalized
      # request, string to sign and content sha256 checksum are also available.
      # These values are useful for debugging signature errors returned by AWS.
      #
      #     signature.canonical_request #=> "..."
      #     signature.string_to_sign #=> "..."
      #     signature.content_sha256 #=> "..."
      #
      # @param [Hash] request
      #
      # @option request [required, String] :http_method One of
      #   'GET', 'HEAD', 'PUT', 'POST', 'PATCH', or 'DELETE'
      #
      # @option request [required, String, URI::HTTPS, URI::HTTP] :url
      #   The request URI. Must be a valid HTTP or HTTPS URI.
      #
      # @option request [optional, Hash] :headers ({}) A hash of headers
      #   to sign. If the 'X-Amz-Content-Sha256' header is set, the `:body`
      #   is optional and will not be read.
      #
      # @option request [otpional, String, IO] :body ('') The HTTP request body.
      #   A sha256 checksum is computed of the body unless the
      #   'X-Amz-Content-Sha256' header is set.
      #
      # @return [Signature] Return an instance of {Signature} that has
      #   a `#headers` method. The headers must be applied to your request.
      #
      def sign_request(request)

        creds = @credentials_provider.credentials

        http_method = extract_http_method(request)
        url = extract_url(request)
        headers = request.key?(:headers) ? request[:headers].to_hash : {}

        datetime = headers['X-Amz-Date']
        datetime ||= Time.now.utc.strftime("%Y%m%dT%H%M%SZ")
        date = datetime[0,8]

        content_sha256 = headers['X-Amz-Content-Sha256']
        content_sha256 ||= sha256_hexdigest(request[:body] || '')

        sigv4_headers = {}
        sigv4_headers['Host'] = host(url)
        sigv4_headers['X-Amz-Date'] = datetime
        sigv4_headers['X-Amz-Security-Token'] = creds.session_token if creds.session_token
        sigv4_headers['X-Amz-Content-Sha256'] ||= content_sha256 if @apply_checksum_header

        headers = headers.merge(sigv4_headers) # merge so we do not modify given headers hash

        # compute signature parts
        credential = "#{creds.access_key_id}/#{credential_scope(date)}"
        creq = canonical_request(http_method, url, headers, content_sha256)
        sts = string_to_sign(datetime, creq)
        sig = signature(creds.secret_access_key, date, sts)

        # apply signature
        sigv4_headers['Authorization'] = [
          "AWS4-HMAC-SHA256 Credential=#{credential}",
          "SignedHeaders=#{signed_headers(headers)}",
          "Signature=#{sig}",
        ].join(', ')

        # Returning the signature components.
        Signature.new(
          headers: sigv4_headers,
          string_to_sign: sts,
          canonical_request: creq,
          content_sha256: content_sha256
        )
      end

      # Signs a URL with query authentication. Using query parameters
      # to authenticate requests is useful when you want to express a
      # request entirely in a URL. This method is also referred as
      # presigning a URL.
      #
      # See [Authenticating Requests: Using Query Parameters (AWS Signature Version 4)](http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html) for more information.
      #
      # To generate a presigned URL, you must provide a HTTP URI and
      # the http method.
      #
      #     url = signer.presigned_url(
      #       http_method: 'GET',
      #       url: 'https://my-bucket.s3-us-east-1.amazonaws.com/key',
      #       expires_in: 60
      #     )
      #
      # By default, signatures are valid for 15 minutes. You can specify
      # the number of seconds for the URL to expire in.
      #
      #     url = signer.presigned_url(
      #       http_method: 'GET',
      #       url: 'https://my-bucket.s3-us-east-1.amazonaws.com/key',
      #       expires_in: 3600 # one hour
      #     )
      #
      # You can provide a hash of headers that you plan to send with the
      # request. Every 'X-Amz-*' header you plan to send with the request
      # **must** be provided, or the signature is invalid. Other headers
      # are optional, but should be provided for security reasons.
      #
      #     url = signer.presigned_url(
      #       http_method: 'PUT',
      #       url: 'https://my-bucket.s3-us-east-1.amazonaws.com/key',
      #       headers: {
      #         'X-Amz-Meta-Custom' => 'metadata'
      #       }
      #     )
      #
      # @option options [required, String] :http_method The HTTP request method,
      #   e.g. 'GET', 'HEAD', 'PUT', 'POST', 'PATCH', or 'DELETE'.
      #
      # @option options [required, String, HTTPS::URI, HTTP::URI] :url
      #   The URI to sign.
      #
      # @option options [Hash] :headers ({}) Headers that should
      #   be signed and sent along with the request. All x-amz-*
      #   headers must be present during signing. Other
      #   headers are optional.
      #
      # @option options [Integer<Seconds>] :expires_in (900)
      #   How long the presigned URL should be valid for. Defaults
      #   to 15 minutes (900 seconds).
      #
      # @option options [optional, String, IO] :body
      #   If the `:body` is set, then a SHA256 hexdigest will be computed of the body.
      #   If `:body_digest` is set, this option is ignored. If neither are set, then
      #   the `:body_digest` will be computed of the empty string.
      #
      # @option options [optional, String] :body_digest
      #   The SHA256 hexdigest of the request body. If you wish to send the presigned
      #   request without signing the body, you can pass 'UNSIGNED-PAYLOAD' as the
      #   `:body_digest` in place of passing `:body`.
      #
      # @option options [Time] :time (Time.now) Time of the signature.
      #   You should only set this value for testing.
      #
      # @return [HTTPS::URI, HTTP::URI]
      #
      def presign_url(options)

        creds = @credentials_provider.credentials

        http_method = extract_http_method(options)
        url = extract_url(options)

        headers = options.key?(:headers) ? options[:headers].to_hash.dup : {}
        headers['Host'] = host(url)

        datetime = headers['X-Amz-Date']
        datetime ||= (options[:time] || Time.now).utc.strftime("%Y%m%dT%H%M%SZ")
        date = datetime[0,8]

        content_sha256 = headers['X-Amz-Content-Sha256']
        content_sha256 ||= options[:body_digest]
        content_sha256 ||= sha256_hexdigest(options[:body] || '')

        params = {}
        params['X-Amz-Algorithm'] = 'AWS4-HMAC-SHA256'
        params['X-Amz-Credential'] = credential(creds, date)
        params['X-Amz-Date'] = datetime
        params['X-Amz-Expires'] = extract_expires_in(options)
        params['X-Amz-SignedHeaders'] = signed_headers(headers)
        params['X-Amz-Security-Token'] = creds.session_token if creds.session_token

        params = params.map do |key, value|
          "#{uri_escape(key)}=#{uri_escape(value)}"
        end.join('&')

        if url.query
          url.query += '&' + params
        else
          url.query = params
        end

        creq = canonical_request(http_method, url, headers, content_sha256)
        sts = string_to_sign(datetime, creq)

        url.query += '&X-Amz-Signature=' + signature(creds.secret_access_key, date, sts)
        url
      end

      private

      def canonical_request(http_method, url, headers, content_sha256)
        [
          http_method,
          path(url),
          normalized_querystring(url.query || ''),
          canonical_headers(headers) + "\n",
          signed_headers(headers),
          content_sha256,
        ].join("\n")
      end

      def string_to_sign(datetime, canonical_request)
        [
          'AWS4-HMAC-SHA256',
          datetime,
          credential_scope(datetime[0,8]),
          sha256_hexdigest(canonical_request),
        ].join("\n")
      end

      def credential_scope(date)
        [
          date,
          @region,
          @service,
          'aws4_request',
        ].join('/')
      end

      def credential(creds, date)
        [creds.access_key_id, credential_scope(date)].join('/')
      end

      def signature(secret_access_key, date, string_to_sign)
        k_date = hmac("AWS4" + secret_access_key, date)
        k_region = hmac(k_date, @region)
        k_service = hmac(k_region, @service)
        k_credentials = hmac(k_service, 'aws4_request')
        hexhmac(k_credentials, string_to_sign)
      end

      def path(url)
        path = url.path
        path = '/' if path == ''
        if @uri_escape_path
          uri_escape_path(path)
        else
          path
        end
      end

      def normalized_querystring(querystring)
        params = querystring.split('&')
        params = params.map { |p| p.match(/=/) ? p : p + '=' }
        # We have to sort by param name and preserve order of params that
        # have the same name. Default sort <=> in JRuby will swap members
        # occasionally when <=> is 0 (considered still sorted), but this
        # causes our normalized query string to not match the sent querystring.
        # When names match, we then sort by their original order
        params = params.each.with_index.sort do |a, b|
          a, a_offset = a
          a_name = a.split('=')[0]
          b, b_offset = b
          b_name = b.split('=')[0]
          if a_name == b_name
            a_offset <=> b_offset
          else
            a_name <=> b_name
          end
        end.map(&:first).join('&')
      end

      def signed_headers(headers)
        headers.inject([]) do |signed_headers, (header, _)|
          header = header.downcase
          if @unsigned_headers.include?(header)
            signed_headers
          else
            signed_headers << header
          end
        end.sort.join(';')
      end

      def canonical_headers(headers)
        headers = headers.inject([]) do |headers, (k,v)|
          k = k.downcase
          if @unsigned_headers.include?(k)
            headers
          else
            headers << [k,v]
          end
        end
        headers = headers.sort_by(&:first)
        headers.map{|k,v| "#{k}:#{canonical_header_value(v.to_s)}" }.join("\n")
      end

      def canonical_header_value(value)
        value.match(/^".*"$/) ? value : value.gsub(/\s+/, ' ').strip
      end

      def host(uri)
        if standard_port?(uri)
          uri.host
        else
          "#{uri.host}:#{uri.port}"
        end
      end

      def standard_port?(uri)
        (uri.scheme == 'http' && uri.port == 80) ||
        (uri.scheme == 'https' && uri.port == 443)
      end

      # @param [File, Tempfile, IO#read, String] value
      # @return [String<SHA256 Hexdigest>]
      def sha256_hexdigest(value)
        if (File === value || Tempfile === value) && !value.path.nil? && File.exist?(value.path)
          OpenSSL::Digest::SHA256.file(value).hexdigest
        elsif value.respond_to?(:read)
          sha256 = OpenSSL::Digest::SHA256.new
          while chunk = value.read(1024 * 1024) # 1MB
            sha256.update(chunk)
          end
          value.rewind
          sha256.hexdigest
        else
          OpenSSL::Digest::SHA256.hexdigest(value)
        end
      end

      def hmac(key, value)
        OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), key, value)
      end

      def hexhmac(key, value)
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), key, value)
      end

      def extract_service(options)
        if options[:service]
          options[:service]
        else
          msg = "missing required option :service"
          raise ArgumentError, msg
        end
      end

      def extract_region(options)
        if options[:region]
          options[:region]
        else
          msg = "missing required option :region"
          raise ArgumentError, msg
        end
      end

      def extract_credentials_provider(options)
        if options[:credentials_provider]
          options[:credentials_provider]
        elsif options.key?(:credentials) || options.key?(:access_key_id)
          StaticCredentialsProvider.new(options)
        else
          raise ArgumentError, <<-MSG
missing credentials, provide credentials with one of the following options:
  - :access_key_id and :secret_access_key
  - :credentials
  - :credentials_provider
          MSG
        end
      end

      def extract_http_method(request)
        if request[:http_method]
          request[:http_method].upcase
        else
          msg = "missing required option :http_method"
          raise ArgumentError, msg
        end
      end

      def extract_url(request)
        if request[:url]
          URI.parse(request[:url].to_s)
        else
          msg = "missing required option :url"
          raise ArgumentError, msg
        end
      end

      def extract_expires_in(options)
        case options[:expires_in]
        when nil then 900.to_s
        when Integer then options[:expires_in].to_s
        else
          msg = "expected :expires_in to be a number of seconds"
          raise ArgumentError, msg
        end
      end

      def uri_escape(string)
        self.class.uri_escape(string)
      end

      def uri_escape_path(string)
        self.class.uri_escape_path(string)
      end

      class << self

        # @api private
        def uri_escape_path(path)
          path.gsub(/[^\/]+/) { |part| uri_escape(part) }
        end

        # @api private
        def uri_escape(string)
          if string.nil?
            nil
          else
            CGI.escape(string.encode('UTF-8')).gsub('+', '%20').gsub('%7E', '~')
          end
        end

      end
    end
  end
end
