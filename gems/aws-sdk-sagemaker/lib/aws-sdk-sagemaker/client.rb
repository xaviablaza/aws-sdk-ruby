# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/credentials_configuration.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/regional_endpoint.rb'
require 'aws-sdk-core/plugins/endpoint_discovery.rb'
require 'aws-sdk-core/plugins/endpoint_pattern.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/idempotency_token.rb'
require 'aws-sdk-core/plugins/jsonvalue_converter.rb'
require 'aws-sdk-core/plugins/client_metrics_plugin.rb'
require 'aws-sdk-core/plugins/client_metrics_send_plugin.rb'
require 'aws-sdk-core/plugins/transfer_encoding.rb'
require 'aws-sdk-core/plugins/http_checksum.rb'
require 'aws-sdk-core/plugins/signature_v4.rb'
require 'aws-sdk-core/plugins/protocols/json_rpc.rb'

Aws::Plugins::GlobalConfiguration.add_identifier(:sagemaker)

module Aws::SageMaker
  # An API client for SageMaker.  To construct a client, you need to configure a `:region` and `:credentials`.
  #
  #     client = Aws::SageMaker::Client.new(
  #       region: region_name,
  #       credentials: credentials,
  #       # ...
  #     )
  #
  # For details on configuring region and credentials see
  # the [developer guide](/sdk-for-ruby/v3/developer-guide/setup-config.html).
  #
  # See {#initialize} for a full list of supported configuration options.
  class Client < Seahorse::Client::Base

    include Aws::ClientStubs

    @identifier = :sagemaker

    set_api(ClientApi::API)

    add_plugin(Seahorse::Client::Plugins::ContentLength)
    add_plugin(Aws::Plugins::CredentialsConfiguration)
    add_plugin(Aws::Plugins::Logging)
    add_plugin(Aws::Plugins::ParamConverter)
    add_plugin(Aws::Plugins::ParamValidator)
    add_plugin(Aws::Plugins::UserAgent)
    add_plugin(Aws::Plugins::HelpfulSocketErrors)
    add_plugin(Aws::Plugins::RetryErrors)
    add_plugin(Aws::Plugins::GlobalConfiguration)
    add_plugin(Aws::Plugins::RegionalEndpoint)
    add_plugin(Aws::Plugins::EndpointDiscovery)
    add_plugin(Aws::Plugins::EndpointPattern)
    add_plugin(Aws::Plugins::ResponsePaging)
    add_plugin(Aws::Plugins::StubResponses)
    add_plugin(Aws::Plugins::IdempotencyToken)
    add_plugin(Aws::Plugins::JsonvalueConverter)
    add_plugin(Aws::Plugins::ClientMetricsPlugin)
    add_plugin(Aws::Plugins::ClientMetricsSendPlugin)
    add_plugin(Aws::Plugins::TransferEncoding)
    add_plugin(Aws::Plugins::HttpChecksum)
    add_plugin(Aws::Plugins::SignatureV4)
    add_plugin(Aws::Plugins::Protocols::JsonRpc)

    # @overload initialize(options)
    #   @param [Hash] options
    #   @option options [required, Aws::CredentialProvider] :credentials
    #     Your AWS credentials. This can be an instance of any one of the
    #     following classes:
    #
    #     * `Aws::Credentials` - Used for configuring static, non-refreshing
    #       credentials.
    #
    #     * `Aws::SharedCredentials` - Used for loading static credentials from a
    #       shared file, such as `~/.aws/config`.
    #
    #     * `Aws::AssumeRoleCredentials` - Used when you need to assume a role.
    #
    #     * `Aws::AssumeRoleWebIdentityCredentials` - Used when you need to
    #       assume a role after providing credentials via the web.
    #
    #     * `Aws::SSOCredentials` - Used for loading credentials from AWS SSO using an
    #       access token generated from `aws login`.
    #
    #     * `Aws::ProcessCredentials` - Used for loading credentials from a
    #       process that outputs to stdout.
    #
    #     * `Aws::InstanceProfileCredentials` - Used for loading credentials
    #       from an EC2 IMDS on an EC2 instance.
    #
    #     * `Aws::ECSCredentials` - Used for loading credentials from
    #       instances running in ECS.
    #
    #     * `Aws::CognitoIdentityCredentials` - Used for loading credentials
    #       from the Cognito Identity service.
    #
    #     When `:credentials` are not configured directly, the following
    #     locations will be searched for credentials:
    #
    #     * `Aws.config[:credentials]`
    #     * The `:access_key_id`, `:secret_access_key`, and `:session_token` options.
    #     * ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']
    #     * `~/.aws/credentials`
    #     * `~/.aws/config`
    #     * EC2/ECS IMDS instance profile - When used by default, the timeouts
    #       are very aggressive. Construct and pass an instance of
    #       `Aws::InstanceProfileCredentails` or `Aws::ECSCredentials` to
    #       enable retries and extended timeouts.
    #
    #   @option options [required, String] :region
    #     The AWS region to connect to.  The configured `:region` is
    #     used to determine the service `:endpoint`. When not passed,
    #     a default `:region` is searched for in the following locations:
    #
    #     * `Aws.config[:region]`
    #     * `ENV['AWS_REGION']`
    #     * `ENV['AMAZON_REGION']`
    #     * `ENV['AWS_DEFAULT_REGION']`
    #     * `~/.aws/credentials`
    #     * `~/.aws/config`
    #
    #   @option options [String] :access_key_id
    #
    #   @option options [Boolean] :active_endpoint_cache (false)
    #     When set to `true`, a thread polling for endpoints will be running in
    #     the background every 60 secs (default). Defaults to `false`.
    #
    #   @option options [Boolean] :adaptive_retry_wait_to_fill (true)
    #     Used only in `adaptive` retry mode.  When true, the request will sleep
    #     until there is sufficent client side capacity to retry the request.
    #     When false, the request will raise a `RetryCapacityNotAvailableError` and will
    #     not retry instead of sleeping.
    #
    #   @option options [Boolean] :client_side_monitoring (false)
    #     When `true`, client-side metrics will be collected for all API requests from
    #     this client.
    #
    #   @option options [String] :client_side_monitoring_client_id ("")
    #     Allows you to provide an identifier for this client which will be attached to
    #     all generated client side metrics. Defaults to an empty string.
    #
    #   @option options [String] :client_side_monitoring_host ("127.0.0.1")
    #     Allows you to specify the DNS hostname or IPv4 or IPv6 address that the client
    #     side monitoring agent is running on, where client metrics will be published via UDP.
    #
    #   @option options [Integer] :client_side_monitoring_port (31000)
    #     Required for publishing client metrics. The port that the client side monitoring
    #     agent is running on, where client metrics will be published via UDP.
    #
    #   @option options [Aws::ClientSideMonitoring::Publisher] :client_side_monitoring_publisher (Aws::ClientSideMonitoring::Publisher)
    #     Allows you to provide a custom client-side monitoring publisher class. By default,
    #     will use the Client Side Monitoring Agent Publisher.
    #
    #   @option options [Boolean] :convert_params (true)
    #     When `true`, an attempt is made to coerce request parameters into
    #     the required types.
    #
    #   @option options [Boolean] :correct_clock_skew (true)
    #     Used only in `standard` and adaptive retry modes. Specifies whether to apply
    #     a clock skew correction and retry requests with skewed client clocks.
    #
    #   @option options [Boolean] :disable_host_prefix_injection (false)
    #     Set to true to disable SDK automatically adding host prefix
    #     to default service endpoint when available.
    #
    #   @option options [String] :endpoint
    #     The client endpoint is normally constructed from the `:region`
    #     option. You should only configure an `:endpoint` when connecting
    #     to test or custom endpoints. This should be a valid HTTP(S) URI.
    #
    #   @option options [Integer] :endpoint_cache_max_entries (1000)
    #     Used for the maximum size limit of the LRU cache storing endpoints data
    #     for endpoint discovery enabled operations. Defaults to 1000.
    #
    #   @option options [Integer] :endpoint_cache_max_threads (10)
    #     Used for the maximum threads in use for polling endpoints to be cached, defaults to 10.
    #
    #   @option options [Integer] :endpoint_cache_poll_interval (60)
    #     When :endpoint_discovery and :active_endpoint_cache is enabled,
    #     Use this option to config the time interval in seconds for making
    #     requests fetching endpoints information. Defaults to 60 sec.
    #
    #   @option options [Boolean] :endpoint_discovery (false)
    #     When set to `true`, endpoint discovery will be enabled for operations when available.
    #
    #   @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
    #     The log formatter.
    #
    #   @option options [Symbol] :log_level (:info)
    #     The log level to send messages to the `:logger` at.
    #
    #   @option options [Logger] :logger
    #     The Logger instance to send log messages to.  If this option
    #     is not set, logging will be disabled.
    #
    #   @option options [Integer] :max_attempts (3)
    #     An integer representing the maximum number attempts that will be made for
    #     a single request, including the initial attempt.  For example,
    #     setting this value to 5 will result in a request being retried up to
    #     4 times. Used in `standard` and `adaptive` retry modes.
    #
    #   @option options [String] :profile ("default")
    #     Used when loading credentials from the shared credentials file
    #     at HOME/.aws/credentials.  When not specified, 'default' is used.
    #
    #   @option options [Proc] :retry_backoff
    #     A proc or lambda used for backoff. Defaults to 2**retries * retry_base_delay.
    #     This option is only used in the `legacy` retry mode.
    #
    #   @option options [Float] :retry_base_delay (0.3)
    #     The base delay in seconds used by the default backoff function. This option
    #     is only used in the `legacy` retry mode.
    #
    #   @option options [Symbol] :retry_jitter (:none)
    #     A delay randomiser function used by the default backoff function.
    #     Some predefined functions can be referenced by name - :none, :equal, :full,
    #     otherwise a Proc that takes and returns a number. This option is only used
    #     in the `legacy` retry mode.
    #
    #     @see https://www.awsarchitectureblog.com/2015/03/backoff.html
    #
    #   @option options [Integer] :retry_limit (3)
    #     The maximum number of times to retry failed requests.  Only
    #     ~ 500 level server errors and certain ~ 400 level client errors
    #     are retried.  Generally, these are throttling errors, data
    #     checksum errors, networking errors, timeout errors, auth errors,
    #     endpoint discovery, and errors from expired credentials.
    #     This option is only used in the `legacy` retry mode.
    #
    #   @option options [Integer] :retry_max_delay (0)
    #     The maximum number of seconds to delay between retries (0 for no limit)
    #     used by the default backoff function. This option is only used in the
    #     `legacy` retry mode.
    #
    #   @option options [String] :retry_mode ("legacy")
    #     Specifies which retry algorithm to use. Values are:
    #
    #     * `legacy` - The pre-existing retry behavior.  This is default value if
    #       no retry mode is provided.
    #
    #     * `standard` - A standardized set of retry rules across the AWS SDKs.
    #       This includes support for retry quotas, which limit the number of
    #       unsuccessful retries a client can make.
    #
    #     * `adaptive` - An experimental retry mode that includes all the
    #       functionality of `standard` mode along with automatic client side
    #       throttling.  This is a provisional mode that may change behavior
    #       in the future.
    #
    #
    #   @option options [String] :secret_access_key
    #
    #   @option options [String] :session_token
    #
    #   @option options [Boolean] :simple_json (false)
    #     Disables request parameter conversion, validation, and formatting.
    #     Also disable response data type conversions. This option is useful
    #     when you want to ensure the highest level of performance by
    #     avoiding overhead of walking request parameters and response data
    #     structures.
    #
    #     When `:simple_json` is enabled, the request parameters hash must
    #     be formatted exactly as the DynamoDB API expects.
    #
    #   @option options [Boolean] :stub_responses (false)
    #     Causes the client to return stubbed responses. By default
    #     fake responses are generated and returned. You can specify
    #     the response data to return or errors to raise by calling
    #     {ClientStubs#stub_responses}. See {ClientStubs} for more information.
    #
    #     ** Please note ** When response stubbing is enabled, no HTTP
    #     requests are made, and retries are disabled.
    #
    #   @option options [Boolean] :validate_params (true)
    #     When `true`, request parameters are validated before
    #     sending the request.
    #
    #   @option options [URI::HTTP,String] :http_proxy A proxy to send
    #     requests through.  Formatted like 'http://proxy.com:123'.
    #
    #   @option options [Float] :http_open_timeout (15) The number of
    #     seconds to wait when opening a HTTP session before raising a
    #     `Timeout::Error`.
    #
    #   @option options [Integer] :http_read_timeout (60) The default
    #     number of seconds to wait for response data.  This value can
    #     safely be set per-request on the session.
    #
    #   @option options [Float] :http_idle_timeout (5) The number of
    #     seconds a connection is allowed to sit idle before it is
    #     considered stale.  Stale connections are closed and removed
    #     from the pool before making a request.
    #
    #   @option options [Float] :http_continue_timeout (1) The number of
    #     seconds to wait for a 100-continue response before sending the
    #     request body.  This option has no effect unless the request has
    #     "Expect" header set to "100-continue".  Defaults to `nil` which
    #     disables this behaviour.  This value can safely be set per
    #     request on the session.
    #
    #   @option options [Boolean] :http_wire_trace (false) When `true`,
    #     HTTP debug output will be sent to the `:logger`.
    #
    #   @option options [Boolean] :ssl_verify_peer (true) When `true`,
    #     SSL peer certificates are verified when establishing a
    #     connection.
    #
    #   @option options [String] :ssl_ca_bundle Full path to the SSL
    #     certificate authority bundle file that should be used when
    #     verifying peer certificates.  If you do not pass
    #     `:ssl_ca_bundle` or `:ssl_ca_directory` the the system default
    #     will be used if available.
    #
    #   @option options [String] :ssl_ca_directory Full path of the
    #     directory that contains the unbundled SSL certificate
    #     authority files for verifying peer certificates.  If you do
    #     not pass `:ssl_ca_bundle` or `:ssl_ca_directory` the the
    #     system default will be used if available.
    #
    def initialize(*args)
      super
    end

    # @!group API Operations

    # Creates an *association* between the source and the destination. A
    # source can be associated with multiple destinations, and a destination
    # can be associated with multiple sources. An association is a lineage
    # tracking entity. For more information, see [Amazon SageMaker ML
    # Lineage Tracking][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html
    #
    # @option params [required, String] :source_arn
    #   The ARN of the source.
    #
    # @option params [required, String] :destination_arn
    #   The Amazon Resource Name (ARN) of the destination.
    #
    # @option params [String] :association_type
    #   The type of association. The following are suggested uses for each
    #   type. Amazon SageMaker places no restrictions on their use.
    #
    #   * ContributedTo - The source contributed to the destination or had a
    #     part in enabling the destination. For example, the training data
    #     contributed to the training job.
    #
    #   * AssociatedWith - The source is connected to the destination. For
    #     example, an approval workflow is associated with a model deployment.
    #
    #   * DerivedFrom - The destination is a modification of the source. For
    #     example, a digest output of a channel input for a processing job is
    #     derived from the original inputs.
    #
    #   * Produced - The source generated the destination. For example, a
    #     training job produced a model artifact.
    #
    # @return [Types::AddAssociationResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::AddAssociationResponse#source_arn #source_arn} => String
    #   * {Types::AddAssociationResponse#destination_arn #destination_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.add_association({
    #     source_arn: "AssociationEntityArn", # required
    #     destination_arn: "AssociationEntityArn", # required
    #     association_type: "ContributedTo", # accepts ContributedTo, AssociatedWith, DerivedFrom, Produced
    #   })
    #
    # @example Response structure
    #
    #   resp.source_arn #=> String
    #   resp.destination_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/AddAssociation AWS API Documentation
    #
    # @overload add_association(params = {})
    # @param [Hash] params ({})
    def add_association(params = {}, options = {})
      req = build_request(:add_association, params)
      req.send_request(options)
    end

    # Adds or overwrites one or more tags for the specified Amazon SageMaker
    # resource. You can add tags to notebook instances, training jobs,
    # hyperparameter tuning jobs, batch transform jobs, models, labeling
    # jobs, work teams, endpoint configurations, and endpoints.
    #
    # Each tag consists of a key and an optional value. Tag keys must be
    # unique per resource. For more information about tags, see For more
    # information, see [Amazon Web Services Tagging Strategies][1].
    #
    # <note markdown="1"> Tags that you add to a hyperparameter tuning job by calling this API
    # are also added to any training jobs that the hyperparameter tuning job
    # launches after you call this API, but not to training jobs that the
    # hyperparameter tuning job launched before you called this API. To make
    # sure that the tags associated with a hyperparameter tuning job are
    # also added to all training jobs that the hyperparameter tuning job
    # launches, add the tags when you first create the tuning job by
    # specifying them in the `Tags` parameter of
    # CreateHyperParameterTuningJob
    #
    #  </note>
    #
    # <note markdown="1"> Tags that you add to a SageMaker Studio Domain or User Profile by
    # calling this API are also added to any Apps that the Domain or User
    # Profile launches after you call this API, but not to Apps that the
    # Domain or User Profile launched before you called this API. To make
    # sure that the tags associated with a Domain or User Profile are also
    # added to all Apps that the Domain or User Profile launches, add the
    # tags when you first create the Domain or User Profile by specifying
    # them in the `Tags` parameter of CreateDomain or CreateUserProfile.
    #
    #  </note>
    #
    #
    #
    # [1]: https://aws.amazon.com/answers/account-management/aws-tagging-strategies/
    #
    # @option params [required, String] :resource_arn
    #   The Amazon Resource Name (ARN) of the resource that you want to tag.
    #
    # @option params [required, Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::AddTagsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::AddTagsOutput#tags #tags} => Array&lt;Types::Tag&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.add_tags({
    #     resource_arn: "ResourceArn", # required
    #     tags: [ # required
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.tags #=> Array
    #   resp.tags[0].key #=> String
    #   resp.tags[0].value #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/AddTags AWS API Documentation
    #
    # @overload add_tags(params = {})
    # @param [Hash] params ({})
    def add_tags(params = {}, options = {})
      req = build_request(:add_tags, params)
      req.send_request(options)
    end

    # Associates a trial component with a trial. A trial component can be
    # associated with multiple trials. To disassociate a trial component
    # from a trial, call the DisassociateTrialComponent API.
    #
    # @option params [required, String] :trial_component_name
    #   The name of the component to associated with the trial.
    #
    # @option params [required, String] :trial_name
    #   The name of the trial to associate with.
    #
    # @return [Types::AssociateTrialComponentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::AssociateTrialComponentResponse#trial_component_arn #trial_component_arn} => String
    #   * {Types::AssociateTrialComponentResponse#trial_arn #trial_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.associate_trial_component({
    #     trial_component_name: "ExperimentEntityName", # required
    #     trial_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_arn #=> String
    #   resp.trial_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/AssociateTrialComponent AWS API Documentation
    #
    # @overload associate_trial_component(params = {})
    # @param [Hash] params ({})
    def associate_trial_component(params = {}, options = {})
      req = build_request(:associate_trial_component, params)
      req.send_request(options)
    end

    # Creates an *action*. An action is a lineage tracking entity that
    # represents an action or activity. For example, a model deployment or
    # an HPO job. Generally, an action involves at least one input or output
    # artifact. For more information, see [Amazon SageMaker ML Lineage
    # Tracking][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html
    #
    # @option params [required, String] :action_name
    #   The name of the action. Must be unique to your account in an Amazon
    #   Web Services Region.
    #
    # @option params [required, Types::ActionSource] :source
    #   The source type, ID, and URI.
    #
    # @option params [required, String] :action_type
    #   The action type.
    #
    # @option params [String] :description
    #   The description of the action.
    #
    # @option params [String] :status
    #   The status of the action.
    #
    # @option params [Hash<String,String>] :properties
    #   A list of properties to add to the action.
    #
    # @option params [Types::MetadataProperties] :metadata_properties
    #   Metadata properties of the tracking entity, trial, or trial component.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to apply to the action.
    #
    # @return [Types::CreateActionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateActionResponse#action_arn #action_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_action({
    #     action_name: "ExperimentEntityName", # required
    #     source: { # required
    #       source_uri: "String2048", # required
    #       source_type: "String256",
    #       source_id: "String256",
    #     },
    #     action_type: "String256", # required
    #     description: "ExperimentDescription",
    #     status: "Unknown", # accepts Unknown, InProgress, Completed, Failed, Stopping, Stopped
    #     properties: {
    #       "StringParameterValue" => "StringParameterValue",
    #     },
    #     metadata_properties: {
    #       commit_id: "MetadataPropertyValue",
    #       repository: "MetadataPropertyValue",
    #       generated_by: "MetadataPropertyValue",
    #       project_id: "MetadataPropertyValue",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.action_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateAction AWS API Documentation
    #
    # @overload create_action(params = {})
    # @param [Hash] params ({})
    def create_action(params = {}, options = {})
      req = build_request(:create_action, params)
      req.send_request(options)
    end

    # Create a machine learning algorithm that you can use in Amazon
    # SageMaker and list in the Amazon Web Services Marketplace.
    #
    # @option params [required, String] :algorithm_name
    #   The name of the algorithm.
    #
    # @option params [String] :algorithm_description
    #   A description of the algorithm.
    #
    # @option params [required, Types::TrainingSpecification] :training_specification
    #   Specifies details about training jobs run by this algorithm, including
    #   the following:
    #
    #   * The Amazon ECR path of the container and the version digest of the
    #     algorithm.
    #
    #   * The hyperparameters that the algorithm supports.
    #
    #   * The instance types that the algorithm supports for training.
    #
    #   * Whether the algorithm supports distributed training.
    #
    #   * The metrics that the algorithm emits to Amazon CloudWatch.
    #
    #   * Which metrics that the algorithm emits can be used as the objective
    #     metric for hyperparameter tuning jobs.
    #
    #   * The input channels that the algorithm supports for training data.
    #     For example, an algorithm might support `train`, `validation`, and
    #     `test` channels.
    #
    # @option params [Types::InferenceSpecification] :inference_specification
    #   Specifies details about inference jobs that the algorithm runs,
    #   including the following:
    #
    #   * The Amazon ECR paths of containers that contain the inference code
    #     and model artifacts.
    #
    #   * The instance types that the algorithm supports for transform jobs
    #     and real-time endpoints used for inference.
    #
    #   * The input and output content formats that the algorithm supports for
    #     inference.
    #
    # @option params [Types::AlgorithmValidationSpecification] :validation_specification
    #   Specifies configurations for one or more training jobs and that Amazon
    #   SageMaker runs to test the algorithm's training code and, optionally,
    #   one or more batch transform jobs that Amazon SageMaker runs to test
    #   the algorithm's inference code.
    #
    # @option params [Boolean] :certify_for_marketplace
    #   Whether to certify the algorithm so that it can be listed in Amazon
    #   Web Services Marketplace.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateAlgorithmOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateAlgorithmOutput#algorithm_arn #algorithm_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_algorithm({
    #     algorithm_name: "EntityName", # required
    #     algorithm_description: "EntityDescription",
    #     training_specification: { # required
    #       training_image: "ContainerImage", # required
    #       training_image_digest: "ImageDigest",
    #       supported_hyper_parameters: [
    #         {
    #           name: "ParameterName", # required
    #           description: "EntityDescription",
    #           type: "Integer", # required, accepts Integer, Continuous, Categorical, FreeText
    #           range: {
    #             integer_parameter_range_specification: {
    #               min_value: "ParameterValue", # required
    #               max_value: "ParameterValue", # required
    #             },
    #             continuous_parameter_range_specification: {
    #               min_value: "ParameterValue", # required
    #               max_value: "ParameterValue", # required
    #             },
    #             categorical_parameter_range_specification: {
    #               values: ["ParameterValue"], # required
    #             },
    #           },
    #           is_tunable: false,
    #           is_required: false,
    #           default_value: "HyperParameterValue",
    #         },
    #       ],
    #       supported_training_instance_types: ["ml.m4.xlarge"], # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.p4d.24xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5n.xlarge, ml.c5n.2xlarge, ml.c5n.4xlarge, ml.c5n.9xlarge, ml.c5n.18xlarge
    #       supports_distributed_training: false,
    #       metric_definitions: [
    #         {
    #           name: "MetricName", # required
    #           regex: "MetricRegex", # required
    #         },
    #       ],
    #       training_channels: [ # required
    #         {
    #           name: "ChannelName", # required
    #           description: "EntityDescription",
    #           is_required: false,
    #           supported_content_types: ["ContentType"], # required
    #           supported_compression_types: ["None"], # accepts None, Gzip
    #           supported_input_modes: ["Pipe"], # required, accepts Pipe, File, FastFile
    #         },
    #       ],
    #       supported_tuning_job_objective_metrics: [
    #         {
    #           type: "Maximize", # required, accepts Maximize, Minimize
    #           metric_name: "MetricName", # required
    #         },
    #       ],
    #     },
    #     inference_specification: {
    #       containers: [ # required
    #         {
    #           container_hostname: "ContainerHostname",
    #           image: "ContainerImage", # required
    #           image_digest: "ImageDigest",
    #           model_data_url: "Url",
    #           product_id: "ProductId",
    #           environment: {
    #             "EnvironmentKey" => "EnvironmentValue",
    #           },
    #         },
    #       ],
    #       supported_transform_instance_types: ["ml.m4.xlarge"], # accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #       supported_realtime_inference_instance_types: ["ml.t2.medium"], # accepts ml.t2.medium, ml.t2.large, ml.t2.xlarge, ml.t2.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.12xlarge, ml.m5d.24xlarge, ml.c4.large, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5d.large, ml.c5d.xlarge, ml.c5d.2xlarge, ml.c5d.4xlarge, ml.c5d.9xlarge, ml.c5d.18xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.12xlarge, ml.r5.24xlarge, ml.r5d.large, ml.r5d.xlarge, ml.r5d.2xlarge, ml.r5d.4xlarge, ml.r5d.12xlarge, ml.r5d.24xlarge, ml.inf1.xlarge, ml.inf1.2xlarge, ml.inf1.6xlarge, ml.inf1.24xlarge
    #       supported_content_types: ["ContentType"], # required
    #       supported_response_mime_types: ["ResponseMIMEType"], # required
    #     },
    #     validation_specification: {
    #       validation_role: "RoleArn", # required
    #       validation_profiles: [ # required
    #         {
    #           profile_name: "EntityName", # required
    #           training_job_definition: { # required
    #             training_input_mode: "Pipe", # required, accepts Pipe, File, FastFile
    #             hyper_parameters: {
    #               "HyperParameterKey" => "HyperParameterValue",
    #             },
    #             input_data_config: [ # required
    #               {
    #                 channel_name: "ChannelName", # required
    #                 data_source: { # required
    #                   s3_data_source: {
    #                     s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #                     s3_uri: "S3Uri", # required
    #                     s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #                     attribute_names: ["AttributeName"],
    #                   },
    #                   file_system_data_source: {
    #                     file_system_id: "FileSystemId", # required
    #                     file_system_access_mode: "rw", # required, accepts rw, ro
    #                     file_system_type: "EFS", # required, accepts EFS, FSxLustre
    #                     directory_path: "DirectoryPath", # required
    #                   },
    #                 },
    #                 content_type: "ContentType",
    #                 compression_type: "None", # accepts None, Gzip
    #                 record_wrapper_type: "None", # accepts None, RecordIO
    #                 input_mode: "Pipe", # accepts Pipe, File, FastFile
    #                 shuffle_config: {
    #                   seed: 1, # required
    #                 },
    #               },
    #             ],
    #             output_data_config: { # required
    #               kms_key_id: "KmsKeyId",
    #               s3_output_path: "S3Uri", # required
    #             },
    #             resource_config: { # required
    #               instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.p4d.24xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5n.xlarge, ml.c5n.2xlarge, ml.c5n.4xlarge, ml.c5n.9xlarge, ml.c5n.18xlarge
    #               instance_count: 1, # required
    #               volume_size_in_gb: 1, # required
    #               volume_kms_key_id: "KmsKeyId",
    #             },
    #             stopping_condition: { # required
    #               max_runtime_in_seconds: 1,
    #               max_wait_time_in_seconds: 1,
    #             },
    #           },
    #           transform_job_definition: {
    #             max_concurrent_transforms: 1,
    #             max_payload_in_mb: 1,
    #             batch_strategy: "MultiRecord", # accepts MultiRecord, SingleRecord
    #             environment: {
    #               "TransformEnvironmentKey" => "TransformEnvironmentValue",
    #             },
    #             transform_input: { # required
    #               data_source: { # required
    #                 s3_data_source: { # required
    #                   s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #                   s3_uri: "S3Uri", # required
    #                 },
    #               },
    #               content_type: "ContentType",
    #               compression_type: "None", # accepts None, Gzip
    #               split_type: "None", # accepts None, Line, RecordIO, TFRecord
    #             },
    #             transform_output: { # required
    #               s3_output_path: "S3Uri", # required
    #               accept: "Accept",
    #               assemble_with: "None", # accepts None, Line
    #               kms_key_id: "KmsKeyId",
    #             },
    #             transform_resources: { # required
    #               instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #               instance_count: 1, # required
    #               volume_kms_key_id: "KmsKeyId",
    #             },
    #           },
    #         },
    #       ],
    #     },
    #     certify_for_marketplace: false,
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.algorithm_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateAlgorithm AWS API Documentation
    #
    # @overload create_algorithm(params = {})
    # @param [Hash] params ({})
    def create_algorithm(params = {}, options = {})
      req = build_request(:create_algorithm, params)
      req.send_request(options)
    end

    # Creates a running app for the specified UserProfile. Supported apps
    # are `JupyterServer` and `KernelGateway`. This operation is
    # automatically invoked by Amazon SageMaker Studio upon access to the
    # associated Domain, and when new kernel configurations are selected by
    # the user. A user may have multiple Apps active simultaneously.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The user profile name.
    #
    # @option params [required, String] :app_type
    #   The type of app. Supported apps are `JupyterServer` and
    #   `KernelGateway`. `TensorBoard` is not supported.
    #
    # @option params [required, String] :app_name
    #   The name of the app.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Each tag consists of a key and an optional value. Tag keys must be
    #   unique per resource.
    #
    # @option params [Types::ResourceSpec] :resource_spec
    #   The instance type and the Amazon Resource Name (ARN) of the SageMaker
    #   image created on the instance.
    #
    # @return [Types::CreateAppResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateAppResponse#app_arn #app_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_app({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #     app_type: "JupyterServer", # required, accepts JupyterServer, KernelGateway, TensorBoard
    #     app_name: "AppName", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     resource_spec: {
    #       sage_maker_image_arn: "ImageArn",
    #       sage_maker_image_version_arn: "ImageVersionArn",
    #       instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #       lifecycle_config_arn: "StudioLifecycleConfigArn",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.app_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateApp AWS API Documentation
    #
    # @overload create_app(params = {})
    # @param [Hash] params ({})
    def create_app(params = {}, options = {})
      req = build_request(:create_app, params)
      req.send_request(options)
    end

    # Creates a configuration for running a SageMaker image as a
    # KernelGateway app. The configuration specifies the Amazon Elastic File
    # System (EFS) storage volume on the image, and a list of the kernels in
    # the image.
    #
    # @option params [required, String] :app_image_config_name
    #   The name of the AppImageConfig. Must be unique to your account.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to apply to the AppImageConfig.
    #
    # @option params [Types::KernelGatewayImageConfig] :kernel_gateway_image_config
    #   The KernelGatewayImageConfig.
    #
    # @return [Types::CreateAppImageConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateAppImageConfigResponse#app_image_config_arn #app_image_config_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_app_image_config({
    #     app_image_config_name: "AppImageConfigName", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     kernel_gateway_image_config: {
    #       kernel_specs: [ # required
    #         {
    #           name: "KernelName", # required
    #           display_name: "KernelDisplayName",
    #         },
    #       ],
    #       file_system_config: {
    #         mount_path: "MountPath",
    #         default_uid: 1,
    #         default_gid: 1,
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.app_image_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateAppImageConfig AWS API Documentation
    #
    # @overload create_app_image_config(params = {})
    # @param [Hash] params ({})
    def create_app_image_config(params = {}, options = {})
      req = build_request(:create_app_image_config, params)
      req.send_request(options)
    end

    # Creates an *artifact*. An artifact is a lineage tracking entity that
    # represents a URI addressable object or data. Some examples are the S3
    # URI of a dataset and the ECR registry path of an image. For more
    # information, see [Amazon SageMaker ML Lineage Tracking][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html
    #
    # @option params [String] :artifact_name
    #   The name of the artifact. Must be unique to your account in an Amazon
    #   Web Services Region.
    #
    # @option params [required, Types::ArtifactSource] :source
    #   The ID, ID type, and URI of the source.
    #
    # @option params [required, String] :artifact_type
    #   The artifact type.
    #
    # @option params [Hash<String,String>] :properties
    #   A list of properties to add to the artifact.
    #
    # @option params [Types::MetadataProperties] :metadata_properties
    #   Metadata properties of the tracking entity, trial, or trial component.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to apply to the artifact.
    #
    # @return [Types::CreateArtifactResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateArtifactResponse#artifact_arn #artifact_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_artifact({
    #     artifact_name: "ExperimentEntityName",
    #     source: { # required
    #       source_uri: "String2048", # required
    #       source_types: [
    #         {
    #           source_id_type: "MD5Hash", # required, accepts MD5Hash, S3ETag, S3Version, Custom
    #           value: "String256", # required
    #         },
    #       ],
    #     },
    #     artifact_type: "String256", # required
    #     properties: {
    #       "StringParameterValue" => "StringParameterValue",
    #     },
    #     metadata_properties: {
    #       commit_id: "MetadataPropertyValue",
    #       repository: "MetadataPropertyValue",
    #       generated_by: "MetadataPropertyValue",
    #       project_id: "MetadataPropertyValue",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.artifact_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateArtifact AWS API Documentation
    #
    # @overload create_artifact(params = {})
    # @param [Hash] params ({})
    def create_artifact(params = {}, options = {})
      req = build_request(:create_artifact, params)
      req.send_request(options)
    end

    # Creates an Autopilot job.
    #
    # Find the best-performing model after you run an Autopilot job by
    # calling .
    #
    # For information about how to use Autopilot, see [Automate Model
    # Development with Amazon SageMaker Autopilot][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html
    #
    # @option params [required, String] :auto_ml_job_name
    #   Identifies an Autopilot job. The name must be unique to your account
    #   and is case-insensitive.
    #
    # @option params [required, Array<Types::AutoMLChannel>] :input_data_config
    #   An array of channel objects that describes the input data and its
    #   location. Each channel is a named input source. Similar to
    #   `InputDataConfig` supported by . Format(s) supported: CSV. Minimum of
    #   500 rows.
    #
    # @option params [required, Types::AutoMLOutputDataConfig] :output_data_config
    #   Provides information about encryption and the Amazon S3 output path
    #   needed to store artifacts from an AutoML job. Format(s) supported:
    #   CSV.
    #
    # @option params [String] :problem_type
    #   Defines the type of supervised learning available for the candidates.
    #   Options include: `BinaryClassification`, `MulticlassClassification`,
    #   and `Regression`. For more information, see [ Amazon SageMaker
    #   Autopilot problem types and algorithm support][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development-problem-types.html
    #
    # @option params [Types::AutoMLJobObjective] :auto_ml_job_objective
    #   Defines the objective metric used to measure the predictive quality of
    #   an AutoML job. You provide an AutoMLJobObjective$MetricName and
    #   Autopilot infers whether to minimize or maximize it.
    #
    # @option params [Types::AutoMLJobConfig] :auto_ml_job_config
    #   Contains `CompletionCriteria` and `SecurityConfig` settings for the
    #   AutoML job.
    #
    # @option params [required, String] :role_arn
    #   The ARN of the role that is used to access the data.
    #
    # @option params [Boolean] :generate_candidate_definitions_only
    #   Generates possible candidates without training the models. A candidate
    #   is a combination of data preprocessors, algorithms, and algorithm
    #   parameter settings.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Each tag consists of a key and an optional value. Tag keys must be
    #   unique per resource.
    #
    # @option params [Types::ModelDeployConfig] :model_deploy_config
    #   Specifies how to generate the endpoint name for an automatic one-click
    #   Autopilot model deployment.
    #
    # @return [Types::CreateAutoMLJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateAutoMLJobResponse#auto_ml_job_arn #auto_ml_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_auto_ml_job({
    #     auto_ml_job_name: "AutoMLJobName", # required
    #     input_data_config: [ # required
    #       {
    #         data_source: { # required
    #           s3_data_source: { # required
    #             s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix
    #             s3_uri: "S3Uri", # required
    #           },
    #         },
    #         compression_type: "None", # accepts None, Gzip
    #         target_attribute_name: "TargetAttributeName", # required
    #       },
    #     ],
    #     output_data_config: { # required
    #       kms_key_id: "KmsKeyId",
    #       s3_output_path: "S3Uri", # required
    #     },
    #     problem_type: "BinaryClassification", # accepts BinaryClassification, MulticlassClassification, Regression
    #     auto_ml_job_objective: {
    #       metric_name: "Accuracy", # required, accepts Accuracy, MSE, F1, F1macro, AUC
    #     },
    #     auto_ml_job_config: {
    #       completion_criteria: {
    #         max_candidates: 1,
    #         max_runtime_per_training_job_in_seconds: 1,
    #         max_auto_ml_job_runtime_in_seconds: 1,
    #       },
    #       security_config: {
    #         volume_kms_key_id: "KmsKeyId",
    #         enable_inter_container_traffic_encryption: false,
    #         vpc_config: {
    #           security_group_ids: ["SecurityGroupId"], # required
    #           subnets: ["SubnetId"], # required
    #         },
    #       },
    #     },
    #     role_arn: "RoleArn", # required
    #     generate_candidate_definitions_only: false,
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     model_deploy_config: {
    #       auto_generate_endpoint_name: false,
    #       endpoint_name: "EndpointName",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.auto_ml_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateAutoMLJob AWS API Documentation
    #
    # @overload create_auto_ml_job(params = {})
    # @param [Hash] params ({})
    def create_auto_ml_job(params = {}, options = {})
      req = build_request(:create_auto_ml_job, params)
      req.send_request(options)
    end

    # Creates a Git repository as a resource in your Amazon SageMaker
    # account. You can associate the repository with notebook instances so
    # that you can use Git source control for the notebooks you create. The
    # Git repository is a resource in your Amazon SageMaker account, so it
    # can be associated with more than one notebook instance, and it
    # persists independently from the lifecycle of any notebook instances it
    # is associated with.
    #
    # The repository can be hosted either in [Amazon Web Services
    # CodeCommit][1] or in any other Git repository.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html
    #
    # @option params [required, String] :code_repository_name
    #   The name of the Git repository. The name must have 1 to 63 characters.
    #   Valid characters are a-z, A-Z, 0-9, and - (hyphen).
    #
    # @option params [required, Types::GitConfig] :git_config
    #   Specifies details about the repository, including the URL where the
    #   repository is located, the default branch, and credentials to use to
    #   access the repository.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateCodeRepositoryOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateCodeRepositoryOutput#code_repository_arn #code_repository_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_code_repository({
    #     code_repository_name: "EntityName", # required
    #     git_config: { # required
    #       repository_url: "GitConfigUrl", # required
    #       branch: "Branch",
    #       secret_arn: "SecretArn",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.code_repository_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateCodeRepository AWS API Documentation
    #
    # @overload create_code_repository(params = {})
    # @param [Hash] params ({})
    def create_code_repository(params = {}, options = {})
      req = build_request(:create_code_repository, params)
      req.send_request(options)
    end

    # Starts a model compilation job. After the model has been compiled,
    # Amazon SageMaker saves the resulting model artifacts to an Amazon
    # Simple Storage Service (Amazon S3) bucket that you specify.
    #
    # If you choose to host your model using Amazon SageMaker hosting
    # services, you can use the resulting model artifacts as part of the
    # model. You can also use the artifacts with Amazon Web Services IoT
    # Greengrass. In that case, deploy them as an ML resource.
    #
    # In the request body, you provide the following:
    #
    # * A name for the compilation job
    #
    # * Information about the input model artifacts
    #
    # * The output location for the compiled model and the device (target)
    #   that the model runs on
    #
    # * The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker
    #   assumes to perform the model compilation job.
    #
    # You can also provide a `Tag` to track the model compilation job's
    # resource use and costs. The response body contains the
    # `CompilationJobArn` for the compiled job.
    #
    # To stop a model compilation job, use StopCompilationJob. To get
    # information about a particular model compilation job, use
    # DescribeCompilationJob. To get information about multiple model
    # compilation jobs, use ListCompilationJobs.
    #
    # @option params [required, String] :compilation_job_name
    #   A name for the model compilation job. The name must be unique within
    #   the Amazon Web Services Region and within your Amazon Web Services
    #   account.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that enables Amazon
    #   SageMaker to perform tasks on your behalf.
    #
    #   During model compilation, Amazon SageMaker needs your permission to:
    #
    #   * Read input data from an S3 bucket
    #
    #   * Write model artifacts to an S3 bucket
    #
    #   * Write logs to Amazon CloudWatch Logs
    #
    #   * Publish metrics to Amazon CloudWatch
    #
    #   You grant permissions for all of these tasks to an IAM role. To pass
    #   this role to Amazon SageMaker, the caller of this API must have the
    #   `iam:PassRole` permission. For more information, see [Amazon SageMaker
    #   Roles.][1]
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html
    #
    # @option params [required, Types::InputConfig] :input_config
    #   Provides information about the location of input model artifacts, the
    #   name and shape of the expected data inputs, and the framework in which
    #   the model was trained.
    #
    # @option params [required, Types::OutputConfig] :output_config
    #   Provides information about the output location for the compiled model
    #   and the target device the model runs on.
    #
    # @option params [Types::NeoVpcConfig] :vpc_config
    #   A VpcConfig object that specifies the VPC that you want your
    #   compilation job to connect to. Control access to your models by
    #   configuring the VPC. For more information, see [Protect Compilation
    #   Jobs by Using an Amazon Virtual Private Cloud][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/neo-vpc.html
    #
    # @option params [required, Types::StoppingCondition] :stopping_condition
    #   Specifies a limit to how long a model compilation job can run. When
    #   the job reaches the time limit, Amazon SageMaker ends the compilation
    #   job. Use this API to cap model training costs.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateCompilationJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateCompilationJobResponse#compilation_job_arn #compilation_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_compilation_job({
    #     compilation_job_name: "EntityName", # required
    #     role_arn: "RoleArn", # required
    #     input_config: { # required
    #       s3_uri: "S3Uri", # required
    #       data_input_config: "DataInputConfig", # required
    #       framework: "TENSORFLOW", # required, accepts TENSORFLOW, KERAS, MXNET, ONNX, PYTORCH, XGBOOST, TFLITE, DARKNET, SKLEARN
    #       framework_version: "FrameworkVersion",
    #     },
    #     output_config: { # required
    #       s3_output_location: "S3Uri", # required
    #       target_device: "lambda", # accepts lambda, ml_m4, ml_m5, ml_c4, ml_c5, ml_p2, ml_p3, ml_g4dn, ml_inf1, ml_eia2, jetson_tx1, jetson_tx2, jetson_nano, jetson_xavier, rasp3b, imx8qm, deeplens, rk3399, rk3288, aisage, sbe_c, qcs605, qcs603, sitara_am57x, amba_cv22, amba_cv25, x86_win32, x86_win64, coreml, jacinto_tda4vm, imx8mplus
    #       target_platform: {
    #         os: "ANDROID", # required, accepts ANDROID, LINUX
    #         arch: "X86_64", # required, accepts X86_64, X86, ARM64, ARM_EABI, ARM_EABIHF
    #         accelerator: "INTEL_GRAPHICS", # accepts INTEL_GRAPHICS, MALI, NVIDIA
    #       },
    #       compiler_options: "CompilerOptions",
    #       kms_key_id: "KmsKeyId",
    #     },
    #     vpc_config: {
    #       security_group_ids: ["NeoVpcSecurityGroupId"], # required
    #       subnets: ["NeoVpcSubnetId"], # required
    #     },
    #     stopping_condition: { # required
    #       max_runtime_in_seconds: 1,
    #       max_wait_time_in_seconds: 1,
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.compilation_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateCompilationJob AWS API Documentation
    #
    # @overload create_compilation_job(params = {})
    # @param [Hash] params ({})
    def create_compilation_job(params = {}, options = {})
      req = build_request(:create_compilation_job, params)
      req.send_request(options)
    end

    # Creates a *context*. A context is a lineage tracking entity that
    # represents a logical grouping of other tracking or experiment
    # entities. Some examples are an endpoint and a model package. For more
    # information, see [Amazon SageMaker ML Lineage Tracking][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/lineage-tracking.html
    #
    # @option params [required, String] :context_name
    #   The name of the context. Must be unique to your account in an Amazon
    #   Web Services Region.
    #
    # @option params [required, Types::ContextSource] :source
    #   The source type, ID, and URI.
    #
    # @option params [required, String] :context_type
    #   The context type.
    #
    # @option params [String] :description
    #   The description of the context.
    #
    # @option params [Hash<String,String>] :properties
    #   A list of properties to add to the context.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to apply to the context.
    #
    # @return [Types::CreateContextResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateContextResponse#context_arn #context_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_context({
    #     context_name: "ExperimentEntityName", # required
    #     source: { # required
    #       source_uri: "String2048", # required
    #       source_type: "String256",
    #       source_id: "String256",
    #     },
    #     context_type: "String256", # required
    #     description: "ExperimentDescription",
    #     properties: {
    #       "StringParameterValue" => "StringParameterValue",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.context_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateContext AWS API Documentation
    #
    # @overload create_context(params = {})
    # @param [Hash] params ({})
    def create_context(params = {}, options = {})
      req = build_request(:create_context, params)
      req.send_request(options)
    end

    # Creates a definition for a job that monitors data quality and drift.
    # For information about model monitor, see [Amazon SageMaker Model
    # Monitor][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html
    #
    # @option params [required, String] :job_definition_name
    #   The name for the monitoring job definition.
    #
    # @option params [Types::DataQualityBaselineConfig] :data_quality_baseline_config
    #   Configures the constraints and baselines for the monitoring job.
    #
    # @option params [required, Types::DataQualityAppSpecification] :data_quality_app_specification
    #   Specifies the container that runs the monitoring job.
    #
    # @option params [required, Types::DataQualityJobInput] :data_quality_job_input
    #   A list of inputs for the monitoring job. Currently endpoints are
    #   supported as monitoring inputs.
    #
    # @option params [required, Types::MonitoringOutputConfig] :data_quality_job_output_config
    #   The output configuration for monitoring jobs.
    #
    # @option params [required, Types::MonitoringResources] :job_resources
    #   Identifies the resources to deploy for a monitoring job.
    #
    # @option params [Types::MonitoringNetworkConfig] :network_config
    #   Specifies networking configuration for the monitoring job.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
    #   can assume to perform tasks on your behalf.
    #
    # @option params [Types::MonitoringStoppingCondition] :stopping_condition
    #   A time limit for how long the monitoring job is allowed to run before
    #   stopping.
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags][1] in the *Amazon Web Services Billing
    #   and Cost Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL
    #
    # @return [Types::CreateDataQualityJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateDataQualityJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_data_quality_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #     data_quality_baseline_config: {
    #       baselining_job_name: "ProcessingJobName",
    #       constraints_resource: {
    #         s3_uri: "S3Uri",
    #       },
    #       statistics_resource: {
    #         s3_uri: "S3Uri",
    #       },
    #     },
    #     data_quality_app_specification: { # required
    #       image_uri: "ImageUri", # required
    #       container_entrypoint: ["ContainerEntrypointString"],
    #       container_arguments: ["ContainerArgument"],
    #       record_preprocessor_source_uri: "S3Uri",
    #       post_analytics_processor_source_uri: "S3Uri",
    #       environment: {
    #         "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #       },
    #     },
    #     data_quality_job_input: { # required
    #       endpoint_input: { # required
    #         endpoint_name: "EndpointName", # required
    #         local_path: "ProcessingLocalPath", # required
    #         s3_input_mode: "Pipe", # accepts Pipe, File
    #         s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #         features_attribute: "String",
    #         inference_attribute: "String",
    #         probability_attribute: "String",
    #         probability_threshold_attribute: 1.0,
    #         start_time_offset: "MonitoringTimeOffsetString",
    #         end_time_offset: "MonitoringTimeOffsetString",
    #       },
    #     },
    #     data_quality_job_output_config: { # required
    #       monitoring_outputs: [ # required
    #         {
    #           s3_output: { # required
    #             s3_uri: "MonitoringS3Uri", # required
    #             local_path: "ProcessingLocalPath", # required
    #             s3_upload_mode: "Continuous", # accepts Continuous, EndOfJob
    #           },
    #         },
    #       ],
    #       kms_key_id: "KmsKeyId",
    #     },
    #     job_resources: { # required
    #       cluster_config: { # required
    #         instance_count: 1, # required
    #         instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1, # required
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #     },
    #     network_config: {
    #       enable_inter_container_traffic_encryption: false,
    #       enable_network_isolation: false,
    #       vpc_config: {
    #         security_group_ids: ["SecurityGroupId"], # required
    #         subnets: ["SubnetId"], # required
    #       },
    #     },
    #     role_arn: "RoleArn", # required
    #     stopping_condition: {
    #       max_runtime_in_seconds: 1, # required
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateDataQualityJobDefinition AWS API Documentation
    #
    # @overload create_data_quality_job_definition(params = {})
    # @param [Hash] params ({})
    def create_data_quality_job_definition(params = {}, options = {})
      req = build_request(:create_data_quality_job_definition, params)
      req.send_request(options)
    end

    # Creates a device fleet.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet that the device belongs to.
    #
    # @option params [String] :role_arn
    #   The Amazon Resource Name (ARN) that has access to Amazon Web Services
    #   Internet of Things (IoT).
    #
    # @option params [String] :description
    #   A description of the fleet.
    #
    # @option params [required, Types::EdgeOutputConfig] :output_config
    #   The output configuration for storing sample data collected by the
    #   fleet.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Creates tags for the specified fleet.
    #
    # @option params [Boolean] :enable_iot_role_alias
    #   Whether to create an Amazon Web Services IoT Role Alias during device
    #   fleet creation. The name of the role alias generated will match this
    #   pattern: "SageMakerEdge-\\\{DeviceFleetName\\}".
    #
    #   For example, if your device fleet is called "demo-fleet", the name
    #   of the role alias will be "SageMakerEdge-demo-fleet".
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_device_fleet({
    #     device_fleet_name: "EntityName", # required
    #     role_arn: "RoleArn",
    #     description: "DeviceFleetDescription",
    #     output_config: { # required
    #       s3_output_location: "S3Uri", # required
    #       kms_key_id: "KmsKeyId",
    #       preset_deployment_type: "GreengrassV2Component", # accepts GreengrassV2Component
    #       preset_deployment_config: "String",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     enable_iot_role_alias: false,
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateDeviceFleet AWS API Documentation
    #
    # @overload create_device_fleet(params = {})
    # @param [Hash] params ({})
    def create_device_fleet(params = {}, options = {})
      req = build_request(:create_device_fleet, params)
      req.send_request(options)
    end

    # Creates a `Domain` used by Amazon SageMaker Studio. A domain consists
    # of an associated Amazon Elastic File System (EFS) volume, a list of
    # authorized users, and a variety of security, application, policy, and
    # Amazon Virtual Private Cloud (VPC) configurations. An Amazon Web
    # Services account is limited to one domain per region. Users within a
    # domain can share notebook files and other artifacts with each other.
    #
    # **EFS storage**
    #
    # When a domain is created, an EFS volume is created for use by all of
    # the users within the domain. Each user receives a private home
    # directory within the EFS volume for notebooks, Git repositories, and
    # data files.
    #
    # SageMaker uses the Amazon Web Services Key Management Service (Amazon
    # Web Services KMS) to encrypt the EFS volume attached to the domain
    # with an Amazon Web Services managed key by default. For more control,
    # you can specify a customer managed key. For more information, see
    # [Protect Data at Rest Using Encryption][1].
    #
    # **VPC configuration**
    #
    # All SageMaker Studio traffic between the domain and the EFS volume is
    # through the specified VPC and subnets. For other Studio traffic, you
    # can specify the `AppNetworkAccessType` parameter.
    # `AppNetworkAccessType` corresponds to the network access type that you
    # choose when you onboard to Studio. The following options are
    # available:
    #
    # * `PublicInternetOnly` - Non-EFS traffic goes through a VPC managed by
    #   Amazon SageMaker, which allows internet access. This is the default
    #   value.
    #
    # * `VpcOnly` - All Studio traffic is through the specified VPC and
    #   subnets. Internet access is disabled by default. To allow internet
    #   access, you must specify a NAT gateway.
    #
    #   When internet access is disabled, you won't be able to run a Studio
    #   notebook or to train or host models unless your VPC has an interface
    #   endpoint to the SageMaker API and runtime or a NAT gateway and your
    #   security groups allow outbound connections.
    #
    # NFS traffic over TCP on port 2049 needs to be allowed in both inbound
    # and outbound rules in order to launch a SageMaker Studio app
    # successfully.
    #
    # For more information, see [Connect SageMaker Studio Notebooks to
    # Resources in a VPC][2].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/encryption-at-rest.html
    # [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/studio-notebooks-and-internet-access.html
    #
    # @option params [required, String] :domain_name
    #   A name for the domain.
    #
    # @option params [required, String] :auth_mode
    #   The mode of authentication that members use to access the domain.
    #
    # @option params [required, Types::UserSettings] :default_user_settings
    #   The default settings to use to create a user profile when
    #   `UserSettings` isn't specified in the call to the `CreateUserProfile`
    #   API.
    #
    #   `SecurityGroups` is aggregated when specified in both calls. For all
    #   other settings in `UserSettings`, the values specified in
    #   `CreateUserProfile` take precedence over those specified in
    #   `CreateDomain`.
    #
    # @option params [required, Array<String>] :subnet_ids
    #   The VPC subnets that Studio uses for communication.
    #
    # @option params [required, String] :vpc_id
    #   The ID of the Amazon Virtual Private Cloud (VPC) that Studio uses for
    #   communication.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Tags to associated with the Domain. Each tag consists of a key and an
    #   optional value. Tag keys must be unique per resource. Tags are
    #   searchable using the `Search` API.
    #
    #   Tags that you specify for the Domain are also added to all Apps that
    #   the Domain launches.
    #
    # @option params [String] :app_network_access_type
    #   Specifies the VPC used for non-EFS traffic. The default value is
    #   `PublicInternetOnly`.
    #
    #   * `PublicInternetOnly` - Non-EFS traffic is through a VPC managed by
    #     Amazon SageMaker, which allows direct internet access
    #
    #   * `VpcOnly` - All Studio traffic is through the specified VPC and
    #     subnets
    #
    # @option params [String] :home_efs_file_system_kms_key_id
    #   This member is deprecated and replaced with `KmsKeyId`.
    #
    # @option params [String] :kms_key_id
    #   SageMaker uses Amazon Web Services KMS to encrypt the EFS volume
    #   attached to the domain with an Amazon Web Services managed key by
    #   default. For more control, specify a customer managed key.
    #
    # @return [Types::CreateDomainResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateDomainResponse#domain_arn #domain_arn} => String
    #   * {Types::CreateDomainResponse#url #url} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_domain({
    #     domain_name: "DomainName", # required
    #     auth_mode: "SSO", # required, accepts SSO, IAM
    #     default_user_settings: { # required
    #       execution_role: "RoleArn",
    #       security_groups: ["SecurityGroupId"],
    #       sharing_settings: {
    #         notebook_output_option: "Allowed", # accepts Allowed, Disabled
    #         s3_output_path: "S3Uri",
    #         s3_kms_key_id: "KmsKeyId",
    #       },
    #       jupyter_server_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       kernel_gateway_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         custom_images: [
    #           {
    #             image_name: "ImageName", # required
    #             image_version_number: 1,
    #             app_image_config_name: "AppImageConfigName", # required
    #           },
    #         ],
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       tensor_board_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #       },
    #     },
    #     subnet_ids: ["SubnetId"], # required
    #     vpc_id: "VpcId", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     app_network_access_type: "PublicInternetOnly", # accepts PublicInternetOnly, VpcOnly
    #     home_efs_file_system_kms_key_id: "KmsKeyId",
    #     kms_key_id: "KmsKeyId",
    #   })
    #
    # @example Response structure
    #
    #   resp.domain_arn #=> String
    #   resp.url #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateDomain AWS API Documentation
    #
    # @overload create_domain(params = {})
    # @param [Hash] params ({})
    def create_domain(params = {}, options = {})
      req = build_request(:create_domain, params)
      req.send_request(options)
    end

    # Starts a SageMaker Edge Manager model packaging job. Edge Manager will
    # use the model artifacts from the Amazon Simple Storage Service bucket
    # that you specify. After the model has been packaged, Amazon SageMaker
    # saves the resulting artifacts to an S3 bucket that you specify.
    #
    # @option params [required, String] :edge_packaging_job_name
    #   The name of the edge packaging job.
    #
    # @option params [required, String] :compilation_job_name
    #   The name of the SageMaker Neo compilation job that will be used to
    #   locate model artifacts for packaging.
    #
    # @option params [required, String] :model_name
    #   The name of the model.
    #
    # @option params [required, String] :model_version
    #   The version of the model.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that enables Amazon
    #   SageMaker to download and upload the model, and to contact SageMaker
    #   Neo.
    #
    # @option params [required, Types::EdgeOutputConfig] :output_config
    #   Provides information about the output location for the packaged model.
    #
    # @option params [String] :resource_key
    #   The Amazon Web Services KMS key to use when encrypting the EBS volume
    #   the edge packaging job runs on.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Creates tags for the packaging job.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_edge_packaging_job({
    #     edge_packaging_job_name: "EntityName", # required
    #     compilation_job_name: "EntityName", # required
    #     model_name: "EntityName", # required
    #     model_version: "EdgeVersion", # required
    #     role_arn: "RoleArn", # required
    #     output_config: { # required
    #       s3_output_location: "S3Uri", # required
    #       kms_key_id: "KmsKeyId",
    #       preset_deployment_type: "GreengrassV2Component", # accepts GreengrassV2Component
    #       preset_deployment_config: "String",
    #     },
    #     resource_key: "KmsKeyId",
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateEdgePackagingJob AWS API Documentation
    #
    # @overload create_edge_packaging_job(params = {})
    # @param [Hash] params ({})
    def create_edge_packaging_job(params = {}, options = {})
      req = build_request(:create_edge_packaging_job, params)
      req.send_request(options)
    end

    # Creates an endpoint using the endpoint configuration specified in the
    # request. Amazon SageMaker uses the endpoint to provision resources and
    # deploy models. You create the endpoint configuration with the
    # CreateEndpointConfig API.
    #
    # Use this API to deploy models using Amazon SageMaker hosting services.
    #
    # For an example that calls this method when deploying a model to Amazon
    # SageMaker hosting services, see the [Create Endpoint example
    # notebook.][1]
    #
    # <note markdown="1"> You must not delete an `EndpointConfig` that is in use by an endpoint
    # that is live or while the `UpdateEndpoint` or `CreateEndpoint`
    # operations are being performed on the endpoint. To update an endpoint,
    # you must create a new `EndpointConfig`.
    #
    #  </note>
    #
    # The endpoint name must be unique within an Amazon Web Services Region
    # in your Amazon Web Services account.
    #
    # When it receives the request, Amazon SageMaker creates the endpoint,
    # launches the resources (ML compute instances), and deploys the
    # model(s) on them.
    #
    # <note markdown="1"> When you call CreateEndpoint, a load call is made to DynamoDB to
    # verify that your endpoint configuration exists. When you read data
    # from a DynamoDB table supporting [ `Eventually Consistent Reads` ][2],
    # the response might not reflect the results of a recently completed
    # write operation. The response might include some stale data. If the
    # dependent entities are not yet in DynamoDB, this causes a validation
    # error. If you repeat your read request after a short time, the
    # response should return the latest data. So retry logic is recommended
    # to handle these possible issues. We also recommend that customers call
    # DescribeEndpointConfig before calling CreateEndpoint to minimize the
    # potential impact of a DynamoDB eventually consistent read.
    #
    #  </note>
    #
    # When Amazon SageMaker receives the request, it sets the endpoint
    # status to `Creating`. After it creates the endpoint, it sets the
    # status to `InService`. Amazon SageMaker can then process incoming
    # requests for inferences. To check the status of an endpoint, use the
    # DescribeEndpoint API.
    #
    # If any of the models hosted at this endpoint get model data from an
    # Amazon S3 location, Amazon SageMaker uses Amazon Web Services Security
    # Token Service to download model artifacts from the S3 path you
    # provided. Amazon Web Services STS is activated in your IAM user
    # account by default. If you previously deactivated Amazon Web Services
    # STS for a region, you need to reactivate Amazon Web Services STS for
    # that region. For more information, see [Activating and Deactivating
    # Amazon Web Services STS in an Amazon Web Services Region][3] in the
    # *Amazon Web Services Identity and Access Management User Guide*.
    #
    # <note markdown="1"> To add the IAM role policies for using this API operation, go to the
    # [IAM console][4], and choose Roles in the left navigation pane. Search
    # the IAM role that you want to grant access to use the CreateEndpoint
    # and CreateEndpointConfig API operations, add the following policies to
    # the role.
    #
    #  * Option 1: For a full SageMaker access, search and attach the
    #   `AmazonSageMakerFullAccess` policy.
    #
    # * Option 2: For granting a limited access to an IAM role, paste the
    #   following Action elements manually into the JSON file of the IAM
    #   role:
    #
    #   `"Action": ["sagemaker:CreateEndpoint",
    #   "sagemaker:CreateEndpointConfig"]`
    #
    #   `"Resource": [`
    #
    #   `"arn:aws:sagemaker:region:account-id:endpoint/endpointName"`
    #
    #   `"arn:aws:sagemaker:region:account-id:endpoint-config/endpointConfigName"`
    #
    #   `]`
    #
    #   For more information, see [SageMaker API Permissions: Actions,
    #   Permissions, and Resources Reference][5].
    #
    #  </note>
    #
    #
    #
    # [1]: https://github.com/aws/amazon-sagemaker-examples/blob/master/sagemaker-fundamentals/create-endpoint/create_endpoint.ipynb
    # [2]: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html
    # [3]: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html
    # [4]: https://console.aws.amazon.com/iam/
    # [5]: https://docs.aws.amazon.com/sagemaker/latest/dg/api-permissions-reference.html
    #
    # @option params [required, String] :endpoint_name
    #   The name of the endpoint.The name must be unique within an Amazon Web
    #   Services Region in your Amazon Web Services account. The name is
    #   case-insensitive in `CreateEndpoint`, but the case is preserved and
    #   must be matched in .
    #
    # @option params [required, String] :endpoint_config_name
    #   The name of an endpoint configuration. For more information, see
    #   CreateEndpointConfig.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateEndpointOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateEndpointOutput#endpoint_arn #endpoint_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_endpoint({
    #     endpoint_name: "EndpointName", # required
    #     endpoint_config_name: "EndpointConfigName", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateEndpoint AWS API Documentation
    #
    # @overload create_endpoint(params = {})
    # @param [Hash] params ({})
    def create_endpoint(params = {}, options = {})
      req = build_request(:create_endpoint, params)
      req.send_request(options)
    end

    # Creates an endpoint configuration that Amazon SageMaker hosting
    # services uses to deploy models. In the configuration, you identify one
    # or more models, created using the `CreateModel` API, to deploy and the
    # resources that you want Amazon SageMaker to provision. Then you call
    # the CreateEndpoint API.
    #
    # <note markdown="1"> Use this API if you want to use Amazon SageMaker hosting services to
    # deploy models into production.
    #
    #  </note>
    #
    # In the request, you define a `ProductionVariant`, for each model that
    # you want to deploy. Each `ProductionVariant` parameter also describes
    # the resources that you want Amazon SageMaker to provision. This
    # includes the number and type of ML compute instances to deploy.
    #
    # If you are hosting multiple models, you also assign a `VariantWeight`
    # to specify how much traffic you want to allocate to each model. For
    # example, suppose that you want to host two models, A and B, and you
    # assign traffic weight 2 for model A and 1 for model B. Amazon
    # SageMaker distributes two-thirds of the traffic to Model A, and
    # one-third to model B.
    #
    # <note markdown="1"> When you call CreateEndpoint, a load call is made to DynamoDB to
    # verify that your endpoint configuration exists. When you read data
    # from a DynamoDB table supporting [ `Eventually Consistent Reads` ][1],
    # the response might not reflect the results of a recently completed
    # write operation. The response might include some stale data. If the
    # dependent entities are not yet in DynamoDB, this causes a validation
    # error. If you repeat your read request after a short time, the
    # response should return the latest data. So retry logic is recommended
    # to handle these possible issues. We also recommend that customers call
    # DescribeEndpointConfig before calling CreateEndpoint to minimize the
    # potential impact of a DynamoDB eventually consistent read.
    #
    #  </note>
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadConsistency.html
    #
    # @option params [required, String] :endpoint_config_name
    #   The name of the endpoint configuration. You specify this name in a
    #   CreateEndpoint request.
    #
    # @option params [required, Array<Types::ProductionVariant>] :production_variants
    #   An list of `ProductionVariant` objects, one for each model that you
    #   want to host at this endpoint.
    #
    # @option params [Types::DataCaptureConfig] :data_capture_config
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @option params [String] :kms_key_id
    #   The Amazon Resource Name (ARN) of a Amazon Web Services Key Management
    #   Service key that Amazon SageMaker uses to encrypt data on the storage
    #   volume attached to the ML compute instance that hosts the endpoint.
    #
    #   The KmsKeyId can be any of the following formats:
    #
    #   * Key ID: `1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    #   * Key ARN:
    #     `arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab`
    #
    #   * Alias name: `alias/ExampleAlias`
    #
    #   * Alias name ARN:
    #     `arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias`
    #
    #   The KMS key policy must grant permission to the IAM role that you
    #   specify in your `CreateEndpoint`, `UpdateEndpoint` requests. For more
    #   information, refer to the Amazon Web Services Key Management Service
    #   section[ Using Key Policies in Amazon Web Services KMS ][1]
    #
    #   <note markdown="1"> Certain Nitro-based instances include local storage, dependent on the
    #   instance type. Local storage volumes are encrypted using a hardware
    #   module on the instance. You can't request a `KmsKeyId` when using an
    #   instance type with local storage. If any of the models that you
    #   specify in the `ProductionVariants` parameter use nitro-based
    #   instances with local storage, do not specify a value for the
    #   `KmsKeyId` parameter. If you specify a value for `KmsKeyId` when using
    #   any nitro-based instances with local storage, the call to
    #   `CreateEndpointConfig` fails.
    #
    #    For a list of instance types that support local instance storage, see
    #   [Instance Store Volumes][2].
    #
    #    For more information about local instance storage encryption, see [SSD
    #   Instance Store Volumes][3].
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html
    #   [2]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes
    #   [3]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html
    #
    # @option params [Types::AsyncInferenceConfig] :async_inference_config
    #   Specifies configuration for how an endpoint performs asynchronous
    #   inference. This is a required field in order for your Endpoint to be
    #   invoked using [ `InvokeEndpointAsync` ][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_runtime_InvokeEndpoint.html
    #
    # @return [Types::CreateEndpointConfigOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateEndpointConfigOutput#endpoint_config_arn #endpoint_config_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_endpoint_config({
    #     endpoint_config_name: "EndpointConfigName", # required
    #     production_variants: [ # required
    #       {
    #         variant_name: "VariantName", # required
    #         model_name: "ModelName", # required
    #         initial_instance_count: 1, # required
    #         instance_type: "ml.t2.medium", # required, accepts ml.t2.medium, ml.t2.large, ml.t2.xlarge, ml.t2.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.12xlarge, ml.m5d.24xlarge, ml.c4.large, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5d.large, ml.c5d.xlarge, ml.c5d.2xlarge, ml.c5d.4xlarge, ml.c5d.9xlarge, ml.c5d.18xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.12xlarge, ml.r5.24xlarge, ml.r5d.large, ml.r5d.xlarge, ml.r5d.2xlarge, ml.r5d.4xlarge, ml.r5d.12xlarge, ml.r5d.24xlarge, ml.inf1.xlarge, ml.inf1.2xlarge, ml.inf1.6xlarge, ml.inf1.24xlarge
    #         initial_variant_weight: 1.0,
    #         accelerator_type: "ml.eia1.medium", # accepts ml.eia1.medium, ml.eia1.large, ml.eia1.xlarge, ml.eia2.medium, ml.eia2.large, ml.eia2.xlarge
    #         core_dump_config: {
    #           destination_s3_uri: "DestinationS3Uri", # required
    #           kms_key_id: "KmsKeyId",
    #         },
    #       },
    #     ],
    #     data_capture_config: {
    #       enable_capture: false,
    #       initial_sampling_percentage: 1, # required
    #       destination_s3_uri: "DestinationS3Uri", # required
    #       kms_key_id: "KmsKeyId",
    #       capture_options: [ # required
    #         {
    #           capture_mode: "Input", # required, accepts Input, Output
    #         },
    #       ],
    #       capture_content_type_header: {
    #         csv_content_types: ["CsvContentType"],
    #         json_content_types: ["JsonContentType"],
    #       },
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     kms_key_id: "KmsKeyId",
    #     async_inference_config: {
    #       client_config: {
    #         max_concurrent_invocations_per_instance: 1,
    #       },
    #       output_config: { # required
    #         kms_key_id: "KmsKeyId",
    #         s3_output_path: "DestinationS3Uri", # required
    #         notification_config: {
    #           success_topic: "SnsTopicArn",
    #           error_topic: "SnsTopicArn",
    #         },
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateEndpointConfig AWS API Documentation
    #
    # @overload create_endpoint_config(params = {})
    # @param [Hash] params ({})
    def create_endpoint_config(params = {}, options = {})
      req = build_request(:create_endpoint_config, params)
      req.send_request(options)
    end

    # Creates an SageMaker *experiment*. An experiment is a collection of
    # *trials* that are observed, compared and evaluated as a group. A trial
    # is a set of steps, called *trial components*, that produce a machine
    # learning model.
    #
    # The goal of an experiment is to determine the components that produce
    # the best model. Multiple trials are performed, each one isolating and
    # measuring the impact of a change to one or more inputs, while keeping
    # the remaining inputs constant.
    #
    # When you use SageMaker Studio or the SageMaker Python SDK, all
    # experiments, trials, and trial components are automatically tracked,
    # logged, and indexed. When you use the Amazon Web Services SDK for
    # Python (Boto), you must use the logging APIs provided by the SDK.
    #
    # You can add tags to experiments, trials, trial components and then use
    # the Search API to search for the tags.
    #
    # To add a description to an experiment, specify the optional
    # `Description` parameter. To add a description later, or to change the
    # description, call the UpdateExperiment API.
    #
    # To get a list of all your experiments, call the ListExperiments API.
    # To view an experiment's properties, call the DescribeExperiment API.
    # To get a list of all the trials associated with an experiment, call
    # the ListTrials API. To create a trial call the CreateTrial API.
    #
    # @option params [required, String] :experiment_name
    #   The name of the experiment. The name must be unique in your Amazon Web
    #   Services account and is not case-sensitive.
    #
    # @option params [String] :display_name
    #   The name of the experiment as displayed. The name doesn't need to be
    #   unique. If you don't specify `DisplayName`, the value in
    #   `ExperimentName` is displayed.
    #
    # @option params [String] :description
    #   The description of the experiment.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to associate with the experiment. You can use Search
    #   API to search on the tags.
    #
    # @return [Types::CreateExperimentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateExperimentResponse#experiment_arn #experiment_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_experiment({
    #     experiment_name: "ExperimentEntityName", # required
    #     display_name: "ExperimentEntityName",
    #     description: "ExperimentDescription",
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.experiment_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateExperiment AWS API Documentation
    #
    # @overload create_experiment(params = {})
    # @param [Hash] params ({})
    def create_experiment(params = {}, options = {})
      req = build_request(:create_experiment, params)
      req.send_request(options)
    end

    # Create a new `FeatureGroup`. A `FeatureGroup` is a group of `Features`
    # defined in the `FeatureStore` to describe a `Record`.
    #
    # The `FeatureGroup` defines the schema and features contained in the
    # FeatureGroup. A `FeatureGroup` definition is composed of a list of
    # `Features`, a `RecordIdentifierFeatureName`, an `EventTimeFeatureName`
    # and configurations for its `OnlineStore` and `OfflineStore`. Check
    # [Amazon Web Services service quotas][1] to see the `FeatureGroup`s
    # quota for your Amazon Web Services account.
    #
    # You must include at least one of `OnlineStoreConfig` and
    # `OfflineStoreConfig` to create a `FeatureGroup`.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html
    #
    # @option params [required, String] :feature_group_name
    #   The name of the `FeatureGroup`. The name must be unique within an
    #   Amazon Web Services Region in an Amazon Web Services account. The
    #   name:
    #
    #   * Must start and end with an alphanumeric character.
    #
    #   * Can only contain alphanumeric character and hyphens. Spaces are not
    #     allowed.
    #
    # @option params [required, String] :record_identifier_feature_name
    #   The name of the `Feature` whose value uniquely identifies a `Record`
    #   defined in the `FeatureStore`. Only the latest record per identifier
    #   value will be stored in the `OnlineStore`.
    #   `RecordIdentifierFeatureName` must be one of feature definitions'
    #   names.
    #
    #   You use the `RecordIdentifierFeatureName` to access data in a
    #   `FeatureStore`.
    #
    #   This name:
    #
    #   * Must start and end with an alphanumeric character.
    #
    #   * Can only contains alphanumeric characters, hyphens, underscores.
    #     Spaces are not allowed.
    #
    # @option params [required, String] :event_time_feature_name
    #   The name of the feature that stores the `EventTime` of a `Record` in a
    #   `FeatureGroup`.
    #
    #   An `EventTime` is a point in time when a new event occurs that
    #   corresponds to the creation or update of a `Record` in a
    #   `FeatureGroup`. All `Records` in the `FeatureGroup` must have a
    #   corresponding `EventTime`.
    #
    #   An `EventTime` can be a `String` or `Fractional`.
    #
    #   * `Fractional`\: `EventTime` feature values must be a Unix timestamp
    #     in seconds.
    #
    #   * `String`\: `EventTime` feature values must be an ISO-8601 string in
    #     the format. The following formats are supported
    #     `yyyy-MM-dd'T'HH:mm:ssZ` and `yyyy-MM-dd'T'HH:mm:ss.SSSZ` where
    #     `yyyy`, `MM`, and `dd` represent the year, month, and day
    #     respectively and `HH`, `mm`, `ss`, and if applicable, `SSS`
    #     represent the hour, month, second and milliseconds respsectively.
    #     `'T'` and `Z` are constants.
    #
    # @option params [required, Array<Types::FeatureDefinition>] :feature_definitions
    #   A list of `Feature` names and types. `Name` and `Type` is compulsory
    #   per `Feature`.
    #
    #   Valid feature `FeatureType`s are `Integral`, `Fractional` and
    #   `String`.
    #
    #   `FeatureName`s cannot be any of the following: `is_deleted`,
    #   `write_time`, `api_invocation_time`
    #
    #   You can create up to 2,500 `FeatureDefinition`s per `FeatureGroup`.
    #
    # @option params [Types::OnlineStoreConfig] :online_store_config
    #   You can turn the `OnlineStore` on or off by specifying `True` for the
    #   `EnableOnlineStore` flag in `OnlineStoreConfig`; the default value is
    #   `False`.
    #
    #   You can also include an Amazon Web Services KMS key ID (`KMSKeyId`)
    #   for at-rest encryption of the `OnlineStore`.
    #
    # @option params [Types::OfflineStoreConfig] :offline_store_config
    #   Use this to configure an `OfflineFeatureStore`. This parameter allows
    #   you to specify:
    #
    #   * The Amazon Simple Storage Service (Amazon S3) location of an
    #     `OfflineStore`.
    #
    #   * A configuration for an Amazon Web Services Glue or Amazon Web
    #     Services Hive data catalog.
    #
    #   * An KMS encryption key to encrypt the Amazon S3 location used for
    #     `OfflineStore`. If KMS encryption key is not specified, by default
    #     we encrypt all data at rest using Amazon Web Services KMS key. By
    #     defining your [bucket-level key][1] for SSE, you can reduce Amazon
    #     Web Services KMS requests costs by up to 99 percent.
    #
    #   To learn more about this parameter, see OfflineStoreConfig.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html
    #
    # @option params [String] :role_arn
    #   The Amazon Resource Name (ARN) of the IAM execution role used to
    #   persist data into the `OfflineStore` if an `OfflineStoreConfig` is
    #   provided.
    #
    # @option params [String] :description
    #   A free-form description of a `FeatureGroup`.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Tags used to identify `Features` in each `FeatureGroup`.
    #
    # @return [Types::CreateFeatureGroupResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateFeatureGroupResponse#feature_group_arn #feature_group_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_feature_group({
    #     feature_group_name: "FeatureGroupName", # required
    #     record_identifier_feature_name: "FeatureName", # required
    #     event_time_feature_name: "FeatureName", # required
    #     feature_definitions: [ # required
    #       {
    #         feature_name: "FeatureName",
    #         feature_type: "Integral", # accepts Integral, Fractional, String
    #       },
    #     ],
    #     online_store_config: {
    #       security_config: {
    #         kms_key_id: "KmsKeyId",
    #       },
    #       enable_online_store: false,
    #     },
    #     offline_store_config: {
    #       s3_storage_config: { # required
    #         s3_uri: "S3Uri", # required
    #         kms_key_id: "KmsKeyId",
    #         resolved_output_s3_uri: "S3Uri",
    #       },
    #       disable_glue_table_creation: false,
    #       data_catalog_config: {
    #         table_name: "TableName", # required
    #         catalog: "Catalog", # required
    #         database: "Database", # required
    #       },
    #     },
    #     role_arn: "RoleArn",
    #     description: "Description",
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.feature_group_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateFeatureGroup AWS API Documentation
    #
    # @overload create_feature_group(params = {})
    # @param [Hash] params ({})
    def create_feature_group(params = {}, options = {})
      req = build_request(:create_feature_group, params)
      req.send_request(options)
    end

    # Creates a flow definition.
    #
    # @option params [required, String] :flow_definition_name
    #   The name of your flow definition.
    #
    # @option params [Types::HumanLoopRequestSource] :human_loop_request_source
    #   Container for configuring the source of human task requests. Use to
    #   specify if Amazon Rekognition or Amazon Textract is used as an
    #   integration source.
    #
    # @option params [Types::HumanLoopActivationConfig] :human_loop_activation_config
    #   An object containing information about the events that trigger a human
    #   workflow.
    #
    # @option params [required, Types::HumanLoopConfig] :human_loop_config
    #   An object containing information about the tasks the human reviewers
    #   will perform.
    #
    # @option params [required, Types::FlowDefinitionOutputConfig] :output_config
    #   An object containing information about where the human review results
    #   will be uploaded.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of the role needed to call other
    #   services on your behalf. For example,
    #   `arn:aws:iam::1234567890:role/service-role/AmazonSageMaker-ExecutionRole-20180111T151298`.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs that contain metadata to help you
    #   categorize and organize a flow definition. Each tag consists of a key
    #   and a value, both of which you define.
    #
    # @return [Types::CreateFlowDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateFlowDefinitionResponse#flow_definition_arn #flow_definition_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_flow_definition({
    #     flow_definition_name: "FlowDefinitionName", # required
    #     human_loop_request_source: {
    #       aws_managed_human_loop_request_source: "AWS/Rekognition/DetectModerationLabels/Image/V3", # required, accepts AWS/Rekognition/DetectModerationLabels/Image/V3, AWS/Textract/AnalyzeDocument/Forms/V1
    #     },
    #     human_loop_activation_config: {
    #       human_loop_activation_conditions_config: { # required
    #         human_loop_activation_conditions: "HumanLoopActivationConditions", # required
    #       },
    #     },
    #     human_loop_config: { # required
    #       workteam_arn: "WorkteamArn", # required
    #       human_task_ui_arn: "HumanTaskUiArn", # required
    #       task_title: "FlowDefinitionTaskTitle", # required
    #       task_description: "FlowDefinitionTaskDescription", # required
    #       task_count: 1, # required
    #       task_availability_lifetime_in_seconds: 1,
    #       task_time_limit_in_seconds: 1,
    #       task_keywords: ["FlowDefinitionTaskKeyword"],
    #       public_workforce_task_price: {
    #         amount_in_usd: {
    #           dollars: 1,
    #           cents: 1,
    #           tenth_fractions_of_a_cent: 1,
    #         },
    #       },
    #     },
    #     output_config: { # required
    #       s3_output_path: "S3Uri", # required
    #       kms_key_id: "KmsKeyId",
    #     },
    #     role_arn: "RoleArn", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.flow_definition_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateFlowDefinition AWS API Documentation
    #
    # @overload create_flow_definition(params = {})
    # @param [Hash] params ({})
    def create_flow_definition(params = {}, options = {})
      req = build_request(:create_flow_definition, params)
      req.send_request(options)
    end

    # Defines the settings you will use for the human review workflow user
    # interface. Reviewers will see a three-panel interface with an
    # instruction area, the item to review, and an input area.
    #
    # @option params [required, String] :human_task_ui_name
    #   The name of the user interface you are creating.
    #
    # @option params [required, Types::UiTemplate] :ui_template
    #   The Liquid template for the worker user interface.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs that contain metadata to help you
    #   categorize and organize a human review workflow user interface. Each
    #   tag consists of a key and a value, both of which you define.
    #
    # @return [Types::CreateHumanTaskUiResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateHumanTaskUiResponse#human_task_ui_arn #human_task_ui_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_human_task_ui({
    #     human_task_ui_name: "HumanTaskUiName", # required
    #     ui_template: { # required
    #       content: "TemplateContent", # required
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.human_task_ui_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateHumanTaskUi AWS API Documentation
    #
    # @overload create_human_task_ui(params = {})
    # @param [Hash] params ({})
    def create_human_task_ui(params = {}, options = {})
      req = build_request(:create_human_task_ui, params)
      req.send_request(options)
    end

    # Starts a hyperparameter tuning job. A hyperparameter tuning job finds
    # the best version of a model by running many training jobs on your
    # dataset using the algorithm you choose and values for hyperparameters
    # within ranges that you specify. It then chooses the hyperparameter
    # values that result in a model that performs the best, as measured by
    # an objective metric that you choose.
    #
    # @option params [required, String] :hyper_parameter_tuning_job_name
    #   The name of the tuning job. This name is the prefix for the names of
    #   all training jobs that this tuning job launches. The name must be
    #   unique within the same Amazon Web Services account and Amazon Web
    #   Services Region. The name must have 1 to 32 characters. Valid
    #   characters are a-z, A-Z, 0-9, and : + = @ \_ % - (hyphen). The name is
    #   not case sensitive.
    #
    # @option params [required, Types::HyperParameterTuningJobConfig] :hyper_parameter_tuning_job_config
    #   The HyperParameterTuningJobConfig object that describes the tuning
    #   job, including the search strategy, the objective metric used to
    #   evaluate training jobs, ranges of parameters to search, and resource
    #   limits for the tuning job. For more information, see [How
    #   Hyperparameter Tuning Works][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html
    #
    # @option params [Types::HyperParameterTrainingJobDefinition] :training_job_definition
    #   The HyperParameterTrainingJobDefinition object that describes the
    #   training jobs that this tuning job launches, including static
    #   hyperparameters, input data configuration, output data configuration,
    #   resource configuration, and stopping condition.
    #
    # @option params [Array<Types::HyperParameterTrainingJobDefinition>] :training_job_definitions
    #   A list of the HyperParameterTrainingJobDefinition objects launched for
    #   this tuning job.
    #
    # @option params [Types::HyperParameterTuningJobWarmStartConfig] :warm_start_config
    #   Specifies the configuration for starting the hyperparameter tuning job
    #   using one or more previous tuning jobs as a starting point. The
    #   results of previous tuning jobs are used to inform which combinations
    #   of hyperparameters to search over in the new tuning job.
    #
    #   All training jobs launched by the new hyperparameter tuning job are
    #   evaluated by using the objective metric. If you specify
    #   `IDENTICAL_DATA_AND_ALGORITHM` as the `WarmStartType` value for the
    #   warm start configuration, the training job that performs the best in
    #   the new tuning job is compared to the best training jobs from the
    #   parent tuning jobs. From these, the training job that performs the
    #   best as measured by the objective metric is returned as the overall
    #   best training job.
    #
    #   <note markdown="1"> All training jobs launched by parent hyperparameter tuning jobs and
    #   the new hyperparameter tuning jobs count against the limit of training
    #   jobs for the tuning job.
    #
    #    </note>
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #   Tags that you specify for the tuning job are also added to all
    #   training jobs that the tuning job launches.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateHyperParameterTuningJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateHyperParameterTuningJobResponse#hyper_parameter_tuning_job_arn #hyper_parameter_tuning_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_hyper_parameter_tuning_job({
    #     hyper_parameter_tuning_job_name: "HyperParameterTuningJobName", # required
    #     hyper_parameter_tuning_job_config: { # required
    #       strategy: "Bayesian", # required, accepts Bayesian, Random
    #       hyper_parameter_tuning_job_objective: {
    #         type: "Maximize", # required, accepts Maximize, Minimize
    #         metric_name: "MetricName", # required
    #       },
    #       resource_limits: { # required
    #         max_number_of_training_jobs: 1, # required
    #         max_parallel_training_jobs: 1, # required
    #       },
    #       parameter_ranges: {
    #         integer_parameter_ranges: [
    #           {
    #             name: "ParameterKey", # required
    #             min_value: "ParameterValue", # required
    #             max_value: "ParameterValue", # required
    #             scaling_type: "Auto", # accepts Auto, Linear, Logarithmic, ReverseLogarithmic
    #           },
    #         ],
    #         continuous_parameter_ranges: [
    #           {
    #             name: "ParameterKey", # required
    #             min_value: "ParameterValue", # required
    #             max_value: "ParameterValue", # required
    #             scaling_type: "Auto", # accepts Auto, Linear, Logarithmic, ReverseLogarithmic
    #           },
    #         ],
    #         categorical_parameter_ranges: [
    #           {
    #             name: "ParameterKey", # required
    #             values: ["ParameterValue"], # required
    #           },
    #         ],
    #       },
    #       training_job_early_stopping_type: "Off", # accepts Off, Auto
    #       tuning_job_completion_criteria: {
    #         target_objective_metric_value: 1.0, # required
    #       },
    #     },
    #     training_job_definition: {
    #       definition_name: "HyperParameterTrainingJobDefinitionName",
    #       tuning_objective: {
    #         type: "Maximize", # required, accepts Maximize, Minimize
    #         metric_name: "MetricName", # required
    #       },
    #       hyper_parameter_ranges: {
    #         integer_parameter_ranges: [
    #           {
    #             name: "ParameterKey", # required
    #             min_value: "ParameterValue", # required
    #             max_value: "ParameterValue", # required
    #             scaling_type: "Auto", # accepts Auto, Linear, Logarithmic, ReverseLogarithmic
    #           },
    #         ],
    #         continuous_parameter_ranges: [
    #           {
    #             name: "ParameterKey", # required
    #             min_value: "ParameterValue", # required
    #             max_value: "ParameterValue", # required
    #             scaling_type: "Auto", # accepts Auto, Linear, Logarithmic, ReverseLogarithmic
    #           },
    #         ],
    #         categorical_parameter_ranges: [
    #           {
    #             name: "ParameterKey", # required
    #             values: ["ParameterValue"], # required
    #           },
    #         ],
    #       },
    #       static_hyper_parameters: {
    #         "HyperParameterKey" => "HyperParameterValue",
    #       },
    #       algorithm_specification: { # required
    #         training_image: "AlgorithmImage",
    #         training_input_mode: "Pipe", # required, accepts Pipe, File, FastFile
    #         algorithm_name: "ArnOrName",
    #         metric_definitions: [
    #           {
    #             name: "MetricName", # required
    #             regex: "MetricRegex", # required
    #           },
    #         ],
    #       },
    #       role_arn: "RoleArn", # required
    #       input_data_config: [
    #         {
    #           channel_name: "ChannelName", # required
    #           data_source: { # required
    #             s3_data_source: {
    #               s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #               s3_uri: "S3Uri", # required
    #               s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #               attribute_names: ["AttributeName"],
    #             },
    #             file_system_data_source: {
    #               file_system_id: "FileSystemId", # required
    #               file_system_access_mode: "rw", # required, accepts rw, ro
    #               file_system_type: "EFS", # required, accepts EFS, FSxLustre
    #               directory_path: "DirectoryPath", # required
    #             },
    #           },
    #           content_type: "ContentType",
    #           compression_type: "None", # accepts None, Gzip
    #           record_wrapper_type: "None", # accepts None, RecordIO
    #           input_mode: "Pipe", # accepts Pipe, File, FastFile
    #           shuffle_config: {
    #             seed: 1, # required
    #           },
    #         },
    #       ],
    #       vpc_config: {
    #         security_group_ids: ["SecurityGroupId"], # required
    #         subnets: ["SubnetId"], # required
    #       },
    #       output_data_config: { # required
    #         kms_key_id: "KmsKeyId",
    #         s3_output_path: "S3Uri", # required
    #       },
    #       resource_config: { # required
    #         instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.p4d.24xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5n.xlarge, ml.c5n.2xlarge, ml.c5n.4xlarge, ml.c5n.9xlarge, ml.c5n.18xlarge
    #         instance_count: 1, # required
    #         volume_size_in_gb: 1, # required
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #       stopping_condition: { # required
    #         max_runtime_in_seconds: 1,
    #         max_wait_time_in_seconds: 1,
    #       },
    #       enable_network_isolation: false,
    #       enable_inter_container_traffic_encryption: false,
    #       enable_managed_spot_training: false,
    #       checkpoint_config: {
    #         s3_uri: "S3Uri", # required
    #         local_path: "DirectoryPath",
    #       },
    #       retry_strategy: {
    #         maximum_retry_attempts: 1, # required
    #       },
    #     },
    #     training_job_definitions: [
    #       {
    #         definition_name: "HyperParameterTrainingJobDefinitionName",
    #         tuning_objective: {
    #           type: "Maximize", # required, accepts Maximize, Minimize
    #           metric_name: "MetricName", # required
    #         },
    #         hyper_parameter_ranges: {
    #           integer_parameter_ranges: [
    #             {
    #               name: "ParameterKey", # required
    #               min_value: "ParameterValue", # required
    #               max_value: "ParameterValue", # required
    #               scaling_type: "Auto", # accepts Auto, Linear, Logarithmic, ReverseLogarithmic
    #             },
    #           ],
    #           continuous_parameter_ranges: [
    #             {
    #               name: "ParameterKey", # required
    #               min_value: "ParameterValue", # required
    #               max_value: "ParameterValue", # required
    #               scaling_type: "Auto", # accepts Auto, Linear, Logarithmic, ReverseLogarithmic
    #             },
    #           ],
    #           categorical_parameter_ranges: [
    #             {
    #               name: "ParameterKey", # required
    #               values: ["ParameterValue"], # required
    #             },
    #           ],
    #         },
    #         static_hyper_parameters: {
    #           "HyperParameterKey" => "HyperParameterValue",
    #         },
    #         algorithm_specification: { # required
    #           training_image: "AlgorithmImage",
    #           training_input_mode: "Pipe", # required, accepts Pipe, File, FastFile
    #           algorithm_name: "ArnOrName",
    #           metric_definitions: [
    #             {
    #               name: "MetricName", # required
    #               regex: "MetricRegex", # required
    #             },
    #           ],
    #         },
    #         role_arn: "RoleArn", # required
    #         input_data_config: [
    #           {
    #             channel_name: "ChannelName", # required
    #             data_source: { # required
    #               s3_data_source: {
    #                 s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #                 s3_uri: "S3Uri", # required
    #                 s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #                 attribute_names: ["AttributeName"],
    #               },
    #               file_system_data_source: {
    #                 file_system_id: "FileSystemId", # required
    #                 file_system_access_mode: "rw", # required, accepts rw, ro
    #                 file_system_type: "EFS", # required, accepts EFS, FSxLustre
    #                 directory_path: "DirectoryPath", # required
    #               },
    #             },
    #             content_type: "ContentType",
    #             compression_type: "None", # accepts None, Gzip
    #             record_wrapper_type: "None", # accepts None, RecordIO
    #             input_mode: "Pipe", # accepts Pipe, File, FastFile
    #             shuffle_config: {
    #               seed: 1, # required
    #             },
    #           },
    #         ],
    #         vpc_config: {
    #           security_group_ids: ["SecurityGroupId"], # required
    #           subnets: ["SubnetId"], # required
    #         },
    #         output_data_config: { # required
    #           kms_key_id: "KmsKeyId",
    #           s3_output_path: "S3Uri", # required
    #         },
    #         resource_config: { # required
    #           instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.p4d.24xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5n.xlarge, ml.c5n.2xlarge, ml.c5n.4xlarge, ml.c5n.9xlarge, ml.c5n.18xlarge
    #           instance_count: 1, # required
    #           volume_size_in_gb: 1, # required
    #           volume_kms_key_id: "KmsKeyId",
    #         },
    #         stopping_condition: { # required
    #           max_runtime_in_seconds: 1,
    #           max_wait_time_in_seconds: 1,
    #         },
    #         enable_network_isolation: false,
    #         enable_inter_container_traffic_encryption: false,
    #         enable_managed_spot_training: false,
    #         checkpoint_config: {
    #           s3_uri: "S3Uri", # required
    #           local_path: "DirectoryPath",
    #         },
    #         retry_strategy: {
    #           maximum_retry_attempts: 1, # required
    #         },
    #       },
    #     ],
    #     warm_start_config: {
    #       parent_hyper_parameter_tuning_jobs: [ # required
    #         {
    #           hyper_parameter_tuning_job_name: "HyperParameterTuningJobName",
    #         },
    #       ],
    #       warm_start_type: "IdenticalDataAndAlgorithm", # required, accepts IdenticalDataAndAlgorithm, TransferLearning
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.hyper_parameter_tuning_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateHyperParameterTuningJob AWS API Documentation
    #
    # @overload create_hyper_parameter_tuning_job(params = {})
    # @param [Hash] params ({})
    def create_hyper_parameter_tuning_job(params = {}, options = {})
      req = build_request(:create_hyper_parameter_tuning_job, params)
      req.send_request(options)
    end

    # Creates a custom SageMaker image. A SageMaker image is a set of image
    # versions. Each image version represents a container image stored in
    # Amazon Container Registry (ECR). For more information, see [Bring your
    # own SageMaker image][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/studio-byoi.html
    #
    # @option params [String] :description
    #   The description of the image.
    #
    # @option params [String] :display_name
    #   The display name of the image. If not provided, `ImageName` is
    #   displayed.
    #
    # @option params [required, String] :image_name
    #   The name of the image. Must be unique to your account.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that enables Amazon
    #   SageMaker to perform tasks on your behalf.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to apply to the image.
    #
    # @return [Types::CreateImageResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateImageResponse#image_arn #image_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_image({
    #     description: "ImageDescription",
    #     display_name: "ImageDisplayName",
    #     image_name: "ImageName", # required
    #     role_arn: "RoleArn", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.image_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateImage AWS API Documentation
    #
    # @overload create_image(params = {})
    # @param [Hash] params ({})
    def create_image(params = {}, options = {})
      req = build_request(:create_image, params)
      req.send_request(options)
    end

    # Creates a version of the SageMaker image specified by `ImageName`. The
    # version represents the Amazon Container Registry (ECR) container image
    # specified by `BaseImage`.
    #
    # @option params [required, String] :base_image
    #   The registry path of the container image to use as the starting point
    #   for this version. The path is an Amazon Container Registry (ECR) URI
    #   in the following format:
    #
    #   `<acct-id>.dkr.ecr.<region>.amazonaws.com/<repo-name[:tag] or
    #   [@digest]>`
    #
    # @option params [required, String] :client_token
    #   A unique ID. If not specified, the Amazon Web Services CLI and Amazon
    #   Web Services SDKs, such as the SDK for Python (Boto3), add a unique
    #   value to the call.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @option params [required, String] :image_name
    #   The `ImageName` of the `Image` to create a version of.
    #
    # @return [Types::CreateImageVersionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateImageVersionResponse#image_version_arn #image_version_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_image_version({
    #     base_image: "ImageBaseImage", # required
    #     client_token: "ClientToken", # required
    #     image_name: "ImageName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.image_version_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateImageVersion AWS API Documentation
    #
    # @overload create_image_version(params = {})
    # @param [Hash] params ({})
    def create_image_version(params = {}, options = {})
      req = build_request(:create_image_version, params)
      req.send_request(options)
    end

    # Creates a job that uses workers to label the data objects in your
    # input dataset. You can use the labeled data to train machine learning
    # models.
    #
    # You can select your workforce from one of three providers:
    #
    # * A private workforce that you create. It can include employees,
    #   contractors, and outside experts. Use a private workforce when want
    #   the data to stay within your organization or when a specific set of
    #   skills is required.
    #
    # * One or more vendors that you select from the Amazon Web Services
    #   Marketplace. Vendors provide expertise in specific areas.
    #
    # * The Amazon Mechanical Turk workforce. This is the largest workforce,
    #   but it should only be used for public data or data that has been
    #   stripped of any personally identifiable information.
    #
    # You can also use *automated data labeling* to reduce the number of
    # data objects that need to be labeled by a human. Automated data
    # labeling uses *active learning* to determine if a data object can be
    # labeled by machine or if it needs to be sent to a human worker. For
    # more information, see [Using Automated Data Labeling][1].
    #
    # The data objects to be labeled are contained in an Amazon S3 bucket.
    # You create a *manifest file* that describes the location of each
    # object. For more information, see [Using Input and Output Data][2].
    #
    # The output can be used as the manifest file for another labeling job
    # or as training data for your machine learning models.
    #
    # You can use this operation to create a static labeling job or a
    # streaming labeling job. A static labeling job stops if all data
    # objects in the input manifest file identified in `ManifestS3Uri` have
    # been labeled. A streaming labeling job runs perpetually until it is
    # manually stopped, or remains idle for 10 days. You can send new data
    # objects to an active (`InProgress`) streaming labeling job in real
    # time. To learn how to create a static labeling job, see [Create a
    # Labeling Job (API) ][3] in the Amazon SageMaker Developer Guide. To
    # learn how to create a streaming labeling job, see [Create a Streaming
    # Labeling Job][4].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html
    # [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html
    # [3]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-create-labeling-job-api.html
    # [4]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-streaming-create-job.html
    #
    # @option params [required, String] :labeling_job_name
    #   The name of the labeling job. This name is used to identify the job in
    #   a list of labeling jobs. Labeling job names must be unique within an
    #   Amazon Web Services account and region. `LabelingJobName` is not case
    #   sensitive. For example, Example-job and example-job are considered the
    #   same labeling job name by Ground Truth.
    #
    # @option params [required, String] :label_attribute_name
    #   The attribute name to use for the label in the output manifest file.
    #   This is the key for the key/value pair formed with the label that a
    #   worker assigns to the object. The `LabelAttributeName` must meet the
    #   following requirements.
    #
    #   * The name can't end with "-metadata".
    #
    #   * If you are using one of the following [built-in task types][1], the
    #     attribute name *must* end with "-ref". If the task type you are
    #     using is not listed below, the attribute name *must not* end with
    #     "-ref".
    #
    #     * Image semantic segmentation (`SemanticSegmentation)`, and
    #       adjustment (`AdjustmentSemanticSegmentation`) and verification
    #       (`VerificationSemanticSegmentation`) labeling jobs for this task
    #       type.
    #
    #     * Video frame object detection (`VideoObjectDetection`), and
    #       adjustment and verification (`AdjustmentVideoObjectDetection`)
    #       labeling jobs for this task type.
    #
    #     * Video frame object tracking (`VideoObjectTracking`), and
    #       adjustment and verification (`AdjustmentVideoObjectTracking`)
    #       labeling jobs for this task type.
    #
    #     * 3D point cloud semantic segmentation
    #       (`3DPointCloudSemanticSegmentation`), and adjustment and
    #       verification (`Adjustment3DPointCloudSemanticSegmentation`)
    #       labeling jobs for this task type.
    #
    #     * 3D point cloud object tracking (`3DPointCloudObjectTracking`), and
    #       adjustment and verification
    #       (`Adjustment3DPointCloudObjectTracking`) labeling jobs for this
    #       task type.
    #
    #
    #
    #   If you are creating an adjustment or verification labeling job, you
    #   must use a *different* `LabelAttributeName` than the one used in the
    #   original labeling job. The original labeling job is the Ground Truth
    #   labeling job that produced the labels that you want verified or
    #   adjusted. To learn more about adjustment and verification labeling
    #   jobs, see [Verify and Adjust Labels][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-task-types.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-verification-data.html
    #
    # @option params [required, Types::LabelingJobInputConfig] :input_config
    #   Input data for the labeling job, such as the Amazon S3 location of the
    #   data objects and the location of the manifest file that describes the
    #   data objects.
    #
    #   You must specify at least one of the following: `S3DataSource` or
    #   `SnsDataSource`.
    #
    #   * Use `SnsDataSource` to specify an SNS input topic for a streaming
    #     labeling job. If you do not specify and SNS input topic ARN, Ground
    #     Truth will create a one-time labeling job that stops after all data
    #     objects in the input manifest file have been labeled.
    #
    #   * Use `S3DataSource` to specify an input manifest file for both
    #     streaming and one-time labeling jobs. Adding an `S3DataSource` is
    #     optional if you use `SnsDataSource` to create a streaming labeling
    #     job.
    #
    #   If you use the Amazon Mechanical Turk workforce, your input data
    #   should not include confidential information, personal information or
    #   protected health information. Use `ContentClassifiers` to specify that
    #   your data is free of personally identifiable information and adult
    #   content.
    #
    # @option params [required, Types::LabelingJobOutputConfig] :output_config
    #   The location of the output data and the Amazon Web Services Key
    #   Management Service key ID for the key used to encrypt the output data,
    #   if any.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Number (ARN) that Amazon SageMaker assumes to
    #   perform tasks on your behalf during data labeling. You must grant this
    #   role the necessary permissions so that Amazon SageMaker can
    #   successfully complete data labeling.
    #
    # @option params [String] :label_category_config_s3_uri
    #   The S3 URI of the file, referred to as a *label category configuration
    #   file*, that defines the categories used to label the data objects.
    #
    #   For 3D point cloud and video frame task types, you can add label
    #   category attributes and frame attributes to your label category
    #   configuration file. To learn how, see [Create a Labeling Category
    #   Configuration File for 3D Point Cloud Labeling Jobs][1].
    #
    #   For named entity recognition jobs, in addition to `"labels"`, you must
    #   provide worker instructions in the label category configuration file
    #   using the `"instructions"` parameter: `"instructions":
    #   \{"shortInstruction":"<h1>Add header</h1><p>Add Instructions</p>",
    #   "fullInstruction":"<p>Add additional instructions.</p>"\}`. For
    #   details and an example, see [Create a Named Entity Recognition
    #   Labeling Job (API) ][2].
    #
    #   For all other [built-in task types][3] and [custom tasks][4], your
    #   label category configuration file must be a JSON file in the following
    #   format. Identify the labels you want to use by replacing `label_1`,
    #   `label_2`,`...`,`label_n` with your label categories.
    #
    #   `\{ `
    #
    #   `"document-version": "2018-11-28",`
    #
    #   `"labels": [\{"label": "label_1"\},\{"label":
    #   "label_2"\},...\{"label": "label_n"\}]`
    #
    #   `\}`
    #
    #   Note the following about the label category configuration file:
    #
    #   * For image classification and text classification (single and
    #     multi-label) you must specify at least two label categories. For all
    #     other task types, the minimum number of label categories required is
    #     one.
    #
    #   * Each label category must be unique, you cannot specify duplicate
    #     label categories.
    #
    #   * If you create a 3D point cloud or video frame adjustment or
    #     verification labeling job, you must include
    #     `auditLabelAttributeName` in the label category configuration. Use
    #     this parameter to enter the [ `LabelAttributeName` ][5] of the
    #     labeling job you want to adjust or verify annotations of.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-point-cloud-label-category-config.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-named-entity-recg.html#sms-creating-ner-api
    #   [3]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-task-types.html
    #   [4]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-custom-templates.html
    #   [5]: https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateLabelingJob.html#sagemaker-CreateLabelingJob-request-LabelAttributeName
    #
    # @option params [Types::LabelingJobStoppingConditions] :stopping_conditions
    #   A set of conditions for stopping the labeling job. If any of the
    #   conditions are met, the job is automatically stopped. You can use
    #   these conditions to control the cost of data labeling.
    #
    # @option params [Types::LabelingJobAlgorithmsConfig] :labeling_job_algorithms_config
    #   Configures the information required to perform automated data
    #   labeling.
    #
    # @option params [required, Types::HumanTaskConfig] :human_task_config
    #   Configures the labeling task and how it is presented to workers;
    #   including, but not limited to price, keywords, and batch size (task
    #   count).
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key/value pairs. For more information, see [Using Cost
    #   Allocation Tags][1] in the *Amazon Web Services Billing and Cost
    #   Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what
    #
    # @return [Types::CreateLabelingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateLabelingJobResponse#labeling_job_arn #labeling_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_labeling_job({
    #     labeling_job_name: "LabelingJobName", # required
    #     label_attribute_name: "LabelAttributeName", # required
    #     input_config: { # required
    #       data_source: { # required
    #         s3_data_source: {
    #           manifest_s3_uri: "S3Uri", # required
    #         },
    #         sns_data_source: {
    #           sns_topic_arn: "SnsTopicArn", # required
    #         },
    #       },
    #       data_attributes: {
    #         content_classifiers: ["FreeOfPersonallyIdentifiableInformation"], # accepts FreeOfPersonallyIdentifiableInformation, FreeOfAdultContent
    #       },
    #     },
    #     output_config: { # required
    #       s3_output_path: "S3Uri", # required
    #       kms_key_id: "KmsKeyId",
    #       sns_topic_arn: "SnsTopicArn",
    #     },
    #     role_arn: "RoleArn", # required
    #     label_category_config_s3_uri: "S3Uri",
    #     stopping_conditions: {
    #       max_human_labeled_object_count: 1,
    #       max_percentage_of_input_dataset_labeled: 1,
    #     },
    #     labeling_job_algorithms_config: {
    #       labeling_job_algorithm_specification_arn: "LabelingJobAlgorithmSpecificationArn", # required
    #       initial_active_learning_model_arn: "ModelArn",
    #       labeling_job_resource_config: {
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #     },
    #     human_task_config: { # required
    #       workteam_arn: "WorkteamArn", # required
    #       ui_config: { # required
    #         ui_template_s3_uri: "S3Uri",
    #         human_task_ui_arn: "HumanTaskUiArn",
    #       },
    #       pre_human_task_lambda_arn: "LambdaFunctionArn", # required
    #       task_keywords: ["TaskKeyword"],
    #       task_title: "TaskTitle", # required
    #       task_description: "TaskDescription", # required
    #       number_of_human_workers_per_data_object: 1, # required
    #       task_time_limit_in_seconds: 1, # required
    #       task_availability_lifetime_in_seconds: 1,
    #       max_concurrent_task_count: 1,
    #       annotation_consolidation_config: { # required
    #         annotation_consolidation_lambda_arn: "LambdaFunctionArn", # required
    #       },
    #       public_workforce_task_price: {
    #         amount_in_usd: {
    #           dollars: 1,
    #           cents: 1,
    #           tenth_fractions_of_a_cent: 1,
    #         },
    #       },
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.labeling_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateLabelingJob AWS API Documentation
    #
    # @overload create_labeling_job(params = {})
    # @param [Hash] params ({})
    def create_labeling_job(params = {}, options = {})
      req = build_request(:create_labeling_job, params)
      req.send_request(options)
    end

    # Creates a model in Amazon SageMaker. In the request, you name the
    # model and describe a primary container. For the primary container, you
    # specify the Docker image that contains inference code, artifacts (from
    # prior training), and a custom environment map that the inference code
    # uses when you deploy the model for predictions.
    #
    # Use this API to create a model if you want to use Amazon SageMaker
    # hosting services or run a batch transform job.
    #
    # To host your model, you create an endpoint configuration with the
    # `CreateEndpointConfig` API, and then create an endpoint with the
    # `CreateEndpoint` API. Amazon SageMaker then deploys all of the
    # containers that you defined for the model in the hosting environment.
    #
    # For an example that calls this method when deploying a model to Amazon
    # SageMaker hosting services, see [Deploy the Model to Amazon SageMaker
    # Hosting Services (Amazon Web Services SDK for Python (Boto 3)).][1]
    #
    # To run a batch transform using your model, you start a job with the
    # `CreateTransformJob` API. Amazon SageMaker uses your model and your
    # dataset to get inferences which are then saved to a specified S3
    # location.
    #
    # In the `CreateModel` request, you must define a container with the
    # `PrimaryContainer` parameter.
    #
    # In the request, you also provide an IAM role that Amazon SageMaker can
    # assume to access model artifacts and docker image for deployment on ML
    # compute hosting instances or for batch transform jobs. In addition,
    # you also use the IAM role to manage permissions the inference code
    # needs. For example, if the inference code access any other Amazon Web
    # Services resources, you grant necessary permissions via this role.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto
    #
    # @option params [required, String] :model_name
    #   The name of the new model.
    #
    # @option params [Types::ContainerDefinition] :primary_container
    #   The location of the primary docker image containing inference code,
    #   associated artifacts, and custom environment map that the inference
    #   code uses when the model is deployed for predictions.
    #
    # @option params [Array<Types::ContainerDefinition>] :containers
    #   Specifies the containers in the inference pipeline.
    #
    # @option params [Types::InferenceExecutionConfig] :inference_execution_config
    #   Specifies details of how containers in a multi-container endpoint are
    #   called.
    #
    # @option params [required, String] :execution_role_arn
    #   The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker
    #   can assume to access model artifacts and docker image for deployment
    #   on ML compute instances or for batch transform jobs. Deploying on ML
    #   compute instances is part of model hosting. For more information, see
    #   [Amazon SageMaker Roles][1].
    #
    #   <note markdown="1"> To be able to pass this role to Amazon SageMaker, the caller of this
    #   API must have the `iam:PassRole` permission.
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @option params [Types::VpcConfig] :vpc_config
    #   A VpcConfig object that specifies the VPC that you want your model to
    #   connect to. Control access to and from your model container by
    #   configuring the VPC. `VpcConfig` is used in hosting services and in
    #   batch transform. For more information, see [Protect Endpoints by Using
    #   an Amazon Virtual Private Cloud][1] and [Protect Data in Batch
    #   Transform Jobs by Using an Amazon Virtual Private Cloud][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/batch-vpc.html
    #
    # @option params [Boolean] :enable_network_isolation
    #   Isolates the model container. No inbound or outbound network calls can
    #   be made to or from the model container.
    #
    # @return [Types::CreateModelOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateModelOutput#model_arn #model_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_model({
    #     model_name: "ModelName", # required
    #     primary_container: {
    #       container_hostname: "ContainerHostname",
    #       image: "ContainerImage",
    #       image_config: {
    #         repository_access_mode: "Platform", # required, accepts Platform, Vpc
    #         repository_auth_config: {
    #           repository_credentials_provider_arn: "RepositoryCredentialsProviderArn", # required
    #         },
    #       },
    #       mode: "SingleModel", # accepts SingleModel, MultiModel
    #       model_data_url: "Url",
    #       environment: {
    #         "EnvironmentKey" => "EnvironmentValue",
    #       },
    #       model_package_name: "VersionedArnOrName",
    #       multi_model_config: {
    #         model_cache_setting: "Enabled", # accepts Enabled, Disabled
    #       },
    #     },
    #     containers: [
    #       {
    #         container_hostname: "ContainerHostname",
    #         image: "ContainerImage",
    #         image_config: {
    #           repository_access_mode: "Platform", # required, accepts Platform, Vpc
    #           repository_auth_config: {
    #             repository_credentials_provider_arn: "RepositoryCredentialsProviderArn", # required
    #           },
    #         },
    #         mode: "SingleModel", # accepts SingleModel, MultiModel
    #         model_data_url: "Url",
    #         environment: {
    #           "EnvironmentKey" => "EnvironmentValue",
    #         },
    #         model_package_name: "VersionedArnOrName",
    #         multi_model_config: {
    #           model_cache_setting: "Enabled", # accepts Enabled, Disabled
    #         },
    #       },
    #     ],
    #     inference_execution_config: {
    #       mode: "Serial", # required, accepts Serial, Direct
    #     },
    #     execution_role_arn: "RoleArn", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     vpc_config: {
    #       security_group_ids: ["SecurityGroupId"], # required
    #       subnets: ["SubnetId"], # required
    #     },
    #     enable_network_isolation: false,
    #   })
    #
    # @example Response structure
    #
    #   resp.model_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateModel AWS API Documentation
    #
    # @overload create_model(params = {})
    # @param [Hash] params ({})
    def create_model(params = {}, options = {})
      req = build_request(:create_model, params)
      req.send_request(options)
    end

    # Creates the definition for a model bias job.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the bias job definition. The name must be unique within an
    #   Amazon Web Services Region in the Amazon Web Services account.
    #
    # @option params [Types::ModelBiasBaselineConfig] :model_bias_baseline_config
    #   The baseline configuration for a model bias job.
    #
    # @option params [required, Types::ModelBiasAppSpecification] :model_bias_app_specification
    #   Configures the model bias job to run a specified Docker container
    #   image.
    #
    # @option params [required, Types::ModelBiasJobInput] :model_bias_job_input
    #   Inputs for the model bias job.
    #
    # @option params [required, Types::MonitoringOutputConfig] :model_bias_job_output_config
    #   The output configuration for monitoring jobs.
    #
    # @option params [required, Types::MonitoringResources] :job_resources
    #   Identifies the resources to deploy for a monitoring job.
    #
    # @option params [Types::MonitoringNetworkConfig] :network_config
    #   Networking options for a model bias job.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
    #   can assume to perform tasks on your behalf.
    #
    # @option params [Types::MonitoringStoppingCondition] :stopping_condition
    #   A time limit for how long the monitoring job is allowed to run before
    #   stopping.
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags][1] in the *Amazon Web Services Billing
    #   and Cost Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL
    #
    # @return [Types::CreateModelBiasJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateModelBiasJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_model_bias_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #     model_bias_baseline_config: {
    #       baselining_job_name: "ProcessingJobName",
    #       constraints_resource: {
    #         s3_uri: "S3Uri",
    #       },
    #     },
    #     model_bias_app_specification: { # required
    #       image_uri: "ImageUri", # required
    #       config_uri: "S3Uri", # required
    #       environment: {
    #         "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #       },
    #     },
    #     model_bias_job_input: { # required
    #       endpoint_input: { # required
    #         endpoint_name: "EndpointName", # required
    #         local_path: "ProcessingLocalPath", # required
    #         s3_input_mode: "Pipe", # accepts Pipe, File
    #         s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #         features_attribute: "String",
    #         inference_attribute: "String",
    #         probability_attribute: "String",
    #         probability_threshold_attribute: 1.0,
    #         start_time_offset: "MonitoringTimeOffsetString",
    #         end_time_offset: "MonitoringTimeOffsetString",
    #       },
    #       ground_truth_s3_input: { # required
    #         s3_uri: "MonitoringS3Uri",
    #       },
    #     },
    #     model_bias_job_output_config: { # required
    #       monitoring_outputs: [ # required
    #         {
    #           s3_output: { # required
    #             s3_uri: "MonitoringS3Uri", # required
    #             local_path: "ProcessingLocalPath", # required
    #             s3_upload_mode: "Continuous", # accepts Continuous, EndOfJob
    #           },
    #         },
    #       ],
    #       kms_key_id: "KmsKeyId",
    #     },
    #     job_resources: { # required
    #       cluster_config: { # required
    #         instance_count: 1, # required
    #         instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1, # required
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #     },
    #     network_config: {
    #       enable_inter_container_traffic_encryption: false,
    #       enable_network_isolation: false,
    #       vpc_config: {
    #         security_group_ids: ["SecurityGroupId"], # required
    #         subnets: ["SubnetId"], # required
    #       },
    #     },
    #     role_arn: "RoleArn", # required
    #     stopping_condition: {
    #       max_runtime_in_seconds: 1, # required
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateModelBiasJobDefinition AWS API Documentation
    #
    # @overload create_model_bias_job_definition(params = {})
    # @param [Hash] params ({})
    def create_model_bias_job_definition(params = {}, options = {})
      req = build_request(:create_model_bias_job_definition, params)
      req.send_request(options)
    end

    # Creates the definition for a model explainability job.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model explainability job definition. The name must be
    #   unique within an Amazon Web Services Region in the Amazon Web Services
    #   account.
    #
    # @option params [Types::ModelExplainabilityBaselineConfig] :model_explainability_baseline_config
    #   The baseline configuration for a model explainability job.
    #
    # @option params [required, Types::ModelExplainabilityAppSpecification] :model_explainability_app_specification
    #   Configures the model explainability job to run a specified Docker
    #   container image.
    #
    # @option params [required, Types::ModelExplainabilityJobInput] :model_explainability_job_input
    #   Inputs for the model explainability job.
    #
    # @option params [required, Types::MonitoringOutputConfig] :model_explainability_job_output_config
    #   The output configuration for monitoring jobs.
    #
    # @option params [required, Types::MonitoringResources] :job_resources
    #   Identifies the resources to deploy for a monitoring job.
    #
    # @option params [Types::MonitoringNetworkConfig] :network_config
    #   Networking options for a model explainability job.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
    #   can assume to perform tasks on your behalf.
    #
    # @option params [Types::MonitoringStoppingCondition] :stopping_condition
    #   A time limit for how long the monitoring job is allowed to run before
    #   stopping.
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags][1] in the *Amazon Web Services Billing
    #   and Cost Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL
    #
    # @return [Types::CreateModelExplainabilityJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateModelExplainabilityJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_model_explainability_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #     model_explainability_baseline_config: {
    #       baselining_job_name: "ProcessingJobName",
    #       constraints_resource: {
    #         s3_uri: "S3Uri",
    #       },
    #     },
    #     model_explainability_app_specification: { # required
    #       image_uri: "ImageUri", # required
    #       config_uri: "S3Uri", # required
    #       environment: {
    #         "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #       },
    #     },
    #     model_explainability_job_input: { # required
    #       endpoint_input: { # required
    #         endpoint_name: "EndpointName", # required
    #         local_path: "ProcessingLocalPath", # required
    #         s3_input_mode: "Pipe", # accepts Pipe, File
    #         s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #         features_attribute: "String",
    #         inference_attribute: "String",
    #         probability_attribute: "String",
    #         probability_threshold_attribute: 1.0,
    #         start_time_offset: "MonitoringTimeOffsetString",
    #         end_time_offset: "MonitoringTimeOffsetString",
    #       },
    #     },
    #     model_explainability_job_output_config: { # required
    #       monitoring_outputs: [ # required
    #         {
    #           s3_output: { # required
    #             s3_uri: "MonitoringS3Uri", # required
    #             local_path: "ProcessingLocalPath", # required
    #             s3_upload_mode: "Continuous", # accepts Continuous, EndOfJob
    #           },
    #         },
    #       ],
    #       kms_key_id: "KmsKeyId",
    #     },
    #     job_resources: { # required
    #       cluster_config: { # required
    #         instance_count: 1, # required
    #         instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1, # required
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #     },
    #     network_config: {
    #       enable_inter_container_traffic_encryption: false,
    #       enable_network_isolation: false,
    #       vpc_config: {
    #         security_group_ids: ["SecurityGroupId"], # required
    #         subnets: ["SubnetId"], # required
    #       },
    #     },
    #     role_arn: "RoleArn", # required
    #     stopping_condition: {
    #       max_runtime_in_seconds: 1, # required
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateModelExplainabilityJobDefinition AWS API Documentation
    #
    # @overload create_model_explainability_job_definition(params = {})
    # @param [Hash] params ({})
    def create_model_explainability_job_definition(params = {}, options = {})
      req = build_request(:create_model_explainability_job_definition, params)
      req.send_request(options)
    end

    # Creates a model package that you can use to create Amazon SageMaker
    # models or list on Amazon Web Services Marketplace, or a versioned
    # model that is part of a model group. Buyers can subscribe to model
    # packages listed on Amazon Web Services Marketplace to create models in
    # Amazon SageMaker.
    #
    # To create a model package by specifying a Docker container that
    # contains your inference code and the Amazon S3 location of your model
    # artifacts, provide values for `InferenceSpecification`. To create a
    # model from an algorithm resource that you created or subscribed to in
    # Amazon Web Services Marketplace, provide a value for
    # `SourceAlgorithmSpecification`.
    #
    # <note markdown="1"> There are two types of model packages:
    #
    #  * Versioned - a model that is part of a model group in the model
    #   registry.
    #
    # * Unversioned - a model package that is not part of a model group.
    #
    #  </note>
    #
    # @option params [String] :model_package_name
    #   The name of the model package. The name must have 1 to 63 characters.
    #   Valid characters are a-z, A-Z, 0-9, and - (hyphen).
    #
    #   This parameter is required for unversioned models. It is not
    #   applicable to versioned models.
    #
    # @option params [String] :model_package_group_name
    #   The name of the model group that this model version belongs to.
    #
    #   This parameter is required for versioned models, and does not apply to
    #   unversioned models.
    #
    # @option params [String] :model_package_description
    #   A description of the model package.
    #
    # @option params [Types::InferenceSpecification] :inference_specification
    #   Specifies details about inference jobs that can be run with models
    #   based on this model package, including the following:
    #
    #   * The Amazon ECR paths of containers that contain the inference code
    #     and model artifacts.
    #
    #   * The instance types that the model package supports for transform
    #     jobs and real-time endpoints used for inference.
    #
    #   * The input and output content formats that the model package supports
    #     for inference.
    #
    # @option params [Types::ModelPackageValidationSpecification] :validation_specification
    #   Specifies configurations for one or more transform jobs that Amazon
    #   SageMaker runs to test the model package.
    #
    # @option params [Types::SourceAlgorithmSpecification] :source_algorithm_specification
    #   Details about the algorithm that was used to create the model package.
    #
    # @option params [Boolean] :certify_for_marketplace
    #   Whether to certify the model package for listing on Amazon Web
    #   Services Marketplace.
    #
    #   This parameter is optional for unversioned models, and does not apply
    #   to versioned models.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of key value pairs associated with the model. For more
    #   information, see [Tagging Amazon Web Services resources][1] in the
    #   *Amazon Web Services General Reference Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @option params [String] :model_approval_status
    #   Whether the model is approved for deployment.
    #
    #   This parameter is optional for versioned models, and does not apply to
    #   unversioned models.
    #
    #   For versioned models, the value of this parameter must be set to
    #   `Approved` to deploy the model.
    #
    # @option params [Types::MetadataProperties] :metadata_properties
    #   Metadata properties of the tracking entity, trial, or trial component.
    #
    # @option params [Types::ModelMetrics] :model_metrics
    #   A structure that contains model metrics reports.
    #
    # @option params [String] :client_token
    #   A unique token that guarantees that the call to this API is
    #   idempotent.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::CreateModelPackageOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateModelPackageOutput#model_package_arn #model_package_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_model_package({
    #     model_package_name: "EntityName",
    #     model_package_group_name: "EntityName",
    #     model_package_description: "EntityDescription",
    #     inference_specification: {
    #       containers: [ # required
    #         {
    #           container_hostname: "ContainerHostname",
    #           image: "ContainerImage", # required
    #           image_digest: "ImageDigest",
    #           model_data_url: "Url",
    #           product_id: "ProductId",
    #           environment: {
    #             "EnvironmentKey" => "EnvironmentValue",
    #           },
    #         },
    #       ],
    #       supported_transform_instance_types: ["ml.m4.xlarge"], # accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #       supported_realtime_inference_instance_types: ["ml.t2.medium"], # accepts ml.t2.medium, ml.t2.large, ml.t2.xlarge, ml.t2.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.12xlarge, ml.m5d.24xlarge, ml.c4.large, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5d.large, ml.c5d.xlarge, ml.c5d.2xlarge, ml.c5d.4xlarge, ml.c5d.9xlarge, ml.c5d.18xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.12xlarge, ml.r5.24xlarge, ml.r5d.large, ml.r5d.xlarge, ml.r5d.2xlarge, ml.r5d.4xlarge, ml.r5d.12xlarge, ml.r5d.24xlarge, ml.inf1.xlarge, ml.inf1.2xlarge, ml.inf1.6xlarge, ml.inf1.24xlarge
    #       supported_content_types: ["ContentType"], # required
    #       supported_response_mime_types: ["ResponseMIMEType"], # required
    #     },
    #     validation_specification: {
    #       validation_role: "RoleArn", # required
    #       validation_profiles: [ # required
    #         {
    #           profile_name: "EntityName", # required
    #           transform_job_definition: { # required
    #             max_concurrent_transforms: 1,
    #             max_payload_in_mb: 1,
    #             batch_strategy: "MultiRecord", # accepts MultiRecord, SingleRecord
    #             environment: {
    #               "TransformEnvironmentKey" => "TransformEnvironmentValue",
    #             },
    #             transform_input: { # required
    #               data_source: { # required
    #                 s3_data_source: { # required
    #                   s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #                   s3_uri: "S3Uri", # required
    #                 },
    #               },
    #               content_type: "ContentType",
    #               compression_type: "None", # accepts None, Gzip
    #               split_type: "None", # accepts None, Line, RecordIO, TFRecord
    #             },
    #             transform_output: { # required
    #               s3_output_path: "S3Uri", # required
    #               accept: "Accept",
    #               assemble_with: "None", # accepts None, Line
    #               kms_key_id: "KmsKeyId",
    #             },
    #             transform_resources: { # required
    #               instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #               instance_count: 1, # required
    #               volume_kms_key_id: "KmsKeyId",
    #             },
    #           },
    #         },
    #       ],
    #     },
    #     source_algorithm_specification: {
    #       source_algorithms: [ # required
    #         {
    #           model_data_url: "Url",
    #           algorithm_name: "ArnOrName", # required
    #         },
    #       ],
    #     },
    #     certify_for_marketplace: false,
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     model_approval_status: "Approved", # accepts Approved, Rejected, PendingManualApproval
    #     metadata_properties: {
    #       commit_id: "MetadataPropertyValue",
    #       repository: "MetadataPropertyValue",
    #       generated_by: "MetadataPropertyValue",
    #       project_id: "MetadataPropertyValue",
    #     },
    #     model_metrics: {
    #       model_quality: {
    #         statistics: {
    #           content_type: "ContentType", # required
    #           content_digest: "ContentDigest",
    #           s3_uri: "S3Uri", # required
    #         },
    #         constraints: {
    #           content_type: "ContentType", # required
    #           content_digest: "ContentDigest",
    #           s3_uri: "S3Uri", # required
    #         },
    #       },
    #       model_data_quality: {
    #         statistics: {
    #           content_type: "ContentType", # required
    #           content_digest: "ContentDigest",
    #           s3_uri: "S3Uri", # required
    #         },
    #         constraints: {
    #           content_type: "ContentType", # required
    #           content_digest: "ContentDigest",
    #           s3_uri: "S3Uri", # required
    #         },
    #       },
    #       bias: {
    #         report: {
    #           content_type: "ContentType", # required
    #           content_digest: "ContentDigest",
    #           s3_uri: "S3Uri", # required
    #         },
    #       },
    #       explainability: {
    #         report: {
    #           content_type: "ContentType", # required
    #           content_digest: "ContentDigest",
    #           s3_uri: "S3Uri", # required
    #         },
    #       },
    #     },
    #     client_token: "ClientToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateModelPackage AWS API Documentation
    #
    # @overload create_model_package(params = {})
    # @param [Hash] params ({})
    def create_model_package(params = {}, options = {})
      req = build_request(:create_model_package, params)
      req.send_request(options)
    end

    # Creates a model group. A model group contains a group of model
    # versions.
    #
    # @option params [required, String] :model_package_group_name
    #   The name of the model group.
    #
    # @option params [String] :model_package_group_description
    #   A description for the model group.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of key value pairs associated with the model group. For more
    #   information, see [Tagging Amazon Web Services resources][1] in the
    #   *Amazon Web Services General Reference Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateModelPackageGroupOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateModelPackageGroupOutput#model_package_group_arn #model_package_group_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_model_package_group({
    #     model_package_group_name: "EntityName", # required
    #     model_package_group_description: "EntityDescription",
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_group_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateModelPackageGroup AWS API Documentation
    #
    # @overload create_model_package_group(params = {})
    # @param [Hash] params ({})
    def create_model_package_group(params = {}, options = {})
      req = build_request(:create_model_package_group, params)
      req.send_request(options)
    end

    # Creates a definition for a job that monitors model quality and drift.
    # For information about model monitor, see [Amazon SageMaker Model
    # Monitor][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor.html
    #
    # @option params [required, String] :job_definition_name
    #   The name of the monitoring job definition.
    #
    # @option params [Types::ModelQualityBaselineConfig] :model_quality_baseline_config
    #   Specifies the constraints and baselines for the monitoring job.
    #
    # @option params [required, Types::ModelQualityAppSpecification] :model_quality_app_specification
    #   The container that runs the monitoring job.
    #
    # @option params [required, Types::ModelQualityJobInput] :model_quality_job_input
    #   A list of the inputs that are monitored. Currently endpoints are
    #   supported.
    #
    # @option params [required, Types::MonitoringOutputConfig] :model_quality_job_output_config
    #   The output configuration for monitoring jobs.
    #
    # @option params [required, Types::MonitoringResources] :job_resources
    #   Identifies the resources to deploy for a monitoring job.
    #
    # @option params [Types::MonitoringNetworkConfig] :network_config
    #   Specifies the network configuration for the monitoring job.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
    #   can assume to perform tasks on your behalf.
    #
    # @option params [Types::MonitoringStoppingCondition] :stopping_condition
    #   A time limit for how long the monitoring job is allowed to run before
    #   stopping.
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags][1] in the *Amazon Web Services Billing
    #   and Cost Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL
    #
    # @return [Types::CreateModelQualityJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateModelQualityJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_model_quality_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #     model_quality_baseline_config: {
    #       baselining_job_name: "ProcessingJobName",
    #       constraints_resource: {
    #         s3_uri: "S3Uri",
    #       },
    #     },
    #     model_quality_app_specification: { # required
    #       image_uri: "ImageUri", # required
    #       container_entrypoint: ["ContainerEntrypointString"],
    #       container_arguments: ["ContainerArgument"],
    #       record_preprocessor_source_uri: "S3Uri",
    #       post_analytics_processor_source_uri: "S3Uri",
    #       problem_type: "BinaryClassification", # accepts BinaryClassification, MulticlassClassification, Regression
    #       environment: {
    #         "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #       },
    #     },
    #     model_quality_job_input: { # required
    #       endpoint_input: { # required
    #         endpoint_name: "EndpointName", # required
    #         local_path: "ProcessingLocalPath", # required
    #         s3_input_mode: "Pipe", # accepts Pipe, File
    #         s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #         features_attribute: "String",
    #         inference_attribute: "String",
    #         probability_attribute: "String",
    #         probability_threshold_attribute: 1.0,
    #         start_time_offset: "MonitoringTimeOffsetString",
    #         end_time_offset: "MonitoringTimeOffsetString",
    #       },
    #       ground_truth_s3_input: { # required
    #         s3_uri: "MonitoringS3Uri",
    #       },
    #     },
    #     model_quality_job_output_config: { # required
    #       monitoring_outputs: [ # required
    #         {
    #           s3_output: { # required
    #             s3_uri: "MonitoringS3Uri", # required
    #             local_path: "ProcessingLocalPath", # required
    #             s3_upload_mode: "Continuous", # accepts Continuous, EndOfJob
    #           },
    #         },
    #       ],
    #       kms_key_id: "KmsKeyId",
    #     },
    #     job_resources: { # required
    #       cluster_config: { # required
    #         instance_count: 1, # required
    #         instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1, # required
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #     },
    #     network_config: {
    #       enable_inter_container_traffic_encryption: false,
    #       enable_network_isolation: false,
    #       vpc_config: {
    #         security_group_ids: ["SecurityGroupId"], # required
    #         subnets: ["SubnetId"], # required
    #       },
    #     },
    #     role_arn: "RoleArn", # required
    #     stopping_condition: {
    #       max_runtime_in_seconds: 1, # required
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateModelQualityJobDefinition AWS API Documentation
    #
    # @overload create_model_quality_job_definition(params = {})
    # @param [Hash] params ({})
    def create_model_quality_job_definition(params = {}, options = {})
      req = build_request(:create_model_quality_job_definition, params)
      req.send_request(options)
    end

    # Creates a schedule that regularly starts Amazon SageMaker Processing
    # Jobs to monitor the data captured for an Amazon SageMaker Endoint.
    #
    # @option params [required, String] :monitoring_schedule_name
    #   The name of the monitoring schedule. The name must be unique within an
    #   Amazon Web Services Region within an Amazon Web Services account.
    #
    # @option params [required, Types::MonitoringScheduleConfig] :monitoring_schedule_config
    #   The configuration object that specifies the monitoring schedule and
    #   defines the monitoring job.
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags](
    #   https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL)
    #   in the *Amazon Web Services Billing and Cost Management User Guide*.
    #
    # @return [Types::CreateMonitoringScheduleResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateMonitoringScheduleResponse#monitoring_schedule_arn #monitoring_schedule_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_monitoring_schedule({
    #     monitoring_schedule_name: "MonitoringScheduleName", # required
    #     monitoring_schedule_config: { # required
    #       schedule_config: {
    #         schedule_expression: "ScheduleExpression", # required
    #       },
    #       monitoring_job_definition: {
    #         baseline_config: {
    #           baselining_job_name: "ProcessingJobName",
    #           constraints_resource: {
    #             s3_uri: "S3Uri",
    #           },
    #           statistics_resource: {
    #             s3_uri: "S3Uri",
    #           },
    #         },
    #         monitoring_inputs: [ # required
    #           {
    #             endpoint_input: { # required
    #               endpoint_name: "EndpointName", # required
    #               local_path: "ProcessingLocalPath", # required
    #               s3_input_mode: "Pipe", # accepts Pipe, File
    #               s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #               features_attribute: "String",
    #               inference_attribute: "String",
    #               probability_attribute: "String",
    #               probability_threshold_attribute: 1.0,
    #               start_time_offset: "MonitoringTimeOffsetString",
    #               end_time_offset: "MonitoringTimeOffsetString",
    #             },
    #           },
    #         ],
    #         monitoring_output_config: { # required
    #           monitoring_outputs: [ # required
    #             {
    #               s3_output: { # required
    #                 s3_uri: "MonitoringS3Uri", # required
    #                 local_path: "ProcessingLocalPath", # required
    #                 s3_upload_mode: "Continuous", # accepts Continuous, EndOfJob
    #               },
    #             },
    #           ],
    #           kms_key_id: "KmsKeyId",
    #         },
    #         monitoring_resources: { # required
    #           cluster_config: { # required
    #             instance_count: 1, # required
    #             instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #             volume_size_in_gb: 1, # required
    #             volume_kms_key_id: "KmsKeyId",
    #           },
    #         },
    #         monitoring_app_specification: { # required
    #           image_uri: "ImageUri", # required
    #           container_entrypoint: ["ContainerEntrypointString"],
    #           container_arguments: ["ContainerArgument"],
    #           record_preprocessor_source_uri: "S3Uri",
    #           post_analytics_processor_source_uri: "S3Uri",
    #         },
    #         stopping_condition: {
    #           max_runtime_in_seconds: 1, # required
    #         },
    #         environment: {
    #           "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #         },
    #         network_config: {
    #           enable_inter_container_traffic_encryption: false,
    #           enable_network_isolation: false,
    #           vpc_config: {
    #             security_group_ids: ["SecurityGroupId"], # required
    #             subnets: ["SubnetId"], # required
    #           },
    #         },
    #         role_arn: "RoleArn", # required
    #       },
    #       monitoring_job_definition_name: "MonitoringJobDefinitionName",
    #       monitoring_type: "DataQuality", # accepts DataQuality, ModelQuality, ModelBias, ModelExplainability
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.monitoring_schedule_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateMonitoringSchedule AWS API Documentation
    #
    # @overload create_monitoring_schedule(params = {})
    # @param [Hash] params ({})
    def create_monitoring_schedule(params = {}, options = {})
      req = build_request(:create_monitoring_schedule, params)
      req.send_request(options)
    end

    # Creates an Amazon SageMaker notebook instance. A notebook instance is
    # a machine learning (ML) compute instance running on a Jupyter
    # notebook.
    #
    # In a `CreateNotebookInstance` request, specify the type of ML compute
    # instance that you want to run. Amazon SageMaker launches the instance,
    # installs common libraries that you can use to explore datasets for
    # model training, and attaches an ML storage volume to the notebook
    # instance.
    #
    # Amazon SageMaker also provides a set of example notebooks. Each
    # notebook demonstrates how to use Amazon SageMaker with a specific
    # algorithm or with a machine learning framework.
    #
    # After receiving the request, Amazon SageMaker does the following:
    #
    # 1.  Creates a network interface in the Amazon SageMaker VPC.
    #
    # 2.  (Option) If you specified `SubnetId`, Amazon SageMaker creates a
    #     network interface in your own VPC, which is inferred from the
    #     subnet ID that you provide in the input. When creating this
    #     network interface, Amazon SageMaker attaches the security group
    #     that you specified in the request to the network interface that it
    #     creates in your VPC.
    #
    # 3.  Launches an EC2 instance of the type specified in the request in
    #     the Amazon SageMaker VPC. If you specified `SubnetId` of your VPC,
    #     Amazon SageMaker specifies both network interfaces when launching
    #     this instance. This enables inbound traffic from your own VPC to
    #     the notebook instance, assuming that the security groups allow it.
    #
    # After creating the notebook instance, Amazon SageMaker returns its
    # Amazon Resource Name (ARN). You can't change the name of a notebook
    # instance after you create it.
    #
    # After Amazon SageMaker creates the notebook instance, you can connect
    # to the Jupyter server and work in Jupyter notebooks. For example, you
    # can write code to explore a dataset that you can use for model
    # training, train a model, host models by creating Amazon SageMaker
    # endpoints, and validate hosted models.
    #
    # For more information, see [How It Works][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the new notebook instance.
    #
    # @option params [required, String] :instance_type
    #   The type of ML compute instance to launch for the notebook instance.
    #
    # @option params [String] :subnet_id
    #   The ID of the subnet in a VPC to which you would like to have a
    #   connectivity from your ML compute instance.
    #
    # @option params [Array<String>] :security_group_ids
    #   The VPC security group IDs, in the form sg-xxxxxxxx. The security
    #   groups must be for the same VPC as specified in the subnet.
    #
    # @option params [required, String] :role_arn
    #   When you send any requests to Amazon Web Services resources from the
    #   notebook instance, Amazon SageMaker assumes this role to perform tasks
    #   on your behalf. You must grant this role necessary permissions so
    #   Amazon SageMaker can perform these tasks. The policy must allow the
    #   Amazon SageMaker service principal (sagemaker.amazonaws.com)
    #   permissions to assume this role. For more information, see [Amazon
    #   SageMaker Roles][1].
    #
    #   <note markdown="1"> To be able to pass this role to Amazon SageMaker, the caller of this
    #   API must have the `iam:PassRole` permission.
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html
    #
    # @option params [String] :kms_key_id
    #   The Amazon Resource Name (ARN) of a Amazon Web Services Key Management
    #   Service key that Amazon SageMaker uses to encrypt data on the storage
    #   volume attached to your notebook instance. The KMS key you provide
    #   must be enabled. For information, see [Enabling and Disabling Keys][1]
    #   in the *Amazon Web Services Key Management Service Developer Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/kms/latest/developerguide/enabling-keys.html
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @option params [String] :lifecycle_config_name
    #   The name of a lifecycle configuration to associate with the notebook
    #   instance. For information about lifestyle configurations, see [Step
    #   2.1: (Optional) Customize a Notebook Instance][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html
    #
    # @option params [String] :direct_internet_access
    #   Sets whether Amazon SageMaker provides internet access to the notebook
    #   instance. If you set this to `Disabled` this notebook instance is able
    #   to access resources only in your VPC, and is not be able to connect to
    #   Amazon SageMaker training and endpoint services unless you configure a
    #   NAT Gateway in your VPC.
    #
    #   For more information, see [Notebook Instances Are Internet-Enabled by
    #   Default][1]. You can set the value of this parameter to `Disabled`
    #   only if you set a value for the `SubnetId` parameter.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access
    #
    # @option params [Integer] :volume_size_in_gb
    #   The size, in GB, of the ML storage volume to attach to the notebook
    #   instance. The default value is 5 GB.
    #
    # @option params [Array<String>] :accelerator_types
    #   A list of Elastic Inference (EI) instance types to associate with this
    #   notebook instance. Currently, only one instance type can be associated
    #   with a notebook instance. For more information, see [Using Elastic
    #   Inference in Amazon SageMaker][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html
    #
    # @option params [String] :default_code_repository
    #   A Git repository to associate with the notebook instance as its
    #   default code repository. This can be either the name of a Git
    #   repository stored as a resource in your account, or the URL of a Git
    #   repository in [Amazon Web Services CodeCommit][1] or in any other Git
    #   repository. When you open a notebook instance, it opens in the
    #   directory that contains this repository. For more information, see
    #   [Associating Git Repositories with Amazon SageMaker Notebook
    #   Instances][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html
    #
    # @option params [Array<String>] :additional_code_repositories
    #   An array of up to three Git repositories to associate with the
    #   notebook instance. These can be either the names of Git repositories
    #   stored as resources in your account, or the URL of Git repositories in
    #   [Amazon Web Services CodeCommit][1] or in any other Git repository.
    #   These repositories are cloned at the same level as the default
    #   repository of your notebook instance. For more information, see
    #   [Associating Git Repositories with Amazon SageMaker Notebook
    #   Instances][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html
    #
    # @option params [String] :root_access
    #   Whether root access is enabled or disabled for users of the notebook
    #   instance. The default value is `Enabled`.
    #
    #   <note markdown="1"> Lifecycle configurations need root access to be able to set up a
    #   notebook instance. Because of this, lifecycle configurations
    #   associated with a notebook instance always run with root access even
    #   if you disable root access for users.
    #
    #    </note>
    #
    # @option params [String] :platform_identifier
    #   The platform identifier of the notebook instance runtime environment.
    #
    # @return [Types::CreateNotebookInstanceOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateNotebookInstanceOutput#notebook_instance_arn #notebook_instance_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_notebook_instance({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #     instance_type: "ml.t2.medium", # required, accepts ml.t2.medium, ml.t2.large, ml.t2.xlarge, ml.t2.2xlarge, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5d.xlarge, ml.c5d.2xlarge, ml.c5d.4xlarge, ml.c5d.9xlarge, ml.c5d.18xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #     subnet_id: "SubnetId",
    #     security_group_ids: ["SecurityGroupId"],
    #     role_arn: "RoleArn", # required
    #     kms_key_id: "KmsKeyId",
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     lifecycle_config_name: "NotebookInstanceLifecycleConfigName",
    #     direct_internet_access: "Enabled", # accepts Enabled, Disabled
    #     volume_size_in_gb: 1,
    #     accelerator_types: ["ml.eia1.medium"], # accepts ml.eia1.medium, ml.eia1.large, ml.eia1.xlarge, ml.eia2.medium, ml.eia2.large, ml.eia2.xlarge
    #     default_code_repository: "CodeRepositoryNameOrUrl",
    #     additional_code_repositories: ["CodeRepositoryNameOrUrl"],
    #     root_access: "Enabled", # accepts Enabled, Disabled
    #     platform_identifier: "PlatformIdentifier",
    #   })
    #
    # @example Response structure
    #
    #   resp.notebook_instance_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateNotebookInstance AWS API Documentation
    #
    # @overload create_notebook_instance(params = {})
    # @param [Hash] params ({})
    def create_notebook_instance(params = {}, options = {})
      req = build_request(:create_notebook_instance, params)
      req.send_request(options)
    end

    # Creates a lifecycle configuration that you can associate with a
    # notebook instance. A *lifecycle configuration* is a collection of
    # shell scripts that run when you create or start a notebook instance.
    #
    # Each lifecycle configuration script has a limit of 16384 characters.
    #
    # The value of the `$PATH` environment variable that is available to
    # both scripts is `/sbin:bin:/usr/sbin:/usr/bin`.
    #
    # View CloudWatch Logs for notebook instance lifecycle configurations in
    # log group `/aws/sagemaker/NotebookInstances` in log stream
    # `[notebook-instance-name]/[LifecycleConfigHook]`.
    #
    # Lifecycle configuration scripts cannot run for longer than 5 minutes.
    # If a script runs for longer than 5 minutes, it fails and the notebook
    # instance is not created or started.
    #
    # For information about notebook instance lifestyle configurations, see
    # [Step 2.1: (Optional) Customize a Notebook Instance][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html
    #
    # @option params [required, String] :notebook_instance_lifecycle_config_name
    #   The name of the lifecycle configuration.
    #
    # @option params [Array<Types::NotebookInstanceLifecycleHook>] :on_create
    #   A shell script that runs only once, when you create a notebook
    #   instance. The shell script must be a base64-encoded string.
    #
    # @option params [Array<Types::NotebookInstanceLifecycleHook>] :on_start
    #   A shell script that runs every time you start a notebook instance,
    #   including when you create the notebook instance. The shell script must
    #   be a base64-encoded string.
    #
    # @return [Types::CreateNotebookInstanceLifecycleConfigOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateNotebookInstanceLifecycleConfigOutput#notebook_instance_lifecycle_config_arn #notebook_instance_lifecycle_config_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_notebook_instance_lifecycle_config({
    #     notebook_instance_lifecycle_config_name: "NotebookInstanceLifecycleConfigName", # required
    #     on_create: [
    #       {
    #         content: "NotebookInstanceLifecycleConfigContent",
    #       },
    #     ],
    #     on_start: [
    #       {
    #         content: "NotebookInstanceLifecycleConfigContent",
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.notebook_instance_lifecycle_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateNotebookInstanceLifecycleConfig AWS API Documentation
    #
    # @overload create_notebook_instance_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def create_notebook_instance_lifecycle_config(params = {}, options = {})
      req = build_request(:create_notebook_instance_lifecycle_config, params)
      req.send_request(options)
    end

    # Creates a pipeline using a JSON pipeline definition.
    #
    # @option params [required, String] :pipeline_name
    #   The name of the pipeline.
    #
    # @option params [String] :pipeline_display_name
    #   The display name of the pipeline.
    #
    # @option params [required, String] :pipeline_definition
    #   The JSON pipeline definition of the pipeline.
    #
    # @option params [String] :pipeline_description
    #   A description of the pipeline.
    #
    # @option params [required, String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than one time.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of the role used by the pipeline to
    #   access and create resources.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to apply to the created pipeline.
    #
    # @return [Types::CreatePipelineResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreatePipelineResponse#pipeline_arn #pipeline_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_pipeline({
    #     pipeline_name: "PipelineName", # required
    #     pipeline_display_name: "PipelineName",
    #     pipeline_definition: "PipelineDefinition", # required
    #     pipeline_description: "PipelineDescription",
    #     client_request_token: "IdempotencyToken", # required
    #     role_arn: "RoleArn", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreatePipeline AWS API Documentation
    #
    # @overload create_pipeline(params = {})
    # @param [Hash] params ({})
    def create_pipeline(params = {}, options = {})
      req = build_request(:create_pipeline, params)
      req.send_request(options)
    end

    # Creates a URL for a specified UserProfile in a Domain. When accessed
    # in a web browser, the user will be automatically signed in to Amazon
    # SageMaker Studio, and granted access to all of the Apps and files
    # associated with the Domain's Amazon Elastic File System (EFS) volume.
    # This operation can only be called when the authentication mode equals
    # IAM.
    #
    # The IAM role or user used to call this API defines the permissions to
    # access the app. Once the presigned URL is created, no additional
    # permission is required to access this URL. IAM authorization policies
    # for this API are also enforced for every HTTP request and WebSocket
    # frame that attempts to connect to the app.
    #
    # You can restrict access to this API and to the URL that it returns to
    # a list of IP addresses, Amazon VPCs or Amazon VPC Endpoints that you
    # specify. For more information, see [Connect to SageMaker Studio
    # Through an Interface VPC Endpoint][1] .
    #
    # <note markdown="1"> The URL that you get from a call to `CreatePresignedDomainUrl` has a
    # default timeout of 5 minutes. You can configure this value using
    # `ExpiresInSeconds`. If you try to use the URL after the timeout limit
    # expires, you are directed to the Amazon Web Services console sign-in
    # page.
    #
    #  </note>
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/studio-interface-endpoint.html
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The name of the UserProfile to sign-in as.
    #
    # @option params [Integer] :session_expiration_duration_in_seconds
    #   The session expiration duration in seconds. This value defaults to
    #   43200.
    #
    # @option params [Integer] :expires_in_seconds
    #   The number of seconds until the pre-signed URL expires. This value
    #   defaults to 300.
    #
    # @return [Types::CreatePresignedDomainUrlResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreatePresignedDomainUrlResponse#authorized_url #authorized_url} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_presigned_domain_url({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #     session_expiration_duration_in_seconds: 1,
    #     expires_in_seconds: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.authorized_url #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreatePresignedDomainUrl AWS API Documentation
    #
    # @overload create_presigned_domain_url(params = {})
    # @param [Hash] params ({})
    def create_presigned_domain_url(params = {}, options = {})
      req = build_request(:create_presigned_domain_url, params)
      req.send_request(options)
    end

    # Returns a URL that you can use to connect to the Jupyter server from a
    # notebook instance. In the Amazon SageMaker console, when you choose
    # `Open` next to a notebook instance, Amazon SageMaker opens a new tab
    # showing the Jupyter server home page from the notebook instance. The
    # console uses this API to get the URL and show the page.
    #
    # The IAM role or user used to call this API defines the permissions to
    # access the notebook instance. Once the presigned URL is created, no
    # additional permission is required to access this URL. IAM
    # authorization policies for this API are also enforced for every HTTP
    # request and WebSocket frame that attempts to connect to the notebook
    # instance.
    #
    # You can restrict access to this API and to the URL that it returns to
    # a list of IP addresses that you specify. Use the `NotIpAddress`
    # condition operator and the `aws:SourceIP` condition context key to
    # specify the list of IP addresses that you want to have access to the
    # notebook instance. For more information, see [Limit Access to a
    # Notebook Instance by IP Address][1].
    #
    # <note markdown="1"> The URL that you get from a call to CreatePresignedNotebookInstanceUrl
    # is valid only for 5 minutes. If you try to use the URL after the
    # 5-minute limit expires, you are directed to the Amazon Web Services
    # console sign-in page.
    #
    #  </note>
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the notebook instance.
    #
    # @option params [Integer] :session_expiration_duration_in_seconds
    #   The duration of the session, in seconds. The default is 12 hours.
    #
    # @return [Types::CreatePresignedNotebookInstanceUrlOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreatePresignedNotebookInstanceUrlOutput#authorized_url #authorized_url} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_presigned_notebook_instance_url({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #     session_expiration_duration_in_seconds: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.authorized_url #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreatePresignedNotebookInstanceUrl AWS API Documentation
    #
    # @overload create_presigned_notebook_instance_url(params = {})
    # @param [Hash] params ({})
    def create_presigned_notebook_instance_url(params = {}, options = {})
      req = build_request(:create_presigned_notebook_instance_url, params)
      req.send_request(options)
    end

    # Creates a processing job.
    #
    # @option params [Array<Types::ProcessingInput>] :processing_inputs
    #   An array of inputs configuring the data to download into the
    #   processing container.
    #
    # @option params [Types::ProcessingOutputConfig] :processing_output_config
    #   Output configuration for the processing job.
    #
    # @option params [required, String] :processing_job_name
    #   The name of the processing job. The name must be unique within an
    #   Amazon Web Services Region in the Amazon Web Services account.
    #
    # @option params [required, Types::ProcessingResources] :processing_resources
    #   Identifies the resources, ML compute instances, and ML storage volumes
    #   to deploy for a processing job. In distributed training, you specify
    #   more than one instance.
    #
    # @option params [Types::ProcessingStoppingCondition] :stopping_condition
    #   The time limit for how long the processing job is allowed to run.
    #
    # @option params [required, Types::AppSpecification] :app_specification
    #   Configures the processing job to run a specified Docker container
    #   image.
    #
    # @option params [Hash<String,String>] :environment
    #   The environment variables to set in the Docker container. Up to 100
    #   key and values entries in the map are supported.
    #
    # @option params [Types::NetworkConfig] :network_config
    #   Networking options for a processing job, such as whether to allow
    #   inbound and outbound network calls to and from processing containers,
    #   and the VPC subnets and security groups to use for VPC-enabled
    #   processing jobs.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
    #   can assume to perform tasks on your behalf.
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags][1] in the *Amazon Web Services Billing
    #   and Cost Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL
    #
    # @option params [Types::ExperimentConfig] :experiment_config
    #   Associates a SageMaker job as a trial component with an experiment and
    #   trial. Specified when you call the following APIs:
    #
    #   * CreateProcessingJob
    #
    #   * CreateTrainingJob
    #
    #   * CreateTransformJob
    #
    # @return [Types::CreateProcessingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateProcessingJobResponse#processing_job_arn #processing_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_processing_job({
    #     processing_inputs: [
    #       {
    #         input_name: "String", # required
    #         app_managed: false,
    #         s3_input: {
    #           s3_uri: "S3Uri", # required
    #           local_path: "ProcessingLocalPath",
    #           s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix
    #           s3_input_mode: "Pipe", # accepts Pipe, File
    #           s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #           s3_compression_type: "None", # accepts None, Gzip
    #         },
    #         dataset_definition: {
    #           athena_dataset_definition: {
    #             catalog: "AthenaCatalog", # required
    #             database: "AthenaDatabase", # required
    #             query_string: "AthenaQueryString", # required
    #             work_group: "AthenaWorkGroup",
    #             output_s3_uri: "S3Uri", # required
    #             kms_key_id: "KmsKeyId",
    #             output_format: "PARQUET", # required, accepts PARQUET, ORC, AVRO, JSON, TEXTFILE
    #             output_compression: "GZIP", # accepts GZIP, SNAPPY, ZLIB
    #           },
    #           redshift_dataset_definition: {
    #             cluster_id: "RedshiftClusterId", # required
    #             database: "RedshiftDatabase", # required
    #             db_user: "RedshiftUserName", # required
    #             query_string: "RedshiftQueryString", # required
    #             cluster_role_arn: "RoleArn", # required
    #             output_s3_uri: "S3Uri", # required
    #             kms_key_id: "KmsKeyId",
    #             output_format: "PARQUET", # required, accepts PARQUET, CSV
    #             output_compression: "None", # accepts None, GZIP, BZIP2, ZSTD, SNAPPY
    #           },
    #           local_path: "ProcessingLocalPath",
    #           data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #           input_mode: "Pipe", # accepts Pipe, File
    #         },
    #       },
    #     ],
    #     processing_output_config: {
    #       outputs: [ # required
    #         {
    #           output_name: "String", # required
    #           s3_output: {
    #             s3_uri: "S3Uri", # required
    #             local_path: "ProcessingLocalPath", # required
    #             s3_upload_mode: "Continuous", # required, accepts Continuous, EndOfJob
    #           },
    #           feature_store_output: {
    #             feature_group_name: "FeatureGroupName", # required
    #           },
    #           app_managed: false,
    #         },
    #       ],
    #       kms_key_id: "KmsKeyId",
    #     },
    #     processing_job_name: "ProcessingJobName", # required
    #     processing_resources: { # required
    #       cluster_config: { # required
    #         instance_count: 1, # required
    #         instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1, # required
    #         volume_kms_key_id: "KmsKeyId",
    #       },
    #     },
    #     stopping_condition: {
    #       max_runtime_in_seconds: 1, # required
    #     },
    #     app_specification: { # required
    #       image_uri: "ImageUri", # required
    #       container_entrypoint: ["ContainerEntrypointString"],
    #       container_arguments: ["ContainerArgument"],
    #     },
    #     environment: {
    #       "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #     },
    #     network_config: {
    #       enable_inter_container_traffic_encryption: false,
    #       enable_network_isolation: false,
    #       vpc_config: {
    #         security_group_ids: ["SecurityGroupId"], # required
    #         subnets: ["SubnetId"], # required
    #       },
    #     },
    #     role_arn: "RoleArn", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     experiment_config: {
    #       experiment_name: "ExperimentEntityName",
    #       trial_name: "ExperimentEntityName",
    #       trial_component_display_name: "ExperimentEntityName",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.processing_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateProcessingJob AWS API Documentation
    #
    # @overload create_processing_job(params = {})
    # @param [Hash] params ({})
    def create_processing_job(params = {}, options = {})
      req = build_request(:create_processing_job, params)
      req.send_request(options)
    end

    # Creates a machine learning (ML) project that can contain one or more
    # templates that set up an ML pipeline from training to deploying an
    # approved model.
    #
    # @option params [required, String] :project_name
    #   The name of the project.
    #
    # @option params [String] :project_description
    #   A description for the project.
    #
    # @option params [required, Types::ServiceCatalogProvisioningDetails] :service_catalog_provisioning_details
    #   The product ID and provisioning artifact ID to provision a service
    #   catalog. The provisioning artifact ID will default to the latest
    #   provisioning artifact ID of the product, if you don't provide the
    #   provisioning artifact ID. For more information, see [What is Amazon
    #   Web Services Service Catalog][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/servicecatalog/latest/adminguide/introduction.html
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs that you want to use to organize and track
    #   your Amazon Web Services resource costs. For more information, see
    #   [Tagging Amazon Web Services resources][1] in the *Amazon Web Services
    #   General Reference Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @return [Types::CreateProjectOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateProjectOutput#project_arn #project_arn} => String
    #   * {Types::CreateProjectOutput#project_id #project_id} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_project({
    #     project_name: "ProjectEntityName", # required
    #     project_description: "EntityDescription",
    #     service_catalog_provisioning_details: { # required
    #       product_id: "ServiceCatalogEntityId", # required
    #       provisioning_artifact_id: "ServiceCatalogEntityId",
    #       path_id: "ServiceCatalogEntityId",
    #       provisioning_parameters: [
    #         {
    #           key: "ProvisioningParameterKey",
    #           value: "ProvisioningParameterValue",
    #         },
    #       ],
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.project_arn #=> String
    #   resp.project_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateProject AWS API Documentation
    #
    # @overload create_project(params = {})
    # @param [Hash] params ({})
    def create_project(params = {}, options = {})
      req = build_request(:create_project, params)
      req.send_request(options)
    end

    # Creates a new Studio Lifecycle Configuration.
    #
    # @option params [required, String] :studio_lifecycle_config_name
    #   The name of the Studio Lifecycle Configuration to create.
    #
    # @option params [required, String] :studio_lifecycle_config_content
    #   The content of your Studio Lifecycle Configuration script. This
    #   content must be base64 encoded.
    #
    # @option params [required, String] :studio_lifecycle_config_app_type
    #   The App type that the Lifecycle Configuration is attached to.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Tags to be associated with the Lifecycle Configuration. Each tag
    #   consists of a key and an optional value. Tag keys must be unique per
    #   resource. Tags are searchable using the Search API.
    #
    # @return [Types::CreateStudioLifecycleConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateStudioLifecycleConfigResponse#studio_lifecycle_config_arn #studio_lifecycle_config_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_studio_lifecycle_config({
    #     studio_lifecycle_config_name: "StudioLifecycleConfigName", # required
    #     studio_lifecycle_config_content: "StudioLifecycleConfigContent", # required
    #     studio_lifecycle_config_app_type: "JupyterServer", # required, accepts JupyterServer, KernelGateway
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.studio_lifecycle_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateStudioLifecycleConfig AWS API Documentation
    #
    # @overload create_studio_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def create_studio_lifecycle_config(params = {}, options = {})
      req = build_request(:create_studio_lifecycle_config, params)
      req.send_request(options)
    end

    # Starts a model training job. After training completes, Amazon
    # SageMaker saves the resulting model artifacts to an Amazon S3 location
    # that you specify.
    #
    # If you choose to host your model using Amazon SageMaker hosting
    # services, you can use the resulting model artifacts as part of the
    # model. You can also use the artifacts in a machine learning service
    # other than Amazon SageMaker, provided that you know how to use them
    # for inference.
    #
    # In the request body, you provide the following:
    #
    # * `AlgorithmSpecification` - Identifies the training algorithm to use.
    #
    # * `HyperParameters` - Specify these algorithm-specific parameters to
    #   enable the estimation of model parameters during training.
    #   Hyperparameters can be tuned to optimize this learning process. For
    #   a list of hyperparameters for each training algorithm provided by
    #   Amazon SageMaker, see [Algorithms][1].
    #
    # * `InputDataConfig` - Describes the training dataset and the Amazon
    #   S3, EFS, or FSx location where it is stored.
    #
    # * `OutputDataConfig` - Identifies the Amazon S3 bucket where you want
    #   Amazon SageMaker to save the results of model training.
    #
    # * `ResourceConfig` - Identifies the resources, ML compute instances,
    #   and ML storage volumes to deploy for model training. In distributed
    #   training, you specify more than one instance.
    #
    # * `EnableManagedSpotTraining` - Optimize the cost of training machine
    #   learning models by up to 80% by using Amazon EC2 Spot instances. For
    #   more information, see [Managed Spot Training][2].
    #
    # * `RoleArn` - The Amazon Resource Name (ARN) that Amazon SageMaker
    #   assumes to perform tasks on your behalf during model training. You
    #   must grant this role the necessary permissions so that Amazon
    #   SageMaker can successfully complete model training.
    #
    # * `StoppingCondition` - To help cap training costs, use
    #   `MaxRuntimeInSeconds` to set a time limit for training. Use
    #   `MaxWaitTimeInSeconds` to specify how long a managed spot training
    #   job has to complete.
    #
    # * `Environment` - The environment variables to set in the Docker
    #   container.
    #
    # * `RetryStrategy` - The number of times to retry the job when the job
    #   fails due to an `InternalServerError`.
    #
    # For more information about Amazon SageMaker, see [How It Works][3].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html
    # [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html
    # [3]: https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html
    #
    # @option params [required, String] :training_job_name
    #   The name of the training job. The name must be unique within an Amazon
    #   Web Services Region in an Amazon Web Services account.
    #
    # @option params [Hash<String,String>] :hyper_parameters
    #   Algorithm-specific parameters that influence the quality of the model.
    #   You set hyperparameters before you start the learning process. For a
    #   list of hyperparameters for each training algorithm provided by Amazon
    #   SageMaker, see [Algorithms][1].
    #
    #   You can specify a maximum of 100 hyperparameters. Each hyperparameter
    #   is a key-value pair. Each key and value is limited to 256 characters,
    #   as specified by the `Length Constraint`.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html
    #
    # @option params [required, Types::AlgorithmSpecification] :algorithm_specification
    #   The registry path of the Docker image that contains the training
    #   algorithm and algorithm-specific metadata, including the input mode.
    #   For more information about algorithms provided by Amazon SageMaker,
    #   see [Algorithms][1]. For information about providing your own
    #   algorithms, see [Using Your Own Algorithms with Amazon SageMaker][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker
    #   can assume to perform tasks on your behalf.
    #
    #   During model training, Amazon SageMaker needs your permission to read
    #   input data from an S3 bucket, download a Docker image that contains
    #   training code, write model artifacts to an S3 bucket, write logs to
    #   Amazon CloudWatch Logs, and publish metrics to Amazon CloudWatch. You
    #   grant permissions for all of these tasks to an IAM role. For more
    #   information, see [Amazon SageMaker Roles][1].
    #
    #   <note markdown="1"> To be able to pass this role to Amazon SageMaker, the caller of this
    #   API must have the `iam:PassRole` permission.
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html
    #
    # @option params [Array<Types::Channel>] :input_data_config
    #   An array of `Channel` objects. Each channel is a named input source.
    #   `InputDataConfig` describes the input data and its location.
    #
    #   Algorithms can accept input data from one or more channels. For
    #   example, an algorithm might have two channels of input data,
    #   `training_data` and `validation_data`. The configuration for each
    #   channel provides the S3, EFS, or FSx location where the input data is
    #   stored. It also provides information about the stored data: the MIME
    #   type, compression method, and whether the data is wrapped in RecordIO
    #   format.
    #
    #   Depending on the input mode that the algorithm supports, Amazon
    #   SageMaker either copies input data files from an S3 bucket to a local
    #   directory in the Docker container, or makes it available as input
    #   streams. For example, if you specify an EFS location, input data files
    #   will be made available as input streams. They do not need to be
    #   downloaded.
    #
    # @option params [required, Types::OutputDataConfig] :output_data_config
    #   Specifies the path to the S3 location where you want to store model
    #   artifacts. Amazon SageMaker creates subfolders for the artifacts.
    #
    # @option params [required, Types::ResourceConfig] :resource_config
    #   The resources, including the ML compute instances and ML storage
    #   volumes, to use for model training.
    #
    #   ML storage volumes store model artifacts and incremental states.
    #   Training algorithms might also use ML storage volumes for scratch
    #   space. If you want Amazon SageMaker to use the ML storage volume to
    #   store the training data, choose `File` as the `TrainingInputMode` in
    #   the algorithm specification. For distributed training algorithms,
    #   specify an instance count greater than 1.
    #
    # @option params [Types::VpcConfig] :vpc_config
    #   A VpcConfig object that specifies the VPC that you want your training
    #   job to connect to. Control access to and from your training container
    #   by configuring the VPC. For more information, see [Protect Training
    #   Jobs by Using an Amazon Virtual Private Cloud][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html
    #
    # @option params [required, Types::StoppingCondition] :stopping_condition
    #   Specifies a limit to how long a model training job can run. It also
    #   specifies how long a managed Spot training job has to complete. When
    #   the job reaches the time limit, Amazon SageMaker ends the training
    #   job. Use this API to cap model training costs.
    #
    #   To stop a job, Amazon SageMaker sends the algorithm the `SIGTERM`
    #   signal, which delays job termination for 120 seconds. Algorithms can
    #   use this 120-second window to save the model artifacts, so the results
    #   of training are not lost.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs. You can use tags to categorize your
    #   Amazon Web Services resources in different ways, for example, by
    #   purpose, owner, or environment. For more information, see [Tagging
    #   Amazon Web Services Resources][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html
    #
    # @option params [Boolean] :enable_network_isolation
    #   Isolates the training container. No inbound or outbound network calls
    #   can be made, except for calls between peers within a training cluster
    #   for distributed training. If you enable network isolation for training
    #   jobs that are configured to use a VPC, Amazon SageMaker downloads and
    #   uploads customer data and model artifacts through the specified VPC,
    #   but the training container does not have network access.
    #
    # @option params [Boolean] :enable_inter_container_traffic_encryption
    #   To encrypt all communications between ML compute instances in
    #   distributed training, choose `True`. Encryption provides greater
    #   security for distributed training, but training might take longer. How
    #   long it takes depends on the amount of communication between compute
    #   instances, especially if you use a deep learning algorithm in
    #   distributed training. For more information, see [Protect
    #   Communications Between ML Compute Instances in a Distributed Training
    #   Job][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/train-encrypt.html
    #
    # @option params [Boolean] :enable_managed_spot_training
    #   To train models using managed spot training, choose `True`. Managed
    #   spot training provides a fully managed and scalable infrastructure for
    #   training machine learning models. this option is useful when training
    #   jobs can be interrupted and when there is flexibility when the
    #   training job is run.
    #
    #   The complete and intermediate results of jobs are stored in an Amazon
    #   S3 bucket, and can be used as a starting point to train models
    #   incrementally. Amazon SageMaker provides metrics and logs in
    #   CloudWatch. They can be used to see when managed spot training jobs
    #   are running, interrupted, resumed, or completed.
    #
    # @option params [Types::CheckpointConfig] :checkpoint_config
    #   Contains information about the output location for managed spot
    #   training checkpoint data.
    #
    # @option params [Types::DebugHookConfig] :debug_hook_config
    #   Configuration information for the Debugger hook parameters, metric and
    #   tensor collections, and storage paths. To learn more about how to
    #   configure the `DebugHookConfig` parameter, see [Use the SageMaker and
    #   Debugger Configuration API Operations to Create, Update, and Debug
    #   Your Training Job][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/debugger-createtrainingjob-api.html
    #
    # @option params [Array<Types::DebugRuleConfiguration>] :debug_rule_configurations
    #   Configuration information for Debugger rules for debugging output
    #   tensors.
    #
    # @option params [Types::TensorBoardOutputConfig] :tensor_board_output_config
    #   Configuration of storage locations for the Debugger TensorBoard output
    #   data.
    #
    # @option params [Types::ExperimentConfig] :experiment_config
    #   Associates a SageMaker job as a trial component with an experiment and
    #   trial. Specified when you call the following APIs:
    #
    #   * CreateProcessingJob
    #
    #   * CreateTrainingJob
    #
    #   * CreateTransformJob
    #
    # @option params [Types::ProfilerConfig] :profiler_config
    #   Configuration information for Debugger system monitoring, framework
    #   profiling, and storage paths.
    #
    # @option params [Array<Types::ProfilerRuleConfiguration>] :profiler_rule_configurations
    #   Configuration information for Debugger rules for profiling system and
    #   framework metrics.
    #
    # @option params [Hash<String,String>] :environment
    #   The environment variables to set in the Docker container.
    #
    # @option params [Types::RetryStrategy] :retry_strategy
    #   The number of times to retry the job when the job fails due to an
    #   `InternalServerError`.
    #
    # @return [Types::CreateTrainingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateTrainingJobResponse#training_job_arn #training_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_training_job({
    #     training_job_name: "TrainingJobName", # required
    #     hyper_parameters: {
    #       "HyperParameterKey" => "HyperParameterValue",
    #     },
    #     algorithm_specification: { # required
    #       training_image: "AlgorithmImage",
    #       algorithm_name: "ArnOrName",
    #       training_input_mode: "Pipe", # required, accepts Pipe, File, FastFile
    #       metric_definitions: [
    #         {
    #           name: "MetricName", # required
    #           regex: "MetricRegex", # required
    #         },
    #       ],
    #       enable_sage_maker_metrics_time_series: false,
    #     },
    #     role_arn: "RoleArn", # required
    #     input_data_config: [
    #       {
    #         channel_name: "ChannelName", # required
    #         data_source: { # required
    #           s3_data_source: {
    #             s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #             s3_uri: "S3Uri", # required
    #             s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #             attribute_names: ["AttributeName"],
    #           },
    #           file_system_data_source: {
    #             file_system_id: "FileSystemId", # required
    #             file_system_access_mode: "rw", # required, accepts rw, ro
    #             file_system_type: "EFS", # required, accepts EFS, FSxLustre
    #             directory_path: "DirectoryPath", # required
    #           },
    #         },
    #         content_type: "ContentType",
    #         compression_type: "None", # accepts None, Gzip
    #         record_wrapper_type: "None", # accepts None, RecordIO
    #         input_mode: "Pipe", # accepts Pipe, File, FastFile
    #         shuffle_config: {
    #           seed: 1, # required
    #         },
    #       },
    #     ],
    #     output_data_config: { # required
    #       kms_key_id: "KmsKeyId",
    #       s3_output_path: "S3Uri", # required
    #     },
    #     resource_config: { # required
    #       instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.p4d.24xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5n.xlarge, ml.c5n.2xlarge, ml.c5n.4xlarge, ml.c5n.9xlarge, ml.c5n.18xlarge
    #       instance_count: 1, # required
    #       volume_size_in_gb: 1, # required
    #       volume_kms_key_id: "KmsKeyId",
    #     },
    #     vpc_config: {
    #       security_group_ids: ["SecurityGroupId"], # required
    #       subnets: ["SubnetId"], # required
    #     },
    #     stopping_condition: { # required
    #       max_runtime_in_seconds: 1,
    #       max_wait_time_in_seconds: 1,
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     enable_network_isolation: false,
    #     enable_inter_container_traffic_encryption: false,
    #     enable_managed_spot_training: false,
    #     checkpoint_config: {
    #       s3_uri: "S3Uri", # required
    #       local_path: "DirectoryPath",
    #     },
    #     debug_hook_config: {
    #       local_path: "DirectoryPath",
    #       s3_output_path: "S3Uri", # required
    #       hook_parameters: {
    #         "ConfigKey" => "ConfigValue",
    #       },
    #       collection_configurations: [
    #         {
    #           collection_name: "CollectionName",
    #           collection_parameters: {
    #             "ConfigKey" => "ConfigValue",
    #           },
    #         },
    #       ],
    #     },
    #     debug_rule_configurations: [
    #       {
    #         rule_configuration_name: "RuleConfigurationName", # required
    #         local_path: "DirectoryPath",
    #         s3_output_path: "S3Uri",
    #         rule_evaluator_image: "AlgorithmImage", # required
    #         instance_type: "ml.t3.medium", # accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1,
    #         rule_parameters: {
    #           "ConfigKey" => "ConfigValue",
    #         },
    #       },
    #     ],
    #     tensor_board_output_config: {
    #       local_path: "DirectoryPath",
    #       s3_output_path: "S3Uri", # required
    #     },
    #     experiment_config: {
    #       experiment_name: "ExperimentEntityName",
    #       trial_name: "ExperimentEntityName",
    #       trial_component_display_name: "ExperimentEntityName",
    #     },
    #     profiler_config: {
    #       s3_output_path: "S3Uri", # required
    #       profiling_interval_in_milliseconds: 1,
    #       profiling_parameters: {
    #         "ConfigKey" => "ConfigValue",
    #       },
    #     },
    #     profiler_rule_configurations: [
    #       {
    #         rule_configuration_name: "RuleConfigurationName", # required
    #         local_path: "DirectoryPath",
    #         s3_output_path: "S3Uri",
    #         rule_evaluator_image: "AlgorithmImage", # required
    #         instance_type: "ml.t3.medium", # accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1,
    #         rule_parameters: {
    #           "ConfigKey" => "ConfigValue",
    #         },
    #       },
    #     ],
    #     environment: {
    #       "TrainingEnvironmentKey" => "TrainingEnvironmentValue",
    #     },
    #     retry_strategy: {
    #       maximum_retry_attempts: 1, # required
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.training_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateTrainingJob AWS API Documentation
    #
    # @overload create_training_job(params = {})
    # @param [Hash] params ({})
    def create_training_job(params = {}, options = {})
      req = build_request(:create_training_job, params)
      req.send_request(options)
    end

    # Starts a transform job. A transform job uses a trained model to get
    # inferences on a dataset and saves these results to an Amazon S3
    # location that you specify.
    #
    # To perform batch transformations, you create a transform job and use
    # the data that you have readily available.
    #
    # In the request body, you provide the following:
    #
    # * `TransformJobName` - Identifies the transform job. The name must be
    #   unique within an Amazon Web Services Region in an Amazon Web
    #   Services account.
    #
    # * `ModelName` - Identifies the model to use. `ModelName` must be the
    #   name of an existing Amazon SageMaker model in the same Amazon Web
    #   Services Region and Amazon Web Services account. For information on
    #   creating a model, see CreateModel.
    #
    # * `TransformInput` - Describes the dataset to be transformed and the
    #   Amazon S3 location where it is stored.
    #
    # * `TransformOutput` - Identifies the Amazon S3 location where you want
    #   Amazon SageMaker to save the results from the transform job.
    #
    # * `TransformResources` - Identifies the ML compute instances for the
    #   transform job.
    #
    # For more information about how batch transformation works, see [Batch
    # Transform][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html
    #
    # @option params [required, String] :transform_job_name
    #   The name of the transform job. The name must be unique within an
    #   Amazon Web Services Region in an Amazon Web Services account.
    #
    # @option params [required, String] :model_name
    #   The name of the model that you want to use for the transform job.
    #   `ModelName` must be the name of an existing Amazon SageMaker model
    #   within an Amazon Web Services Region in an Amazon Web Services
    #   account.
    #
    # @option params [Integer] :max_concurrent_transforms
    #   The maximum number of parallel requests that can be sent to each
    #   instance in a transform job. If `MaxConcurrentTransforms` is set to
    #   `0` or left unset, Amazon SageMaker checks the optional
    #   execution-parameters to determine the settings for your chosen
    #   algorithm. If the execution-parameters endpoint is not enabled, the
    #   default value is `1`. For more information on execution-parameters,
    #   see [How Containers Serve Requests][1]. For built-in algorithms, you
    #   don't need to set a value for `MaxConcurrentTransforms`.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-batch-code.html#your-algorithms-batch-code-how-containe-serves-requests
    #
    # @option params [Types::ModelClientConfig] :model_client_config
    #   Configures the timeout and maximum number of retries for processing a
    #   transform job invocation.
    #
    # @option params [Integer] :max_payload_in_mb
    #   The maximum allowed size of the payload, in MB. A *payload* is the
    #   data portion of a record (without metadata). The value in
    #   `MaxPayloadInMB` must be greater than, or equal to, the size of a
    #   single record. To estimate the size of a record in MB, divide the size
    #   of your dataset by the number of records. To ensure that the records
    #   fit within the maximum payload size, we recommend using a slightly
    #   larger value. The default value is `6` MB.
    #
    #   For cases where the payload might be arbitrarily large and is
    #   transmitted using HTTP chunked encoding, set the value to `0`. This
    #   feature works only in supported algorithms. Currently, Amazon
    #   SageMaker built-in algorithms do not support HTTP chunked encoding.
    #
    # @option params [String] :batch_strategy
    #   Specifies the number of records to include in a mini-batch for an HTTP
    #   inference request. A *record* ** is a single unit of input data that
    #   inference can be made on. For example, a single line in a CSV file is
    #   a record.
    #
    #   To enable the batch strategy, you must set the `SplitType` property to
    #   `Line`, `RecordIO`, or `TFRecord`.
    #
    #   To use only one record when making an HTTP invocation request to a
    #   container, set `BatchStrategy` to `SingleRecord` and `SplitType` to
    #   `Line`.
    #
    #   To fit as many records in a mini-batch as can fit within the
    #   `MaxPayloadInMB` limit, set `BatchStrategy` to `MultiRecord` and
    #   `SplitType` to `Line`.
    #
    # @option params [Hash<String,String>] :environment
    #   The environment variables to set in the Docker container. We support
    #   up to 16 key and values entries in the map.
    #
    # @option params [required, Types::TransformInput] :transform_input
    #   Describes the input source and the way the transform job consumes it.
    #
    # @option params [required, Types::TransformOutput] :transform_output
    #   Describes the results of the transform job.
    #
    # @option params [required, Types::TransformResources] :transform_resources
    #   Describes the resources, including ML instance types and ML instance
    #   count, to use for the transform job.
    #
    # @option params [Types::DataProcessing] :data_processing
    #   The data structure used to specify the data to be used for inference
    #   in a batch transform job and to associate the data that is relevant to
    #   the prediction results in the output. The input filter provided allows
    #   you to exclude input data that is not needed for inference in a batch
    #   transform job. The output filter provided allows you to include input
    #   data relevant to interpreting the predictions in the output from the
    #   job. For more information, see [Associate Prediction Results with
    #   their Corresponding Input Records][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html
    #
    # @option params [Array<Types::Tag>] :tags
    #   (Optional) An array of key-value pairs. For more information, see
    #   [Using Cost Allocation Tags][1] in the *Amazon Web Services Billing
    #   and Cost Management User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what
    #
    # @option params [Types::ExperimentConfig] :experiment_config
    #   Associates a SageMaker job as a trial component with an experiment and
    #   trial. Specified when you call the following APIs:
    #
    #   * CreateProcessingJob
    #
    #   * CreateTrainingJob
    #
    #   * CreateTransformJob
    #
    # @return [Types::CreateTransformJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateTransformJobResponse#transform_job_arn #transform_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_transform_job({
    #     transform_job_name: "TransformJobName", # required
    #     model_name: "ModelName", # required
    #     max_concurrent_transforms: 1,
    #     model_client_config: {
    #       invocations_timeout_in_seconds: 1,
    #       invocations_max_retries: 1,
    #     },
    #     max_payload_in_mb: 1,
    #     batch_strategy: "MultiRecord", # accepts MultiRecord, SingleRecord
    #     environment: {
    #       "TransformEnvironmentKey" => "TransformEnvironmentValue",
    #     },
    #     transform_input: { # required
    #       data_source: { # required
    #         s3_data_source: { # required
    #           s3_data_type: "ManifestFile", # required, accepts ManifestFile, S3Prefix, AugmentedManifestFile
    #           s3_uri: "S3Uri", # required
    #         },
    #       },
    #       content_type: "ContentType",
    #       compression_type: "None", # accepts None, Gzip
    #       split_type: "None", # accepts None, Line, RecordIO, TFRecord
    #     },
    #     transform_output: { # required
    #       s3_output_path: "S3Uri", # required
    #       accept: "Accept",
    #       assemble_with: "None", # accepts None, Line
    #       kms_key_id: "KmsKeyId",
    #     },
    #     transform_resources: { # required
    #       instance_type: "ml.m4.xlarge", # required, accepts ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #       instance_count: 1, # required
    #       volume_kms_key_id: "KmsKeyId",
    #     },
    #     data_processing: {
    #       input_filter: "JsonPath",
    #       output_filter: "JsonPath",
    #       join_source: "Input", # accepts Input, None
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     experiment_config: {
    #       experiment_name: "ExperimentEntityName",
    #       trial_name: "ExperimentEntityName",
    #       trial_component_display_name: "ExperimentEntityName",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.transform_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateTransformJob AWS API Documentation
    #
    # @overload create_transform_job(params = {})
    # @param [Hash] params ({})
    def create_transform_job(params = {}, options = {})
      req = build_request(:create_transform_job, params)
      req.send_request(options)
    end

    # Creates an SageMaker *trial*. A trial is a set of steps called *trial
    # components* that produce a machine learning model. A trial is part of
    # a single SageMaker *experiment*.
    #
    # When you use SageMaker Studio or the SageMaker Python SDK, all
    # experiments, trials, and trial components are automatically tracked,
    # logged, and indexed. When you use the Amazon Web Services SDK for
    # Python (Boto), you must use the logging APIs provided by the SDK.
    #
    # You can add tags to a trial and then use the Search API to search for
    # the tags.
    #
    # To get a list of all your trials, call the ListTrials API. To view a
    # trial's properties, call the DescribeTrial API. To create a trial
    # component, call the CreateTrialComponent API.
    #
    # @option params [required, String] :trial_name
    #   The name of the trial. The name must be unique in your Amazon Web
    #   Services account and is not case-sensitive.
    #
    # @option params [String] :display_name
    #   The name of the trial as displayed. The name doesn't need to be
    #   unique. If `DisplayName` isn't specified, `TrialName` is displayed.
    #
    # @option params [required, String] :experiment_name
    #   The name of the experiment to associate the trial with.
    #
    # @option params [Types::MetadataProperties] :metadata_properties
    #   Metadata properties of the tracking entity, trial, or trial component.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to associate with the trial. You can use Search API to
    #   search on the tags.
    #
    # @return [Types::CreateTrialResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateTrialResponse#trial_arn #trial_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_trial({
    #     trial_name: "ExperimentEntityName", # required
    #     display_name: "ExperimentEntityName",
    #     experiment_name: "ExperimentEntityName", # required
    #     metadata_properties: {
    #       commit_id: "MetadataPropertyValue",
    #       repository: "MetadataPropertyValue",
    #       generated_by: "MetadataPropertyValue",
    #       project_id: "MetadataPropertyValue",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateTrial AWS API Documentation
    #
    # @overload create_trial(params = {})
    # @param [Hash] params ({})
    def create_trial(params = {}, options = {})
      req = build_request(:create_trial, params)
      req.send_request(options)
    end

    # Creates a *trial component*, which is a stage of a machine learning
    # *trial*. A trial is composed of one or more trial components. A trial
    # component can be used in multiple trials.
    #
    # Trial components include pre-processing jobs, training jobs, and batch
    # transform jobs.
    #
    # When you use SageMaker Studio or the SageMaker Python SDK, all
    # experiments, trials, and trial components are automatically tracked,
    # logged, and indexed. When you use the Amazon Web Services SDK for
    # Python (Boto), you must use the logging APIs provided by the SDK.
    #
    # You can add tags to a trial component and then use the Search API to
    # search for the tags.
    #
    # @option params [required, String] :trial_component_name
    #   The name of the component. The name must be unique in your Amazon Web
    #   Services account and is not case-sensitive.
    #
    # @option params [String] :display_name
    #   The name of the component as displayed. The name doesn't need to be
    #   unique. If `DisplayName` isn't specified, `TrialComponentName` is
    #   displayed.
    #
    # @option params [Types::TrialComponentStatus] :status
    #   The status of the component. States include:
    #
    #   * InProgress
    #
    #   * Completed
    #
    #   * Failed
    #
    # @option params [Time,DateTime,Date,Integer,String] :start_time
    #   When the component started.
    #
    # @option params [Time,DateTime,Date,Integer,String] :end_time
    #   When the component ended.
    #
    # @option params [Hash<String,Types::TrialComponentParameterValue>] :parameters
    #   The hyperparameters for the component.
    #
    # @option params [Hash<String,Types::TrialComponentArtifact>] :input_artifacts
    #   The input artifacts for the component. Examples of input artifacts are
    #   datasets, algorithms, hyperparameters, source code, and instance
    #   types.
    #
    # @option params [Hash<String,Types::TrialComponentArtifact>] :output_artifacts
    #   The output artifacts for the component. Examples of output artifacts
    #   are metrics, snapshots, logs, and images.
    #
    # @option params [Types::MetadataProperties] :metadata_properties
    #   Metadata properties of the tracking entity, trial, or trial component.
    #
    # @option params [Array<Types::Tag>] :tags
    #   A list of tags to associate with the component. You can use Search API
    #   to search on the tags.
    #
    # @return [Types::CreateTrialComponentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateTrialComponentResponse#trial_component_arn #trial_component_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_trial_component({
    #     trial_component_name: "ExperimentEntityName", # required
    #     display_name: "ExperimentEntityName",
    #     status: {
    #       primary_status: "InProgress", # accepts InProgress, Completed, Failed, Stopping, Stopped
    #       message: "TrialComponentStatusMessage",
    #     },
    #     start_time: Time.now,
    #     end_time: Time.now,
    #     parameters: {
    #       "TrialComponentKey256" => {
    #         string_value: "StringParameterValue",
    #         number_value: 1.0,
    #       },
    #     },
    #     input_artifacts: {
    #       "TrialComponentKey64" => {
    #         media_type: "MediaType",
    #         value: "TrialComponentArtifactValue", # required
    #       },
    #     },
    #     output_artifacts: {
    #       "TrialComponentKey64" => {
    #         media_type: "MediaType",
    #         value: "TrialComponentArtifactValue", # required
    #       },
    #     },
    #     metadata_properties: {
    #       commit_id: "MetadataPropertyValue",
    #       repository: "MetadataPropertyValue",
    #       generated_by: "MetadataPropertyValue",
    #       project_id: "MetadataPropertyValue",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateTrialComponent AWS API Documentation
    #
    # @overload create_trial_component(params = {})
    # @param [Hash] params ({})
    def create_trial_component(params = {}, options = {})
      req = build_request(:create_trial_component, params)
      req.send_request(options)
    end

    # Creates a user profile. A user profile represents a single user within
    # a domain, and is the main way to reference a "person" for the
    # purposes of sharing, reporting, and other user-oriented features. This
    # entity is created when a user onboards to Amazon SageMaker Studio. If
    # an administrator invites a person by email or imports them from SSO, a
    # user profile is automatically created. A user profile is the primary
    # holder of settings for an individual user and has a reference to the
    # user's private Amazon Elastic File System (EFS) home directory.
    #
    # @option params [required, String] :domain_id
    #   The ID of the associated Domain.
    #
    # @option params [required, String] :user_profile_name
    #   A name for the UserProfile. This value is not case sensitive.
    #
    # @option params [String] :single_sign_on_user_identifier
    #   A specifier for the type of value specified in SingleSignOnUserValue.
    #   Currently, the only supported value is "UserName". If the Domain's
    #   AuthMode is SSO, this field is required. If the Domain's AuthMode is
    #   not SSO, this field cannot be specified.
    #
    # @option params [String] :single_sign_on_user_value
    #   The username of the associated Amazon Web Services Single Sign-On User
    #   for this UserProfile. If the Domain's AuthMode is SSO, this field is
    #   required, and must match a valid username of a user in your directory.
    #   If the Domain's AuthMode is not SSO, this field cannot be specified.
    #
    # @option params [Array<Types::Tag>] :tags
    #   Each tag consists of a key and an optional value. Tag keys must be
    #   unique per resource.
    #
    #   Tags that you specify for the User Profile are also added to all Apps
    #   that the User Profile launches.
    #
    # @option params [Types::UserSettings] :user_settings
    #   A collection of settings.
    #
    # @return [Types::CreateUserProfileResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateUserProfileResponse#user_profile_arn #user_profile_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_user_profile({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #     single_sign_on_user_identifier: "SingleSignOnUserIdentifier",
    #     single_sign_on_user_value: "String256",
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #     user_settings: {
    #       execution_role: "RoleArn",
    #       security_groups: ["SecurityGroupId"],
    #       sharing_settings: {
    #         notebook_output_option: "Allowed", # accepts Allowed, Disabled
    #         s3_output_path: "S3Uri",
    #         s3_kms_key_id: "KmsKeyId",
    #       },
    #       jupyter_server_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       kernel_gateway_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         custom_images: [
    #           {
    #             image_name: "ImageName", # required
    #             image_version_number: 1,
    #             app_image_config_name: "AppImageConfigName", # required
    #           },
    #         ],
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       tensor_board_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.user_profile_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateUserProfile AWS API Documentation
    #
    # @overload create_user_profile(params = {})
    # @param [Hash] params ({})
    def create_user_profile(params = {}, options = {})
      req = build_request(:create_user_profile, params)
      req.send_request(options)
    end

    # Use this operation to create a workforce. This operation will return
    # an error if a workforce already exists in the Amazon Web Services
    # Region that you specify. You can only create one workforce in each
    # Amazon Web Services Region per Amazon Web Services account.
    #
    # If you want to create a new workforce in an Amazon Web Services Region
    # where a workforce already exists, use the API operation to delete the
    # existing workforce and then use `CreateWorkforce` to create a new
    # workforce.
    #
    # To create a private workforce using Amazon Cognito, you must specify a
    # Cognito user pool in `CognitoConfig`. You can also create an Amazon
    # Cognito workforce using the Amazon SageMaker console. For more
    # information, see [ Create a Private Workforce (Amazon Cognito)][1].
    #
    # To create a private workforce using your own OIDC Identity Provider
    # (IdP), specify your IdP configuration in `OidcConfig`. Your OIDC IdP
    # must support *groups* because groups are used by Ground Truth and
    # Amazon A2I to create work teams. For more information, see [ Create a
    # Private Workforce (OIDC IdP)][2].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html
    # [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private-oidc.html
    #
    # @option params [Types::CognitoConfig] :cognito_config
    #   Use this parameter to configure an Amazon Cognito private workforce. A
    #   single Cognito workforce is created using and corresponds to a single
    #   [ Amazon Cognito user pool][1].
    #
    #   Do not use `OidcConfig` if you specify values for `CognitoConfig`.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html
    #
    # @option params [Types::OidcConfig] :oidc_config
    #   Use this parameter to configure a private workforce using your own
    #   OIDC Identity Provider.
    #
    #   Do not use `CognitoConfig` if you specify values for `OidcConfig`.
    #
    # @option params [Types::SourceIpConfig] :source_ip_config
    #   A list of IP address ranges ([CIDRs][1]). Used to create an allow list
    #   of IP addresses for a private workforce. Workers will only be able to
    #   login to their worker portal from an IP address within this range. By
    #   default, a workforce isn't restricted to specific IP addresses.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html
    #
    # @option params [required, String] :workforce_name
    #   The name of the private workforce.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs that contain metadata to help you
    #   categorize and organize our workforce. Each tag consists of a key and
    #   a value, both of which you define.
    #
    # @return [Types::CreateWorkforceResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateWorkforceResponse#workforce_arn #workforce_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_workforce({
    #     cognito_config: {
    #       user_pool: "CognitoUserPool", # required
    #       client_id: "ClientId", # required
    #     },
    #     oidc_config: {
    #       client_id: "ClientId", # required
    #       client_secret: "ClientSecret", # required
    #       issuer: "OidcEndpoint", # required
    #       authorization_endpoint: "OidcEndpoint", # required
    #       token_endpoint: "OidcEndpoint", # required
    #       user_info_endpoint: "OidcEndpoint", # required
    #       logout_endpoint: "OidcEndpoint", # required
    #       jwks_uri: "OidcEndpoint", # required
    #     },
    #     source_ip_config: {
    #       cidrs: ["Cidr"], # required
    #     },
    #     workforce_name: "WorkforceName", # required
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.workforce_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateWorkforce AWS API Documentation
    #
    # @overload create_workforce(params = {})
    # @param [Hash] params ({})
    def create_workforce(params = {}, options = {})
      req = build_request(:create_workforce, params)
      req.send_request(options)
    end

    # Creates a new work team for labeling your data. A work team is defined
    # by one or more Amazon Cognito user pools. You must first create the
    # user pools before you can create a work team.
    #
    # You cannot create more than 25 work teams in an account and region.
    #
    # @option params [required, String] :workteam_name
    #   The name of the work team. Use this name to identify the work team.
    #
    # @option params [String] :workforce_name
    #   The name of the workforce.
    #
    # @option params [required, Array<Types::MemberDefinition>] :member_definitions
    #   A list of `MemberDefinition` objects that contains objects that
    #   identify the workers that make up the work team.
    #
    #   Workforces can be created using Amazon Cognito or your own OIDC
    #   Identity Provider (IdP). For private workforces created using Amazon
    #   Cognito use `CognitoMemberDefinition`. For workforces created using
    #   your own OIDC identity provider (IdP) use `OidcMemberDefinition`. Do
    #   not provide input for both of these parameters in a single request.
    #
    #   For workforces created using Amazon Cognito, private work teams
    #   correspond to Amazon Cognito *user groups* within the user pool used
    #   to create a workforce. All of the `CognitoMemberDefinition` objects
    #   that make up the member definition must have the same `ClientId` and
    #   `UserPool` values. To add a Amazon Cognito user group to an existing
    #   worker pool, see [Adding groups to a User Pool](). For more
    #   information about user pools, see [Amazon Cognito User Pools][1].
    #
    #   For workforces created using your own OIDC IdP, specify the user
    #   groups that you want to include in your private work team in
    #   `OidcMemberDefinition` by listing those groups in `Groups`.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html
    #
    # @option params [required, String] :description
    #   A description of the work team.
    #
    # @option params [Types::NotificationConfiguration] :notification_configuration
    #   Configures notification of workers regarding available or expiring
    #   work items.
    #
    # @option params [Array<Types::Tag>] :tags
    #   An array of key-value pairs.
    #
    #   For more information, see [Resource Tag][1] and [Using Cost Allocation
    #   Tags][2] in the <i> Amazon Web Services Billing and Cost Management
    #   User Guide</i>.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html
    #   [2]: https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what
    #
    # @return [Types::CreateWorkteamResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::CreateWorkteamResponse#workteam_arn #workteam_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.create_workteam({
    #     workteam_name: "WorkteamName", # required
    #     workforce_name: "WorkforceName",
    #     member_definitions: [ # required
    #       {
    #         cognito_member_definition: {
    #           user_pool: "CognitoUserPool", # required
    #           user_group: "CognitoUserGroup", # required
    #           client_id: "ClientId", # required
    #         },
    #         oidc_member_definition: {
    #           groups: ["Group"], # required
    #         },
    #       },
    #     ],
    #     description: "String200", # required
    #     notification_configuration: {
    #       notification_topic_arn: "NotificationTopicArn",
    #     },
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.workteam_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/CreateWorkteam AWS API Documentation
    #
    # @overload create_workteam(params = {})
    # @param [Hash] params ({})
    def create_workteam(params = {}, options = {})
      req = build_request(:create_workteam, params)
      req.send_request(options)
    end

    # Deletes an action.
    #
    # @option params [required, String] :action_name
    #   The name of the action to delete.
    #
    # @return [Types::DeleteActionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteActionResponse#action_arn #action_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_action({
    #     action_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.action_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteAction AWS API Documentation
    #
    # @overload delete_action(params = {})
    # @param [Hash] params ({})
    def delete_action(params = {}, options = {})
      req = build_request(:delete_action, params)
      req.send_request(options)
    end

    # Removes the specified algorithm from your account.
    #
    # @option params [required, String] :algorithm_name
    #   The name of the algorithm to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_algorithm({
    #     algorithm_name: "EntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteAlgorithm AWS API Documentation
    #
    # @overload delete_algorithm(params = {})
    # @param [Hash] params ({})
    def delete_algorithm(params = {}, options = {})
      req = build_request(:delete_algorithm, params)
      req.send_request(options)
    end

    # Used to stop and delete an app.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The user profile name.
    #
    # @option params [required, String] :app_type
    #   The type of app.
    #
    # @option params [required, String] :app_name
    #   The name of the app.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_app({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #     app_type: "JupyterServer", # required, accepts JupyterServer, KernelGateway, TensorBoard
    #     app_name: "AppName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteApp AWS API Documentation
    #
    # @overload delete_app(params = {})
    # @param [Hash] params ({})
    def delete_app(params = {}, options = {})
      req = build_request(:delete_app, params)
      req.send_request(options)
    end

    # Deletes an AppImageConfig.
    #
    # @option params [required, String] :app_image_config_name
    #   The name of the AppImageConfig to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_app_image_config({
    #     app_image_config_name: "AppImageConfigName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteAppImageConfig AWS API Documentation
    #
    # @overload delete_app_image_config(params = {})
    # @param [Hash] params ({})
    def delete_app_image_config(params = {}, options = {})
      req = build_request(:delete_app_image_config, params)
      req.send_request(options)
    end

    # Deletes an artifact. Either `ArtifactArn` or `Source` must be
    # specified.
    #
    # @option params [String] :artifact_arn
    #   The Amazon Resource Name (ARN) of the artifact to delete.
    #
    # @option params [Types::ArtifactSource] :source
    #   The URI of the source.
    #
    # @return [Types::DeleteArtifactResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteArtifactResponse#artifact_arn #artifact_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_artifact({
    #     artifact_arn: "ArtifactArn",
    #     source: {
    #       source_uri: "String2048", # required
    #       source_types: [
    #         {
    #           source_id_type: "MD5Hash", # required, accepts MD5Hash, S3ETag, S3Version, Custom
    #           value: "String256", # required
    #         },
    #       ],
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.artifact_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteArtifact AWS API Documentation
    #
    # @overload delete_artifact(params = {})
    # @param [Hash] params ({})
    def delete_artifact(params = {}, options = {})
      req = build_request(:delete_artifact, params)
      req.send_request(options)
    end

    # Deletes an association.
    #
    # @option params [required, String] :source_arn
    #   The ARN of the source.
    #
    # @option params [required, String] :destination_arn
    #   The Amazon Resource Name (ARN) of the destination.
    #
    # @return [Types::DeleteAssociationResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteAssociationResponse#source_arn #source_arn} => String
    #   * {Types::DeleteAssociationResponse#destination_arn #destination_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_association({
    #     source_arn: "AssociationEntityArn", # required
    #     destination_arn: "AssociationEntityArn", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.source_arn #=> String
    #   resp.destination_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteAssociation AWS API Documentation
    #
    # @overload delete_association(params = {})
    # @param [Hash] params ({})
    def delete_association(params = {}, options = {})
      req = build_request(:delete_association, params)
      req.send_request(options)
    end

    # Deletes the specified Git repository from your account.
    #
    # @option params [required, String] :code_repository_name
    #   The name of the Git repository to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_code_repository({
    #     code_repository_name: "EntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteCodeRepository AWS API Documentation
    #
    # @overload delete_code_repository(params = {})
    # @param [Hash] params ({})
    def delete_code_repository(params = {}, options = {})
      req = build_request(:delete_code_repository, params)
      req.send_request(options)
    end

    # Deletes an context.
    #
    # @option params [required, String] :context_name
    #   The name of the context to delete.
    #
    # @return [Types::DeleteContextResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteContextResponse#context_arn #context_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_context({
    #     context_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.context_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteContext AWS API Documentation
    #
    # @overload delete_context(params = {})
    # @param [Hash] params ({})
    def delete_context(params = {}, options = {})
      req = build_request(:delete_context, params)
      req.send_request(options)
    end

    # Deletes a data quality monitoring job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the data quality monitoring job definition to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_data_quality_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteDataQualityJobDefinition AWS API Documentation
    #
    # @overload delete_data_quality_job_definition(params = {})
    # @param [Hash] params ({})
    def delete_data_quality_job_definition(params = {}, options = {})
      req = build_request(:delete_data_quality_job_definition, params)
      req.send_request(options)
    end

    # Deletes a fleet.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_device_fleet({
    #     device_fleet_name: "EntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteDeviceFleet AWS API Documentation
    #
    # @overload delete_device_fleet(params = {})
    # @param [Hash] params ({})
    def delete_device_fleet(params = {}, options = {})
      req = build_request(:delete_device_fleet, params)
      req.send_request(options)
    end

    # Used to delete a domain. If you onboarded with IAM mode, you will need
    # to delete your domain to onboard again using SSO. Use with caution.
    # All of the members of the domain will lose access to their EFS volume,
    # including data, notebooks, and other artifacts.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [Types::RetentionPolicy] :retention_policy
    #   The retention policy for this domain, which specifies whether
    #   resources will be retained after the Domain is deleted. By default,
    #   all resources are retained (not automatically deleted).
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_domain({
    #     domain_id: "DomainId", # required
    #     retention_policy: {
    #       home_efs_file_system: "Retain", # accepts Retain, Delete
    #     },
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteDomain AWS API Documentation
    #
    # @overload delete_domain(params = {})
    # @param [Hash] params ({})
    def delete_domain(params = {}, options = {})
      req = build_request(:delete_domain, params)
      req.send_request(options)
    end

    # Deletes an endpoint. Amazon SageMaker frees up all of the resources
    # that were deployed when the endpoint was created.
    #
    # Amazon SageMaker retires any custom KMS key grants associated with the
    # endpoint, meaning you don't need to use the [RevokeGrant][1] API
    # call.
    #
    #
    #
    # [1]: http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html
    #
    # @option params [required, String] :endpoint_name
    #   The name of the endpoint that you want to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_endpoint({
    #     endpoint_name: "EndpointName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteEndpoint AWS API Documentation
    #
    # @overload delete_endpoint(params = {})
    # @param [Hash] params ({})
    def delete_endpoint(params = {}, options = {})
      req = build_request(:delete_endpoint, params)
      req.send_request(options)
    end

    # Deletes an endpoint configuration. The `DeleteEndpointConfig` API
    # deletes only the specified configuration. It does not delete endpoints
    # created using the configuration.
    #
    # You must not delete an `EndpointConfig` in use by an endpoint that is
    # live or while the `UpdateEndpoint` or `CreateEndpoint` operations are
    # being performed on the endpoint. If you delete the `EndpointConfig` of
    # an endpoint that is active or being created or updated you may lose
    # visibility into the instance type the endpoint is using. The endpoint
    # must be deleted in order to stop incurring charges.
    #
    # @option params [required, String] :endpoint_config_name
    #   The name of the endpoint configuration that you want to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_endpoint_config({
    #     endpoint_config_name: "EndpointConfigName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteEndpointConfig AWS API Documentation
    #
    # @overload delete_endpoint_config(params = {})
    # @param [Hash] params ({})
    def delete_endpoint_config(params = {}, options = {})
      req = build_request(:delete_endpoint_config, params)
      req.send_request(options)
    end

    # Deletes an SageMaker experiment. All trials associated with the
    # experiment must be deleted first. Use the ListTrials API to get a list
    # of the trials associated with the experiment.
    #
    # @option params [required, String] :experiment_name
    #   The name of the experiment to delete.
    #
    # @return [Types::DeleteExperimentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteExperimentResponse#experiment_arn #experiment_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_experiment({
    #     experiment_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.experiment_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteExperiment AWS API Documentation
    #
    # @overload delete_experiment(params = {})
    # @param [Hash] params ({})
    def delete_experiment(params = {}, options = {})
      req = build_request(:delete_experiment, params)
      req.send_request(options)
    end

    # Delete the `FeatureGroup` and any data that was written to the
    # `OnlineStore` of the `FeatureGroup`. Data cannot be accessed from the
    # `OnlineStore` immediately after `DeleteFeatureGroup` is called.
    #
    # Data written into the `OfflineStore` will not be deleted. The Amazon
    # Web Services Glue database and tables that are automatically created
    # for your `OfflineStore` are not deleted.
    #
    # @option params [required, String] :feature_group_name
    #   The name of the `FeatureGroup` you want to delete. The name must be
    #   unique within an Amazon Web Services Region in an Amazon Web Services
    #   account.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_feature_group({
    #     feature_group_name: "FeatureGroupName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteFeatureGroup AWS API Documentation
    #
    # @overload delete_feature_group(params = {})
    # @param [Hash] params ({})
    def delete_feature_group(params = {}, options = {})
      req = build_request(:delete_feature_group, params)
      req.send_request(options)
    end

    # Deletes the specified flow definition.
    #
    # @option params [required, String] :flow_definition_name
    #   The name of the flow definition you are deleting.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_flow_definition({
    #     flow_definition_name: "FlowDefinitionName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteFlowDefinition AWS API Documentation
    #
    # @overload delete_flow_definition(params = {})
    # @param [Hash] params ({})
    def delete_flow_definition(params = {}, options = {})
      req = build_request(:delete_flow_definition, params)
      req.send_request(options)
    end

    # Use this operation to delete a human task user interface (worker task
    # template).
    #
    # To see a list of human task user interfaces (work task templates) in
    # your account, use . When you delete a worker task template, it no
    # longer appears when you call `ListHumanTaskUis`.
    #
    # @option params [required, String] :human_task_ui_name
    #   The name of the human task user interface (work task template) you
    #   want to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_human_task_ui({
    #     human_task_ui_name: "HumanTaskUiName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteHumanTaskUi AWS API Documentation
    #
    # @overload delete_human_task_ui(params = {})
    # @param [Hash] params ({})
    def delete_human_task_ui(params = {}, options = {})
      req = build_request(:delete_human_task_ui, params)
      req.send_request(options)
    end

    # Deletes a SageMaker image and all versions of the image. The container
    # images aren't deleted.
    #
    # @option params [required, String] :image_name
    #   The name of the image to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_image({
    #     image_name: "ImageName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteImage AWS API Documentation
    #
    # @overload delete_image(params = {})
    # @param [Hash] params ({})
    def delete_image(params = {}, options = {})
      req = build_request(:delete_image, params)
      req.send_request(options)
    end

    # Deletes a version of a SageMaker image. The container image the
    # version represents isn't deleted.
    #
    # @option params [required, String] :image_name
    #   The name of the image.
    #
    # @option params [required, Integer] :version
    #   The version to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_image_version({
    #     image_name: "ImageName", # required
    #     version: 1, # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteImageVersion AWS API Documentation
    #
    # @overload delete_image_version(params = {})
    # @param [Hash] params ({})
    def delete_image_version(params = {}, options = {})
      req = build_request(:delete_image_version, params)
      req.send_request(options)
    end

    # Deletes a model. The `DeleteModel` API deletes only the model entry
    # that was created in Amazon SageMaker when you called the `CreateModel`
    # API. It does not delete model artifacts, inference code, or the IAM
    # role that you specified when creating the model.
    #
    # @option params [required, String] :model_name
    #   The name of the model to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model({
    #     model_name: "ModelName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModel AWS API Documentation
    #
    # @overload delete_model(params = {})
    # @param [Hash] params ({})
    def delete_model(params = {}, options = {})
      req = build_request(:delete_model, params)
      req.send_request(options)
    end

    # Deletes an Amazon SageMaker model bias job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model bias job definition to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model_bias_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModelBiasJobDefinition AWS API Documentation
    #
    # @overload delete_model_bias_job_definition(params = {})
    # @param [Hash] params ({})
    def delete_model_bias_job_definition(params = {}, options = {})
      req = build_request(:delete_model_bias_job_definition, params)
      req.send_request(options)
    end

    # Deletes an Amazon SageMaker model explainability job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model explainability job definition to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model_explainability_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModelExplainabilityJobDefinition AWS API Documentation
    #
    # @overload delete_model_explainability_job_definition(params = {})
    # @param [Hash] params ({})
    def delete_model_explainability_job_definition(params = {}, options = {})
      req = build_request(:delete_model_explainability_job_definition, params)
      req.send_request(options)
    end

    # Deletes a model package.
    #
    # A model package is used to create Amazon SageMaker models or list on
    # Amazon Web Services Marketplace. Buyers can subscribe to model
    # packages listed on Amazon Web Services Marketplace to create models in
    # Amazon SageMaker.
    #
    # @option params [required, String] :model_package_name
    #   The name or Amazon Resource Name (ARN) of the model package to delete.
    #
    #   When you specify a name, the name must have 1 to 63 characters. Valid
    #   characters are a-z, A-Z, 0-9, and - (hyphen).
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model_package({
    #     model_package_name: "VersionedArnOrName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModelPackage AWS API Documentation
    #
    # @overload delete_model_package(params = {})
    # @param [Hash] params ({})
    def delete_model_package(params = {}, options = {})
      req = build_request(:delete_model_package, params)
      req.send_request(options)
    end

    # Deletes the specified model group.
    #
    # @option params [required, String] :model_package_group_name
    #   The name of the model group to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model_package_group({
    #     model_package_group_name: "ArnOrName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModelPackageGroup AWS API Documentation
    #
    # @overload delete_model_package_group(params = {})
    # @param [Hash] params ({})
    def delete_model_package_group(params = {}, options = {})
      req = build_request(:delete_model_package_group, params)
      req.send_request(options)
    end

    # Deletes a model group resource policy.
    #
    # @option params [required, String] :model_package_group_name
    #   The name of the model group for which to delete the policy.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model_package_group_policy({
    #     model_package_group_name: "EntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModelPackageGroupPolicy AWS API Documentation
    #
    # @overload delete_model_package_group_policy(params = {})
    # @param [Hash] params ({})
    def delete_model_package_group_policy(params = {}, options = {})
      req = build_request(:delete_model_package_group_policy, params)
      req.send_request(options)
    end

    # Deletes the secified model quality monitoring job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model quality monitoring job definition to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_model_quality_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteModelQualityJobDefinition AWS API Documentation
    #
    # @overload delete_model_quality_job_definition(params = {})
    # @param [Hash] params ({})
    def delete_model_quality_job_definition(params = {}, options = {})
      req = build_request(:delete_model_quality_job_definition, params)
      req.send_request(options)
    end

    # Deletes a monitoring schedule. Also stops the schedule had not already
    # been stopped. This does not delete the job execution history of the
    # monitoring schedule.
    #
    # @option params [required, String] :monitoring_schedule_name
    #   The name of the monitoring schedule to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_monitoring_schedule({
    #     monitoring_schedule_name: "MonitoringScheduleName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteMonitoringSchedule AWS API Documentation
    #
    # @overload delete_monitoring_schedule(params = {})
    # @param [Hash] params ({})
    def delete_monitoring_schedule(params = {}, options = {})
      req = build_request(:delete_monitoring_schedule, params)
      req.send_request(options)
    end

    # Deletes an Amazon SageMaker notebook instance. Before you can delete a
    # notebook instance, you must call the `StopNotebookInstance` API.
    #
    # When you delete a notebook instance, you lose all of your data. Amazon
    # SageMaker removes the ML compute instance, and deletes the ML storage
    # volume and the network interface associated with the notebook
    # instance.
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the Amazon SageMaker notebook instance to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_notebook_instance({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteNotebookInstance AWS API Documentation
    #
    # @overload delete_notebook_instance(params = {})
    # @param [Hash] params ({})
    def delete_notebook_instance(params = {}, options = {})
      req = build_request(:delete_notebook_instance, params)
      req.send_request(options)
    end

    # Deletes a notebook instance lifecycle configuration.
    #
    # @option params [required, String] :notebook_instance_lifecycle_config_name
    #   The name of the lifecycle configuration to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_notebook_instance_lifecycle_config({
    #     notebook_instance_lifecycle_config_name: "NotebookInstanceLifecycleConfigName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteNotebookInstanceLifecycleConfig AWS API Documentation
    #
    # @overload delete_notebook_instance_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def delete_notebook_instance_lifecycle_config(params = {}, options = {})
      req = build_request(:delete_notebook_instance_lifecycle_config, params)
      req.send_request(options)
    end

    # Deletes a pipeline if there are no running instances of the pipeline.
    # To delete a pipeline, you must stop all running instances of the
    # pipeline using the `StopPipelineExecution` API. When you delete a
    # pipeline, all instances of the pipeline are deleted.
    #
    # @option params [required, String] :pipeline_name
    #   The name of the pipeline to delete.
    #
    # @option params [required, String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than one time.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::DeletePipelineResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeletePipelineResponse#pipeline_arn #pipeline_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_pipeline({
    #     pipeline_name: "PipelineName", # required
    #     client_request_token: "IdempotencyToken", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeletePipeline AWS API Documentation
    #
    # @overload delete_pipeline(params = {})
    # @param [Hash] params ({})
    def delete_pipeline(params = {}, options = {})
      req = build_request(:delete_pipeline, params)
      req.send_request(options)
    end

    # Delete the specified project.
    #
    # @option params [required, String] :project_name
    #   The name of the project to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_project({
    #     project_name: "ProjectEntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteProject AWS API Documentation
    #
    # @overload delete_project(params = {})
    # @param [Hash] params ({})
    def delete_project(params = {}, options = {})
      req = build_request(:delete_project, params)
      req.send_request(options)
    end

    # Deletes the Studio Lifecycle Configuration. In order to delete the
    # Lifecycle Configuration, there must be no running apps using the
    # Lifecycle Configuration. You must also remove the Lifecycle
    # Configuration from UserSettings in all Domains and UserProfiles.
    #
    # @option params [required, String] :studio_lifecycle_config_name
    #   The name of the Studio Lifecycle Configuration to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_studio_lifecycle_config({
    #     studio_lifecycle_config_name: "StudioLifecycleConfigName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteStudioLifecycleConfig AWS API Documentation
    #
    # @overload delete_studio_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def delete_studio_lifecycle_config(params = {}, options = {})
      req = build_request(:delete_studio_lifecycle_config, params)
      req.send_request(options)
    end

    # Deletes the specified tags from an Amazon SageMaker resource.
    #
    # To list a resource's tags, use the `ListTags` API.
    #
    # <note markdown="1"> When you call this API to delete tags from a hyperparameter tuning
    # job, the deleted tags are not removed from training jobs that the
    # hyperparameter tuning job launched before you called this API.
    #
    #  </note>
    #
    # <note markdown="1"> When you call this API to delete tags from a SageMaker Studio Domain
    # or User Profile, the deleted tags are not removed from Apps that the
    # SageMaker Studio Domain or User Profile launched before you called
    # this API.
    #
    #  </note>
    #
    # @option params [required, String] :resource_arn
    #   The Amazon Resource Name (ARN) of the resource whose tags you want to
    #   delete.
    #
    # @option params [required, Array<String>] :tag_keys
    #   An array or one or more tag keys to delete.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_tags({
    #     resource_arn: "ResourceArn", # required
    #     tag_keys: ["TagKey"], # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteTags AWS API Documentation
    #
    # @overload delete_tags(params = {})
    # @param [Hash] params ({})
    def delete_tags(params = {}, options = {})
      req = build_request(:delete_tags, params)
      req.send_request(options)
    end

    # Deletes the specified trial. All trial components that make up the
    # trial must be deleted first. Use the DescribeTrialComponent API to get
    # the list of trial components.
    #
    # @option params [required, String] :trial_name
    #   The name of the trial to delete.
    #
    # @return [Types::DeleteTrialResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteTrialResponse#trial_arn #trial_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_trial({
    #     trial_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteTrial AWS API Documentation
    #
    # @overload delete_trial(params = {})
    # @param [Hash] params ({})
    def delete_trial(params = {}, options = {})
      req = build_request(:delete_trial, params)
      req.send_request(options)
    end

    # Deletes the specified trial component. A trial component must be
    # disassociated from all trials before the trial component can be
    # deleted. To disassociate a trial component from a trial, call the
    # DisassociateTrialComponent API.
    #
    # @option params [required, String] :trial_component_name
    #   The name of the component to delete.
    #
    # @return [Types::DeleteTrialComponentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteTrialComponentResponse#trial_component_arn #trial_component_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_trial_component({
    #     trial_component_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteTrialComponent AWS API Documentation
    #
    # @overload delete_trial_component(params = {})
    # @param [Hash] params ({})
    def delete_trial_component(params = {}, options = {})
      req = build_request(:delete_trial_component, params)
      req.send_request(options)
    end

    # Deletes a user profile. When a user profile is deleted, the user loses
    # access to their EFS volume, including data, notebooks, and other
    # artifacts.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The user profile name.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_user_profile({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteUserProfile AWS API Documentation
    #
    # @overload delete_user_profile(params = {})
    # @param [Hash] params ({})
    def delete_user_profile(params = {}, options = {})
      req = build_request(:delete_user_profile, params)
      req.send_request(options)
    end

    # Use this operation to delete a workforce.
    #
    # If you want to create a new workforce in an Amazon Web Services Region
    # where a workforce already exists, use this operation to delete the
    # existing workforce and then use to create a new workforce.
    #
    # If a private workforce contains one or more work teams, you must use
    # the operation to delete all work teams before you delete the
    # workforce. If you try to delete a workforce that contains one or more
    # work teams, you will recieve a `ResourceInUse` error.
    #
    # @option params [required, String] :workforce_name
    #   The name of the workforce.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_workforce({
    #     workforce_name: "WorkforceName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteWorkforce AWS API Documentation
    #
    # @overload delete_workforce(params = {})
    # @param [Hash] params ({})
    def delete_workforce(params = {}, options = {})
      req = build_request(:delete_workforce, params)
      req.send_request(options)
    end

    # Deletes an existing work team. This operation can't be undone.
    #
    # @option params [required, String] :workteam_name
    #   The name of the work team to delete.
    #
    # @return [Types::DeleteWorkteamResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DeleteWorkteamResponse#success #success} => Boolean
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.delete_workteam({
    #     workteam_name: "WorkteamName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.success #=> Boolean
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeleteWorkteam AWS API Documentation
    #
    # @overload delete_workteam(params = {})
    # @param [Hash] params ({})
    def delete_workteam(params = {}, options = {})
      req = build_request(:delete_workteam, params)
      req.send_request(options)
    end

    # Deregisters the specified devices. After you deregister a device, you
    # will need to re-register the devices.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet the devices belong to.
    #
    # @option params [required, Array<String>] :device_names
    #   The unique IDs of the devices.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.deregister_devices({
    #     device_fleet_name: "EntityName", # required
    #     device_names: ["DeviceName"], # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DeregisterDevices AWS API Documentation
    #
    # @overload deregister_devices(params = {})
    # @param [Hash] params ({})
    def deregister_devices(params = {}, options = {})
      req = build_request(:deregister_devices, params)
      req.send_request(options)
    end

    # Describes an action.
    #
    # @option params [required, String] :action_name
    #   The name of the action to describe.
    #
    # @return [Types::DescribeActionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeActionResponse#action_name #action_name} => String
    #   * {Types::DescribeActionResponse#action_arn #action_arn} => String
    #   * {Types::DescribeActionResponse#source #source} => Types::ActionSource
    #   * {Types::DescribeActionResponse#action_type #action_type} => String
    #   * {Types::DescribeActionResponse#description #description} => String
    #   * {Types::DescribeActionResponse#status #status} => String
    #   * {Types::DescribeActionResponse#properties #properties} => Hash&lt;String,String&gt;
    #   * {Types::DescribeActionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeActionResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeActionResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeActionResponse#last_modified_by #last_modified_by} => Types::UserContext
    #   * {Types::DescribeActionResponse#metadata_properties #metadata_properties} => Types::MetadataProperties
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_action({
    #     action_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.action_name #=> String
    #   resp.action_arn #=> String
    #   resp.source.source_uri #=> String
    #   resp.source.source_type #=> String
    #   resp.source.source_id #=> String
    #   resp.action_type #=> String
    #   resp.description #=> String
    #   resp.status #=> String, one of "Unknown", "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.properties #=> Hash
    #   resp.properties["StringParameterValue"] #=> String
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #   resp.metadata_properties.commit_id #=> String
    #   resp.metadata_properties.repository #=> String
    #   resp.metadata_properties.generated_by #=> String
    #   resp.metadata_properties.project_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeAction AWS API Documentation
    #
    # @overload describe_action(params = {})
    # @param [Hash] params ({})
    def describe_action(params = {}, options = {})
      req = build_request(:describe_action, params)
      req.send_request(options)
    end

    # Returns a description of the specified algorithm that is in your
    # account.
    #
    # @option params [required, String] :algorithm_name
    #   The name of the algorithm to describe.
    #
    # @return [Types::DescribeAlgorithmOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeAlgorithmOutput#algorithm_name #algorithm_name} => String
    #   * {Types::DescribeAlgorithmOutput#algorithm_arn #algorithm_arn} => String
    #   * {Types::DescribeAlgorithmOutput#algorithm_description #algorithm_description} => String
    #   * {Types::DescribeAlgorithmOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeAlgorithmOutput#training_specification #training_specification} => Types::TrainingSpecification
    #   * {Types::DescribeAlgorithmOutput#inference_specification #inference_specification} => Types::InferenceSpecification
    #   * {Types::DescribeAlgorithmOutput#validation_specification #validation_specification} => Types::AlgorithmValidationSpecification
    #   * {Types::DescribeAlgorithmOutput#algorithm_status #algorithm_status} => String
    #   * {Types::DescribeAlgorithmOutput#algorithm_status_details #algorithm_status_details} => Types::AlgorithmStatusDetails
    #   * {Types::DescribeAlgorithmOutput#product_id #product_id} => String
    #   * {Types::DescribeAlgorithmOutput#certify_for_marketplace #certify_for_marketplace} => Boolean
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_algorithm({
    #     algorithm_name: "ArnOrName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.algorithm_name #=> String
    #   resp.algorithm_arn #=> String
    #   resp.algorithm_description #=> String
    #   resp.creation_time #=> Time
    #   resp.training_specification.training_image #=> String
    #   resp.training_specification.training_image_digest #=> String
    #   resp.training_specification.supported_hyper_parameters #=> Array
    #   resp.training_specification.supported_hyper_parameters[0].name #=> String
    #   resp.training_specification.supported_hyper_parameters[0].description #=> String
    #   resp.training_specification.supported_hyper_parameters[0].type #=> String, one of "Integer", "Continuous", "Categorical", "FreeText"
    #   resp.training_specification.supported_hyper_parameters[0].range.integer_parameter_range_specification.min_value #=> String
    #   resp.training_specification.supported_hyper_parameters[0].range.integer_parameter_range_specification.max_value #=> String
    #   resp.training_specification.supported_hyper_parameters[0].range.continuous_parameter_range_specification.min_value #=> String
    #   resp.training_specification.supported_hyper_parameters[0].range.continuous_parameter_range_specification.max_value #=> String
    #   resp.training_specification.supported_hyper_parameters[0].range.categorical_parameter_range_specification.values #=> Array
    #   resp.training_specification.supported_hyper_parameters[0].range.categorical_parameter_range_specification.values[0] #=> String
    #   resp.training_specification.supported_hyper_parameters[0].is_tunable #=> Boolean
    #   resp.training_specification.supported_hyper_parameters[0].is_required #=> Boolean
    #   resp.training_specification.supported_hyper_parameters[0].default_value #=> String
    #   resp.training_specification.supported_training_instance_types #=> Array
    #   resp.training_specification.supported_training_instance_types[0] #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.training_specification.supports_distributed_training #=> Boolean
    #   resp.training_specification.metric_definitions #=> Array
    #   resp.training_specification.metric_definitions[0].name #=> String
    #   resp.training_specification.metric_definitions[0].regex #=> String
    #   resp.training_specification.training_channels #=> Array
    #   resp.training_specification.training_channels[0].name #=> String
    #   resp.training_specification.training_channels[0].description #=> String
    #   resp.training_specification.training_channels[0].is_required #=> Boolean
    #   resp.training_specification.training_channels[0].supported_content_types #=> Array
    #   resp.training_specification.training_channels[0].supported_content_types[0] #=> String
    #   resp.training_specification.training_channels[0].supported_compression_types #=> Array
    #   resp.training_specification.training_channels[0].supported_compression_types[0] #=> String, one of "None", "Gzip"
    #   resp.training_specification.training_channels[0].supported_input_modes #=> Array
    #   resp.training_specification.training_channels[0].supported_input_modes[0] #=> String, one of "Pipe", "File", "FastFile"
    #   resp.training_specification.supported_tuning_job_objective_metrics #=> Array
    #   resp.training_specification.supported_tuning_job_objective_metrics[0].type #=> String, one of "Maximize", "Minimize"
    #   resp.training_specification.supported_tuning_job_objective_metrics[0].metric_name #=> String
    #   resp.inference_specification.containers #=> Array
    #   resp.inference_specification.containers[0].container_hostname #=> String
    #   resp.inference_specification.containers[0].image #=> String
    #   resp.inference_specification.containers[0].image_digest #=> String
    #   resp.inference_specification.containers[0].model_data_url #=> String
    #   resp.inference_specification.containers[0].product_id #=> String
    #   resp.inference_specification.containers[0].environment #=> Hash
    #   resp.inference_specification.containers[0].environment["EnvironmentKey"] #=> String
    #   resp.inference_specification.supported_transform_instance_types #=> Array
    #   resp.inference_specification.supported_transform_instance_types[0] #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.inference_specification.supported_realtime_inference_instance_types #=> Array
    #   resp.inference_specification.supported_realtime_inference_instance_types[0] #=> String, one of "ml.t2.medium", "ml.t2.large", "ml.t2.xlarge", "ml.t2.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.12xlarge", "ml.m5d.24xlarge", "ml.c4.large", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5d.large", "ml.c5d.xlarge", "ml.c5d.2xlarge", "ml.c5d.4xlarge", "ml.c5d.9xlarge", "ml.c5d.18xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.12xlarge", "ml.r5.24xlarge", "ml.r5d.large", "ml.r5d.xlarge", "ml.r5d.2xlarge", "ml.r5d.4xlarge", "ml.r5d.12xlarge", "ml.r5d.24xlarge", "ml.inf1.xlarge", "ml.inf1.2xlarge", "ml.inf1.6xlarge", "ml.inf1.24xlarge"
    #   resp.inference_specification.supported_content_types #=> Array
    #   resp.inference_specification.supported_content_types[0] #=> String
    #   resp.inference_specification.supported_response_mime_types #=> Array
    #   resp.inference_specification.supported_response_mime_types[0] #=> String
    #   resp.validation_specification.validation_role #=> String
    #   resp.validation_specification.validation_profiles #=> Array
    #   resp.validation_specification.validation_profiles[0].profile_name #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.training_input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.hyper_parameters #=> Hash
    #   resp.validation_specification.validation_profiles[0].training_job_definition.hyper_parameters["HyperParameterKey"] #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config #=> Array
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].channel_name #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.s3_data_source.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.s3_data_source.attribute_names #=> Array
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.s3_data_source.attribute_names[0] #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.file_system_data_source.file_system_id #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.file_system_data_source.file_system_access_mode #=> String, one of "rw", "ro"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.file_system_data_source.file_system_type #=> String, one of "EFS", "FSxLustre"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].data_source.file_system_data_source.directory_path #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].content_type #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].record_wrapper_type #=> String, one of "None", "RecordIO"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.input_data_config[0].shuffle_config.seed #=> Integer
    #   resp.validation_specification.validation_profiles[0].training_job_definition.output_data_config.kms_key_id #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.output_data_config.s3_output_path #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.resource_config.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.validation_specification.validation_profiles[0].training_job_definition.resource_config.instance_count #=> Integer
    #   resp.validation_specification.validation_profiles[0].training_job_definition.resource_config.volume_size_in_gb #=> Integer
    #   resp.validation_specification.validation_profiles[0].training_job_definition.resource_config.volume_kms_key_id #=> String
    #   resp.validation_specification.validation_profiles[0].training_job_definition.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.validation_specification.validation_profiles[0].training_job_definition.stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.max_concurrent_transforms #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.max_payload_in_mb #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.batch_strategy #=> String, one of "MultiRecord", "SingleRecord"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.environment #=> Hash
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.environment["TransformEnvironmentKey"] #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.data_source.s3_data_source.s3_uri #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.content_type #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.compression_type #=> String, one of "None", "Gzip"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.split_type #=> String, one of "None", "Line", "RecordIO", "TFRecord"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.s3_output_path #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.accept #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.assemble_with #=> String, one of "None", "Line"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.kms_key_id #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.instance_count #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.volume_kms_key_id #=> String
    #   resp.algorithm_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting"
    #   resp.algorithm_status_details.validation_statuses #=> Array
    #   resp.algorithm_status_details.validation_statuses[0].name #=> String
    #   resp.algorithm_status_details.validation_statuses[0].status #=> String, one of "NotStarted", "InProgress", "Completed", "Failed"
    #   resp.algorithm_status_details.validation_statuses[0].failure_reason #=> String
    #   resp.algorithm_status_details.image_scan_statuses #=> Array
    #   resp.algorithm_status_details.image_scan_statuses[0].name #=> String
    #   resp.algorithm_status_details.image_scan_statuses[0].status #=> String, one of "NotStarted", "InProgress", "Completed", "Failed"
    #   resp.algorithm_status_details.image_scan_statuses[0].failure_reason #=> String
    #   resp.product_id #=> String
    #   resp.certify_for_marketplace #=> Boolean
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeAlgorithm AWS API Documentation
    #
    # @overload describe_algorithm(params = {})
    # @param [Hash] params ({})
    def describe_algorithm(params = {}, options = {})
      req = build_request(:describe_algorithm, params)
      req.send_request(options)
    end

    # Describes the app.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The user profile name.
    #
    # @option params [required, String] :app_type
    #   The type of app.
    #
    # @option params [required, String] :app_name
    #   The name of the app.
    #
    # @return [Types::DescribeAppResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeAppResponse#app_arn #app_arn} => String
    #   * {Types::DescribeAppResponse#app_type #app_type} => String
    #   * {Types::DescribeAppResponse#app_name #app_name} => String
    #   * {Types::DescribeAppResponse#domain_id #domain_id} => String
    #   * {Types::DescribeAppResponse#user_profile_name #user_profile_name} => String
    #   * {Types::DescribeAppResponse#status #status} => String
    #   * {Types::DescribeAppResponse#last_health_check_timestamp #last_health_check_timestamp} => Time
    #   * {Types::DescribeAppResponse#last_user_activity_timestamp #last_user_activity_timestamp} => Time
    #   * {Types::DescribeAppResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeAppResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeAppResponse#resource_spec #resource_spec} => Types::ResourceSpec
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_app({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #     app_type: "JupyterServer", # required, accepts JupyterServer, KernelGateway, TensorBoard
    #     app_name: "AppName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.app_arn #=> String
    #   resp.app_type #=> String, one of "JupyterServer", "KernelGateway", "TensorBoard"
    #   resp.app_name #=> String
    #   resp.domain_id #=> String
    #   resp.user_profile_name #=> String
    #   resp.status #=> String, one of "Deleted", "Deleting", "Failed", "InService", "Pending"
    #   resp.last_health_check_timestamp #=> Time
    #   resp.last_user_activity_timestamp #=> Time
    #   resp.creation_time #=> Time
    #   resp.failure_reason #=> String
    #   resp.resource_spec.sage_maker_image_arn #=> String
    #   resp.resource_spec.sage_maker_image_version_arn #=> String
    #   resp.resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.resource_spec.lifecycle_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeApp AWS API Documentation
    #
    # @overload describe_app(params = {})
    # @param [Hash] params ({})
    def describe_app(params = {}, options = {})
      req = build_request(:describe_app, params)
      req.send_request(options)
    end

    # Describes an AppImageConfig.
    #
    # @option params [required, String] :app_image_config_name
    #   The name of the AppImageConfig to describe.
    #
    # @return [Types::DescribeAppImageConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeAppImageConfigResponse#app_image_config_arn #app_image_config_arn} => String
    #   * {Types::DescribeAppImageConfigResponse#app_image_config_name #app_image_config_name} => String
    #   * {Types::DescribeAppImageConfigResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeAppImageConfigResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeAppImageConfigResponse#kernel_gateway_image_config #kernel_gateway_image_config} => Types::KernelGatewayImageConfig
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_app_image_config({
    #     app_image_config_name: "AppImageConfigName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.app_image_config_arn #=> String
    #   resp.app_image_config_name #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.kernel_gateway_image_config.kernel_specs #=> Array
    #   resp.kernel_gateway_image_config.kernel_specs[0].name #=> String
    #   resp.kernel_gateway_image_config.kernel_specs[0].display_name #=> String
    #   resp.kernel_gateway_image_config.file_system_config.mount_path #=> String
    #   resp.kernel_gateway_image_config.file_system_config.default_uid #=> Integer
    #   resp.kernel_gateway_image_config.file_system_config.default_gid #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeAppImageConfig AWS API Documentation
    #
    # @overload describe_app_image_config(params = {})
    # @param [Hash] params ({})
    def describe_app_image_config(params = {}, options = {})
      req = build_request(:describe_app_image_config, params)
      req.send_request(options)
    end

    # Describes an artifact.
    #
    # @option params [required, String] :artifact_arn
    #   The Amazon Resource Name (ARN) of the artifact to describe.
    #
    # @return [Types::DescribeArtifactResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeArtifactResponse#artifact_name #artifact_name} => String
    #   * {Types::DescribeArtifactResponse#artifact_arn #artifact_arn} => String
    #   * {Types::DescribeArtifactResponse#source #source} => Types::ArtifactSource
    #   * {Types::DescribeArtifactResponse#artifact_type #artifact_type} => String
    #   * {Types::DescribeArtifactResponse#properties #properties} => Hash&lt;String,String&gt;
    #   * {Types::DescribeArtifactResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeArtifactResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeArtifactResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeArtifactResponse#last_modified_by #last_modified_by} => Types::UserContext
    #   * {Types::DescribeArtifactResponse#metadata_properties #metadata_properties} => Types::MetadataProperties
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_artifact({
    #     artifact_arn: "ArtifactArn", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.artifact_name #=> String
    #   resp.artifact_arn #=> String
    #   resp.source.source_uri #=> String
    #   resp.source.source_types #=> Array
    #   resp.source.source_types[0].source_id_type #=> String, one of "MD5Hash", "S3ETag", "S3Version", "Custom"
    #   resp.source.source_types[0].value #=> String
    #   resp.artifact_type #=> String
    #   resp.properties #=> Hash
    #   resp.properties["StringParameterValue"] #=> String
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #   resp.metadata_properties.commit_id #=> String
    #   resp.metadata_properties.repository #=> String
    #   resp.metadata_properties.generated_by #=> String
    #   resp.metadata_properties.project_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeArtifact AWS API Documentation
    #
    # @overload describe_artifact(params = {})
    # @param [Hash] params ({})
    def describe_artifact(params = {}, options = {})
      req = build_request(:describe_artifact, params)
      req.send_request(options)
    end

    # Returns information about an Amazon SageMaker AutoML job.
    #
    # @option params [required, String] :auto_ml_job_name
    #   Requests information about an AutoML job using its unique name.
    #
    # @return [Types::DescribeAutoMLJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_name #auto_ml_job_name} => String
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_arn #auto_ml_job_arn} => String
    #   * {Types::DescribeAutoMLJobResponse#input_data_config #input_data_config} => Array&lt;Types::AutoMLChannel&gt;
    #   * {Types::DescribeAutoMLJobResponse#output_data_config #output_data_config} => Types::AutoMLOutputDataConfig
    #   * {Types::DescribeAutoMLJobResponse#role_arn #role_arn} => String
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_objective #auto_ml_job_objective} => Types::AutoMLJobObjective
    #   * {Types::DescribeAutoMLJobResponse#problem_type #problem_type} => String
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_config #auto_ml_job_config} => Types::AutoMLJobConfig
    #   * {Types::DescribeAutoMLJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeAutoMLJobResponse#end_time #end_time} => Time
    #   * {Types::DescribeAutoMLJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeAutoMLJobResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeAutoMLJobResponse#partial_failure_reasons #partial_failure_reasons} => Array&lt;Types::AutoMLPartialFailureReason&gt;
    #   * {Types::DescribeAutoMLJobResponse#best_candidate #best_candidate} => Types::AutoMLCandidate
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_status #auto_ml_job_status} => String
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_secondary_status #auto_ml_job_secondary_status} => String
    #   * {Types::DescribeAutoMLJobResponse#generate_candidate_definitions_only #generate_candidate_definitions_only} => Boolean
    #   * {Types::DescribeAutoMLJobResponse#auto_ml_job_artifacts #auto_ml_job_artifacts} => Types::AutoMLJobArtifacts
    #   * {Types::DescribeAutoMLJobResponse#resolved_attributes #resolved_attributes} => Types::ResolvedAttributes
    #   * {Types::DescribeAutoMLJobResponse#model_deploy_config #model_deploy_config} => Types::ModelDeployConfig
    #   * {Types::DescribeAutoMLJobResponse#model_deploy_result #model_deploy_result} => Types::ModelDeployResult
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_auto_ml_job({
    #     auto_ml_job_name: "AutoMLJobName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.auto_ml_job_name #=> String
    #   resp.auto_ml_job_arn #=> String
    #   resp.input_data_config #=> Array
    #   resp.input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix"
    #   resp.input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.input_data_config[0].target_attribute_name #=> String
    #   resp.output_data_config.kms_key_id #=> String
    #   resp.output_data_config.s3_output_path #=> String
    #   resp.role_arn #=> String
    #   resp.auto_ml_job_objective.metric_name #=> String, one of "Accuracy", "MSE", "F1", "F1macro", "AUC"
    #   resp.problem_type #=> String, one of "BinaryClassification", "MulticlassClassification", "Regression"
    #   resp.auto_ml_job_config.completion_criteria.max_candidates #=> Integer
    #   resp.auto_ml_job_config.completion_criteria.max_runtime_per_training_job_in_seconds #=> Integer
    #   resp.auto_ml_job_config.completion_criteria.max_auto_ml_job_runtime_in_seconds #=> Integer
    #   resp.auto_ml_job_config.security_config.volume_kms_key_id #=> String
    #   resp.auto_ml_job_config.security_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.auto_ml_job_config.security_config.vpc_config.security_group_ids #=> Array
    #   resp.auto_ml_job_config.security_config.vpc_config.security_group_ids[0] #=> String
    #   resp.auto_ml_job_config.security_config.vpc_config.subnets #=> Array
    #   resp.auto_ml_job_config.security_config.vpc_config.subnets[0] #=> String
    #   resp.creation_time #=> Time
    #   resp.end_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.failure_reason #=> String
    #   resp.partial_failure_reasons #=> Array
    #   resp.partial_failure_reasons[0].partial_failure_message #=> String
    #   resp.best_candidate.candidate_name #=> String
    #   resp.best_candidate.final_auto_ml_job_objective_metric.type #=> String, one of "Maximize", "Minimize"
    #   resp.best_candidate.final_auto_ml_job_objective_metric.metric_name #=> String, one of "Accuracy", "MSE", "F1", "F1macro", "AUC"
    #   resp.best_candidate.final_auto_ml_job_objective_metric.value #=> Float
    #   resp.best_candidate.objective_status #=> String, one of "Succeeded", "Pending", "Failed"
    #   resp.best_candidate.candidate_steps #=> Array
    #   resp.best_candidate.candidate_steps[0].candidate_step_type #=> String, one of "AWS::SageMaker::TrainingJob", "AWS::SageMaker::TransformJob", "AWS::SageMaker::ProcessingJob"
    #   resp.best_candidate.candidate_steps[0].candidate_step_arn #=> String
    #   resp.best_candidate.candidate_steps[0].candidate_step_name #=> String
    #   resp.best_candidate.candidate_status #=> String, one of "Completed", "InProgress", "Failed", "Stopped", "Stopping"
    #   resp.best_candidate.inference_containers #=> Array
    #   resp.best_candidate.inference_containers[0].image #=> String
    #   resp.best_candidate.inference_containers[0].model_data_url #=> String
    #   resp.best_candidate.inference_containers[0].environment #=> Hash
    #   resp.best_candidate.inference_containers[0].environment["EnvironmentKey"] #=> String
    #   resp.best_candidate.creation_time #=> Time
    #   resp.best_candidate.end_time #=> Time
    #   resp.best_candidate.last_modified_time #=> Time
    #   resp.best_candidate.failure_reason #=> String
    #   resp.best_candidate.candidate_properties.candidate_artifact_locations.explainability #=> String
    #   resp.best_candidate.candidate_properties.candidate_metrics #=> Array
    #   resp.best_candidate.candidate_properties.candidate_metrics[0].metric_name #=> String, one of "Accuracy", "MSE", "F1", "F1macro", "AUC"
    #   resp.best_candidate.candidate_properties.candidate_metrics[0].value #=> Float
    #   resp.best_candidate.candidate_properties.candidate_metrics[0].set #=> String, one of "Train", "Validation", "Test"
    #   resp.auto_ml_job_status #=> String, one of "Completed", "InProgress", "Failed", "Stopped", "Stopping"
    #   resp.auto_ml_job_secondary_status #=> String, one of "Starting", "AnalyzingData", "FeatureEngineering", "ModelTuning", "MaxCandidatesReached", "Failed", "Stopped", "MaxAutoMLJobRuntimeReached", "Stopping", "CandidateDefinitionsGenerated", "GeneratingExplainabilityReport", "Completed", "ExplainabilityError", "DeployingModel", "ModelDeploymentError"
    #   resp.generate_candidate_definitions_only #=> Boolean
    #   resp.auto_ml_job_artifacts.candidate_definition_notebook_location #=> String
    #   resp.auto_ml_job_artifacts.data_exploration_notebook_location #=> String
    #   resp.resolved_attributes.auto_ml_job_objective.metric_name #=> String, one of "Accuracy", "MSE", "F1", "F1macro", "AUC"
    #   resp.resolved_attributes.problem_type #=> String, one of "BinaryClassification", "MulticlassClassification", "Regression"
    #   resp.resolved_attributes.completion_criteria.max_candidates #=> Integer
    #   resp.resolved_attributes.completion_criteria.max_runtime_per_training_job_in_seconds #=> Integer
    #   resp.resolved_attributes.completion_criteria.max_auto_ml_job_runtime_in_seconds #=> Integer
    #   resp.model_deploy_config.auto_generate_endpoint_name #=> Boolean
    #   resp.model_deploy_config.endpoint_name #=> String
    #   resp.model_deploy_result.endpoint_name #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeAutoMLJob AWS API Documentation
    #
    # @overload describe_auto_ml_job(params = {})
    # @param [Hash] params ({})
    def describe_auto_ml_job(params = {}, options = {})
      req = build_request(:describe_auto_ml_job, params)
      req.send_request(options)
    end

    # Gets details about the specified Git repository.
    #
    # @option params [required, String] :code_repository_name
    #   The name of the Git repository to describe.
    #
    # @return [Types::DescribeCodeRepositoryOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeCodeRepositoryOutput#code_repository_name #code_repository_name} => String
    #   * {Types::DescribeCodeRepositoryOutput#code_repository_arn #code_repository_arn} => String
    #   * {Types::DescribeCodeRepositoryOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeCodeRepositoryOutput#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeCodeRepositoryOutput#git_config #git_config} => Types::GitConfig
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_code_repository({
    #     code_repository_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.code_repository_name #=> String
    #   resp.code_repository_arn #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.git_config.repository_url #=> String
    #   resp.git_config.branch #=> String
    #   resp.git_config.secret_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeCodeRepository AWS API Documentation
    #
    # @overload describe_code_repository(params = {})
    # @param [Hash] params ({})
    def describe_code_repository(params = {}, options = {})
      req = build_request(:describe_code_repository, params)
      req.send_request(options)
    end

    # Returns information about a model compilation job.
    #
    # To create a model compilation job, use CreateCompilationJob. To get
    # information about multiple model compilation jobs, use
    # ListCompilationJobs.
    #
    # @option params [required, String] :compilation_job_name
    #   The name of the model compilation job that you want information about.
    #
    # @return [Types::DescribeCompilationJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeCompilationJobResponse#compilation_job_name #compilation_job_name} => String
    #   * {Types::DescribeCompilationJobResponse#compilation_job_arn #compilation_job_arn} => String
    #   * {Types::DescribeCompilationJobResponse#compilation_job_status #compilation_job_status} => String
    #   * {Types::DescribeCompilationJobResponse#compilation_start_time #compilation_start_time} => Time
    #   * {Types::DescribeCompilationJobResponse#compilation_end_time #compilation_end_time} => Time
    #   * {Types::DescribeCompilationJobResponse#stopping_condition #stopping_condition} => Types::StoppingCondition
    #   * {Types::DescribeCompilationJobResponse#inference_image #inference_image} => String
    #   * {Types::DescribeCompilationJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeCompilationJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeCompilationJobResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeCompilationJobResponse#model_artifacts #model_artifacts} => Types::ModelArtifacts
    #   * {Types::DescribeCompilationJobResponse#model_digests #model_digests} => Types::ModelDigests
    #   * {Types::DescribeCompilationJobResponse#role_arn #role_arn} => String
    #   * {Types::DescribeCompilationJobResponse#input_config #input_config} => Types::InputConfig
    #   * {Types::DescribeCompilationJobResponse#output_config #output_config} => Types::OutputConfig
    #   * {Types::DescribeCompilationJobResponse#vpc_config #vpc_config} => Types::NeoVpcConfig
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_compilation_job({
    #     compilation_job_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.compilation_job_name #=> String
    #   resp.compilation_job_arn #=> String
    #   resp.compilation_job_status #=> String, one of "INPROGRESS", "COMPLETED", "FAILED", "STARTING", "STOPPING", "STOPPED"
    #   resp.compilation_start_time #=> Time
    #   resp.compilation_end_time #=> Time
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.inference_image #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.failure_reason #=> String
    #   resp.model_artifacts.s3_model_artifacts #=> String
    #   resp.model_digests.artifact_digest #=> String
    #   resp.role_arn #=> String
    #   resp.input_config.s3_uri #=> String
    #   resp.input_config.data_input_config #=> String
    #   resp.input_config.framework #=> String, one of "TENSORFLOW", "KERAS", "MXNET", "ONNX", "PYTORCH", "XGBOOST", "TFLITE", "DARKNET", "SKLEARN"
    #   resp.input_config.framework_version #=> String
    #   resp.output_config.s3_output_location #=> String
    #   resp.output_config.target_device #=> String, one of "lambda", "ml_m4", "ml_m5", "ml_c4", "ml_c5", "ml_p2", "ml_p3", "ml_g4dn", "ml_inf1", "ml_eia2", "jetson_tx1", "jetson_tx2", "jetson_nano", "jetson_xavier", "rasp3b", "imx8qm", "deeplens", "rk3399", "rk3288", "aisage", "sbe_c", "qcs605", "qcs603", "sitara_am57x", "amba_cv22", "amba_cv25", "x86_win32", "x86_win64", "coreml", "jacinto_tda4vm", "imx8mplus"
    #   resp.output_config.target_platform.os #=> String, one of "ANDROID", "LINUX"
    #   resp.output_config.target_platform.arch #=> String, one of "X86_64", "X86", "ARM64", "ARM_EABI", "ARM_EABIHF"
    #   resp.output_config.target_platform.accelerator #=> String, one of "INTEL_GRAPHICS", "MALI", "NVIDIA"
    #   resp.output_config.compiler_options #=> String
    #   resp.output_config.kms_key_id #=> String
    #   resp.vpc_config.security_group_ids #=> Array
    #   resp.vpc_config.security_group_ids[0] #=> String
    #   resp.vpc_config.subnets #=> Array
    #   resp.vpc_config.subnets[0] #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeCompilationJob AWS API Documentation
    #
    # @overload describe_compilation_job(params = {})
    # @param [Hash] params ({})
    def describe_compilation_job(params = {}, options = {})
      req = build_request(:describe_compilation_job, params)
      req.send_request(options)
    end

    # Describes a context.
    #
    # @option params [required, String] :context_name
    #   The name of the context to describe.
    #
    # @return [Types::DescribeContextResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeContextResponse#context_name #context_name} => String
    #   * {Types::DescribeContextResponse#context_arn #context_arn} => String
    #   * {Types::DescribeContextResponse#source #source} => Types::ContextSource
    #   * {Types::DescribeContextResponse#context_type #context_type} => String
    #   * {Types::DescribeContextResponse#description #description} => String
    #   * {Types::DescribeContextResponse#properties #properties} => Hash&lt;String,String&gt;
    #   * {Types::DescribeContextResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeContextResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeContextResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeContextResponse#last_modified_by #last_modified_by} => Types::UserContext
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_context({
    #     context_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.context_name #=> String
    #   resp.context_arn #=> String
    #   resp.source.source_uri #=> String
    #   resp.source.source_type #=> String
    #   resp.source.source_id #=> String
    #   resp.context_type #=> String
    #   resp.description #=> String
    #   resp.properties #=> Hash
    #   resp.properties["StringParameterValue"] #=> String
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeContext AWS API Documentation
    #
    # @overload describe_context(params = {})
    # @param [Hash] params ({})
    def describe_context(params = {}, options = {})
      req = build_request(:describe_context, params)
      req.send_request(options)
    end

    # Gets the details of a data quality monitoring job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the data quality monitoring job definition to describe.
    #
    # @return [Types::DescribeDataQualityJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeDataQualityJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #   * {Types::DescribeDataQualityJobDefinitionResponse#job_definition_name #job_definition_name} => String
    #   * {Types::DescribeDataQualityJobDefinitionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeDataQualityJobDefinitionResponse#data_quality_baseline_config #data_quality_baseline_config} => Types::DataQualityBaselineConfig
    #   * {Types::DescribeDataQualityJobDefinitionResponse#data_quality_app_specification #data_quality_app_specification} => Types::DataQualityAppSpecification
    #   * {Types::DescribeDataQualityJobDefinitionResponse#data_quality_job_input #data_quality_job_input} => Types::DataQualityJobInput
    #   * {Types::DescribeDataQualityJobDefinitionResponse#data_quality_job_output_config #data_quality_job_output_config} => Types::MonitoringOutputConfig
    #   * {Types::DescribeDataQualityJobDefinitionResponse#job_resources #job_resources} => Types::MonitoringResources
    #   * {Types::DescribeDataQualityJobDefinitionResponse#network_config #network_config} => Types::MonitoringNetworkConfig
    #   * {Types::DescribeDataQualityJobDefinitionResponse#role_arn #role_arn} => String
    #   * {Types::DescribeDataQualityJobDefinitionResponse#stopping_condition #stopping_condition} => Types::MonitoringStoppingCondition
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_data_quality_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #   resp.job_definition_name #=> String
    #   resp.creation_time #=> Time
    #   resp.data_quality_baseline_config.baselining_job_name #=> String
    #   resp.data_quality_baseline_config.constraints_resource.s3_uri #=> String
    #   resp.data_quality_baseline_config.statistics_resource.s3_uri #=> String
    #   resp.data_quality_app_specification.image_uri #=> String
    #   resp.data_quality_app_specification.container_entrypoint #=> Array
    #   resp.data_quality_app_specification.container_entrypoint[0] #=> String
    #   resp.data_quality_app_specification.container_arguments #=> Array
    #   resp.data_quality_app_specification.container_arguments[0] #=> String
    #   resp.data_quality_app_specification.record_preprocessor_source_uri #=> String
    #   resp.data_quality_app_specification.post_analytics_processor_source_uri #=> String
    #   resp.data_quality_app_specification.environment #=> Hash
    #   resp.data_quality_app_specification.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.data_quality_job_input.endpoint_input.endpoint_name #=> String
    #   resp.data_quality_job_input.endpoint_input.local_path #=> String
    #   resp.data_quality_job_input.endpoint_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.data_quality_job_input.endpoint_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.data_quality_job_input.endpoint_input.features_attribute #=> String
    #   resp.data_quality_job_input.endpoint_input.inference_attribute #=> String
    #   resp.data_quality_job_input.endpoint_input.probability_attribute #=> String
    #   resp.data_quality_job_input.endpoint_input.probability_threshold_attribute #=> Float
    #   resp.data_quality_job_input.endpoint_input.start_time_offset #=> String
    #   resp.data_quality_job_input.endpoint_input.end_time_offset #=> String
    #   resp.data_quality_job_output_config.monitoring_outputs #=> Array
    #   resp.data_quality_job_output_config.monitoring_outputs[0].s3_output.s3_uri #=> String
    #   resp.data_quality_job_output_config.monitoring_outputs[0].s3_output.local_path #=> String
    #   resp.data_quality_job_output_config.monitoring_outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.data_quality_job_output_config.kms_key_id #=> String
    #   resp.job_resources.cluster_config.instance_count #=> Integer
    #   resp.job_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.job_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.job_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.network_config.enable_network_isolation #=> Boolean
    #   resp.network_config.vpc_config.security_group_ids #=> Array
    #   resp.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.network_config.vpc_config.subnets #=> Array
    #   resp.network_config.vpc_config.subnets[0] #=> String
    #   resp.role_arn #=> String
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeDataQualityJobDefinition AWS API Documentation
    #
    # @overload describe_data_quality_job_definition(params = {})
    # @param [Hash] params ({})
    def describe_data_quality_job_definition(params = {}, options = {})
      req = build_request(:describe_data_quality_job_definition, params)
      req.send_request(options)
    end

    # Describes the device.
    #
    # @option params [String] :next_token
    #   Next token of device description.
    #
    # @option params [required, String] :device_name
    #   The unique ID of the device.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet the devices belong to.
    #
    # @return [Types::DescribeDeviceResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeDeviceResponse#device_arn #device_arn} => String
    #   * {Types::DescribeDeviceResponse#device_name #device_name} => String
    #   * {Types::DescribeDeviceResponse#description #description} => String
    #   * {Types::DescribeDeviceResponse#device_fleet_name #device_fleet_name} => String
    #   * {Types::DescribeDeviceResponse#iot_thing_name #iot_thing_name} => String
    #   * {Types::DescribeDeviceResponse#registration_time #registration_time} => Time
    #   * {Types::DescribeDeviceResponse#latest_heartbeat #latest_heartbeat} => Time
    #   * {Types::DescribeDeviceResponse#models #models} => Array&lt;Types::EdgeModel&gt;
    #   * {Types::DescribeDeviceResponse#max_models #max_models} => Integer
    #   * {Types::DescribeDeviceResponse#next_token #next_token} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_device({
    #     next_token: "NextToken",
    #     device_name: "EntityName", # required
    #     device_fleet_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.device_arn #=> String
    #   resp.device_name #=> String
    #   resp.description #=> String
    #   resp.device_fleet_name #=> String
    #   resp.iot_thing_name #=> String
    #   resp.registration_time #=> Time
    #   resp.latest_heartbeat #=> Time
    #   resp.models #=> Array
    #   resp.models[0].model_name #=> String
    #   resp.models[0].model_version #=> String
    #   resp.models[0].latest_sample_time #=> Time
    #   resp.models[0].latest_inference #=> Time
    #   resp.max_models #=> Integer
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeDevice AWS API Documentation
    #
    # @overload describe_device(params = {})
    # @param [Hash] params ({})
    def describe_device(params = {}, options = {})
      req = build_request(:describe_device, params)
      req.send_request(options)
    end

    # A description of the fleet the device belongs to.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet.
    #
    # @return [Types::DescribeDeviceFleetResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeDeviceFleetResponse#device_fleet_name #device_fleet_name} => String
    #   * {Types::DescribeDeviceFleetResponse#device_fleet_arn #device_fleet_arn} => String
    #   * {Types::DescribeDeviceFleetResponse#output_config #output_config} => Types::EdgeOutputConfig
    #   * {Types::DescribeDeviceFleetResponse#description #description} => String
    #   * {Types::DescribeDeviceFleetResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeDeviceFleetResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeDeviceFleetResponse#role_arn #role_arn} => String
    #   * {Types::DescribeDeviceFleetResponse#iot_role_alias #iot_role_alias} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_device_fleet({
    #     device_fleet_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.device_fleet_name #=> String
    #   resp.device_fleet_arn #=> String
    #   resp.output_config.s3_output_location #=> String
    #   resp.output_config.kms_key_id #=> String
    #   resp.output_config.preset_deployment_type #=> String, one of "GreengrassV2Component"
    #   resp.output_config.preset_deployment_config #=> String
    #   resp.description #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.role_arn #=> String
    #   resp.iot_role_alias #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeDeviceFleet AWS API Documentation
    #
    # @overload describe_device_fleet(params = {})
    # @param [Hash] params ({})
    def describe_device_fleet(params = {}, options = {})
      req = build_request(:describe_device_fleet, params)
      req.send_request(options)
    end

    # The description of the domain.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @return [Types::DescribeDomainResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeDomainResponse#domain_arn #domain_arn} => String
    #   * {Types::DescribeDomainResponse#domain_id #domain_id} => String
    #   * {Types::DescribeDomainResponse#domain_name #domain_name} => String
    #   * {Types::DescribeDomainResponse#home_efs_file_system_id #home_efs_file_system_id} => String
    #   * {Types::DescribeDomainResponse#single_sign_on_managed_application_instance_id #single_sign_on_managed_application_instance_id} => String
    #   * {Types::DescribeDomainResponse#status #status} => String
    #   * {Types::DescribeDomainResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeDomainResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeDomainResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeDomainResponse#auth_mode #auth_mode} => String
    #   * {Types::DescribeDomainResponse#default_user_settings #default_user_settings} => Types::UserSettings
    #   * {Types::DescribeDomainResponse#app_network_access_type #app_network_access_type} => String
    #   * {Types::DescribeDomainResponse#home_efs_file_system_kms_key_id #home_efs_file_system_kms_key_id} => String
    #   * {Types::DescribeDomainResponse#subnet_ids #subnet_ids} => Array&lt;String&gt;
    #   * {Types::DescribeDomainResponse#url #url} => String
    #   * {Types::DescribeDomainResponse#vpc_id #vpc_id} => String
    #   * {Types::DescribeDomainResponse#kms_key_id #kms_key_id} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_domain({
    #     domain_id: "DomainId", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.domain_arn #=> String
    #   resp.domain_id #=> String
    #   resp.domain_name #=> String
    #   resp.home_efs_file_system_id #=> String
    #   resp.single_sign_on_managed_application_instance_id #=> String
    #   resp.status #=> String, one of "Deleting", "Failed", "InService", "Pending", "Updating", "Update_Failed", "Delete_Failed"
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.failure_reason #=> String
    #   resp.auth_mode #=> String, one of "SSO", "IAM"
    #   resp.default_user_settings.execution_role #=> String
    #   resp.default_user_settings.security_groups #=> Array
    #   resp.default_user_settings.security_groups[0] #=> String
    #   resp.default_user_settings.sharing_settings.notebook_output_option #=> String, one of "Allowed", "Disabled"
    #   resp.default_user_settings.sharing_settings.s3_output_path #=> String
    #   resp.default_user_settings.sharing_settings.s3_kms_key_id #=> String
    #   resp.default_user_settings.jupyter_server_app_settings.default_resource_spec.sage_maker_image_arn #=> String
    #   resp.default_user_settings.jupyter_server_app_settings.default_resource_spec.sage_maker_image_version_arn #=> String
    #   resp.default_user_settings.jupyter_server_app_settings.default_resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.default_user_settings.jupyter_server_app_settings.default_resource_spec.lifecycle_config_arn #=> String
    #   resp.default_user_settings.jupyter_server_app_settings.lifecycle_config_arns #=> Array
    #   resp.default_user_settings.jupyter_server_app_settings.lifecycle_config_arns[0] #=> String
    #   resp.default_user_settings.kernel_gateway_app_settings.default_resource_spec.sage_maker_image_arn #=> String
    #   resp.default_user_settings.kernel_gateway_app_settings.default_resource_spec.sage_maker_image_version_arn #=> String
    #   resp.default_user_settings.kernel_gateway_app_settings.default_resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.default_user_settings.kernel_gateway_app_settings.default_resource_spec.lifecycle_config_arn #=> String
    #   resp.default_user_settings.kernel_gateway_app_settings.custom_images #=> Array
    #   resp.default_user_settings.kernel_gateway_app_settings.custom_images[0].image_name #=> String
    #   resp.default_user_settings.kernel_gateway_app_settings.custom_images[0].image_version_number #=> Integer
    #   resp.default_user_settings.kernel_gateway_app_settings.custom_images[0].app_image_config_name #=> String
    #   resp.default_user_settings.kernel_gateway_app_settings.lifecycle_config_arns #=> Array
    #   resp.default_user_settings.kernel_gateway_app_settings.lifecycle_config_arns[0] #=> String
    #   resp.default_user_settings.tensor_board_app_settings.default_resource_spec.sage_maker_image_arn #=> String
    #   resp.default_user_settings.tensor_board_app_settings.default_resource_spec.sage_maker_image_version_arn #=> String
    #   resp.default_user_settings.tensor_board_app_settings.default_resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.default_user_settings.tensor_board_app_settings.default_resource_spec.lifecycle_config_arn #=> String
    #   resp.app_network_access_type #=> String, one of "PublicInternetOnly", "VpcOnly"
    #   resp.home_efs_file_system_kms_key_id #=> String
    #   resp.subnet_ids #=> Array
    #   resp.subnet_ids[0] #=> String
    #   resp.url #=> String
    #   resp.vpc_id #=> String
    #   resp.kms_key_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeDomain AWS API Documentation
    #
    # @overload describe_domain(params = {})
    # @param [Hash] params ({})
    def describe_domain(params = {}, options = {})
      req = build_request(:describe_domain, params)
      req.send_request(options)
    end

    # A description of edge packaging jobs.
    #
    # @option params [required, String] :edge_packaging_job_name
    #   The name of the edge packaging job.
    #
    # @return [Types::DescribeEdgePackagingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeEdgePackagingJobResponse#edge_packaging_job_arn #edge_packaging_job_arn} => String
    #   * {Types::DescribeEdgePackagingJobResponse#edge_packaging_job_name #edge_packaging_job_name} => String
    #   * {Types::DescribeEdgePackagingJobResponse#compilation_job_name #compilation_job_name} => String
    #   * {Types::DescribeEdgePackagingJobResponse#model_name #model_name} => String
    #   * {Types::DescribeEdgePackagingJobResponse#model_version #model_version} => String
    #   * {Types::DescribeEdgePackagingJobResponse#role_arn #role_arn} => String
    #   * {Types::DescribeEdgePackagingJobResponse#output_config #output_config} => Types::EdgeOutputConfig
    #   * {Types::DescribeEdgePackagingJobResponse#resource_key #resource_key} => String
    #   * {Types::DescribeEdgePackagingJobResponse#edge_packaging_job_status #edge_packaging_job_status} => String
    #   * {Types::DescribeEdgePackagingJobResponse#edge_packaging_job_status_message #edge_packaging_job_status_message} => String
    #   * {Types::DescribeEdgePackagingJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeEdgePackagingJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeEdgePackagingJobResponse#model_artifact #model_artifact} => String
    #   * {Types::DescribeEdgePackagingJobResponse#model_signature #model_signature} => String
    #   * {Types::DescribeEdgePackagingJobResponse#preset_deployment_output #preset_deployment_output} => Types::EdgePresetDeploymentOutput
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_edge_packaging_job({
    #     edge_packaging_job_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.edge_packaging_job_arn #=> String
    #   resp.edge_packaging_job_name #=> String
    #   resp.compilation_job_name #=> String
    #   resp.model_name #=> String
    #   resp.model_version #=> String
    #   resp.role_arn #=> String
    #   resp.output_config.s3_output_location #=> String
    #   resp.output_config.kms_key_id #=> String
    #   resp.output_config.preset_deployment_type #=> String, one of "GreengrassV2Component"
    #   resp.output_config.preset_deployment_config #=> String
    #   resp.resource_key #=> String
    #   resp.edge_packaging_job_status #=> String, one of "STARTING", "INPROGRESS", "COMPLETED", "FAILED", "STOPPING", "STOPPED"
    #   resp.edge_packaging_job_status_message #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.model_artifact #=> String
    #   resp.model_signature #=> String
    #   resp.preset_deployment_output.type #=> String, one of "GreengrassV2Component"
    #   resp.preset_deployment_output.artifact #=> String
    #   resp.preset_deployment_output.status #=> String, one of "COMPLETED", "FAILED"
    #   resp.preset_deployment_output.status_message #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeEdgePackagingJob AWS API Documentation
    #
    # @overload describe_edge_packaging_job(params = {})
    # @param [Hash] params ({})
    def describe_edge_packaging_job(params = {}, options = {})
      req = build_request(:describe_edge_packaging_job, params)
      req.send_request(options)
    end

    # Returns the description of an endpoint.
    #
    # @option params [required, String] :endpoint_name
    #   The name of the endpoint.
    #
    # @return [Types::DescribeEndpointOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeEndpointOutput#endpoint_name #endpoint_name} => String
    #   * {Types::DescribeEndpointOutput#endpoint_arn #endpoint_arn} => String
    #   * {Types::DescribeEndpointOutput#endpoint_config_name #endpoint_config_name} => String
    #   * {Types::DescribeEndpointOutput#production_variants #production_variants} => Array&lt;Types::ProductionVariantSummary&gt;
    #   * {Types::DescribeEndpointOutput#data_capture_config #data_capture_config} => Types::DataCaptureConfigSummary
    #   * {Types::DescribeEndpointOutput#endpoint_status #endpoint_status} => String
    #   * {Types::DescribeEndpointOutput#failure_reason #failure_reason} => String
    #   * {Types::DescribeEndpointOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeEndpointOutput#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeEndpointOutput#last_deployment_config #last_deployment_config} => Types::DeploymentConfig
    #   * {Types::DescribeEndpointOutput#async_inference_config #async_inference_config} => Types::AsyncInferenceConfig
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_endpoint({
    #     endpoint_name: "EndpointName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_name #=> String
    #   resp.endpoint_arn #=> String
    #   resp.endpoint_config_name #=> String
    #   resp.production_variants #=> Array
    #   resp.production_variants[0].variant_name #=> String
    #   resp.production_variants[0].deployed_images #=> Array
    #   resp.production_variants[0].deployed_images[0].specified_image #=> String
    #   resp.production_variants[0].deployed_images[0].resolved_image #=> String
    #   resp.production_variants[0].deployed_images[0].resolution_time #=> Time
    #   resp.production_variants[0].current_weight #=> Float
    #   resp.production_variants[0].desired_weight #=> Float
    #   resp.production_variants[0].current_instance_count #=> Integer
    #   resp.production_variants[0].desired_instance_count #=> Integer
    #   resp.data_capture_config.enable_capture #=> Boolean
    #   resp.data_capture_config.capture_status #=> String, one of "Started", "Stopped"
    #   resp.data_capture_config.current_sampling_percentage #=> Integer
    #   resp.data_capture_config.destination_s3_uri #=> String
    #   resp.data_capture_config.kms_key_id #=> String
    #   resp.endpoint_status #=> String, one of "OutOfService", "Creating", "Updating", "SystemUpdating", "RollingBack", "InService", "Deleting", "Failed"
    #   resp.failure_reason #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.last_deployment_config.blue_green_update_policy.traffic_routing_configuration.type #=> String, one of "ALL_AT_ONCE", "CANARY"
    #   resp.last_deployment_config.blue_green_update_policy.traffic_routing_configuration.wait_interval_in_seconds #=> Integer
    #   resp.last_deployment_config.blue_green_update_policy.traffic_routing_configuration.canary_size.type #=> String, one of "INSTANCE_COUNT", "CAPACITY_PERCENT"
    #   resp.last_deployment_config.blue_green_update_policy.traffic_routing_configuration.canary_size.value #=> Integer
    #   resp.last_deployment_config.blue_green_update_policy.termination_wait_in_seconds #=> Integer
    #   resp.last_deployment_config.blue_green_update_policy.maximum_execution_timeout_in_seconds #=> Integer
    #   resp.last_deployment_config.auto_rollback_configuration.alarms #=> Array
    #   resp.last_deployment_config.auto_rollback_configuration.alarms[0].alarm_name #=> String
    #   resp.async_inference_config.client_config.max_concurrent_invocations_per_instance #=> Integer
    #   resp.async_inference_config.output_config.kms_key_id #=> String
    #   resp.async_inference_config.output_config.s3_output_path #=> String
    #   resp.async_inference_config.output_config.notification_config.success_topic #=> String
    #   resp.async_inference_config.output_config.notification_config.error_topic #=> String
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * endpoint_deleted
    #   * endpoint_in_service
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeEndpoint AWS API Documentation
    #
    # @overload describe_endpoint(params = {})
    # @param [Hash] params ({})
    def describe_endpoint(params = {}, options = {})
      req = build_request(:describe_endpoint, params)
      req.send_request(options)
    end

    # Returns the description of an endpoint configuration created using the
    # `CreateEndpointConfig` API.
    #
    # @option params [required, String] :endpoint_config_name
    #   The name of the endpoint configuration.
    #
    # @return [Types::DescribeEndpointConfigOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeEndpointConfigOutput#endpoint_config_name #endpoint_config_name} => String
    #   * {Types::DescribeEndpointConfigOutput#endpoint_config_arn #endpoint_config_arn} => String
    #   * {Types::DescribeEndpointConfigOutput#production_variants #production_variants} => Array&lt;Types::ProductionVariant&gt;
    #   * {Types::DescribeEndpointConfigOutput#data_capture_config #data_capture_config} => Types::DataCaptureConfig
    #   * {Types::DescribeEndpointConfigOutput#kms_key_id #kms_key_id} => String
    #   * {Types::DescribeEndpointConfigOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeEndpointConfigOutput#async_inference_config #async_inference_config} => Types::AsyncInferenceConfig
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_endpoint_config({
    #     endpoint_config_name: "EndpointConfigName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_config_name #=> String
    #   resp.endpoint_config_arn #=> String
    #   resp.production_variants #=> Array
    #   resp.production_variants[0].variant_name #=> String
    #   resp.production_variants[0].model_name #=> String
    #   resp.production_variants[0].initial_instance_count #=> Integer
    #   resp.production_variants[0].instance_type #=> String, one of "ml.t2.medium", "ml.t2.large", "ml.t2.xlarge", "ml.t2.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.12xlarge", "ml.m5d.24xlarge", "ml.c4.large", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5d.large", "ml.c5d.xlarge", "ml.c5d.2xlarge", "ml.c5d.4xlarge", "ml.c5d.9xlarge", "ml.c5d.18xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.12xlarge", "ml.r5.24xlarge", "ml.r5d.large", "ml.r5d.xlarge", "ml.r5d.2xlarge", "ml.r5d.4xlarge", "ml.r5d.12xlarge", "ml.r5d.24xlarge", "ml.inf1.xlarge", "ml.inf1.2xlarge", "ml.inf1.6xlarge", "ml.inf1.24xlarge"
    #   resp.production_variants[0].initial_variant_weight #=> Float
    #   resp.production_variants[0].accelerator_type #=> String, one of "ml.eia1.medium", "ml.eia1.large", "ml.eia1.xlarge", "ml.eia2.medium", "ml.eia2.large", "ml.eia2.xlarge"
    #   resp.production_variants[0].core_dump_config.destination_s3_uri #=> String
    #   resp.production_variants[0].core_dump_config.kms_key_id #=> String
    #   resp.data_capture_config.enable_capture #=> Boolean
    #   resp.data_capture_config.initial_sampling_percentage #=> Integer
    #   resp.data_capture_config.destination_s3_uri #=> String
    #   resp.data_capture_config.kms_key_id #=> String
    #   resp.data_capture_config.capture_options #=> Array
    #   resp.data_capture_config.capture_options[0].capture_mode #=> String, one of "Input", "Output"
    #   resp.data_capture_config.capture_content_type_header.csv_content_types #=> Array
    #   resp.data_capture_config.capture_content_type_header.csv_content_types[0] #=> String
    #   resp.data_capture_config.capture_content_type_header.json_content_types #=> Array
    #   resp.data_capture_config.capture_content_type_header.json_content_types[0] #=> String
    #   resp.kms_key_id #=> String
    #   resp.creation_time #=> Time
    #   resp.async_inference_config.client_config.max_concurrent_invocations_per_instance #=> Integer
    #   resp.async_inference_config.output_config.kms_key_id #=> String
    #   resp.async_inference_config.output_config.s3_output_path #=> String
    #   resp.async_inference_config.output_config.notification_config.success_topic #=> String
    #   resp.async_inference_config.output_config.notification_config.error_topic #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeEndpointConfig AWS API Documentation
    #
    # @overload describe_endpoint_config(params = {})
    # @param [Hash] params ({})
    def describe_endpoint_config(params = {}, options = {})
      req = build_request(:describe_endpoint_config, params)
      req.send_request(options)
    end

    # Provides a list of an experiment's properties.
    #
    # @option params [required, String] :experiment_name
    #   The name of the experiment to describe.
    #
    # @return [Types::DescribeExperimentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeExperimentResponse#experiment_name #experiment_name} => String
    #   * {Types::DescribeExperimentResponse#experiment_arn #experiment_arn} => String
    #   * {Types::DescribeExperimentResponse#display_name #display_name} => String
    #   * {Types::DescribeExperimentResponse#source #source} => Types::ExperimentSource
    #   * {Types::DescribeExperimentResponse#description #description} => String
    #   * {Types::DescribeExperimentResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeExperimentResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeExperimentResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeExperimentResponse#last_modified_by #last_modified_by} => Types::UserContext
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_experiment({
    #     experiment_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.experiment_name #=> String
    #   resp.experiment_arn #=> String
    #   resp.display_name #=> String
    #   resp.source.source_arn #=> String
    #   resp.source.source_type #=> String
    #   resp.description #=> String
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeExperiment AWS API Documentation
    #
    # @overload describe_experiment(params = {})
    # @param [Hash] params ({})
    def describe_experiment(params = {}, options = {})
      req = build_request(:describe_experiment, params)
      req.send_request(options)
    end

    # Use this operation to describe a `FeatureGroup`. The response includes
    # information on the creation time, `FeatureGroup` name, the unique
    # identifier for each `FeatureGroup`, and more.
    #
    # @option params [required, String] :feature_group_name
    #   The name of the `FeatureGroup` you want described.
    #
    # @option params [String] :next_token
    #   A token to resume pagination of the list of `Features`
    #   (`FeatureDefinitions`). 2,500 `Features` are returned by default.
    #
    # @return [Types::DescribeFeatureGroupResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeFeatureGroupResponse#feature_group_arn #feature_group_arn} => String
    #   * {Types::DescribeFeatureGroupResponse#feature_group_name #feature_group_name} => String
    #   * {Types::DescribeFeatureGroupResponse#record_identifier_feature_name #record_identifier_feature_name} => String
    #   * {Types::DescribeFeatureGroupResponse#event_time_feature_name #event_time_feature_name} => String
    #   * {Types::DescribeFeatureGroupResponse#feature_definitions #feature_definitions} => Array&lt;Types::FeatureDefinition&gt;
    #   * {Types::DescribeFeatureGroupResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeFeatureGroupResponse#online_store_config #online_store_config} => Types::OnlineStoreConfig
    #   * {Types::DescribeFeatureGroupResponse#offline_store_config #offline_store_config} => Types::OfflineStoreConfig
    #   * {Types::DescribeFeatureGroupResponse#role_arn #role_arn} => String
    #   * {Types::DescribeFeatureGroupResponse#feature_group_status #feature_group_status} => String
    #   * {Types::DescribeFeatureGroupResponse#offline_store_status #offline_store_status} => Types::OfflineStoreStatus
    #   * {Types::DescribeFeatureGroupResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeFeatureGroupResponse#description #description} => String
    #   * {Types::DescribeFeatureGroupResponse#next_token #next_token} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_feature_group({
    #     feature_group_name: "FeatureGroupName", # required
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.feature_group_arn #=> String
    #   resp.feature_group_name #=> String
    #   resp.record_identifier_feature_name #=> String
    #   resp.event_time_feature_name #=> String
    #   resp.feature_definitions #=> Array
    #   resp.feature_definitions[0].feature_name #=> String
    #   resp.feature_definitions[0].feature_type #=> String, one of "Integral", "Fractional", "String"
    #   resp.creation_time #=> Time
    #   resp.online_store_config.security_config.kms_key_id #=> String
    #   resp.online_store_config.enable_online_store #=> Boolean
    #   resp.offline_store_config.s3_storage_config.s3_uri #=> String
    #   resp.offline_store_config.s3_storage_config.kms_key_id #=> String
    #   resp.offline_store_config.s3_storage_config.resolved_output_s3_uri #=> String
    #   resp.offline_store_config.disable_glue_table_creation #=> Boolean
    #   resp.offline_store_config.data_catalog_config.table_name #=> String
    #   resp.offline_store_config.data_catalog_config.catalog #=> String
    #   resp.offline_store_config.data_catalog_config.database #=> String
    #   resp.role_arn #=> String
    #   resp.feature_group_status #=> String, one of "Creating", "Created", "CreateFailed", "Deleting", "DeleteFailed"
    #   resp.offline_store_status.status #=> String, one of "Active", "Blocked", "Disabled"
    #   resp.offline_store_status.blocked_reason #=> String
    #   resp.failure_reason #=> String
    #   resp.description #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeFeatureGroup AWS API Documentation
    #
    # @overload describe_feature_group(params = {})
    # @param [Hash] params ({})
    def describe_feature_group(params = {}, options = {})
      req = build_request(:describe_feature_group, params)
      req.send_request(options)
    end

    # Returns information about the specified flow definition.
    #
    # @option params [required, String] :flow_definition_name
    #   The name of the flow definition.
    #
    # @return [Types::DescribeFlowDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeFlowDefinitionResponse#flow_definition_arn #flow_definition_arn} => String
    #   * {Types::DescribeFlowDefinitionResponse#flow_definition_name #flow_definition_name} => String
    #   * {Types::DescribeFlowDefinitionResponse#flow_definition_status #flow_definition_status} => String
    #   * {Types::DescribeFlowDefinitionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeFlowDefinitionResponse#human_loop_request_source #human_loop_request_source} => Types::HumanLoopRequestSource
    #   * {Types::DescribeFlowDefinitionResponse#human_loop_activation_config #human_loop_activation_config} => Types::HumanLoopActivationConfig
    #   * {Types::DescribeFlowDefinitionResponse#human_loop_config #human_loop_config} => Types::HumanLoopConfig
    #   * {Types::DescribeFlowDefinitionResponse#output_config #output_config} => Types::FlowDefinitionOutputConfig
    #   * {Types::DescribeFlowDefinitionResponse#role_arn #role_arn} => String
    #   * {Types::DescribeFlowDefinitionResponse#failure_reason #failure_reason} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_flow_definition({
    #     flow_definition_name: "FlowDefinitionName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.flow_definition_arn #=> String
    #   resp.flow_definition_name #=> String
    #   resp.flow_definition_status #=> String, one of "Initializing", "Active", "Failed", "Deleting"
    #   resp.creation_time #=> Time
    #   resp.human_loop_request_source.aws_managed_human_loop_request_source #=> String, one of "AWS/Rekognition/DetectModerationLabels/Image/V3", "AWS/Textract/AnalyzeDocument/Forms/V1"
    #   resp.human_loop_activation_config.human_loop_activation_conditions_config.human_loop_activation_conditions #=> String
    #   resp.human_loop_config.workteam_arn #=> String
    #   resp.human_loop_config.human_task_ui_arn #=> String
    #   resp.human_loop_config.task_title #=> String
    #   resp.human_loop_config.task_description #=> String
    #   resp.human_loop_config.task_count #=> Integer
    #   resp.human_loop_config.task_availability_lifetime_in_seconds #=> Integer
    #   resp.human_loop_config.task_time_limit_in_seconds #=> Integer
    #   resp.human_loop_config.task_keywords #=> Array
    #   resp.human_loop_config.task_keywords[0] #=> String
    #   resp.human_loop_config.public_workforce_task_price.amount_in_usd.dollars #=> Integer
    #   resp.human_loop_config.public_workforce_task_price.amount_in_usd.cents #=> Integer
    #   resp.human_loop_config.public_workforce_task_price.amount_in_usd.tenth_fractions_of_a_cent #=> Integer
    #   resp.output_config.s3_output_path #=> String
    #   resp.output_config.kms_key_id #=> String
    #   resp.role_arn #=> String
    #   resp.failure_reason #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeFlowDefinition AWS API Documentation
    #
    # @overload describe_flow_definition(params = {})
    # @param [Hash] params ({})
    def describe_flow_definition(params = {}, options = {})
      req = build_request(:describe_flow_definition, params)
      req.send_request(options)
    end

    # Returns information about the requested human task user interface
    # (worker task template).
    #
    # @option params [required, String] :human_task_ui_name
    #   The name of the human task user interface (worker task template) you
    #   want information about.
    #
    # @return [Types::DescribeHumanTaskUiResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeHumanTaskUiResponse#human_task_ui_arn #human_task_ui_arn} => String
    #   * {Types::DescribeHumanTaskUiResponse#human_task_ui_name #human_task_ui_name} => String
    #   * {Types::DescribeHumanTaskUiResponse#human_task_ui_status #human_task_ui_status} => String
    #   * {Types::DescribeHumanTaskUiResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeHumanTaskUiResponse#ui_template #ui_template} => Types::UiTemplateInfo
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_human_task_ui({
    #     human_task_ui_name: "HumanTaskUiName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.human_task_ui_arn #=> String
    #   resp.human_task_ui_name #=> String
    #   resp.human_task_ui_status #=> String, one of "Active", "Deleting"
    #   resp.creation_time #=> Time
    #   resp.ui_template.url #=> String
    #   resp.ui_template.content_sha_256 #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeHumanTaskUi AWS API Documentation
    #
    # @overload describe_human_task_ui(params = {})
    # @param [Hash] params ({})
    def describe_human_task_ui(params = {}, options = {})
      req = build_request(:describe_human_task_ui, params)
      req.send_request(options)
    end

    # Gets a description of a hyperparameter tuning job.
    #
    # @option params [required, String] :hyper_parameter_tuning_job_name
    #   The name of the tuning job.
    #
    # @return [Types::DescribeHyperParameterTuningJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeHyperParameterTuningJobResponse#hyper_parameter_tuning_job_name #hyper_parameter_tuning_job_name} => String
    #   * {Types::DescribeHyperParameterTuningJobResponse#hyper_parameter_tuning_job_arn #hyper_parameter_tuning_job_arn} => String
    #   * {Types::DescribeHyperParameterTuningJobResponse#hyper_parameter_tuning_job_config #hyper_parameter_tuning_job_config} => Types::HyperParameterTuningJobConfig
    #   * {Types::DescribeHyperParameterTuningJobResponse#training_job_definition #training_job_definition} => Types::HyperParameterTrainingJobDefinition
    #   * {Types::DescribeHyperParameterTuningJobResponse#training_job_definitions #training_job_definitions} => Array&lt;Types::HyperParameterTrainingJobDefinition&gt;
    #   * {Types::DescribeHyperParameterTuningJobResponse#hyper_parameter_tuning_job_status #hyper_parameter_tuning_job_status} => String
    #   * {Types::DescribeHyperParameterTuningJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeHyperParameterTuningJobResponse#hyper_parameter_tuning_end_time #hyper_parameter_tuning_end_time} => Time
    #   * {Types::DescribeHyperParameterTuningJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeHyperParameterTuningJobResponse#training_job_status_counters #training_job_status_counters} => Types::TrainingJobStatusCounters
    #   * {Types::DescribeHyperParameterTuningJobResponse#objective_status_counters #objective_status_counters} => Types::ObjectiveStatusCounters
    #   * {Types::DescribeHyperParameterTuningJobResponse#best_training_job #best_training_job} => Types::HyperParameterTrainingJobSummary
    #   * {Types::DescribeHyperParameterTuningJobResponse#overall_best_training_job #overall_best_training_job} => Types::HyperParameterTrainingJobSummary
    #   * {Types::DescribeHyperParameterTuningJobResponse#warm_start_config #warm_start_config} => Types::HyperParameterTuningJobWarmStartConfig
    #   * {Types::DescribeHyperParameterTuningJobResponse#failure_reason #failure_reason} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_hyper_parameter_tuning_job({
    #     hyper_parameter_tuning_job_name: "HyperParameterTuningJobName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.hyper_parameter_tuning_job_name #=> String
    #   resp.hyper_parameter_tuning_job_arn #=> String
    #   resp.hyper_parameter_tuning_job_config.strategy #=> String, one of "Bayesian", "Random"
    #   resp.hyper_parameter_tuning_job_config.hyper_parameter_tuning_job_objective.type #=> String, one of "Maximize", "Minimize"
    #   resp.hyper_parameter_tuning_job_config.hyper_parameter_tuning_job_objective.metric_name #=> String
    #   resp.hyper_parameter_tuning_job_config.resource_limits.max_number_of_training_jobs #=> Integer
    #   resp.hyper_parameter_tuning_job_config.resource_limits.max_parallel_training_jobs #=> Integer
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.integer_parameter_ranges #=> Array
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.integer_parameter_ranges[0].name #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.integer_parameter_ranges[0].min_value #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.integer_parameter_ranges[0].max_value #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.integer_parameter_ranges[0].scaling_type #=> String, one of "Auto", "Linear", "Logarithmic", "ReverseLogarithmic"
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.continuous_parameter_ranges #=> Array
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.continuous_parameter_ranges[0].name #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.continuous_parameter_ranges[0].min_value #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.continuous_parameter_ranges[0].max_value #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.continuous_parameter_ranges[0].scaling_type #=> String, one of "Auto", "Linear", "Logarithmic", "ReverseLogarithmic"
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.categorical_parameter_ranges #=> Array
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.categorical_parameter_ranges[0].name #=> String
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.categorical_parameter_ranges[0].values #=> Array
    #   resp.hyper_parameter_tuning_job_config.parameter_ranges.categorical_parameter_ranges[0].values[0] #=> String
    #   resp.hyper_parameter_tuning_job_config.training_job_early_stopping_type #=> String, one of "Off", "Auto"
    #   resp.hyper_parameter_tuning_job_config.tuning_job_completion_criteria.target_objective_metric_value #=> Float
    #   resp.training_job_definition.definition_name #=> String
    #   resp.training_job_definition.tuning_objective.type #=> String, one of "Maximize", "Minimize"
    #   resp.training_job_definition.tuning_objective.metric_name #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.integer_parameter_ranges #=> Array
    #   resp.training_job_definition.hyper_parameter_ranges.integer_parameter_ranges[0].name #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.integer_parameter_ranges[0].min_value #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.integer_parameter_ranges[0].max_value #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.integer_parameter_ranges[0].scaling_type #=> String, one of "Auto", "Linear", "Logarithmic", "ReverseLogarithmic"
    #   resp.training_job_definition.hyper_parameter_ranges.continuous_parameter_ranges #=> Array
    #   resp.training_job_definition.hyper_parameter_ranges.continuous_parameter_ranges[0].name #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.continuous_parameter_ranges[0].min_value #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.continuous_parameter_ranges[0].max_value #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.continuous_parameter_ranges[0].scaling_type #=> String, one of "Auto", "Linear", "Logarithmic", "ReverseLogarithmic"
    #   resp.training_job_definition.hyper_parameter_ranges.categorical_parameter_ranges #=> Array
    #   resp.training_job_definition.hyper_parameter_ranges.categorical_parameter_ranges[0].name #=> String
    #   resp.training_job_definition.hyper_parameter_ranges.categorical_parameter_ranges[0].values #=> Array
    #   resp.training_job_definition.hyper_parameter_ranges.categorical_parameter_ranges[0].values[0] #=> String
    #   resp.training_job_definition.static_hyper_parameters #=> Hash
    #   resp.training_job_definition.static_hyper_parameters["HyperParameterKey"] #=> String
    #   resp.training_job_definition.algorithm_specification.training_image #=> String
    #   resp.training_job_definition.algorithm_specification.training_input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.training_job_definition.algorithm_specification.algorithm_name #=> String
    #   resp.training_job_definition.algorithm_specification.metric_definitions #=> Array
    #   resp.training_job_definition.algorithm_specification.metric_definitions[0].name #=> String
    #   resp.training_job_definition.algorithm_specification.metric_definitions[0].regex #=> String
    #   resp.training_job_definition.role_arn #=> String
    #   resp.training_job_definition.input_data_config #=> Array
    #   resp.training_job_definition.input_data_config[0].channel_name #=> String
    #   resp.training_job_definition.input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.training_job_definition.input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.training_job_definition.input_data_config[0].data_source.s3_data_source.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.training_job_definition.input_data_config[0].data_source.s3_data_source.attribute_names #=> Array
    #   resp.training_job_definition.input_data_config[0].data_source.s3_data_source.attribute_names[0] #=> String
    #   resp.training_job_definition.input_data_config[0].data_source.file_system_data_source.file_system_id #=> String
    #   resp.training_job_definition.input_data_config[0].data_source.file_system_data_source.file_system_access_mode #=> String, one of "rw", "ro"
    #   resp.training_job_definition.input_data_config[0].data_source.file_system_data_source.file_system_type #=> String, one of "EFS", "FSxLustre"
    #   resp.training_job_definition.input_data_config[0].data_source.file_system_data_source.directory_path #=> String
    #   resp.training_job_definition.input_data_config[0].content_type #=> String
    #   resp.training_job_definition.input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.training_job_definition.input_data_config[0].record_wrapper_type #=> String, one of "None", "RecordIO"
    #   resp.training_job_definition.input_data_config[0].input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.training_job_definition.input_data_config[0].shuffle_config.seed #=> Integer
    #   resp.training_job_definition.vpc_config.security_group_ids #=> Array
    #   resp.training_job_definition.vpc_config.security_group_ids[0] #=> String
    #   resp.training_job_definition.vpc_config.subnets #=> Array
    #   resp.training_job_definition.vpc_config.subnets[0] #=> String
    #   resp.training_job_definition.output_data_config.kms_key_id #=> String
    #   resp.training_job_definition.output_data_config.s3_output_path #=> String
    #   resp.training_job_definition.resource_config.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.training_job_definition.resource_config.instance_count #=> Integer
    #   resp.training_job_definition.resource_config.volume_size_in_gb #=> Integer
    #   resp.training_job_definition.resource_config.volume_kms_key_id #=> String
    #   resp.training_job_definition.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.training_job_definition.stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.training_job_definition.enable_network_isolation #=> Boolean
    #   resp.training_job_definition.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.training_job_definition.enable_managed_spot_training #=> Boolean
    #   resp.training_job_definition.checkpoint_config.s3_uri #=> String
    #   resp.training_job_definition.checkpoint_config.local_path #=> String
    #   resp.training_job_definition.retry_strategy.maximum_retry_attempts #=> Integer
    #   resp.training_job_definitions #=> Array
    #   resp.training_job_definitions[0].definition_name #=> String
    #   resp.training_job_definitions[0].tuning_objective.type #=> String, one of "Maximize", "Minimize"
    #   resp.training_job_definitions[0].tuning_objective.metric_name #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.integer_parameter_ranges #=> Array
    #   resp.training_job_definitions[0].hyper_parameter_ranges.integer_parameter_ranges[0].name #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.integer_parameter_ranges[0].min_value #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.integer_parameter_ranges[0].max_value #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.integer_parameter_ranges[0].scaling_type #=> String, one of "Auto", "Linear", "Logarithmic", "ReverseLogarithmic"
    #   resp.training_job_definitions[0].hyper_parameter_ranges.continuous_parameter_ranges #=> Array
    #   resp.training_job_definitions[0].hyper_parameter_ranges.continuous_parameter_ranges[0].name #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.continuous_parameter_ranges[0].min_value #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.continuous_parameter_ranges[0].max_value #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.continuous_parameter_ranges[0].scaling_type #=> String, one of "Auto", "Linear", "Logarithmic", "ReverseLogarithmic"
    #   resp.training_job_definitions[0].hyper_parameter_ranges.categorical_parameter_ranges #=> Array
    #   resp.training_job_definitions[0].hyper_parameter_ranges.categorical_parameter_ranges[0].name #=> String
    #   resp.training_job_definitions[0].hyper_parameter_ranges.categorical_parameter_ranges[0].values #=> Array
    #   resp.training_job_definitions[0].hyper_parameter_ranges.categorical_parameter_ranges[0].values[0] #=> String
    #   resp.training_job_definitions[0].static_hyper_parameters #=> Hash
    #   resp.training_job_definitions[0].static_hyper_parameters["HyperParameterKey"] #=> String
    #   resp.training_job_definitions[0].algorithm_specification.training_image #=> String
    #   resp.training_job_definitions[0].algorithm_specification.training_input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.training_job_definitions[0].algorithm_specification.algorithm_name #=> String
    #   resp.training_job_definitions[0].algorithm_specification.metric_definitions #=> Array
    #   resp.training_job_definitions[0].algorithm_specification.metric_definitions[0].name #=> String
    #   resp.training_job_definitions[0].algorithm_specification.metric_definitions[0].regex #=> String
    #   resp.training_job_definitions[0].role_arn #=> String
    #   resp.training_job_definitions[0].input_data_config #=> Array
    #   resp.training_job_definitions[0].input_data_config[0].channel_name #=> String
    #   resp.training_job_definitions[0].input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.training_job_definitions[0].input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.training_job_definitions[0].input_data_config[0].data_source.s3_data_source.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.training_job_definitions[0].input_data_config[0].data_source.s3_data_source.attribute_names #=> Array
    #   resp.training_job_definitions[0].input_data_config[0].data_source.s3_data_source.attribute_names[0] #=> String
    #   resp.training_job_definitions[0].input_data_config[0].data_source.file_system_data_source.file_system_id #=> String
    #   resp.training_job_definitions[0].input_data_config[0].data_source.file_system_data_source.file_system_access_mode #=> String, one of "rw", "ro"
    #   resp.training_job_definitions[0].input_data_config[0].data_source.file_system_data_source.file_system_type #=> String, one of "EFS", "FSxLustre"
    #   resp.training_job_definitions[0].input_data_config[0].data_source.file_system_data_source.directory_path #=> String
    #   resp.training_job_definitions[0].input_data_config[0].content_type #=> String
    #   resp.training_job_definitions[0].input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.training_job_definitions[0].input_data_config[0].record_wrapper_type #=> String, one of "None", "RecordIO"
    #   resp.training_job_definitions[0].input_data_config[0].input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.training_job_definitions[0].input_data_config[0].shuffle_config.seed #=> Integer
    #   resp.training_job_definitions[0].vpc_config.security_group_ids #=> Array
    #   resp.training_job_definitions[0].vpc_config.security_group_ids[0] #=> String
    #   resp.training_job_definitions[0].vpc_config.subnets #=> Array
    #   resp.training_job_definitions[0].vpc_config.subnets[0] #=> String
    #   resp.training_job_definitions[0].output_data_config.kms_key_id #=> String
    #   resp.training_job_definitions[0].output_data_config.s3_output_path #=> String
    #   resp.training_job_definitions[0].resource_config.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.training_job_definitions[0].resource_config.instance_count #=> Integer
    #   resp.training_job_definitions[0].resource_config.volume_size_in_gb #=> Integer
    #   resp.training_job_definitions[0].resource_config.volume_kms_key_id #=> String
    #   resp.training_job_definitions[0].stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.training_job_definitions[0].stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.training_job_definitions[0].enable_network_isolation #=> Boolean
    #   resp.training_job_definitions[0].enable_inter_container_traffic_encryption #=> Boolean
    #   resp.training_job_definitions[0].enable_managed_spot_training #=> Boolean
    #   resp.training_job_definitions[0].checkpoint_config.s3_uri #=> String
    #   resp.training_job_definitions[0].checkpoint_config.local_path #=> String
    #   resp.training_job_definitions[0].retry_strategy.maximum_retry_attempts #=> Integer
    #   resp.hyper_parameter_tuning_job_status #=> String, one of "Completed", "InProgress", "Failed", "Stopped", "Stopping"
    #   resp.creation_time #=> Time
    #   resp.hyper_parameter_tuning_end_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.training_job_status_counters.completed #=> Integer
    #   resp.training_job_status_counters.in_progress #=> Integer
    #   resp.training_job_status_counters.retryable_error #=> Integer
    #   resp.training_job_status_counters.non_retryable_error #=> Integer
    #   resp.training_job_status_counters.stopped #=> Integer
    #   resp.objective_status_counters.succeeded #=> Integer
    #   resp.objective_status_counters.pending #=> Integer
    #   resp.objective_status_counters.failed #=> Integer
    #   resp.best_training_job.training_job_definition_name #=> String
    #   resp.best_training_job.training_job_name #=> String
    #   resp.best_training_job.training_job_arn #=> String
    #   resp.best_training_job.tuning_job_name #=> String
    #   resp.best_training_job.creation_time #=> Time
    #   resp.best_training_job.training_start_time #=> Time
    #   resp.best_training_job.training_end_time #=> Time
    #   resp.best_training_job.training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.best_training_job.tuned_hyper_parameters #=> Hash
    #   resp.best_training_job.tuned_hyper_parameters["HyperParameterKey"] #=> String
    #   resp.best_training_job.failure_reason #=> String
    #   resp.best_training_job.final_hyper_parameter_tuning_job_objective_metric.type #=> String, one of "Maximize", "Minimize"
    #   resp.best_training_job.final_hyper_parameter_tuning_job_objective_metric.metric_name #=> String
    #   resp.best_training_job.final_hyper_parameter_tuning_job_objective_metric.value #=> Float
    #   resp.best_training_job.objective_status #=> String, one of "Succeeded", "Pending", "Failed"
    #   resp.overall_best_training_job.training_job_definition_name #=> String
    #   resp.overall_best_training_job.training_job_name #=> String
    #   resp.overall_best_training_job.training_job_arn #=> String
    #   resp.overall_best_training_job.tuning_job_name #=> String
    #   resp.overall_best_training_job.creation_time #=> Time
    #   resp.overall_best_training_job.training_start_time #=> Time
    #   resp.overall_best_training_job.training_end_time #=> Time
    #   resp.overall_best_training_job.training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.overall_best_training_job.tuned_hyper_parameters #=> Hash
    #   resp.overall_best_training_job.tuned_hyper_parameters["HyperParameterKey"] #=> String
    #   resp.overall_best_training_job.failure_reason #=> String
    #   resp.overall_best_training_job.final_hyper_parameter_tuning_job_objective_metric.type #=> String, one of "Maximize", "Minimize"
    #   resp.overall_best_training_job.final_hyper_parameter_tuning_job_objective_metric.metric_name #=> String
    #   resp.overall_best_training_job.final_hyper_parameter_tuning_job_objective_metric.value #=> Float
    #   resp.overall_best_training_job.objective_status #=> String, one of "Succeeded", "Pending", "Failed"
    #   resp.warm_start_config.parent_hyper_parameter_tuning_jobs #=> Array
    #   resp.warm_start_config.parent_hyper_parameter_tuning_jobs[0].hyper_parameter_tuning_job_name #=> String
    #   resp.warm_start_config.warm_start_type #=> String, one of "IdenticalDataAndAlgorithm", "TransferLearning"
    #   resp.failure_reason #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeHyperParameterTuningJob AWS API Documentation
    #
    # @overload describe_hyper_parameter_tuning_job(params = {})
    # @param [Hash] params ({})
    def describe_hyper_parameter_tuning_job(params = {}, options = {})
      req = build_request(:describe_hyper_parameter_tuning_job, params)
      req.send_request(options)
    end

    # Describes a SageMaker image.
    #
    # @option params [required, String] :image_name
    #   The name of the image to describe.
    #
    # @return [Types::DescribeImageResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeImageResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeImageResponse#description #description} => String
    #   * {Types::DescribeImageResponse#display_name #display_name} => String
    #   * {Types::DescribeImageResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeImageResponse#image_arn #image_arn} => String
    #   * {Types::DescribeImageResponse#image_name #image_name} => String
    #   * {Types::DescribeImageResponse#image_status #image_status} => String
    #   * {Types::DescribeImageResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeImageResponse#role_arn #role_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_image({
    #     image_name: "ImageName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.creation_time #=> Time
    #   resp.description #=> String
    #   resp.display_name #=> String
    #   resp.failure_reason #=> String
    #   resp.image_arn #=> String
    #   resp.image_name #=> String
    #   resp.image_status #=> String, one of "CREATING", "CREATED", "CREATE_FAILED", "UPDATING", "UPDATE_FAILED", "DELETING", "DELETE_FAILED"
    #   resp.last_modified_time #=> Time
    #   resp.role_arn #=> String
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * image_created
    #   * image_deleted
    #   * image_updated
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeImage AWS API Documentation
    #
    # @overload describe_image(params = {})
    # @param [Hash] params ({})
    def describe_image(params = {}, options = {})
      req = build_request(:describe_image, params)
      req.send_request(options)
    end

    # Describes a version of a SageMaker image.
    #
    # @option params [required, String] :image_name
    #   The name of the image.
    #
    # @option params [Integer] :version
    #   The version of the image. If not specified, the latest version is
    #   described.
    #
    # @return [Types::DescribeImageVersionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeImageVersionResponse#base_image #base_image} => String
    #   * {Types::DescribeImageVersionResponse#container_image #container_image} => String
    #   * {Types::DescribeImageVersionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeImageVersionResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeImageVersionResponse#image_arn #image_arn} => String
    #   * {Types::DescribeImageVersionResponse#image_version_arn #image_version_arn} => String
    #   * {Types::DescribeImageVersionResponse#image_version_status #image_version_status} => String
    #   * {Types::DescribeImageVersionResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeImageVersionResponse#version #version} => Integer
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_image_version({
    #     image_name: "ImageName", # required
    #     version: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.base_image #=> String
    #   resp.container_image #=> String
    #   resp.creation_time #=> Time
    #   resp.failure_reason #=> String
    #   resp.image_arn #=> String
    #   resp.image_version_arn #=> String
    #   resp.image_version_status #=> String, one of "CREATING", "CREATED", "CREATE_FAILED", "DELETING", "DELETE_FAILED"
    #   resp.last_modified_time #=> Time
    #   resp.version #=> Integer
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * image_version_created
    #   * image_version_deleted
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeImageVersion AWS API Documentation
    #
    # @overload describe_image_version(params = {})
    # @param [Hash] params ({})
    def describe_image_version(params = {}, options = {})
      req = build_request(:describe_image_version, params)
      req.send_request(options)
    end

    # Gets information about a labeling job.
    #
    # @option params [required, String] :labeling_job_name
    #   The name of the labeling job to return information for.
    #
    # @return [Types::DescribeLabelingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeLabelingJobResponse#labeling_job_status #labeling_job_status} => String
    #   * {Types::DescribeLabelingJobResponse#label_counters #label_counters} => Types::LabelCounters
    #   * {Types::DescribeLabelingJobResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeLabelingJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeLabelingJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeLabelingJobResponse#job_reference_code #job_reference_code} => String
    #   * {Types::DescribeLabelingJobResponse#labeling_job_name #labeling_job_name} => String
    #   * {Types::DescribeLabelingJobResponse#labeling_job_arn #labeling_job_arn} => String
    #   * {Types::DescribeLabelingJobResponse#label_attribute_name #label_attribute_name} => String
    #   * {Types::DescribeLabelingJobResponse#input_config #input_config} => Types::LabelingJobInputConfig
    #   * {Types::DescribeLabelingJobResponse#output_config #output_config} => Types::LabelingJobOutputConfig
    #   * {Types::DescribeLabelingJobResponse#role_arn #role_arn} => String
    #   * {Types::DescribeLabelingJobResponse#label_category_config_s3_uri #label_category_config_s3_uri} => String
    #   * {Types::DescribeLabelingJobResponse#stopping_conditions #stopping_conditions} => Types::LabelingJobStoppingConditions
    #   * {Types::DescribeLabelingJobResponse#labeling_job_algorithms_config #labeling_job_algorithms_config} => Types::LabelingJobAlgorithmsConfig
    #   * {Types::DescribeLabelingJobResponse#human_task_config #human_task_config} => Types::HumanTaskConfig
    #   * {Types::DescribeLabelingJobResponse#tags #tags} => Array&lt;Types::Tag&gt;
    #   * {Types::DescribeLabelingJobResponse#labeling_job_output #labeling_job_output} => Types::LabelingJobOutput
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_labeling_job({
    #     labeling_job_name: "LabelingJobName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.labeling_job_status #=> String, one of "Initializing", "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.label_counters.total_labeled #=> Integer
    #   resp.label_counters.human_labeled #=> Integer
    #   resp.label_counters.machine_labeled #=> Integer
    #   resp.label_counters.failed_non_retryable_error #=> Integer
    #   resp.label_counters.unlabeled #=> Integer
    #   resp.failure_reason #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.job_reference_code #=> String
    #   resp.labeling_job_name #=> String
    #   resp.labeling_job_arn #=> String
    #   resp.label_attribute_name #=> String
    #   resp.input_config.data_source.s3_data_source.manifest_s3_uri #=> String
    #   resp.input_config.data_source.sns_data_source.sns_topic_arn #=> String
    #   resp.input_config.data_attributes.content_classifiers #=> Array
    #   resp.input_config.data_attributes.content_classifiers[0] #=> String, one of "FreeOfPersonallyIdentifiableInformation", "FreeOfAdultContent"
    #   resp.output_config.s3_output_path #=> String
    #   resp.output_config.kms_key_id #=> String
    #   resp.output_config.sns_topic_arn #=> String
    #   resp.role_arn #=> String
    #   resp.label_category_config_s3_uri #=> String
    #   resp.stopping_conditions.max_human_labeled_object_count #=> Integer
    #   resp.stopping_conditions.max_percentage_of_input_dataset_labeled #=> Integer
    #   resp.labeling_job_algorithms_config.labeling_job_algorithm_specification_arn #=> String
    #   resp.labeling_job_algorithms_config.initial_active_learning_model_arn #=> String
    #   resp.labeling_job_algorithms_config.labeling_job_resource_config.volume_kms_key_id #=> String
    #   resp.human_task_config.workteam_arn #=> String
    #   resp.human_task_config.ui_config.ui_template_s3_uri #=> String
    #   resp.human_task_config.ui_config.human_task_ui_arn #=> String
    #   resp.human_task_config.pre_human_task_lambda_arn #=> String
    #   resp.human_task_config.task_keywords #=> Array
    #   resp.human_task_config.task_keywords[0] #=> String
    #   resp.human_task_config.task_title #=> String
    #   resp.human_task_config.task_description #=> String
    #   resp.human_task_config.number_of_human_workers_per_data_object #=> Integer
    #   resp.human_task_config.task_time_limit_in_seconds #=> Integer
    #   resp.human_task_config.task_availability_lifetime_in_seconds #=> Integer
    #   resp.human_task_config.max_concurrent_task_count #=> Integer
    #   resp.human_task_config.annotation_consolidation_config.annotation_consolidation_lambda_arn #=> String
    #   resp.human_task_config.public_workforce_task_price.amount_in_usd.dollars #=> Integer
    #   resp.human_task_config.public_workforce_task_price.amount_in_usd.cents #=> Integer
    #   resp.human_task_config.public_workforce_task_price.amount_in_usd.tenth_fractions_of_a_cent #=> Integer
    #   resp.tags #=> Array
    #   resp.tags[0].key #=> String
    #   resp.tags[0].value #=> String
    #   resp.labeling_job_output.output_dataset_s3_uri #=> String
    #   resp.labeling_job_output.final_active_learning_model_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeLabelingJob AWS API Documentation
    #
    # @overload describe_labeling_job(params = {})
    # @param [Hash] params ({})
    def describe_labeling_job(params = {}, options = {})
      req = build_request(:describe_labeling_job, params)
      req.send_request(options)
    end

    # Describes a model that you created using the `CreateModel` API.
    #
    # @option params [required, String] :model_name
    #   The name of the model.
    #
    # @return [Types::DescribeModelOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeModelOutput#model_name #model_name} => String
    #   * {Types::DescribeModelOutput#primary_container #primary_container} => Types::ContainerDefinition
    #   * {Types::DescribeModelOutput#containers #containers} => Array&lt;Types::ContainerDefinition&gt;
    #   * {Types::DescribeModelOutput#inference_execution_config #inference_execution_config} => Types::InferenceExecutionConfig
    #   * {Types::DescribeModelOutput#execution_role_arn #execution_role_arn} => String
    #   * {Types::DescribeModelOutput#vpc_config #vpc_config} => Types::VpcConfig
    #   * {Types::DescribeModelOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeModelOutput#model_arn #model_arn} => String
    #   * {Types::DescribeModelOutput#enable_network_isolation #enable_network_isolation} => Boolean
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_model({
    #     model_name: "ModelName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.model_name #=> String
    #   resp.primary_container.container_hostname #=> String
    #   resp.primary_container.image #=> String
    #   resp.primary_container.image_config.repository_access_mode #=> String, one of "Platform", "Vpc"
    #   resp.primary_container.image_config.repository_auth_config.repository_credentials_provider_arn #=> String
    #   resp.primary_container.mode #=> String, one of "SingleModel", "MultiModel"
    #   resp.primary_container.model_data_url #=> String
    #   resp.primary_container.environment #=> Hash
    #   resp.primary_container.environment["EnvironmentKey"] #=> String
    #   resp.primary_container.model_package_name #=> String
    #   resp.primary_container.multi_model_config.model_cache_setting #=> String, one of "Enabled", "Disabled"
    #   resp.containers #=> Array
    #   resp.containers[0].container_hostname #=> String
    #   resp.containers[0].image #=> String
    #   resp.containers[0].image_config.repository_access_mode #=> String, one of "Platform", "Vpc"
    #   resp.containers[0].image_config.repository_auth_config.repository_credentials_provider_arn #=> String
    #   resp.containers[0].mode #=> String, one of "SingleModel", "MultiModel"
    #   resp.containers[0].model_data_url #=> String
    #   resp.containers[0].environment #=> Hash
    #   resp.containers[0].environment["EnvironmentKey"] #=> String
    #   resp.containers[0].model_package_name #=> String
    #   resp.containers[0].multi_model_config.model_cache_setting #=> String, one of "Enabled", "Disabled"
    #   resp.inference_execution_config.mode #=> String, one of "Serial", "Direct"
    #   resp.execution_role_arn #=> String
    #   resp.vpc_config.security_group_ids #=> Array
    #   resp.vpc_config.security_group_ids[0] #=> String
    #   resp.vpc_config.subnets #=> Array
    #   resp.vpc_config.subnets[0] #=> String
    #   resp.creation_time #=> Time
    #   resp.model_arn #=> String
    #   resp.enable_network_isolation #=> Boolean
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeModel AWS API Documentation
    #
    # @overload describe_model(params = {})
    # @param [Hash] params ({})
    def describe_model(params = {}, options = {})
      req = build_request(:describe_model, params)
      req.send_request(options)
    end

    # Returns a description of a model bias job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model bias job definition. The name must be unique
    #   within an Amazon Web Services Region in the Amazon Web Services
    #   account.
    #
    # @return [Types::DescribeModelBiasJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeModelBiasJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #   * {Types::DescribeModelBiasJobDefinitionResponse#job_definition_name #job_definition_name} => String
    #   * {Types::DescribeModelBiasJobDefinitionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeModelBiasJobDefinitionResponse#model_bias_baseline_config #model_bias_baseline_config} => Types::ModelBiasBaselineConfig
    #   * {Types::DescribeModelBiasJobDefinitionResponse#model_bias_app_specification #model_bias_app_specification} => Types::ModelBiasAppSpecification
    #   * {Types::DescribeModelBiasJobDefinitionResponse#model_bias_job_input #model_bias_job_input} => Types::ModelBiasJobInput
    #   * {Types::DescribeModelBiasJobDefinitionResponse#model_bias_job_output_config #model_bias_job_output_config} => Types::MonitoringOutputConfig
    #   * {Types::DescribeModelBiasJobDefinitionResponse#job_resources #job_resources} => Types::MonitoringResources
    #   * {Types::DescribeModelBiasJobDefinitionResponse#network_config #network_config} => Types::MonitoringNetworkConfig
    #   * {Types::DescribeModelBiasJobDefinitionResponse#role_arn #role_arn} => String
    #   * {Types::DescribeModelBiasJobDefinitionResponse#stopping_condition #stopping_condition} => Types::MonitoringStoppingCondition
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_model_bias_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #   resp.job_definition_name #=> String
    #   resp.creation_time #=> Time
    #   resp.model_bias_baseline_config.baselining_job_name #=> String
    #   resp.model_bias_baseline_config.constraints_resource.s3_uri #=> String
    #   resp.model_bias_app_specification.image_uri #=> String
    #   resp.model_bias_app_specification.config_uri #=> String
    #   resp.model_bias_app_specification.environment #=> Hash
    #   resp.model_bias_app_specification.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.model_bias_job_input.endpoint_input.endpoint_name #=> String
    #   resp.model_bias_job_input.endpoint_input.local_path #=> String
    #   resp.model_bias_job_input.endpoint_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.model_bias_job_input.endpoint_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.model_bias_job_input.endpoint_input.features_attribute #=> String
    #   resp.model_bias_job_input.endpoint_input.inference_attribute #=> String
    #   resp.model_bias_job_input.endpoint_input.probability_attribute #=> String
    #   resp.model_bias_job_input.endpoint_input.probability_threshold_attribute #=> Float
    #   resp.model_bias_job_input.endpoint_input.start_time_offset #=> String
    #   resp.model_bias_job_input.endpoint_input.end_time_offset #=> String
    #   resp.model_bias_job_input.ground_truth_s3_input.s3_uri #=> String
    #   resp.model_bias_job_output_config.monitoring_outputs #=> Array
    #   resp.model_bias_job_output_config.monitoring_outputs[0].s3_output.s3_uri #=> String
    #   resp.model_bias_job_output_config.monitoring_outputs[0].s3_output.local_path #=> String
    #   resp.model_bias_job_output_config.monitoring_outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.model_bias_job_output_config.kms_key_id #=> String
    #   resp.job_resources.cluster_config.instance_count #=> Integer
    #   resp.job_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.job_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.job_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.network_config.enable_network_isolation #=> Boolean
    #   resp.network_config.vpc_config.security_group_ids #=> Array
    #   resp.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.network_config.vpc_config.subnets #=> Array
    #   resp.network_config.vpc_config.subnets[0] #=> String
    #   resp.role_arn #=> String
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeModelBiasJobDefinition AWS API Documentation
    #
    # @overload describe_model_bias_job_definition(params = {})
    # @param [Hash] params ({})
    def describe_model_bias_job_definition(params = {}, options = {})
      req = build_request(:describe_model_bias_job_definition, params)
      req.send_request(options)
    end

    # Returns a description of a model explainability job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model explainability job definition. The name must be
    #   unique within an Amazon Web Services Region in the Amazon Web Services
    #   account.
    #
    # @return [Types::DescribeModelExplainabilityJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#job_definition_name #job_definition_name} => String
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#model_explainability_baseline_config #model_explainability_baseline_config} => Types::ModelExplainabilityBaselineConfig
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#model_explainability_app_specification #model_explainability_app_specification} => Types::ModelExplainabilityAppSpecification
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#model_explainability_job_input #model_explainability_job_input} => Types::ModelExplainabilityJobInput
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#model_explainability_job_output_config #model_explainability_job_output_config} => Types::MonitoringOutputConfig
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#job_resources #job_resources} => Types::MonitoringResources
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#network_config #network_config} => Types::MonitoringNetworkConfig
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#role_arn #role_arn} => String
    #   * {Types::DescribeModelExplainabilityJobDefinitionResponse#stopping_condition #stopping_condition} => Types::MonitoringStoppingCondition
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_model_explainability_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #   resp.job_definition_name #=> String
    #   resp.creation_time #=> Time
    #   resp.model_explainability_baseline_config.baselining_job_name #=> String
    #   resp.model_explainability_baseline_config.constraints_resource.s3_uri #=> String
    #   resp.model_explainability_app_specification.image_uri #=> String
    #   resp.model_explainability_app_specification.config_uri #=> String
    #   resp.model_explainability_app_specification.environment #=> Hash
    #   resp.model_explainability_app_specification.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.model_explainability_job_input.endpoint_input.endpoint_name #=> String
    #   resp.model_explainability_job_input.endpoint_input.local_path #=> String
    #   resp.model_explainability_job_input.endpoint_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.model_explainability_job_input.endpoint_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.model_explainability_job_input.endpoint_input.features_attribute #=> String
    #   resp.model_explainability_job_input.endpoint_input.inference_attribute #=> String
    #   resp.model_explainability_job_input.endpoint_input.probability_attribute #=> String
    #   resp.model_explainability_job_input.endpoint_input.probability_threshold_attribute #=> Float
    #   resp.model_explainability_job_input.endpoint_input.start_time_offset #=> String
    #   resp.model_explainability_job_input.endpoint_input.end_time_offset #=> String
    #   resp.model_explainability_job_output_config.monitoring_outputs #=> Array
    #   resp.model_explainability_job_output_config.monitoring_outputs[0].s3_output.s3_uri #=> String
    #   resp.model_explainability_job_output_config.monitoring_outputs[0].s3_output.local_path #=> String
    #   resp.model_explainability_job_output_config.monitoring_outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.model_explainability_job_output_config.kms_key_id #=> String
    #   resp.job_resources.cluster_config.instance_count #=> Integer
    #   resp.job_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.job_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.job_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.network_config.enable_network_isolation #=> Boolean
    #   resp.network_config.vpc_config.security_group_ids #=> Array
    #   resp.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.network_config.vpc_config.subnets #=> Array
    #   resp.network_config.vpc_config.subnets[0] #=> String
    #   resp.role_arn #=> String
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeModelExplainabilityJobDefinition AWS API Documentation
    #
    # @overload describe_model_explainability_job_definition(params = {})
    # @param [Hash] params ({})
    def describe_model_explainability_job_definition(params = {}, options = {})
      req = build_request(:describe_model_explainability_job_definition, params)
      req.send_request(options)
    end

    # Returns a description of the specified model package, which is used to
    # create Amazon SageMaker models or list them on Amazon Web Services
    # Marketplace.
    #
    # To create models in Amazon SageMaker, buyers can subscribe to model
    # packages listed on Amazon Web Services Marketplace.
    #
    # @option params [required, String] :model_package_name
    #   The name or Amazon Resource Name (ARN) of the model package to
    #   describe.
    #
    #   When you specify a name, the name must have 1 to 63 characters. Valid
    #   characters are a-z, A-Z, 0-9, and - (hyphen).
    #
    # @return [Types::DescribeModelPackageOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeModelPackageOutput#model_package_name #model_package_name} => String
    #   * {Types::DescribeModelPackageOutput#model_package_group_name #model_package_group_name} => String
    #   * {Types::DescribeModelPackageOutput#model_package_version #model_package_version} => Integer
    #   * {Types::DescribeModelPackageOutput#model_package_arn #model_package_arn} => String
    #   * {Types::DescribeModelPackageOutput#model_package_description #model_package_description} => String
    #   * {Types::DescribeModelPackageOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeModelPackageOutput#inference_specification #inference_specification} => Types::InferenceSpecification
    #   * {Types::DescribeModelPackageOutput#source_algorithm_specification #source_algorithm_specification} => Types::SourceAlgorithmSpecification
    #   * {Types::DescribeModelPackageOutput#validation_specification #validation_specification} => Types::ModelPackageValidationSpecification
    #   * {Types::DescribeModelPackageOutput#model_package_status #model_package_status} => String
    #   * {Types::DescribeModelPackageOutput#model_package_status_details #model_package_status_details} => Types::ModelPackageStatusDetails
    #   * {Types::DescribeModelPackageOutput#certify_for_marketplace #certify_for_marketplace} => Boolean
    #   * {Types::DescribeModelPackageOutput#model_approval_status #model_approval_status} => String
    #   * {Types::DescribeModelPackageOutput#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeModelPackageOutput#metadata_properties #metadata_properties} => Types::MetadataProperties
    #   * {Types::DescribeModelPackageOutput#model_metrics #model_metrics} => Types::ModelMetrics
    #   * {Types::DescribeModelPackageOutput#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeModelPackageOutput#last_modified_by #last_modified_by} => Types::UserContext
    #   * {Types::DescribeModelPackageOutput#approval_description #approval_description} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_model_package({
    #     model_package_name: "VersionedArnOrName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_name #=> String
    #   resp.model_package_group_name #=> String
    #   resp.model_package_version #=> Integer
    #   resp.model_package_arn #=> String
    #   resp.model_package_description #=> String
    #   resp.creation_time #=> Time
    #   resp.inference_specification.containers #=> Array
    #   resp.inference_specification.containers[0].container_hostname #=> String
    #   resp.inference_specification.containers[0].image #=> String
    #   resp.inference_specification.containers[0].image_digest #=> String
    #   resp.inference_specification.containers[0].model_data_url #=> String
    #   resp.inference_specification.containers[0].product_id #=> String
    #   resp.inference_specification.containers[0].environment #=> Hash
    #   resp.inference_specification.containers[0].environment["EnvironmentKey"] #=> String
    #   resp.inference_specification.supported_transform_instance_types #=> Array
    #   resp.inference_specification.supported_transform_instance_types[0] #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.inference_specification.supported_realtime_inference_instance_types #=> Array
    #   resp.inference_specification.supported_realtime_inference_instance_types[0] #=> String, one of "ml.t2.medium", "ml.t2.large", "ml.t2.xlarge", "ml.t2.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.12xlarge", "ml.m5d.24xlarge", "ml.c4.large", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5d.large", "ml.c5d.xlarge", "ml.c5d.2xlarge", "ml.c5d.4xlarge", "ml.c5d.9xlarge", "ml.c5d.18xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.12xlarge", "ml.r5.24xlarge", "ml.r5d.large", "ml.r5d.xlarge", "ml.r5d.2xlarge", "ml.r5d.4xlarge", "ml.r5d.12xlarge", "ml.r5d.24xlarge", "ml.inf1.xlarge", "ml.inf1.2xlarge", "ml.inf1.6xlarge", "ml.inf1.24xlarge"
    #   resp.inference_specification.supported_content_types #=> Array
    #   resp.inference_specification.supported_content_types[0] #=> String
    #   resp.inference_specification.supported_response_mime_types #=> Array
    #   resp.inference_specification.supported_response_mime_types[0] #=> String
    #   resp.source_algorithm_specification.source_algorithms #=> Array
    #   resp.source_algorithm_specification.source_algorithms[0].model_data_url #=> String
    #   resp.source_algorithm_specification.source_algorithms[0].algorithm_name #=> String
    #   resp.validation_specification.validation_role #=> String
    #   resp.validation_specification.validation_profiles #=> Array
    #   resp.validation_specification.validation_profiles[0].profile_name #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.max_concurrent_transforms #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.max_payload_in_mb #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.batch_strategy #=> String, one of "MultiRecord", "SingleRecord"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.environment #=> Hash
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.environment["TransformEnvironmentKey"] #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.data_source.s3_data_source.s3_uri #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.content_type #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.compression_type #=> String, one of "None", "Gzip"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_input.split_type #=> String, one of "None", "Line", "RecordIO", "TFRecord"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.s3_output_path #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.accept #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.assemble_with #=> String, one of "None", "Line"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_output.kms_key_id #=> String
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.instance_count #=> Integer
    #   resp.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.volume_kms_key_id #=> String
    #   resp.model_package_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting"
    #   resp.model_package_status_details.validation_statuses #=> Array
    #   resp.model_package_status_details.validation_statuses[0].name #=> String
    #   resp.model_package_status_details.validation_statuses[0].status #=> String, one of "NotStarted", "InProgress", "Completed", "Failed"
    #   resp.model_package_status_details.validation_statuses[0].failure_reason #=> String
    #   resp.model_package_status_details.image_scan_statuses #=> Array
    #   resp.model_package_status_details.image_scan_statuses[0].name #=> String
    #   resp.model_package_status_details.image_scan_statuses[0].status #=> String, one of "NotStarted", "InProgress", "Completed", "Failed"
    #   resp.model_package_status_details.image_scan_statuses[0].failure_reason #=> String
    #   resp.certify_for_marketplace #=> Boolean
    #   resp.model_approval_status #=> String, one of "Approved", "Rejected", "PendingManualApproval"
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.metadata_properties.commit_id #=> String
    #   resp.metadata_properties.repository #=> String
    #   resp.metadata_properties.generated_by #=> String
    #   resp.metadata_properties.project_id #=> String
    #   resp.model_metrics.model_quality.statistics.content_type #=> String
    #   resp.model_metrics.model_quality.statistics.content_digest #=> String
    #   resp.model_metrics.model_quality.statistics.s3_uri #=> String
    #   resp.model_metrics.model_quality.constraints.content_type #=> String
    #   resp.model_metrics.model_quality.constraints.content_digest #=> String
    #   resp.model_metrics.model_quality.constraints.s3_uri #=> String
    #   resp.model_metrics.model_data_quality.statistics.content_type #=> String
    #   resp.model_metrics.model_data_quality.statistics.content_digest #=> String
    #   resp.model_metrics.model_data_quality.statistics.s3_uri #=> String
    #   resp.model_metrics.model_data_quality.constraints.content_type #=> String
    #   resp.model_metrics.model_data_quality.constraints.content_digest #=> String
    #   resp.model_metrics.model_data_quality.constraints.s3_uri #=> String
    #   resp.model_metrics.bias.report.content_type #=> String
    #   resp.model_metrics.bias.report.content_digest #=> String
    #   resp.model_metrics.bias.report.s3_uri #=> String
    #   resp.model_metrics.explainability.report.content_type #=> String
    #   resp.model_metrics.explainability.report.content_digest #=> String
    #   resp.model_metrics.explainability.report.s3_uri #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #   resp.approval_description #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeModelPackage AWS API Documentation
    #
    # @overload describe_model_package(params = {})
    # @param [Hash] params ({})
    def describe_model_package(params = {}, options = {})
      req = build_request(:describe_model_package, params)
      req.send_request(options)
    end

    # Gets a description for the specified model group.
    #
    # @option params [required, String] :model_package_group_name
    #   The name of the model group to describe.
    #
    # @return [Types::DescribeModelPackageGroupOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeModelPackageGroupOutput#model_package_group_name #model_package_group_name} => String
    #   * {Types::DescribeModelPackageGroupOutput#model_package_group_arn #model_package_group_arn} => String
    #   * {Types::DescribeModelPackageGroupOutput#model_package_group_description #model_package_group_description} => String
    #   * {Types::DescribeModelPackageGroupOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeModelPackageGroupOutput#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeModelPackageGroupOutput#model_package_group_status #model_package_group_status} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_model_package_group({
    #     model_package_group_name: "ArnOrName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_group_name #=> String
    #   resp.model_package_group_arn #=> String
    #   resp.model_package_group_description #=> String
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.model_package_group_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting", "DeleteFailed"
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeModelPackageGroup AWS API Documentation
    #
    # @overload describe_model_package_group(params = {})
    # @param [Hash] params ({})
    def describe_model_package_group(params = {}, options = {})
      req = build_request(:describe_model_package_group, params)
      req.send_request(options)
    end

    # Returns a description of a model quality job definition.
    #
    # @option params [required, String] :job_definition_name
    #   The name of the model quality job. The name must be unique within an
    #   Amazon Web Services Region in the Amazon Web Services account.
    #
    # @return [Types::DescribeModelQualityJobDefinitionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeModelQualityJobDefinitionResponse#job_definition_arn #job_definition_arn} => String
    #   * {Types::DescribeModelQualityJobDefinitionResponse#job_definition_name #job_definition_name} => String
    #   * {Types::DescribeModelQualityJobDefinitionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeModelQualityJobDefinitionResponse#model_quality_baseline_config #model_quality_baseline_config} => Types::ModelQualityBaselineConfig
    #   * {Types::DescribeModelQualityJobDefinitionResponse#model_quality_app_specification #model_quality_app_specification} => Types::ModelQualityAppSpecification
    #   * {Types::DescribeModelQualityJobDefinitionResponse#model_quality_job_input #model_quality_job_input} => Types::ModelQualityJobInput
    #   * {Types::DescribeModelQualityJobDefinitionResponse#model_quality_job_output_config #model_quality_job_output_config} => Types::MonitoringOutputConfig
    #   * {Types::DescribeModelQualityJobDefinitionResponse#job_resources #job_resources} => Types::MonitoringResources
    #   * {Types::DescribeModelQualityJobDefinitionResponse#network_config #network_config} => Types::MonitoringNetworkConfig
    #   * {Types::DescribeModelQualityJobDefinitionResponse#role_arn #role_arn} => String
    #   * {Types::DescribeModelQualityJobDefinitionResponse#stopping_condition #stopping_condition} => Types::MonitoringStoppingCondition
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_model_quality_job_definition({
    #     job_definition_name: "MonitoringJobDefinitionName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_arn #=> String
    #   resp.job_definition_name #=> String
    #   resp.creation_time #=> Time
    #   resp.model_quality_baseline_config.baselining_job_name #=> String
    #   resp.model_quality_baseline_config.constraints_resource.s3_uri #=> String
    #   resp.model_quality_app_specification.image_uri #=> String
    #   resp.model_quality_app_specification.container_entrypoint #=> Array
    #   resp.model_quality_app_specification.container_entrypoint[0] #=> String
    #   resp.model_quality_app_specification.container_arguments #=> Array
    #   resp.model_quality_app_specification.container_arguments[0] #=> String
    #   resp.model_quality_app_specification.record_preprocessor_source_uri #=> String
    #   resp.model_quality_app_specification.post_analytics_processor_source_uri #=> String
    #   resp.model_quality_app_specification.problem_type #=> String, one of "BinaryClassification", "MulticlassClassification", "Regression"
    #   resp.model_quality_app_specification.environment #=> Hash
    #   resp.model_quality_app_specification.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.model_quality_job_input.endpoint_input.endpoint_name #=> String
    #   resp.model_quality_job_input.endpoint_input.local_path #=> String
    #   resp.model_quality_job_input.endpoint_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.model_quality_job_input.endpoint_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.model_quality_job_input.endpoint_input.features_attribute #=> String
    #   resp.model_quality_job_input.endpoint_input.inference_attribute #=> String
    #   resp.model_quality_job_input.endpoint_input.probability_attribute #=> String
    #   resp.model_quality_job_input.endpoint_input.probability_threshold_attribute #=> Float
    #   resp.model_quality_job_input.endpoint_input.start_time_offset #=> String
    #   resp.model_quality_job_input.endpoint_input.end_time_offset #=> String
    #   resp.model_quality_job_input.ground_truth_s3_input.s3_uri #=> String
    #   resp.model_quality_job_output_config.monitoring_outputs #=> Array
    #   resp.model_quality_job_output_config.monitoring_outputs[0].s3_output.s3_uri #=> String
    #   resp.model_quality_job_output_config.monitoring_outputs[0].s3_output.local_path #=> String
    #   resp.model_quality_job_output_config.monitoring_outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.model_quality_job_output_config.kms_key_id #=> String
    #   resp.job_resources.cluster_config.instance_count #=> Integer
    #   resp.job_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.job_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.job_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.network_config.enable_network_isolation #=> Boolean
    #   resp.network_config.vpc_config.security_group_ids #=> Array
    #   resp.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.network_config.vpc_config.subnets #=> Array
    #   resp.network_config.vpc_config.subnets[0] #=> String
    #   resp.role_arn #=> String
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeModelQualityJobDefinition AWS API Documentation
    #
    # @overload describe_model_quality_job_definition(params = {})
    # @param [Hash] params ({})
    def describe_model_quality_job_definition(params = {}, options = {})
      req = build_request(:describe_model_quality_job_definition, params)
      req.send_request(options)
    end

    # Describes the schedule for a monitoring job.
    #
    # @option params [required, String] :monitoring_schedule_name
    #   Name of a previously created monitoring schedule.
    #
    # @return [Types::DescribeMonitoringScheduleResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeMonitoringScheduleResponse#monitoring_schedule_arn #monitoring_schedule_arn} => String
    #   * {Types::DescribeMonitoringScheduleResponse#monitoring_schedule_name #monitoring_schedule_name} => String
    #   * {Types::DescribeMonitoringScheduleResponse#monitoring_schedule_status #monitoring_schedule_status} => String
    #   * {Types::DescribeMonitoringScheduleResponse#monitoring_type #monitoring_type} => String
    #   * {Types::DescribeMonitoringScheduleResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeMonitoringScheduleResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeMonitoringScheduleResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeMonitoringScheduleResponse#monitoring_schedule_config #monitoring_schedule_config} => Types::MonitoringScheduleConfig
    #   * {Types::DescribeMonitoringScheduleResponse#endpoint_name #endpoint_name} => String
    #   * {Types::DescribeMonitoringScheduleResponse#last_monitoring_execution_summary #last_monitoring_execution_summary} => Types::MonitoringExecutionSummary
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_monitoring_schedule({
    #     monitoring_schedule_name: "MonitoringScheduleName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.monitoring_schedule_arn #=> String
    #   resp.monitoring_schedule_name #=> String
    #   resp.monitoring_schedule_status #=> String, one of "Pending", "Failed", "Scheduled", "Stopped"
    #   resp.monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.failure_reason #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.monitoring_schedule_config.schedule_config.schedule_expression #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.baseline_config.baselining_job_name #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.baseline_config.constraints_resource.s3_uri #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.baseline_config.statistics_resource.s3_uri #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs #=> Array
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.endpoint_name #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.local_path #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.features_attribute #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.inference_attribute #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.probability_attribute #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.probability_threshold_attribute #=> Float
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.start_time_offset #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.end_time_offset #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs #=> Array
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs[0].s3_output.s3_uri #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs[0].s3_output.local_path #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.kms_key_id #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.instance_count #=> Integer
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.image_uri #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_entrypoint #=> Array
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_entrypoint[0] #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_arguments #=> Array
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_arguments[0] #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.record_preprocessor_source_uri #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.post_analytics_processor_source_uri #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.monitoring_schedule_config.monitoring_job_definition.environment #=> Hash
    #   resp.monitoring_schedule_config.monitoring_job_definition.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.monitoring_schedule_config.monitoring_job_definition.network_config.enable_network_isolation #=> Boolean
    #   resp.monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.security_group_ids #=> Array
    #   resp.monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.subnets #=> Array
    #   resp.monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.subnets[0] #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition.role_arn #=> String
    #   resp.monitoring_schedule_config.monitoring_job_definition_name #=> String
    #   resp.monitoring_schedule_config.monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.endpoint_name #=> String
    #   resp.last_monitoring_execution_summary.monitoring_schedule_name #=> String
    #   resp.last_monitoring_execution_summary.scheduled_time #=> Time
    #   resp.last_monitoring_execution_summary.creation_time #=> Time
    #   resp.last_monitoring_execution_summary.last_modified_time #=> Time
    #   resp.last_monitoring_execution_summary.monitoring_execution_status #=> String, one of "Pending", "Completed", "CompletedWithViolations", "InProgress", "Failed", "Stopping", "Stopped"
    #   resp.last_monitoring_execution_summary.processing_job_arn #=> String
    #   resp.last_monitoring_execution_summary.endpoint_name #=> String
    #   resp.last_monitoring_execution_summary.failure_reason #=> String
    #   resp.last_monitoring_execution_summary.monitoring_job_definition_name #=> String
    #   resp.last_monitoring_execution_summary.monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeMonitoringSchedule AWS API Documentation
    #
    # @overload describe_monitoring_schedule(params = {})
    # @param [Hash] params ({})
    def describe_monitoring_schedule(params = {}, options = {})
      req = build_request(:describe_monitoring_schedule, params)
      req.send_request(options)
    end

    # Returns information about a notebook instance.
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the notebook instance that you want information about.
    #
    # @return [Types::DescribeNotebookInstanceOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeNotebookInstanceOutput#notebook_instance_arn #notebook_instance_arn} => String
    #   * {Types::DescribeNotebookInstanceOutput#notebook_instance_name #notebook_instance_name} => String
    #   * {Types::DescribeNotebookInstanceOutput#notebook_instance_status #notebook_instance_status} => String
    #   * {Types::DescribeNotebookInstanceOutput#failure_reason #failure_reason} => String
    #   * {Types::DescribeNotebookInstanceOutput#url #url} => String
    #   * {Types::DescribeNotebookInstanceOutput#instance_type #instance_type} => String
    #   * {Types::DescribeNotebookInstanceOutput#subnet_id #subnet_id} => String
    #   * {Types::DescribeNotebookInstanceOutput#security_groups #security_groups} => Array&lt;String&gt;
    #   * {Types::DescribeNotebookInstanceOutput#role_arn #role_arn} => String
    #   * {Types::DescribeNotebookInstanceOutput#kms_key_id #kms_key_id} => String
    #   * {Types::DescribeNotebookInstanceOutput#network_interface_id #network_interface_id} => String
    #   * {Types::DescribeNotebookInstanceOutput#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeNotebookInstanceOutput#creation_time #creation_time} => Time
    #   * {Types::DescribeNotebookInstanceOutput#notebook_instance_lifecycle_config_name #notebook_instance_lifecycle_config_name} => String
    #   * {Types::DescribeNotebookInstanceOutput#direct_internet_access #direct_internet_access} => String
    #   * {Types::DescribeNotebookInstanceOutput#volume_size_in_gb #volume_size_in_gb} => Integer
    #   * {Types::DescribeNotebookInstanceOutput#accelerator_types #accelerator_types} => Array&lt;String&gt;
    #   * {Types::DescribeNotebookInstanceOutput#default_code_repository #default_code_repository} => String
    #   * {Types::DescribeNotebookInstanceOutput#additional_code_repositories #additional_code_repositories} => Array&lt;String&gt;
    #   * {Types::DescribeNotebookInstanceOutput#root_access #root_access} => String
    #   * {Types::DescribeNotebookInstanceOutput#platform_identifier #platform_identifier} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_notebook_instance({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.notebook_instance_arn #=> String
    #   resp.notebook_instance_name #=> String
    #   resp.notebook_instance_status #=> String, one of "Pending", "InService", "Stopping", "Stopped", "Failed", "Deleting", "Updating"
    #   resp.failure_reason #=> String
    #   resp.url #=> String
    #   resp.instance_type #=> String, one of "ml.t2.medium", "ml.t2.large", "ml.t2.xlarge", "ml.t2.2xlarge", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5d.xlarge", "ml.c5d.2xlarge", "ml.c5d.4xlarge", "ml.c5d.9xlarge", "ml.c5d.18xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.subnet_id #=> String
    #   resp.security_groups #=> Array
    #   resp.security_groups[0] #=> String
    #   resp.role_arn #=> String
    #   resp.kms_key_id #=> String
    #   resp.network_interface_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.creation_time #=> Time
    #   resp.notebook_instance_lifecycle_config_name #=> String
    #   resp.direct_internet_access #=> String, one of "Enabled", "Disabled"
    #   resp.volume_size_in_gb #=> Integer
    #   resp.accelerator_types #=> Array
    #   resp.accelerator_types[0] #=> String, one of "ml.eia1.medium", "ml.eia1.large", "ml.eia1.xlarge", "ml.eia2.medium", "ml.eia2.large", "ml.eia2.xlarge"
    #   resp.default_code_repository #=> String
    #   resp.additional_code_repositories #=> Array
    #   resp.additional_code_repositories[0] #=> String
    #   resp.root_access #=> String, one of "Enabled", "Disabled"
    #   resp.platform_identifier #=> String
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * notebook_instance_deleted
    #   * notebook_instance_in_service
    #   * notebook_instance_stopped
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeNotebookInstance AWS API Documentation
    #
    # @overload describe_notebook_instance(params = {})
    # @param [Hash] params ({})
    def describe_notebook_instance(params = {}, options = {})
      req = build_request(:describe_notebook_instance, params)
      req.send_request(options)
    end

    # Returns a description of a notebook instance lifecycle configuration.
    #
    # For information about notebook instance lifestyle configurations, see
    # [Step 2.1: (Optional) Customize a Notebook Instance][1].
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html
    #
    # @option params [required, String] :notebook_instance_lifecycle_config_name
    #   The name of the lifecycle configuration to describe.
    #
    # @return [Types::DescribeNotebookInstanceLifecycleConfigOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeNotebookInstanceLifecycleConfigOutput#notebook_instance_lifecycle_config_arn #notebook_instance_lifecycle_config_arn} => String
    #   * {Types::DescribeNotebookInstanceLifecycleConfigOutput#notebook_instance_lifecycle_config_name #notebook_instance_lifecycle_config_name} => String
    #   * {Types::DescribeNotebookInstanceLifecycleConfigOutput#on_create #on_create} => Array&lt;Types::NotebookInstanceLifecycleHook&gt;
    #   * {Types::DescribeNotebookInstanceLifecycleConfigOutput#on_start #on_start} => Array&lt;Types::NotebookInstanceLifecycleHook&gt;
    #   * {Types::DescribeNotebookInstanceLifecycleConfigOutput#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeNotebookInstanceLifecycleConfigOutput#creation_time #creation_time} => Time
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_notebook_instance_lifecycle_config({
    #     notebook_instance_lifecycle_config_name: "NotebookInstanceLifecycleConfigName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.notebook_instance_lifecycle_config_arn #=> String
    #   resp.notebook_instance_lifecycle_config_name #=> String
    #   resp.on_create #=> Array
    #   resp.on_create[0].content #=> String
    #   resp.on_start #=> Array
    #   resp.on_start[0].content #=> String
    #   resp.last_modified_time #=> Time
    #   resp.creation_time #=> Time
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeNotebookInstanceLifecycleConfig AWS API Documentation
    #
    # @overload describe_notebook_instance_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def describe_notebook_instance_lifecycle_config(params = {}, options = {})
      req = build_request(:describe_notebook_instance_lifecycle_config, params)
      req.send_request(options)
    end

    # Describes the details of a pipeline.
    #
    # @option params [required, String] :pipeline_name
    #   The name of the pipeline to describe.
    #
    # @return [Types::DescribePipelineResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribePipelineResponse#pipeline_arn #pipeline_arn} => String
    #   * {Types::DescribePipelineResponse#pipeline_name #pipeline_name} => String
    #   * {Types::DescribePipelineResponse#pipeline_display_name #pipeline_display_name} => String
    #   * {Types::DescribePipelineResponse#pipeline_definition #pipeline_definition} => String
    #   * {Types::DescribePipelineResponse#pipeline_description #pipeline_description} => String
    #   * {Types::DescribePipelineResponse#role_arn #role_arn} => String
    #   * {Types::DescribePipelineResponse#pipeline_status #pipeline_status} => String
    #   * {Types::DescribePipelineResponse#creation_time #creation_time} => Time
    #   * {Types::DescribePipelineResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribePipelineResponse#last_run_time #last_run_time} => Time
    #   * {Types::DescribePipelineResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribePipelineResponse#last_modified_by #last_modified_by} => Types::UserContext
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_pipeline({
    #     pipeline_name: "PipelineName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_arn #=> String
    #   resp.pipeline_name #=> String
    #   resp.pipeline_display_name #=> String
    #   resp.pipeline_definition #=> String
    #   resp.pipeline_description #=> String
    #   resp.role_arn #=> String
    #   resp.pipeline_status #=> String, one of "Active"
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.last_run_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribePipeline AWS API Documentation
    #
    # @overload describe_pipeline(params = {})
    # @param [Hash] params ({})
    def describe_pipeline(params = {}, options = {})
      req = build_request(:describe_pipeline, params)
      req.send_request(options)
    end

    # Describes the details of an execution's pipeline definition.
    #
    # @option params [required, String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @return [Types::DescribePipelineDefinitionForExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribePipelineDefinitionForExecutionResponse#pipeline_definition #pipeline_definition} => String
    #   * {Types::DescribePipelineDefinitionForExecutionResponse#creation_time #creation_time} => Time
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_pipeline_definition_for_execution({
    #     pipeline_execution_arn: "PipelineExecutionArn", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_definition #=> String
    #   resp.creation_time #=> Time
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribePipelineDefinitionForExecution AWS API Documentation
    #
    # @overload describe_pipeline_definition_for_execution(params = {})
    # @param [Hash] params ({})
    def describe_pipeline_definition_for_execution(params = {}, options = {})
      req = build_request(:describe_pipeline_definition_for_execution, params)
      req.send_request(options)
    end

    # Describes the details of a pipeline execution.
    #
    # @option params [required, String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @return [Types::DescribePipelineExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribePipelineExecutionResponse#pipeline_arn #pipeline_arn} => String
    #   * {Types::DescribePipelineExecutionResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #   * {Types::DescribePipelineExecutionResponse#pipeline_execution_display_name #pipeline_execution_display_name} => String
    #   * {Types::DescribePipelineExecutionResponse#pipeline_execution_status #pipeline_execution_status} => String
    #   * {Types::DescribePipelineExecutionResponse#pipeline_execution_description #pipeline_execution_description} => String
    #   * {Types::DescribePipelineExecutionResponse#pipeline_experiment_config #pipeline_experiment_config} => Types::PipelineExperimentConfig
    #   * {Types::DescribePipelineExecutionResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribePipelineExecutionResponse#creation_time #creation_time} => Time
    #   * {Types::DescribePipelineExecutionResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribePipelineExecutionResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribePipelineExecutionResponse#last_modified_by #last_modified_by} => Types::UserContext
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_pipeline_execution({
    #     pipeline_execution_arn: "PipelineExecutionArn", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_arn #=> String
    #   resp.pipeline_execution_arn #=> String
    #   resp.pipeline_execution_display_name #=> String
    #   resp.pipeline_execution_status #=> String, one of "Executing", "Stopping", "Stopped", "Failed", "Succeeded"
    #   resp.pipeline_execution_description #=> String
    #   resp.pipeline_experiment_config.experiment_name #=> String
    #   resp.pipeline_experiment_config.trial_name #=> String
    #   resp.failure_reason #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribePipelineExecution AWS API Documentation
    #
    # @overload describe_pipeline_execution(params = {})
    # @param [Hash] params ({})
    def describe_pipeline_execution(params = {}, options = {})
      req = build_request(:describe_pipeline_execution, params)
      req.send_request(options)
    end

    # Returns a description of a processing job.
    #
    # @option params [required, String] :processing_job_name
    #   The name of the processing job. The name must be unique within an
    #   Amazon Web Services Region in the Amazon Web Services account.
    #
    # @return [Types::DescribeProcessingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeProcessingJobResponse#processing_inputs #processing_inputs} => Array&lt;Types::ProcessingInput&gt;
    #   * {Types::DescribeProcessingJobResponse#processing_output_config #processing_output_config} => Types::ProcessingOutputConfig
    #   * {Types::DescribeProcessingJobResponse#processing_job_name #processing_job_name} => String
    #   * {Types::DescribeProcessingJobResponse#processing_resources #processing_resources} => Types::ProcessingResources
    #   * {Types::DescribeProcessingJobResponse#stopping_condition #stopping_condition} => Types::ProcessingStoppingCondition
    #   * {Types::DescribeProcessingJobResponse#app_specification #app_specification} => Types::AppSpecification
    #   * {Types::DescribeProcessingJobResponse#environment #environment} => Hash&lt;String,String&gt;
    #   * {Types::DescribeProcessingJobResponse#network_config #network_config} => Types::NetworkConfig
    #   * {Types::DescribeProcessingJobResponse#role_arn #role_arn} => String
    #   * {Types::DescribeProcessingJobResponse#experiment_config #experiment_config} => Types::ExperimentConfig
    #   * {Types::DescribeProcessingJobResponse#processing_job_arn #processing_job_arn} => String
    #   * {Types::DescribeProcessingJobResponse#processing_job_status #processing_job_status} => String
    #   * {Types::DescribeProcessingJobResponse#exit_message #exit_message} => String
    #   * {Types::DescribeProcessingJobResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeProcessingJobResponse#processing_end_time #processing_end_time} => Time
    #   * {Types::DescribeProcessingJobResponse#processing_start_time #processing_start_time} => Time
    #   * {Types::DescribeProcessingJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeProcessingJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeProcessingJobResponse#monitoring_schedule_arn #monitoring_schedule_arn} => String
    #   * {Types::DescribeProcessingJobResponse#auto_ml_job_arn #auto_ml_job_arn} => String
    #   * {Types::DescribeProcessingJobResponse#training_job_arn #training_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_processing_job({
    #     processing_job_name: "ProcessingJobName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.processing_inputs #=> Array
    #   resp.processing_inputs[0].input_name #=> String
    #   resp.processing_inputs[0].app_managed #=> Boolean
    #   resp.processing_inputs[0].s3_input.s3_uri #=> String
    #   resp.processing_inputs[0].s3_input.local_path #=> String
    #   resp.processing_inputs[0].s3_input.s3_data_type #=> String, one of "ManifestFile", "S3Prefix"
    #   resp.processing_inputs[0].s3_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.processing_inputs[0].s3_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.processing_inputs[0].s3_input.s3_compression_type #=> String, one of "None", "Gzip"
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.catalog #=> String
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.database #=> String
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.query_string #=> String
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.work_group #=> String
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.output_s3_uri #=> String
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.kms_key_id #=> String
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.output_format #=> String, one of "PARQUET", "ORC", "AVRO", "JSON", "TEXTFILE"
    #   resp.processing_inputs[0].dataset_definition.athena_dataset_definition.output_compression #=> String, one of "GZIP", "SNAPPY", "ZLIB"
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.cluster_id #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.database #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.db_user #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.query_string #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.cluster_role_arn #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.output_s3_uri #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.kms_key_id #=> String
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.output_format #=> String, one of "PARQUET", "CSV"
    #   resp.processing_inputs[0].dataset_definition.redshift_dataset_definition.output_compression #=> String, one of "None", "GZIP", "BZIP2", "ZSTD", "SNAPPY"
    #   resp.processing_inputs[0].dataset_definition.local_path #=> String
    #   resp.processing_inputs[0].dataset_definition.data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.processing_inputs[0].dataset_definition.input_mode #=> String, one of "Pipe", "File"
    #   resp.processing_output_config.outputs #=> Array
    #   resp.processing_output_config.outputs[0].output_name #=> String
    #   resp.processing_output_config.outputs[0].s3_output.s3_uri #=> String
    #   resp.processing_output_config.outputs[0].s3_output.local_path #=> String
    #   resp.processing_output_config.outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.processing_output_config.outputs[0].feature_store_output.feature_group_name #=> String
    #   resp.processing_output_config.outputs[0].app_managed #=> Boolean
    #   resp.processing_output_config.kms_key_id #=> String
    #   resp.processing_job_name #=> String
    #   resp.processing_resources.cluster_config.instance_count #=> Integer
    #   resp.processing_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.processing_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.processing_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.app_specification.image_uri #=> String
    #   resp.app_specification.container_entrypoint #=> Array
    #   resp.app_specification.container_entrypoint[0] #=> String
    #   resp.app_specification.container_arguments #=> Array
    #   resp.app_specification.container_arguments[0] #=> String
    #   resp.environment #=> Hash
    #   resp.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.network_config.enable_network_isolation #=> Boolean
    #   resp.network_config.vpc_config.security_group_ids #=> Array
    #   resp.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.network_config.vpc_config.subnets #=> Array
    #   resp.network_config.vpc_config.subnets[0] #=> String
    #   resp.role_arn #=> String
    #   resp.experiment_config.experiment_name #=> String
    #   resp.experiment_config.trial_name #=> String
    #   resp.experiment_config.trial_component_display_name #=> String
    #   resp.processing_job_arn #=> String
    #   resp.processing_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.exit_message #=> String
    #   resp.failure_reason #=> String
    #   resp.processing_end_time #=> Time
    #   resp.processing_start_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.creation_time #=> Time
    #   resp.monitoring_schedule_arn #=> String
    #   resp.auto_ml_job_arn #=> String
    #   resp.training_job_arn #=> String
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * processing_job_completed_or_stopped
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeProcessingJob AWS API Documentation
    #
    # @overload describe_processing_job(params = {})
    # @param [Hash] params ({})
    def describe_processing_job(params = {}, options = {})
      req = build_request(:describe_processing_job, params)
      req.send_request(options)
    end

    # Describes the details of a project.
    #
    # @option params [required, String] :project_name
    #   The name of the project to describe.
    #
    # @return [Types::DescribeProjectOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeProjectOutput#project_arn #project_arn} => String
    #   * {Types::DescribeProjectOutput#project_name #project_name} => String
    #   * {Types::DescribeProjectOutput#project_id #project_id} => String
    #   * {Types::DescribeProjectOutput#project_description #project_description} => String
    #   * {Types::DescribeProjectOutput#service_catalog_provisioning_details #service_catalog_provisioning_details} => Types::ServiceCatalogProvisioningDetails
    #   * {Types::DescribeProjectOutput#service_catalog_provisioned_product_details #service_catalog_provisioned_product_details} => Types::ServiceCatalogProvisionedProductDetails
    #   * {Types::DescribeProjectOutput#project_status #project_status} => String
    #   * {Types::DescribeProjectOutput#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeProjectOutput#creation_time #creation_time} => Time
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_project({
    #     project_name: "ProjectEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.project_arn #=> String
    #   resp.project_name #=> String
    #   resp.project_id #=> String
    #   resp.project_description #=> String
    #   resp.service_catalog_provisioning_details.product_id #=> String
    #   resp.service_catalog_provisioning_details.provisioning_artifact_id #=> String
    #   resp.service_catalog_provisioning_details.path_id #=> String
    #   resp.service_catalog_provisioning_details.provisioning_parameters #=> Array
    #   resp.service_catalog_provisioning_details.provisioning_parameters[0].key #=> String
    #   resp.service_catalog_provisioning_details.provisioning_parameters[0].value #=> String
    #   resp.service_catalog_provisioned_product_details.provisioned_product_id #=> String
    #   resp.service_catalog_provisioned_product_details.provisioned_product_status_message #=> String
    #   resp.project_status #=> String, one of "Pending", "CreateInProgress", "CreateCompleted", "CreateFailed", "DeleteInProgress", "DeleteFailed", "DeleteCompleted"
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.creation_time #=> Time
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeProject AWS API Documentation
    #
    # @overload describe_project(params = {})
    # @param [Hash] params ({})
    def describe_project(params = {}, options = {})
      req = build_request(:describe_project, params)
      req.send_request(options)
    end

    # Describes the Studio Lifecycle Configuration.
    #
    # @option params [required, String] :studio_lifecycle_config_name
    #   The name of the Studio Lifecycle Configuration to describe.
    #
    # @return [Types::DescribeStudioLifecycleConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeStudioLifecycleConfigResponse#studio_lifecycle_config_arn #studio_lifecycle_config_arn} => String
    #   * {Types::DescribeStudioLifecycleConfigResponse#studio_lifecycle_config_name #studio_lifecycle_config_name} => String
    #   * {Types::DescribeStudioLifecycleConfigResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeStudioLifecycleConfigResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeStudioLifecycleConfigResponse#studio_lifecycle_config_content #studio_lifecycle_config_content} => String
    #   * {Types::DescribeStudioLifecycleConfigResponse#studio_lifecycle_config_app_type #studio_lifecycle_config_app_type} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_studio_lifecycle_config({
    #     studio_lifecycle_config_name: "StudioLifecycleConfigName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.studio_lifecycle_config_arn #=> String
    #   resp.studio_lifecycle_config_name #=> String
    #   resp.creation_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.studio_lifecycle_config_content #=> String
    #   resp.studio_lifecycle_config_app_type #=> String, one of "JupyterServer", "KernelGateway"
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeStudioLifecycleConfig AWS API Documentation
    #
    # @overload describe_studio_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def describe_studio_lifecycle_config(params = {}, options = {})
      req = build_request(:describe_studio_lifecycle_config, params)
      req.send_request(options)
    end

    # Gets information about a work team provided by a vendor. It returns
    # details about the subscription with a vendor in the Amazon Web
    # Services Marketplace.
    #
    # @option params [required, String] :workteam_arn
    #   The Amazon Resource Name (ARN) of the subscribed work team to
    #   describe.
    #
    # @return [Types::DescribeSubscribedWorkteamResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeSubscribedWorkteamResponse#subscribed_workteam #subscribed_workteam} => Types::SubscribedWorkteam
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_subscribed_workteam({
    #     workteam_arn: "WorkteamArn", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.subscribed_workteam.workteam_arn #=> String
    #   resp.subscribed_workteam.marketplace_title #=> String
    #   resp.subscribed_workteam.seller_name #=> String
    #   resp.subscribed_workteam.marketplace_description #=> String
    #   resp.subscribed_workteam.listing_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeSubscribedWorkteam AWS API Documentation
    #
    # @overload describe_subscribed_workteam(params = {})
    # @param [Hash] params ({})
    def describe_subscribed_workteam(params = {}, options = {})
      req = build_request(:describe_subscribed_workteam, params)
      req.send_request(options)
    end

    # Returns information about a training job.
    #
    # Some of the attributes below only appear if the training job
    # successfully starts. If the training job fails, `TrainingJobStatus` is
    # `Failed` and, depending on the `FailureReason`, attributes like
    # `TrainingStartTime`, `TrainingTimeInSeconds`, `TrainingEndTime`, and
    # `BillableTimeInSeconds` may not be present in the response.
    #
    # @option params [required, String] :training_job_name
    #   The name of the training job.
    #
    # @return [Types::DescribeTrainingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeTrainingJobResponse#training_job_name #training_job_name} => String
    #   * {Types::DescribeTrainingJobResponse#training_job_arn #training_job_arn} => String
    #   * {Types::DescribeTrainingJobResponse#tuning_job_arn #tuning_job_arn} => String
    #   * {Types::DescribeTrainingJobResponse#labeling_job_arn #labeling_job_arn} => String
    #   * {Types::DescribeTrainingJobResponse#auto_ml_job_arn #auto_ml_job_arn} => String
    #   * {Types::DescribeTrainingJobResponse#model_artifacts #model_artifacts} => Types::ModelArtifacts
    #   * {Types::DescribeTrainingJobResponse#training_job_status #training_job_status} => String
    #   * {Types::DescribeTrainingJobResponse#secondary_status #secondary_status} => String
    #   * {Types::DescribeTrainingJobResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeTrainingJobResponse#hyper_parameters #hyper_parameters} => Hash&lt;String,String&gt;
    #   * {Types::DescribeTrainingJobResponse#algorithm_specification #algorithm_specification} => Types::AlgorithmSpecification
    #   * {Types::DescribeTrainingJobResponse#role_arn #role_arn} => String
    #   * {Types::DescribeTrainingJobResponse#input_data_config #input_data_config} => Array&lt;Types::Channel&gt;
    #   * {Types::DescribeTrainingJobResponse#output_data_config #output_data_config} => Types::OutputDataConfig
    #   * {Types::DescribeTrainingJobResponse#resource_config #resource_config} => Types::ResourceConfig
    #   * {Types::DescribeTrainingJobResponse#vpc_config #vpc_config} => Types::VpcConfig
    #   * {Types::DescribeTrainingJobResponse#stopping_condition #stopping_condition} => Types::StoppingCondition
    #   * {Types::DescribeTrainingJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeTrainingJobResponse#training_start_time #training_start_time} => Time
    #   * {Types::DescribeTrainingJobResponse#training_end_time #training_end_time} => Time
    #   * {Types::DescribeTrainingJobResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeTrainingJobResponse#secondary_status_transitions #secondary_status_transitions} => Array&lt;Types::SecondaryStatusTransition&gt;
    #   * {Types::DescribeTrainingJobResponse#final_metric_data_list #final_metric_data_list} => Array&lt;Types::MetricData&gt;
    #   * {Types::DescribeTrainingJobResponse#enable_network_isolation #enable_network_isolation} => Boolean
    #   * {Types::DescribeTrainingJobResponse#enable_inter_container_traffic_encryption #enable_inter_container_traffic_encryption} => Boolean
    #   * {Types::DescribeTrainingJobResponse#enable_managed_spot_training #enable_managed_spot_training} => Boolean
    #   * {Types::DescribeTrainingJobResponse#checkpoint_config #checkpoint_config} => Types::CheckpointConfig
    #   * {Types::DescribeTrainingJobResponse#training_time_in_seconds #training_time_in_seconds} => Integer
    #   * {Types::DescribeTrainingJobResponse#billable_time_in_seconds #billable_time_in_seconds} => Integer
    #   * {Types::DescribeTrainingJobResponse#debug_hook_config #debug_hook_config} => Types::DebugHookConfig
    #   * {Types::DescribeTrainingJobResponse#experiment_config #experiment_config} => Types::ExperimentConfig
    #   * {Types::DescribeTrainingJobResponse#debug_rule_configurations #debug_rule_configurations} => Array&lt;Types::DebugRuleConfiguration&gt;
    #   * {Types::DescribeTrainingJobResponse#tensor_board_output_config #tensor_board_output_config} => Types::TensorBoardOutputConfig
    #   * {Types::DescribeTrainingJobResponse#debug_rule_evaluation_statuses #debug_rule_evaluation_statuses} => Array&lt;Types::DebugRuleEvaluationStatus&gt;
    #   * {Types::DescribeTrainingJobResponse#profiler_config #profiler_config} => Types::ProfilerConfig
    #   * {Types::DescribeTrainingJobResponse#profiler_rule_configurations #profiler_rule_configurations} => Array&lt;Types::ProfilerRuleConfiguration&gt;
    #   * {Types::DescribeTrainingJobResponse#profiler_rule_evaluation_statuses #profiler_rule_evaluation_statuses} => Array&lt;Types::ProfilerRuleEvaluationStatus&gt;
    #   * {Types::DescribeTrainingJobResponse#profiling_status #profiling_status} => String
    #   * {Types::DescribeTrainingJobResponse#retry_strategy #retry_strategy} => Types::RetryStrategy
    #   * {Types::DescribeTrainingJobResponse#environment #environment} => Hash&lt;String,String&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_training_job({
    #     training_job_name: "TrainingJobName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.training_job_name #=> String
    #   resp.training_job_arn #=> String
    #   resp.tuning_job_arn #=> String
    #   resp.labeling_job_arn #=> String
    #   resp.auto_ml_job_arn #=> String
    #   resp.model_artifacts.s3_model_artifacts #=> String
    #   resp.training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.secondary_status #=> String, one of "Starting", "LaunchingMLInstances", "PreparingTrainingStack", "Downloading", "DownloadingTrainingImage", "Training", "Uploading", "Stopping", "Stopped", "MaxRuntimeExceeded", "Completed", "Failed", "Interrupted", "MaxWaitTimeExceeded", "Updating", "Restarting"
    #   resp.failure_reason #=> String
    #   resp.hyper_parameters #=> Hash
    #   resp.hyper_parameters["HyperParameterKey"] #=> String
    #   resp.algorithm_specification.training_image #=> String
    #   resp.algorithm_specification.algorithm_name #=> String
    #   resp.algorithm_specification.training_input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.algorithm_specification.metric_definitions #=> Array
    #   resp.algorithm_specification.metric_definitions[0].name #=> String
    #   resp.algorithm_specification.metric_definitions[0].regex #=> String
    #   resp.algorithm_specification.enable_sage_maker_metrics_time_series #=> Boolean
    #   resp.role_arn #=> String
    #   resp.input_data_config #=> Array
    #   resp.input_data_config[0].channel_name #=> String
    #   resp.input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.input_data_config[0].data_source.s3_data_source.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.input_data_config[0].data_source.s3_data_source.attribute_names #=> Array
    #   resp.input_data_config[0].data_source.s3_data_source.attribute_names[0] #=> String
    #   resp.input_data_config[0].data_source.file_system_data_source.file_system_id #=> String
    #   resp.input_data_config[0].data_source.file_system_data_source.file_system_access_mode #=> String, one of "rw", "ro"
    #   resp.input_data_config[0].data_source.file_system_data_source.file_system_type #=> String, one of "EFS", "FSxLustre"
    #   resp.input_data_config[0].data_source.file_system_data_source.directory_path #=> String
    #   resp.input_data_config[0].content_type #=> String
    #   resp.input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.input_data_config[0].record_wrapper_type #=> String, one of "None", "RecordIO"
    #   resp.input_data_config[0].input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.input_data_config[0].shuffle_config.seed #=> Integer
    #   resp.output_data_config.kms_key_id #=> String
    #   resp.output_data_config.s3_output_path #=> String
    #   resp.resource_config.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.resource_config.instance_count #=> Integer
    #   resp.resource_config.volume_size_in_gb #=> Integer
    #   resp.resource_config.volume_kms_key_id #=> String
    #   resp.vpc_config.security_group_ids #=> Array
    #   resp.vpc_config.security_group_ids[0] #=> String
    #   resp.vpc_config.subnets #=> Array
    #   resp.vpc_config.subnets[0] #=> String
    #   resp.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.creation_time #=> Time
    #   resp.training_start_time #=> Time
    #   resp.training_end_time #=> Time
    #   resp.last_modified_time #=> Time
    #   resp.secondary_status_transitions #=> Array
    #   resp.secondary_status_transitions[0].status #=> String, one of "Starting", "LaunchingMLInstances", "PreparingTrainingStack", "Downloading", "DownloadingTrainingImage", "Training", "Uploading", "Stopping", "Stopped", "MaxRuntimeExceeded", "Completed", "Failed", "Interrupted", "MaxWaitTimeExceeded", "Updating", "Restarting"
    #   resp.secondary_status_transitions[0].start_time #=> Time
    #   resp.secondary_status_transitions[0].end_time #=> Time
    #   resp.secondary_status_transitions[0].status_message #=> String
    #   resp.final_metric_data_list #=> Array
    #   resp.final_metric_data_list[0].metric_name #=> String
    #   resp.final_metric_data_list[0].value #=> Float
    #   resp.final_metric_data_list[0].timestamp #=> Time
    #   resp.enable_network_isolation #=> Boolean
    #   resp.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.enable_managed_spot_training #=> Boolean
    #   resp.checkpoint_config.s3_uri #=> String
    #   resp.checkpoint_config.local_path #=> String
    #   resp.training_time_in_seconds #=> Integer
    #   resp.billable_time_in_seconds #=> Integer
    #   resp.debug_hook_config.local_path #=> String
    #   resp.debug_hook_config.s3_output_path #=> String
    #   resp.debug_hook_config.hook_parameters #=> Hash
    #   resp.debug_hook_config.hook_parameters["ConfigKey"] #=> String
    #   resp.debug_hook_config.collection_configurations #=> Array
    #   resp.debug_hook_config.collection_configurations[0].collection_name #=> String
    #   resp.debug_hook_config.collection_configurations[0].collection_parameters #=> Hash
    #   resp.debug_hook_config.collection_configurations[0].collection_parameters["ConfigKey"] #=> String
    #   resp.experiment_config.experiment_name #=> String
    #   resp.experiment_config.trial_name #=> String
    #   resp.experiment_config.trial_component_display_name #=> String
    #   resp.debug_rule_configurations #=> Array
    #   resp.debug_rule_configurations[0].rule_configuration_name #=> String
    #   resp.debug_rule_configurations[0].local_path #=> String
    #   resp.debug_rule_configurations[0].s3_output_path #=> String
    #   resp.debug_rule_configurations[0].rule_evaluator_image #=> String
    #   resp.debug_rule_configurations[0].instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.debug_rule_configurations[0].volume_size_in_gb #=> Integer
    #   resp.debug_rule_configurations[0].rule_parameters #=> Hash
    #   resp.debug_rule_configurations[0].rule_parameters["ConfigKey"] #=> String
    #   resp.tensor_board_output_config.local_path #=> String
    #   resp.tensor_board_output_config.s3_output_path #=> String
    #   resp.debug_rule_evaluation_statuses #=> Array
    #   resp.debug_rule_evaluation_statuses[0].rule_configuration_name #=> String
    #   resp.debug_rule_evaluation_statuses[0].rule_evaluation_job_arn #=> String
    #   resp.debug_rule_evaluation_statuses[0].rule_evaluation_status #=> String, one of "InProgress", "NoIssuesFound", "IssuesFound", "Error", "Stopping", "Stopped"
    #   resp.debug_rule_evaluation_statuses[0].status_details #=> String
    #   resp.debug_rule_evaluation_statuses[0].last_modified_time #=> Time
    #   resp.profiler_config.s3_output_path #=> String
    #   resp.profiler_config.profiling_interval_in_milliseconds #=> Integer
    #   resp.profiler_config.profiling_parameters #=> Hash
    #   resp.profiler_config.profiling_parameters["ConfigKey"] #=> String
    #   resp.profiler_rule_configurations #=> Array
    #   resp.profiler_rule_configurations[0].rule_configuration_name #=> String
    #   resp.profiler_rule_configurations[0].local_path #=> String
    #   resp.profiler_rule_configurations[0].s3_output_path #=> String
    #   resp.profiler_rule_configurations[0].rule_evaluator_image #=> String
    #   resp.profiler_rule_configurations[0].instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.profiler_rule_configurations[0].volume_size_in_gb #=> Integer
    #   resp.profiler_rule_configurations[0].rule_parameters #=> Hash
    #   resp.profiler_rule_configurations[0].rule_parameters["ConfigKey"] #=> String
    #   resp.profiler_rule_evaluation_statuses #=> Array
    #   resp.profiler_rule_evaluation_statuses[0].rule_configuration_name #=> String
    #   resp.profiler_rule_evaluation_statuses[0].rule_evaluation_job_arn #=> String
    #   resp.profiler_rule_evaluation_statuses[0].rule_evaluation_status #=> String, one of "InProgress", "NoIssuesFound", "IssuesFound", "Error", "Stopping", "Stopped"
    #   resp.profiler_rule_evaluation_statuses[0].status_details #=> String
    #   resp.profiler_rule_evaluation_statuses[0].last_modified_time #=> Time
    #   resp.profiling_status #=> String, one of "Enabled", "Disabled"
    #   resp.retry_strategy.maximum_retry_attempts #=> Integer
    #   resp.environment #=> Hash
    #   resp.environment["TrainingEnvironmentKey"] #=> String
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * training_job_completed_or_stopped
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeTrainingJob AWS API Documentation
    #
    # @overload describe_training_job(params = {})
    # @param [Hash] params ({})
    def describe_training_job(params = {}, options = {})
      req = build_request(:describe_training_job, params)
      req.send_request(options)
    end

    # Returns information about a transform job.
    #
    # @option params [required, String] :transform_job_name
    #   The name of the transform job that you want to view details of.
    #
    # @return [Types::DescribeTransformJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeTransformJobResponse#transform_job_name #transform_job_name} => String
    #   * {Types::DescribeTransformJobResponse#transform_job_arn #transform_job_arn} => String
    #   * {Types::DescribeTransformJobResponse#transform_job_status #transform_job_status} => String
    #   * {Types::DescribeTransformJobResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeTransformJobResponse#model_name #model_name} => String
    #   * {Types::DescribeTransformJobResponse#max_concurrent_transforms #max_concurrent_transforms} => Integer
    #   * {Types::DescribeTransformJobResponse#model_client_config #model_client_config} => Types::ModelClientConfig
    #   * {Types::DescribeTransformJobResponse#max_payload_in_mb #max_payload_in_mb} => Integer
    #   * {Types::DescribeTransformJobResponse#batch_strategy #batch_strategy} => String
    #   * {Types::DescribeTransformJobResponse#environment #environment} => Hash&lt;String,String&gt;
    #   * {Types::DescribeTransformJobResponse#transform_input #transform_input} => Types::TransformInput
    #   * {Types::DescribeTransformJobResponse#transform_output #transform_output} => Types::TransformOutput
    #   * {Types::DescribeTransformJobResponse#transform_resources #transform_resources} => Types::TransformResources
    #   * {Types::DescribeTransformJobResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeTransformJobResponse#transform_start_time #transform_start_time} => Time
    #   * {Types::DescribeTransformJobResponse#transform_end_time #transform_end_time} => Time
    #   * {Types::DescribeTransformJobResponse#labeling_job_arn #labeling_job_arn} => String
    #   * {Types::DescribeTransformJobResponse#auto_ml_job_arn #auto_ml_job_arn} => String
    #   * {Types::DescribeTransformJobResponse#data_processing #data_processing} => Types::DataProcessing
    #   * {Types::DescribeTransformJobResponse#experiment_config #experiment_config} => Types::ExperimentConfig
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_transform_job({
    #     transform_job_name: "TransformJobName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.transform_job_name #=> String
    #   resp.transform_job_arn #=> String
    #   resp.transform_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.failure_reason #=> String
    #   resp.model_name #=> String
    #   resp.max_concurrent_transforms #=> Integer
    #   resp.model_client_config.invocations_timeout_in_seconds #=> Integer
    #   resp.model_client_config.invocations_max_retries #=> Integer
    #   resp.max_payload_in_mb #=> Integer
    #   resp.batch_strategy #=> String, one of "MultiRecord", "SingleRecord"
    #   resp.environment #=> Hash
    #   resp.environment["TransformEnvironmentKey"] #=> String
    #   resp.transform_input.data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.transform_input.data_source.s3_data_source.s3_uri #=> String
    #   resp.transform_input.content_type #=> String
    #   resp.transform_input.compression_type #=> String, one of "None", "Gzip"
    #   resp.transform_input.split_type #=> String, one of "None", "Line", "RecordIO", "TFRecord"
    #   resp.transform_output.s3_output_path #=> String
    #   resp.transform_output.accept #=> String
    #   resp.transform_output.assemble_with #=> String, one of "None", "Line"
    #   resp.transform_output.kms_key_id #=> String
    #   resp.transform_resources.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.transform_resources.instance_count #=> Integer
    #   resp.transform_resources.volume_kms_key_id #=> String
    #   resp.creation_time #=> Time
    #   resp.transform_start_time #=> Time
    #   resp.transform_end_time #=> Time
    #   resp.labeling_job_arn #=> String
    #   resp.auto_ml_job_arn #=> String
    #   resp.data_processing.input_filter #=> String
    #   resp.data_processing.output_filter #=> String
    #   resp.data_processing.join_source #=> String, one of "Input", "None"
    #   resp.experiment_config.experiment_name #=> String
    #   resp.experiment_config.trial_name #=> String
    #   resp.experiment_config.trial_component_display_name #=> String
    #
    #
    # The following waiters are defined for this operation (see {Client#wait_until} for detailed usage):
    #
    #   * transform_job_completed_or_stopped
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeTransformJob AWS API Documentation
    #
    # @overload describe_transform_job(params = {})
    # @param [Hash] params ({})
    def describe_transform_job(params = {}, options = {})
      req = build_request(:describe_transform_job, params)
      req.send_request(options)
    end

    # Provides a list of a trial's properties.
    #
    # @option params [required, String] :trial_name
    #   The name of the trial to describe.
    #
    # @return [Types::DescribeTrialResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeTrialResponse#trial_name #trial_name} => String
    #   * {Types::DescribeTrialResponse#trial_arn #trial_arn} => String
    #   * {Types::DescribeTrialResponse#display_name #display_name} => String
    #   * {Types::DescribeTrialResponse#experiment_name #experiment_name} => String
    #   * {Types::DescribeTrialResponse#source #source} => Types::TrialSource
    #   * {Types::DescribeTrialResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeTrialResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeTrialResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeTrialResponse#last_modified_by #last_modified_by} => Types::UserContext
    #   * {Types::DescribeTrialResponse#metadata_properties #metadata_properties} => Types::MetadataProperties
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_trial({
    #     trial_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_name #=> String
    #   resp.trial_arn #=> String
    #   resp.display_name #=> String
    #   resp.experiment_name #=> String
    #   resp.source.source_arn #=> String
    #   resp.source.source_type #=> String
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #   resp.metadata_properties.commit_id #=> String
    #   resp.metadata_properties.repository #=> String
    #   resp.metadata_properties.generated_by #=> String
    #   resp.metadata_properties.project_id #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeTrial AWS API Documentation
    #
    # @overload describe_trial(params = {})
    # @param [Hash] params ({})
    def describe_trial(params = {}, options = {})
      req = build_request(:describe_trial, params)
      req.send_request(options)
    end

    # Provides a list of a trials component's properties.
    #
    # @option params [required, String] :trial_component_name
    #   The name of the trial component to describe.
    #
    # @return [Types::DescribeTrialComponentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeTrialComponentResponse#trial_component_name #trial_component_name} => String
    #   * {Types::DescribeTrialComponentResponse#trial_component_arn #trial_component_arn} => String
    #   * {Types::DescribeTrialComponentResponse#display_name #display_name} => String
    #   * {Types::DescribeTrialComponentResponse#source #source} => Types::TrialComponentSource
    #   * {Types::DescribeTrialComponentResponse#status #status} => Types::TrialComponentStatus
    #   * {Types::DescribeTrialComponentResponse#start_time #start_time} => Time
    #   * {Types::DescribeTrialComponentResponse#end_time #end_time} => Time
    #   * {Types::DescribeTrialComponentResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeTrialComponentResponse#created_by #created_by} => Types::UserContext
    #   * {Types::DescribeTrialComponentResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeTrialComponentResponse#last_modified_by #last_modified_by} => Types::UserContext
    #   * {Types::DescribeTrialComponentResponse#parameters #parameters} => Hash&lt;String,Types::TrialComponentParameterValue&gt;
    #   * {Types::DescribeTrialComponentResponse#input_artifacts #input_artifacts} => Hash&lt;String,Types::TrialComponentArtifact&gt;
    #   * {Types::DescribeTrialComponentResponse#output_artifacts #output_artifacts} => Hash&lt;String,Types::TrialComponentArtifact&gt;
    #   * {Types::DescribeTrialComponentResponse#metadata_properties #metadata_properties} => Types::MetadataProperties
    #   * {Types::DescribeTrialComponentResponse#metrics #metrics} => Array&lt;Types::TrialComponentMetricSummary&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_trial_component({
    #     trial_component_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_name #=> String
    #   resp.trial_component_arn #=> String
    #   resp.display_name #=> String
    #   resp.source.source_arn #=> String
    #   resp.source.source_type #=> String
    #   resp.status.primary_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.status.message #=> String
    #   resp.start_time #=> Time
    #   resp.end_time #=> Time
    #   resp.creation_time #=> Time
    #   resp.created_by.user_profile_arn #=> String
    #   resp.created_by.user_profile_name #=> String
    #   resp.created_by.domain_id #=> String
    #   resp.last_modified_time #=> Time
    #   resp.last_modified_by.user_profile_arn #=> String
    #   resp.last_modified_by.user_profile_name #=> String
    #   resp.last_modified_by.domain_id #=> String
    #   resp.parameters #=> Hash
    #   resp.parameters["TrialComponentKey256"].string_value #=> String
    #   resp.parameters["TrialComponentKey256"].number_value #=> Float
    #   resp.input_artifacts #=> Hash
    #   resp.input_artifacts["TrialComponentKey64"].media_type #=> String
    #   resp.input_artifacts["TrialComponentKey64"].value #=> String
    #   resp.output_artifacts #=> Hash
    #   resp.output_artifacts["TrialComponentKey64"].media_type #=> String
    #   resp.output_artifacts["TrialComponentKey64"].value #=> String
    #   resp.metadata_properties.commit_id #=> String
    #   resp.metadata_properties.repository #=> String
    #   resp.metadata_properties.generated_by #=> String
    #   resp.metadata_properties.project_id #=> String
    #   resp.metrics #=> Array
    #   resp.metrics[0].metric_name #=> String
    #   resp.metrics[0].source_arn #=> String
    #   resp.metrics[0].time_stamp #=> Time
    #   resp.metrics[0].max #=> Float
    #   resp.metrics[0].min #=> Float
    #   resp.metrics[0].last #=> Float
    #   resp.metrics[0].count #=> Integer
    #   resp.metrics[0].avg #=> Float
    #   resp.metrics[0].std_dev #=> Float
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeTrialComponent AWS API Documentation
    #
    # @overload describe_trial_component(params = {})
    # @param [Hash] params ({})
    def describe_trial_component(params = {}, options = {})
      req = build_request(:describe_trial_component, params)
      req.send_request(options)
    end

    # Describes a user profile. For more information, see
    # `CreateUserProfile`.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The user profile name. This value is not case sensitive.
    #
    # @return [Types::DescribeUserProfileResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeUserProfileResponse#domain_id #domain_id} => String
    #   * {Types::DescribeUserProfileResponse#user_profile_arn #user_profile_arn} => String
    #   * {Types::DescribeUserProfileResponse#user_profile_name #user_profile_name} => String
    #   * {Types::DescribeUserProfileResponse#home_efs_file_system_uid #home_efs_file_system_uid} => String
    #   * {Types::DescribeUserProfileResponse#status #status} => String
    #   * {Types::DescribeUserProfileResponse#last_modified_time #last_modified_time} => Time
    #   * {Types::DescribeUserProfileResponse#creation_time #creation_time} => Time
    #   * {Types::DescribeUserProfileResponse#failure_reason #failure_reason} => String
    #   * {Types::DescribeUserProfileResponse#single_sign_on_user_identifier #single_sign_on_user_identifier} => String
    #   * {Types::DescribeUserProfileResponse#single_sign_on_user_value #single_sign_on_user_value} => String
    #   * {Types::DescribeUserProfileResponse#user_settings #user_settings} => Types::UserSettings
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_user_profile({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.domain_id #=> String
    #   resp.user_profile_arn #=> String
    #   resp.user_profile_name #=> String
    #   resp.home_efs_file_system_uid #=> String
    #   resp.status #=> String, one of "Deleting", "Failed", "InService", "Pending", "Updating", "Update_Failed", "Delete_Failed"
    #   resp.last_modified_time #=> Time
    #   resp.creation_time #=> Time
    #   resp.failure_reason #=> String
    #   resp.single_sign_on_user_identifier #=> String
    #   resp.single_sign_on_user_value #=> String
    #   resp.user_settings.execution_role #=> String
    #   resp.user_settings.security_groups #=> Array
    #   resp.user_settings.security_groups[0] #=> String
    #   resp.user_settings.sharing_settings.notebook_output_option #=> String, one of "Allowed", "Disabled"
    #   resp.user_settings.sharing_settings.s3_output_path #=> String
    #   resp.user_settings.sharing_settings.s3_kms_key_id #=> String
    #   resp.user_settings.jupyter_server_app_settings.default_resource_spec.sage_maker_image_arn #=> String
    #   resp.user_settings.jupyter_server_app_settings.default_resource_spec.sage_maker_image_version_arn #=> String
    #   resp.user_settings.jupyter_server_app_settings.default_resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.user_settings.jupyter_server_app_settings.default_resource_spec.lifecycle_config_arn #=> String
    #   resp.user_settings.jupyter_server_app_settings.lifecycle_config_arns #=> Array
    #   resp.user_settings.jupyter_server_app_settings.lifecycle_config_arns[0] #=> String
    #   resp.user_settings.kernel_gateway_app_settings.default_resource_spec.sage_maker_image_arn #=> String
    #   resp.user_settings.kernel_gateway_app_settings.default_resource_spec.sage_maker_image_version_arn #=> String
    #   resp.user_settings.kernel_gateway_app_settings.default_resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.user_settings.kernel_gateway_app_settings.default_resource_spec.lifecycle_config_arn #=> String
    #   resp.user_settings.kernel_gateway_app_settings.custom_images #=> Array
    #   resp.user_settings.kernel_gateway_app_settings.custom_images[0].image_name #=> String
    #   resp.user_settings.kernel_gateway_app_settings.custom_images[0].image_version_number #=> Integer
    #   resp.user_settings.kernel_gateway_app_settings.custom_images[0].app_image_config_name #=> String
    #   resp.user_settings.kernel_gateway_app_settings.lifecycle_config_arns #=> Array
    #   resp.user_settings.kernel_gateway_app_settings.lifecycle_config_arns[0] #=> String
    #   resp.user_settings.tensor_board_app_settings.default_resource_spec.sage_maker_image_arn #=> String
    #   resp.user_settings.tensor_board_app_settings.default_resource_spec.sage_maker_image_version_arn #=> String
    #   resp.user_settings.tensor_board_app_settings.default_resource_spec.instance_type #=> String, one of "system", "ml.t3.micro", "ml.t3.small", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.8xlarge", "ml.m5.12xlarge", "ml.m5.16xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.12xlarge", "ml.c5.18xlarge", "ml.c5.24xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.user_settings.tensor_board_app_settings.default_resource_spec.lifecycle_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeUserProfile AWS API Documentation
    #
    # @overload describe_user_profile(params = {})
    # @param [Hash] params ({})
    def describe_user_profile(params = {}, options = {})
      req = build_request(:describe_user_profile, params)
      req.send_request(options)
    end

    # Lists private workforce information, including workforce name, Amazon
    # Resource Name (ARN), and, if applicable, allowed IP address ranges
    # ([CIDRs][1]). Allowable IP address ranges are the IP addresses that
    # workers can use to access tasks.
    #
    # This operation applies only to private workforces.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html
    #
    # @option params [required, String] :workforce_name
    #   The name of the private workforce whose access you want to restrict.
    #   `WorkforceName` is automatically set to `default` when a workforce is
    #   created and cannot be modified.
    #
    # @return [Types::DescribeWorkforceResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeWorkforceResponse#workforce #workforce} => Types::Workforce
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_workforce({
    #     workforce_name: "WorkforceName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.workforce.workforce_name #=> String
    #   resp.workforce.workforce_arn #=> String
    #   resp.workforce.last_updated_date #=> Time
    #   resp.workforce.source_ip_config.cidrs #=> Array
    #   resp.workforce.source_ip_config.cidrs[0] #=> String
    #   resp.workforce.sub_domain #=> String
    #   resp.workforce.cognito_config.user_pool #=> String
    #   resp.workforce.cognito_config.client_id #=> String
    #   resp.workforce.oidc_config.client_id #=> String
    #   resp.workforce.oidc_config.issuer #=> String
    #   resp.workforce.oidc_config.authorization_endpoint #=> String
    #   resp.workforce.oidc_config.token_endpoint #=> String
    #   resp.workforce.oidc_config.user_info_endpoint #=> String
    #   resp.workforce.oidc_config.logout_endpoint #=> String
    #   resp.workforce.oidc_config.jwks_uri #=> String
    #   resp.workforce.create_date #=> Time
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeWorkforce AWS API Documentation
    #
    # @overload describe_workforce(params = {})
    # @param [Hash] params ({})
    def describe_workforce(params = {}, options = {})
      req = build_request(:describe_workforce, params)
      req.send_request(options)
    end

    # Gets information about a specific work team. You can see information
    # such as the create date, the last updated date, membership
    # information, and the work team's Amazon Resource Name (ARN).
    #
    # @option params [required, String] :workteam_name
    #   The name of the work team to return a description of.
    #
    # @return [Types::DescribeWorkteamResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DescribeWorkteamResponse#workteam #workteam} => Types::Workteam
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.describe_workteam({
    #     workteam_name: "WorkteamName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.workteam.workteam_name #=> String
    #   resp.workteam.member_definitions #=> Array
    #   resp.workteam.member_definitions[0].cognito_member_definition.user_pool #=> String
    #   resp.workteam.member_definitions[0].cognito_member_definition.user_group #=> String
    #   resp.workteam.member_definitions[0].cognito_member_definition.client_id #=> String
    #   resp.workteam.member_definitions[0].oidc_member_definition.groups #=> Array
    #   resp.workteam.member_definitions[0].oidc_member_definition.groups[0] #=> String
    #   resp.workteam.workteam_arn #=> String
    #   resp.workteam.workforce_arn #=> String
    #   resp.workteam.product_listing_ids #=> Array
    #   resp.workteam.product_listing_ids[0] #=> String
    #   resp.workteam.description #=> String
    #   resp.workteam.sub_domain #=> String
    #   resp.workteam.create_date #=> Time
    #   resp.workteam.last_updated_date #=> Time
    #   resp.workteam.notification_configuration.notification_topic_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DescribeWorkteam AWS API Documentation
    #
    # @overload describe_workteam(params = {})
    # @param [Hash] params ({})
    def describe_workteam(params = {}, options = {})
      req = build_request(:describe_workteam, params)
      req.send_request(options)
    end

    # Disables using Service Catalog in SageMaker. Service Catalog is used
    # to create SageMaker projects.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DisableSagemakerServicecatalogPortfolio AWS API Documentation
    #
    # @overload disable_sagemaker_servicecatalog_portfolio(params = {})
    # @param [Hash] params ({})
    def disable_sagemaker_servicecatalog_portfolio(params = {}, options = {})
      req = build_request(:disable_sagemaker_servicecatalog_portfolio, params)
      req.send_request(options)
    end

    # Disassociates a trial component from a trial. This doesn't effect
    # other trials the component is associated with. Before you can delete a
    # component, you must disassociate the component from all trials it is
    # associated with. To associate a trial component with a trial, call the
    # AssociateTrialComponent API.
    #
    # To get a list of the trials a component is associated with, use the
    # Search API. Specify `ExperimentTrialComponent` for the `Resource`
    # parameter. The list appears in the response under
    # `Results.TrialComponent.Parents`.
    #
    # @option params [required, String] :trial_component_name
    #   The name of the component to disassociate from the trial.
    #
    # @option params [required, String] :trial_name
    #   The name of the trial to disassociate from.
    #
    # @return [Types::DisassociateTrialComponentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::DisassociateTrialComponentResponse#trial_component_arn #trial_component_arn} => String
    #   * {Types::DisassociateTrialComponentResponse#trial_arn #trial_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.disassociate_trial_component({
    #     trial_component_name: "ExperimentEntityName", # required
    #     trial_name: "ExperimentEntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_arn #=> String
    #   resp.trial_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/DisassociateTrialComponent AWS API Documentation
    #
    # @overload disassociate_trial_component(params = {})
    # @param [Hash] params ({})
    def disassociate_trial_component(params = {}, options = {})
      req = build_request(:disassociate_trial_component, params)
      req.send_request(options)
    end

    # Enables using Service Catalog in SageMaker. Service Catalog is used to
    # create SageMaker projects.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/EnableSagemakerServicecatalogPortfolio AWS API Documentation
    #
    # @overload enable_sagemaker_servicecatalog_portfolio(params = {})
    # @param [Hash] params ({})
    def enable_sagemaker_servicecatalog_portfolio(params = {}, options = {})
      req = build_request(:enable_sagemaker_servicecatalog_portfolio, params)
      req.send_request(options)
    end

    # Describes a fleet.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet.
    #
    # @return [Types::GetDeviceFleetReportResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::GetDeviceFleetReportResponse#device_fleet_arn #device_fleet_arn} => String
    #   * {Types::GetDeviceFleetReportResponse#device_fleet_name #device_fleet_name} => String
    #   * {Types::GetDeviceFleetReportResponse#output_config #output_config} => Types::EdgeOutputConfig
    #   * {Types::GetDeviceFleetReportResponse#description #description} => String
    #   * {Types::GetDeviceFleetReportResponse#report_generated #report_generated} => Time
    #   * {Types::GetDeviceFleetReportResponse#device_stats #device_stats} => Types::DeviceStats
    #   * {Types::GetDeviceFleetReportResponse#agent_versions #agent_versions} => Array&lt;Types::AgentVersion&gt;
    #   * {Types::GetDeviceFleetReportResponse#model_stats #model_stats} => Array&lt;Types::EdgeModelStat&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.get_device_fleet_report({
    #     device_fleet_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.device_fleet_arn #=> String
    #   resp.device_fleet_name #=> String
    #   resp.output_config.s3_output_location #=> String
    #   resp.output_config.kms_key_id #=> String
    #   resp.output_config.preset_deployment_type #=> String, one of "GreengrassV2Component"
    #   resp.output_config.preset_deployment_config #=> String
    #   resp.description #=> String
    #   resp.report_generated #=> Time
    #   resp.device_stats.connected_device_count #=> Integer
    #   resp.device_stats.registered_device_count #=> Integer
    #   resp.agent_versions #=> Array
    #   resp.agent_versions[0].version #=> String
    #   resp.agent_versions[0].agent_count #=> Integer
    #   resp.model_stats #=> Array
    #   resp.model_stats[0].model_name #=> String
    #   resp.model_stats[0].model_version #=> String
    #   resp.model_stats[0].offline_device_count #=> Integer
    #   resp.model_stats[0].connected_device_count #=> Integer
    #   resp.model_stats[0].active_device_count #=> Integer
    #   resp.model_stats[0].sampling_device_count #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/GetDeviceFleetReport AWS API Documentation
    #
    # @overload get_device_fleet_report(params = {})
    # @param [Hash] params ({})
    def get_device_fleet_report(params = {}, options = {})
      req = build_request(:get_device_fleet_report, params)
      req.send_request(options)
    end

    # Gets a resource policy that manages access for a model group. For
    # information about resource policies, see [Identity-based policies and
    # resource-based policies][1] in the *Amazon Web Services Identity and
    # Access Management User Guide.*.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html
    #
    # @option params [required, String] :model_package_group_name
    #   The name of the model group for which to get the resource policy.
    #
    # @return [Types::GetModelPackageGroupPolicyOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::GetModelPackageGroupPolicyOutput#resource_policy #resource_policy} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.get_model_package_group_policy({
    #     model_package_group_name: "EntityName", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.resource_policy #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/GetModelPackageGroupPolicy AWS API Documentation
    #
    # @overload get_model_package_group_policy(params = {})
    # @param [Hash] params ({})
    def get_model_package_group_policy(params = {}, options = {})
      req = build_request(:get_model_package_group_policy, params)
      req.send_request(options)
    end

    # Gets the status of Service Catalog in SageMaker. Service Catalog is
    # used to create SageMaker projects.
    #
    # @return [Types::GetSagemakerServicecatalogPortfolioStatusOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::GetSagemakerServicecatalogPortfolioStatusOutput#status #status} => String
    #
    # @example Response structure
    #
    #   resp.status #=> String, one of "Enabled", "Disabled"
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/GetSagemakerServicecatalogPortfolioStatus AWS API Documentation
    #
    # @overload get_sagemaker_servicecatalog_portfolio_status(params = {})
    # @param [Hash] params ({})
    def get_sagemaker_servicecatalog_portfolio_status(params = {}, options = {})
      req = build_request(:get_sagemaker_servicecatalog_portfolio_status, params)
      req.send_request(options)
    end

    # An auto-complete API for the search functionality in the Amazon
    # SageMaker console. It returns suggestions of possible matches for the
    # property name to use in `Search` queries. Provides suggestions for
    # `HyperParameters`, `Tags`, and `Metrics`.
    #
    # @option params [required, String] :resource
    #   The name of the Amazon SageMaker resource to search for.
    #
    # @option params [Types::SuggestionQuery] :suggestion_query
    #   Limits the property names that are included in the response.
    #
    # @return [Types::GetSearchSuggestionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::GetSearchSuggestionsResponse#property_name_suggestions #property_name_suggestions} => Array&lt;Types::PropertyNameSuggestion&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.get_search_suggestions({
    #     resource: "TrainingJob", # required, accepts TrainingJob, Experiment, ExperimentTrial, ExperimentTrialComponent, Endpoint, ModelPackage, ModelPackageGroup, Pipeline, PipelineExecution, FeatureGroup, Project
    #     suggestion_query: {
    #       property_name_query: {
    #         property_name_hint: "PropertyNameHint", # required
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.property_name_suggestions #=> Array
    #   resp.property_name_suggestions[0].property_name #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/GetSearchSuggestions AWS API Documentation
    #
    # @overload get_search_suggestions(params = {})
    # @param [Hash] params ({})
    def get_search_suggestions(params = {}, options = {})
      req = build_request(:get_search_suggestions, params)
      req.send_request(options)
    end

    # Lists the actions in your account and their properties.
    #
    # @option params [String] :source_uri
    #   A filter that returns only actions with the specified source URI.
    #
    # @option params [String] :action_type
    #   A filter that returns only actions of the specified type.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only actions created on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only actions created on or before the specified
    #   time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListActions` didn't return the full set of
    #   actions, the call returns a token for getting the next set of actions.
    #
    # @option params [Integer] :max_results
    #   The maximum number of actions to return in the response. The default
    #   value is 10.
    #
    # @return [Types::ListActionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListActionsResponse#action_summaries #action_summaries} => Array&lt;Types::ActionSummary&gt;
    #   * {Types::ListActionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_actions({
    #     source_uri: "SourceUri",
    #     action_type: "String256",
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.action_summaries #=> Array
    #   resp.action_summaries[0].action_arn #=> String
    #   resp.action_summaries[0].action_name #=> String
    #   resp.action_summaries[0].source.source_uri #=> String
    #   resp.action_summaries[0].source.source_type #=> String
    #   resp.action_summaries[0].source.source_id #=> String
    #   resp.action_summaries[0].action_type #=> String
    #   resp.action_summaries[0].status #=> String, one of "Unknown", "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.action_summaries[0].creation_time #=> Time
    #   resp.action_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListActions AWS API Documentation
    #
    # @overload list_actions(params = {})
    # @param [Hash] params ({})
    def list_actions(params = {}, options = {})
      req = build_request(:list_actions, params)
      req.send_request(options)
    end

    # Lists the machine learning algorithms that have been created.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only algorithms created after the specified time
    #   (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only algorithms created before the specified
    #   time (timestamp).
    #
    # @option params [Integer] :max_results
    #   The maximum number of algorithms to return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the algorithm name. This filter returns only algorithms
    #   whose name contains the specified string.
    #
    # @option params [String] :next_token
    #   If the response to a previous `ListAlgorithms` request was truncated,
    #   the response includes a `NextToken`. To retrieve the next set of
    #   algorithms, use the token in the next request.
    #
    # @option params [String] :sort_by
    #   The parameter by which to sort the results. The default is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for the results. The default is `Ascending`.
    #
    # @return [Types::ListAlgorithmsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListAlgorithmsOutput#algorithm_summary_list #algorithm_summary_list} => Array&lt;Types::AlgorithmSummary&gt;
    #   * {Types::ListAlgorithmsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_algorithms({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     next_token: "NextToken",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.algorithm_summary_list #=> Array
    #   resp.algorithm_summary_list[0].algorithm_name #=> String
    #   resp.algorithm_summary_list[0].algorithm_arn #=> String
    #   resp.algorithm_summary_list[0].algorithm_description #=> String
    #   resp.algorithm_summary_list[0].creation_time #=> Time
    #   resp.algorithm_summary_list[0].algorithm_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListAlgorithms AWS API Documentation
    #
    # @overload list_algorithms(params = {})
    # @param [Hash] params ({})
    def list_algorithms(params = {}, options = {})
      req = build_request(:list_algorithms, params)
      req.send_request(options)
    end

    # Lists the AppImageConfigs in your account and their properties. The
    # list can be filtered by creation time or modified time, and whether
    # the AppImageConfig name contains a specified string.
    #
    # @option params [Integer] :max_results
    #   The maximum number of AppImageConfigs to return in the response. The
    #   default value is 10.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListImages` didn't return the full set of
    #   AppImageConfigs, the call returns a token for getting the next set of
    #   AppImageConfigs.
    #
    # @option params [String] :name_contains
    #   A filter that returns only AppImageConfigs whose name contains the
    #   specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only AppImageConfigs created on or before the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only AppImageConfigs created on or after the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :modified_time_before
    #   A filter that returns only AppImageConfigs modified on or before the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :modified_time_after
    #   A filter that returns only AppImageConfigs modified on or after the
    #   specified time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @return [Types::ListAppImageConfigsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListAppImageConfigsResponse#next_token #next_token} => String
    #   * {Types::ListAppImageConfigsResponse#app_image_configs #app_image_configs} => Array&lt;Types::AppImageConfigDetails&gt;
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_app_image_configs({
    #     max_results: 1,
    #     next_token: "NextToken",
    #     name_contains: "AppImageConfigName",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     modified_time_before: Time.now,
    #     modified_time_after: Time.now,
    #     sort_by: "CreationTime", # accepts CreationTime, LastModifiedTime, Name
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.next_token #=> String
    #   resp.app_image_configs #=> Array
    #   resp.app_image_configs[0].app_image_config_arn #=> String
    #   resp.app_image_configs[0].app_image_config_name #=> String
    #   resp.app_image_configs[0].creation_time #=> Time
    #   resp.app_image_configs[0].last_modified_time #=> Time
    #   resp.app_image_configs[0].kernel_gateway_image_config.kernel_specs #=> Array
    #   resp.app_image_configs[0].kernel_gateway_image_config.kernel_specs[0].name #=> String
    #   resp.app_image_configs[0].kernel_gateway_image_config.kernel_specs[0].display_name #=> String
    #   resp.app_image_configs[0].kernel_gateway_image_config.file_system_config.mount_path #=> String
    #   resp.app_image_configs[0].kernel_gateway_image_config.file_system_config.default_uid #=> Integer
    #   resp.app_image_configs[0].kernel_gateway_image_config.file_system_config.default_gid #=> Integer
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListAppImageConfigs AWS API Documentation
    #
    # @overload list_app_image_configs(params = {})
    # @param [Hash] params ({})
    def list_app_image_configs(params = {}, options = {})
      req = build_request(:list_app_image_configs, params)
      req.send_request(options)
    end

    # Lists apps.
    #
    # @option params [String] :next_token
    #   If the previous response was truncated, you will receive this token.
    #   Use it in your next request to receive the next set of results.
    #
    # @option params [Integer] :max_results
    #   Returns a list up to a specified limit.
    #
    # @option params [String] :sort_order
    #   The sort order for the results. The default is Ascending.
    #
    # @option params [String] :sort_by
    #   The parameter by which to sort the results. The default is
    #   CreationTime.
    #
    # @option params [String] :domain_id_equals
    #   A parameter to search for the domain ID.
    #
    # @option params [String] :user_profile_name_equals
    #   A parameter to search by user profile name.
    #
    # @return [Types::ListAppsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListAppsResponse#apps #apps} => Array&lt;Types::AppDetails&gt;
    #   * {Types::ListAppsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_apps({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     sort_by: "CreationTime", # accepts CreationTime
    #     domain_id_equals: "DomainId",
    #     user_profile_name_equals: "UserProfileName",
    #   })
    #
    # @example Response structure
    #
    #   resp.apps #=> Array
    #   resp.apps[0].domain_id #=> String
    #   resp.apps[0].user_profile_name #=> String
    #   resp.apps[0].app_type #=> String, one of "JupyterServer", "KernelGateway", "TensorBoard"
    #   resp.apps[0].app_name #=> String
    #   resp.apps[0].status #=> String, one of "Deleted", "Deleting", "Failed", "InService", "Pending"
    #   resp.apps[0].creation_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListApps AWS API Documentation
    #
    # @overload list_apps(params = {})
    # @param [Hash] params ({})
    def list_apps(params = {}, options = {})
      req = build_request(:list_apps, params)
      req.send_request(options)
    end

    # Lists the artifacts in your account and their properties.
    #
    # @option params [String] :source_uri
    #   A filter that returns only artifacts with the specified source URI.
    #
    # @option params [String] :artifact_type
    #   A filter that returns only artifacts of the specified type.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only artifacts created on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only artifacts created on or before the
    #   specified time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListArtifacts` didn't return the full set of
    #   artifacts, the call returns a token for getting the next set of
    #   artifacts.
    #
    # @option params [Integer] :max_results
    #   The maximum number of artifacts to return in the response. The default
    #   value is 10.
    #
    # @return [Types::ListArtifactsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListArtifactsResponse#artifact_summaries #artifact_summaries} => Array&lt;Types::ArtifactSummary&gt;
    #   * {Types::ListArtifactsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_artifacts({
    #     source_uri: "SourceUri",
    #     artifact_type: "String256",
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "CreationTime", # accepts CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.artifact_summaries #=> Array
    #   resp.artifact_summaries[0].artifact_arn #=> String
    #   resp.artifact_summaries[0].artifact_name #=> String
    #   resp.artifact_summaries[0].source.source_uri #=> String
    #   resp.artifact_summaries[0].source.source_types #=> Array
    #   resp.artifact_summaries[0].source.source_types[0].source_id_type #=> String, one of "MD5Hash", "S3ETag", "S3Version", "Custom"
    #   resp.artifact_summaries[0].source.source_types[0].value #=> String
    #   resp.artifact_summaries[0].artifact_type #=> String
    #   resp.artifact_summaries[0].creation_time #=> Time
    #   resp.artifact_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListArtifacts AWS API Documentation
    #
    # @overload list_artifacts(params = {})
    # @param [Hash] params ({})
    def list_artifacts(params = {}, options = {})
      req = build_request(:list_artifacts, params)
      req.send_request(options)
    end

    # Lists the associations in your account and their properties.
    #
    # @option params [String] :source_arn
    #   A filter that returns only associations with the specified source ARN.
    #
    # @option params [String] :destination_arn
    #   A filter that returns only associations with the specified destination
    #   Amazon Resource Name (ARN).
    #
    # @option params [String] :source_type
    #   A filter that returns only associations with the specified source
    #   type.
    #
    # @option params [String] :destination_type
    #   A filter that returns only associations with the specified destination
    #   type.
    #
    # @option params [String] :association_type
    #   A filter that returns only associations of the specified type.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only associations created on or after the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only associations created on or before the
    #   specified time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListAssociations` didn't return the full set
    #   of associations, the call returns a token for getting the next set of
    #   associations.
    #
    # @option params [Integer] :max_results
    #   The maximum number of associations to return in the response. The
    #   default value is 10.
    #
    # @return [Types::ListAssociationsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListAssociationsResponse#association_summaries #association_summaries} => Array&lt;Types::AssociationSummary&gt;
    #   * {Types::ListAssociationsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_associations({
    #     source_arn: "AssociationEntityArn",
    #     destination_arn: "AssociationEntityArn",
    #     source_type: "String256",
    #     destination_type: "String256",
    #     association_type: "ContributedTo", # accepts ContributedTo, AssociatedWith, DerivedFrom, Produced
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "SourceArn", # accepts SourceArn, DestinationArn, SourceType, DestinationType, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.association_summaries #=> Array
    #   resp.association_summaries[0].source_arn #=> String
    #   resp.association_summaries[0].destination_arn #=> String
    #   resp.association_summaries[0].source_type #=> String
    #   resp.association_summaries[0].destination_type #=> String
    #   resp.association_summaries[0].association_type #=> String, one of "ContributedTo", "AssociatedWith", "DerivedFrom", "Produced"
    #   resp.association_summaries[0].source_name #=> String
    #   resp.association_summaries[0].destination_name #=> String
    #   resp.association_summaries[0].creation_time #=> Time
    #   resp.association_summaries[0].created_by.user_profile_arn #=> String
    #   resp.association_summaries[0].created_by.user_profile_name #=> String
    #   resp.association_summaries[0].created_by.domain_id #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListAssociations AWS API Documentation
    #
    # @overload list_associations(params = {})
    # @param [Hash] params ({})
    def list_associations(params = {}, options = {})
      req = build_request(:list_associations, params)
      req.send_request(options)
    end

    # Request a list of jobs.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   Request a list of jobs, using a filter for time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   Request a list of jobs, using a filter for time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   Request a list of jobs, using a filter for time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   Request a list of jobs, using a filter for time.
    #
    # @option params [String] :name_contains
    #   Request a list of jobs, using a search filter for name.
    #
    # @option params [String] :status_equals
    #   Request a list of jobs, using a filter for status.
    #
    # @option params [String] :sort_order
    #   The sort order for the results. The default is `Descending`.
    #
    # @option params [String] :sort_by
    #   The parameter by which to sort the results. The default is `Name`.
    #
    # @option params [Integer] :max_results
    #   Request a list of jobs up to a specified limit.
    #
    # @option params [String] :next_token
    #   If the previous response was truncated, you receive this token. Use it
    #   in your next request to receive the next set of results.
    #
    # @return [Types::ListAutoMLJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListAutoMLJobsResponse#auto_ml_job_summaries #auto_ml_job_summaries} => Array&lt;Types::AutoMLJobSummary&gt;
    #   * {Types::ListAutoMLJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_auto_ml_jobs({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "AutoMLNameContains",
    #     status_equals: "Completed", # accepts Completed, InProgress, Failed, Stopped, Stopping
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.auto_ml_job_summaries #=> Array
    #   resp.auto_ml_job_summaries[0].auto_ml_job_name #=> String
    #   resp.auto_ml_job_summaries[0].auto_ml_job_arn #=> String
    #   resp.auto_ml_job_summaries[0].auto_ml_job_status #=> String, one of "Completed", "InProgress", "Failed", "Stopped", "Stopping"
    #   resp.auto_ml_job_summaries[0].auto_ml_job_secondary_status #=> String, one of "Starting", "AnalyzingData", "FeatureEngineering", "ModelTuning", "MaxCandidatesReached", "Failed", "Stopped", "MaxAutoMLJobRuntimeReached", "Stopping", "CandidateDefinitionsGenerated", "GeneratingExplainabilityReport", "Completed", "ExplainabilityError", "DeployingModel", "ModelDeploymentError"
    #   resp.auto_ml_job_summaries[0].creation_time #=> Time
    #   resp.auto_ml_job_summaries[0].end_time #=> Time
    #   resp.auto_ml_job_summaries[0].last_modified_time #=> Time
    #   resp.auto_ml_job_summaries[0].failure_reason #=> String
    #   resp.auto_ml_job_summaries[0].partial_failure_reasons #=> Array
    #   resp.auto_ml_job_summaries[0].partial_failure_reasons[0].partial_failure_message #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListAutoMLJobs AWS API Documentation
    #
    # @overload list_auto_ml_jobs(params = {})
    # @param [Hash] params ({})
    def list_auto_ml_jobs(params = {}, options = {})
      req = build_request(:list_auto_ml_jobs, params)
      req.send_request(options)
    end

    # List the candidates created for the job.
    #
    # @option params [required, String] :auto_ml_job_name
    #   List the candidates created for the job by providing the job's name.
    #
    # @option params [String] :status_equals
    #   List the candidates for the job and filter by status.
    #
    # @option params [String] :candidate_name_equals
    #   List the candidates for the job and filter by candidate name.
    #
    # @option params [String] :sort_order
    #   The sort order for the results. The default is `Ascending`.
    #
    # @option params [String] :sort_by
    #   The parameter by which to sort the results. The default is
    #   `Descending`.
    #
    # @option params [Integer] :max_results
    #   List the job's candidates up to a specified limit.
    #
    # @option params [String] :next_token
    #   If the previous response was truncated, you receive this token. Use it
    #   in your next request to receive the next set of results.
    #
    # @return [Types::ListCandidatesForAutoMLJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListCandidatesForAutoMLJobResponse#candidates #candidates} => Array&lt;Types::AutoMLCandidate&gt;
    #   * {Types::ListCandidatesForAutoMLJobResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_candidates_for_auto_ml_job({
    #     auto_ml_job_name: "AutoMLJobName", # required
    #     status_equals: "Completed", # accepts Completed, InProgress, Failed, Stopped, Stopping
    #     candidate_name_equals: "CandidateName",
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     sort_by: "CreationTime", # accepts CreationTime, Status, FinalObjectiveMetricValue
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.candidates #=> Array
    #   resp.candidates[0].candidate_name #=> String
    #   resp.candidates[0].final_auto_ml_job_objective_metric.type #=> String, one of "Maximize", "Minimize"
    #   resp.candidates[0].final_auto_ml_job_objective_metric.metric_name #=> String, one of "Accuracy", "MSE", "F1", "F1macro", "AUC"
    #   resp.candidates[0].final_auto_ml_job_objective_metric.value #=> Float
    #   resp.candidates[0].objective_status #=> String, one of "Succeeded", "Pending", "Failed"
    #   resp.candidates[0].candidate_steps #=> Array
    #   resp.candidates[0].candidate_steps[0].candidate_step_type #=> String, one of "AWS::SageMaker::TrainingJob", "AWS::SageMaker::TransformJob", "AWS::SageMaker::ProcessingJob"
    #   resp.candidates[0].candidate_steps[0].candidate_step_arn #=> String
    #   resp.candidates[0].candidate_steps[0].candidate_step_name #=> String
    #   resp.candidates[0].candidate_status #=> String, one of "Completed", "InProgress", "Failed", "Stopped", "Stopping"
    #   resp.candidates[0].inference_containers #=> Array
    #   resp.candidates[0].inference_containers[0].image #=> String
    #   resp.candidates[0].inference_containers[0].model_data_url #=> String
    #   resp.candidates[0].inference_containers[0].environment #=> Hash
    #   resp.candidates[0].inference_containers[0].environment["EnvironmentKey"] #=> String
    #   resp.candidates[0].creation_time #=> Time
    #   resp.candidates[0].end_time #=> Time
    #   resp.candidates[0].last_modified_time #=> Time
    #   resp.candidates[0].failure_reason #=> String
    #   resp.candidates[0].candidate_properties.candidate_artifact_locations.explainability #=> String
    #   resp.candidates[0].candidate_properties.candidate_metrics #=> Array
    #   resp.candidates[0].candidate_properties.candidate_metrics[0].metric_name #=> String, one of "Accuracy", "MSE", "F1", "F1macro", "AUC"
    #   resp.candidates[0].candidate_properties.candidate_metrics[0].value #=> Float
    #   resp.candidates[0].candidate_properties.candidate_metrics[0].set #=> String, one of "Train", "Validation", "Test"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListCandidatesForAutoMLJob AWS API Documentation
    #
    # @overload list_candidates_for_auto_ml_job(params = {})
    # @param [Hash] params ({})
    def list_candidates_for_auto_ml_job(params = {}, options = {})
      req = build_request(:list_candidates_for_auto_ml_job, params)
      req.send_request(options)
    end

    # Gets a list of the Git repositories in your account.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only Git repositories that were created after
    #   the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only Git repositories that were created before
    #   the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only Git repositories that were last modified
    #   after the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only Git repositories that were last modified
    #   before the specified time.
    #
    # @option params [Integer] :max_results
    #   The maximum number of Git repositories to return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the Git repositories name. This filter returns only
    #   repositories whose name contains the specified string.
    #
    # @option params [String] :next_token
    #   If the result of a `ListCodeRepositoriesOutput` request was truncated,
    #   the response includes a `NextToken`. To get the next set of Git
    #   repositories, use the token in the next request.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `Name`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListCodeRepositoriesOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListCodeRepositoriesOutput#code_repository_summary_list #code_repository_summary_list} => Array&lt;Types::CodeRepositorySummary&gt;
    #   * {Types::ListCodeRepositoriesOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_code_repositories({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     max_results: 1,
    #     name_contains: "CodeRepositoryNameContains",
    #     next_token: "NextToken",
    #     sort_by: "Name", # accepts Name, CreationTime, LastModifiedTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.code_repository_summary_list #=> Array
    #   resp.code_repository_summary_list[0].code_repository_name #=> String
    #   resp.code_repository_summary_list[0].code_repository_arn #=> String
    #   resp.code_repository_summary_list[0].creation_time #=> Time
    #   resp.code_repository_summary_list[0].last_modified_time #=> Time
    #   resp.code_repository_summary_list[0].git_config.repository_url #=> String
    #   resp.code_repository_summary_list[0].git_config.branch #=> String
    #   resp.code_repository_summary_list[0].git_config.secret_arn #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListCodeRepositories AWS API Documentation
    #
    # @overload list_code_repositories(params = {})
    # @param [Hash] params ({})
    def list_code_repositories(params = {}, options = {})
      req = build_request(:list_code_repositories, params)
      req.send_request(options)
    end

    # Lists model compilation jobs that satisfy various filters.
    #
    # To create a model compilation job, use CreateCompilationJob. To get
    # information about a particular model compilation job you have created,
    # use DescribeCompilationJob.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListCompilationJobs` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of model compilation jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of model compilation jobs to return in the
    #   response.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns the model compilation jobs that were created
    #   after a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns the model compilation jobs that were created
    #   before a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns the model compilation jobs that were modified
    #   after a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns the model compilation jobs that were modified
    #   before a specified time.
    #
    # @option params [String] :name_contains
    #   A filter that returns the model compilation jobs whose name contains a
    #   specified string.
    #
    # @option params [String] :status_equals
    #   A filter that retrieves model compilation jobs with a specific
    #   DescribeCompilationJobResponse$CompilationJobStatus status.
    #
    # @option params [String] :sort_by
    #   The field by which to sort results. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListCompilationJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListCompilationJobsResponse#compilation_job_summaries #compilation_job_summaries} => Array&lt;Types::CompilationJobSummary&gt;
    #   * {Types::ListCompilationJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_compilation_jobs({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "NameContains",
    #     status_equals: "INPROGRESS", # accepts INPROGRESS, COMPLETED, FAILED, STARTING, STOPPING, STOPPED
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.compilation_job_summaries #=> Array
    #   resp.compilation_job_summaries[0].compilation_job_name #=> String
    #   resp.compilation_job_summaries[0].compilation_job_arn #=> String
    #   resp.compilation_job_summaries[0].creation_time #=> Time
    #   resp.compilation_job_summaries[0].compilation_start_time #=> Time
    #   resp.compilation_job_summaries[0].compilation_end_time #=> Time
    #   resp.compilation_job_summaries[0].compilation_target_device #=> String, one of "lambda", "ml_m4", "ml_m5", "ml_c4", "ml_c5", "ml_p2", "ml_p3", "ml_g4dn", "ml_inf1", "ml_eia2", "jetson_tx1", "jetson_tx2", "jetson_nano", "jetson_xavier", "rasp3b", "imx8qm", "deeplens", "rk3399", "rk3288", "aisage", "sbe_c", "qcs605", "qcs603", "sitara_am57x", "amba_cv22", "amba_cv25", "x86_win32", "x86_win64", "coreml", "jacinto_tda4vm", "imx8mplus"
    #   resp.compilation_job_summaries[0].compilation_target_platform_os #=> String, one of "ANDROID", "LINUX"
    #   resp.compilation_job_summaries[0].compilation_target_platform_arch #=> String, one of "X86_64", "X86", "ARM64", "ARM_EABI", "ARM_EABIHF"
    #   resp.compilation_job_summaries[0].compilation_target_platform_accelerator #=> String, one of "INTEL_GRAPHICS", "MALI", "NVIDIA"
    #   resp.compilation_job_summaries[0].last_modified_time #=> Time
    #   resp.compilation_job_summaries[0].compilation_job_status #=> String, one of "INPROGRESS", "COMPLETED", "FAILED", "STARTING", "STOPPING", "STOPPED"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListCompilationJobs AWS API Documentation
    #
    # @overload list_compilation_jobs(params = {})
    # @param [Hash] params ({})
    def list_compilation_jobs(params = {}, options = {})
      req = build_request(:list_compilation_jobs, params)
      req.send_request(options)
    end

    # Lists the contexts in your account and their properties.
    #
    # @option params [String] :source_uri
    #   A filter that returns only contexts with the specified source URI.
    #
    # @option params [String] :context_type
    #   A filter that returns only contexts of the specified type.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only contexts created on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only contexts created on or before the specified
    #   time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListContexts` didn't return the full set of
    #   contexts, the call returns a token for getting the next set of
    #   contexts.
    #
    # @option params [Integer] :max_results
    #   The maximum number of contexts to return in the response. The default
    #   value is 10.
    #
    # @return [Types::ListContextsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListContextsResponse#context_summaries #context_summaries} => Array&lt;Types::ContextSummary&gt;
    #   * {Types::ListContextsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_contexts({
    #     source_uri: "SourceUri",
    #     context_type: "String256",
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.context_summaries #=> Array
    #   resp.context_summaries[0].context_arn #=> String
    #   resp.context_summaries[0].context_name #=> String
    #   resp.context_summaries[0].source.source_uri #=> String
    #   resp.context_summaries[0].source.source_type #=> String
    #   resp.context_summaries[0].source.source_id #=> String
    #   resp.context_summaries[0].context_type #=> String
    #   resp.context_summaries[0].creation_time #=> Time
    #   resp.context_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListContexts AWS API Documentation
    #
    # @overload list_contexts(params = {})
    # @param [Hash] params ({})
    def list_contexts(params = {}, options = {})
      req = build_request(:list_contexts, params)
      req.send_request(options)
    end

    # Lists the data quality job definitions in your account.
    #
    # @option params [String] :endpoint_name
    #   A filter that lists the data quality job definitions associated with
    #   the specified endpoint.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListDataQualityJobDefinitions` request
    #   was truncated, the response includes a `NextToken`. To retrieve the
    #   next set of transform jobs, use the token in the next request.&gt;
    #
    # @option params [Integer] :max_results
    #   The maximum number of data quality monitoring job definitions to
    #   return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the data quality monitoring job definition name. This
    #   filter returns only data quality monitoring job definitions whose name
    #   contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only data quality monitoring job definitions
    #   created before the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only data quality monitoring job definitions
    #   created after the specified time.
    #
    # @return [Types::ListDataQualityJobDefinitionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListDataQualityJobDefinitionsResponse#job_definition_summaries #job_definition_summaries} => Array&lt;Types::MonitoringJobDefinitionSummary&gt;
    #   * {Types::ListDataQualityJobDefinitionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_data_quality_job_definitions({
    #     endpoint_name: "EndpointName",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_summaries #=> Array
    #   resp.job_definition_summaries[0].monitoring_job_definition_name #=> String
    #   resp.job_definition_summaries[0].monitoring_job_definition_arn #=> String
    #   resp.job_definition_summaries[0].creation_time #=> Time
    #   resp.job_definition_summaries[0].endpoint_name #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListDataQualityJobDefinitions AWS API Documentation
    #
    # @overload list_data_quality_job_definitions(params = {})
    # @param [Hash] params ({})
    def list_data_quality_job_definitions(params = {}, options = {})
      req = build_request(:list_data_quality_job_definitions, params)
      req.send_request(options)
    end

    # Returns a list of devices in the fleet.
    #
    # @option params [String] :next_token
    #   The response from the last list when returning a list large enough to
    #   need tokening.
    #
    # @option params [Integer] :max_results
    #   The maximum number of results to select.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   Filter fleets where packaging job was created after specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   Filter fleets where the edge packaging job was created before
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   Select fleets where the job was updated after X
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   Select fleets where the job was updated before X
    #
    # @option params [String] :name_contains
    #   Filter for fleets containing this name in their fleet device name.
    #
    # @option params [String] :sort_by
    #   The column to sort by.
    #
    # @option params [String] :sort_order
    #   What direction to sort in.
    #
    # @return [Types::ListDeviceFleetsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListDeviceFleetsResponse#device_fleet_summaries #device_fleet_summaries} => Array&lt;Types::DeviceFleetSummary&gt;
    #   * {Types::ListDeviceFleetsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_device_fleets({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "NameContains",
    #     sort_by: "NAME", # accepts NAME, CREATION_TIME, LAST_MODIFIED_TIME
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.device_fleet_summaries #=> Array
    #   resp.device_fleet_summaries[0].device_fleet_arn #=> String
    #   resp.device_fleet_summaries[0].device_fleet_name #=> String
    #   resp.device_fleet_summaries[0].creation_time #=> Time
    #   resp.device_fleet_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListDeviceFleets AWS API Documentation
    #
    # @overload list_device_fleets(params = {})
    # @param [Hash] params ({})
    def list_device_fleets(params = {}, options = {})
      req = build_request(:list_device_fleets, params)
      req.send_request(options)
    end

    # A list of devices.
    #
    # @option params [String] :next_token
    #   The response from the last list when returning a list large enough to
    #   need tokening.
    #
    # @option params [Integer] :max_results
    #   Maximum number of results to select.
    #
    # @option params [Time,DateTime,Date,Integer,String] :latest_heartbeat_after
    #   Select fleets where the job was updated after X
    #
    # @option params [String] :model_name
    #   A filter that searches devices that contains this name in any of their
    #   models.
    #
    # @option params [String] :device_fleet_name
    #   Filter for fleets containing this name in their device fleet name.
    #
    # @return [Types::ListDevicesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListDevicesResponse#device_summaries #device_summaries} => Array&lt;Types::DeviceSummary&gt;
    #   * {Types::ListDevicesResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_devices({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     latest_heartbeat_after: Time.now,
    #     model_name: "EntityName",
    #     device_fleet_name: "EntityName",
    #   })
    #
    # @example Response structure
    #
    #   resp.device_summaries #=> Array
    #   resp.device_summaries[0].device_name #=> String
    #   resp.device_summaries[0].device_arn #=> String
    #   resp.device_summaries[0].description #=> String
    #   resp.device_summaries[0].device_fleet_name #=> String
    #   resp.device_summaries[0].iot_thing_name #=> String
    #   resp.device_summaries[0].registration_time #=> Time
    #   resp.device_summaries[0].latest_heartbeat #=> Time
    #   resp.device_summaries[0].models #=> Array
    #   resp.device_summaries[0].models[0].model_name #=> String
    #   resp.device_summaries[0].models[0].model_version #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListDevices AWS API Documentation
    #
    # @overload list_devices(params = {})
    # @param [Hash] params ({})
    def list_devices(params = {}, options = {})
      req = build_request(:list_devices, params)
      req.send_request(options)
    end

    # Lists the domains.
    #
    # @option params [String] :next_token
    #   If the previous response was truncated, you will receive this token.
    #   Use it in your next request to receive the next set of results.
    #
    # @option params [Integer] :max_results
    #   Returns a list up to a specified limit.
    #
    # @return [Types::ListDomainsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListDomainsResponse#domains #domains} => Array&lt;Types::DomainDetails&gt;
    #   * {Types::ListDomainsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_domains({
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.domains #=> Array
    #   resp.domains[0].domain_arn #=> String
    #   resp.domains[0].domain_id #=> String
    #   resp.domains[0].domain_name #=> String
    #   resp.domains[0].status #=> String, one of "Deleting", "Failed", "InService", "Pending", "Updating", "Update_Failed", "Delete_Failed"
    #   resp.domains[0].creation_time #=> Time
    #   resp.domains[0].last_modified_time #=> Time
    #   resp.domains[0].url #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListDomains AWS API Documentation
    #
    # @overload list_domains(params = {})
    # @param [Hash] params ({})
    def list_domains(params = {}, options = {})
      req = build_request(:list_domains, params)
      req.send_request(options)
    end

    # Returns a list of edge packaging jobs.
    #
    # @option params [String] :next_token
    #   The response from the last list when returning a list large enough to
    #   need tokening.
    #
    # @option params [Integer] :max_results
    #   Maximum number of results to select.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   Select jobs where the job was created after specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   Select jobs where the job was created before specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   Select jobs where the job was updated after specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   Select jobs where the job was updated before specified time.
    #
    # @option params [String] :name_contains
    #   Filter for jobs containing this name in their packaging job name.
    #
    # @option params [String] :model_name_contains
    #   Filter for jobs where the model name contains this string.
    #
    # @option params [String] :status_equals
    #   The job status to filter for.
    #
    # @option params [String] :sort_by
    #   Use to specify what column to sort by.
    #
    # @option params [String] :sort_order
    #   What direction to sort by.
    #
    # @return [Types::ListEdgePackagingJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListEdgePackagingJobsResponse#edge_packaging_job_summaries #edge_packaging_job_summaries} => Array&lt;Types::EdgePackagingJobSummary&gt;
    #   * {Types::ListEdgePackagingJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_edge_packaging_jobs({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "NameContains",
    #     model_name_contains: "NameContains",
    #     status_equals: "STARTING", # accepts STARTING, INPROGRESS, COMPLETED, FAILED, STOPPING, STOPPED
    #     sort_by: "NAME", # accepts NAME, MODEL_NAME, CREATION_TIME, LAST_MODIFIED_TIME, STATUS
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.edge_packaging_job_summaries #=> Array
    #   resp.edge_packaging_job_summaries[0].edge_packaging_job_arn #=> String
    #   resp.edge_packaging_job_summaries[0].edge_packaging_job_name #=> String
    #   resp.edge_packaging_job_summaries[0].edge_packaging_job_status #=> String, one of "STARTING", "INPROGRESS", "COMPLETED", "FAILED", "STOPPING", "STOPPED"
    #   resp.edge_packaging_job_summaries[0].compilation_job_name #=> String
    #   resp.edge_packaging_job_summaries[0].model_name #=> String
    #   resp.edge_packaging_job_summaries[0].model_version #=> String
    #   resp.edge_packaging_job_summaries[0].creation_time #=> Time
    #   resp.edge_packaging_job_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListEdgePackagingJobs AWS API Documentation
    #
    # @overload list_edge_packaging_jobs(params = {})
    # @param [Hash] params ({})
    def list_edge_packaging_jobs(params = {}, options = {})
      req = build_request(:list_edge_packaging_jobs, params)
      req.send_request(options)
    end

    # Lists endpoint configurations.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListEndpointConfig` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of endpoint configurations, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of training jobs to return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the endpoint configuration name. This filter returns only
    #   endpoint configurations whose name contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only endpoint configurations created before the
    #   specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only endpoint configurations with a creation
    #   time greater than or equal to the specified time (timestamp).
    #
    # @return [Types::ListEndpointConfigsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListEndpointConfigsOutput#endpoint_configs #endpoint_configs} => Array&lt;Types::EndpointConfigSummary&gt;
    #   * {Types::ListEndpointConfigsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_endpoint_configs({
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "PaginationToken",
    #     max_results: 1,
    #     name_contains: "EndpointConfigNameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_configs #=> Array
    #   resp.endpoint_configs[0].endpoint_config_name #=> String
    #   resp.endpoint_configs[0].endpoint_config_arn #=> String
    #   resp.endpoint_configs[0].creation_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListEndpointConfigs AWS API Documentation
    #
    # @overload list_endpoint_configs(params = {})
    # @param [Hash] params ({})
    def list_endpoint_configs(params = {}, options = {})
      req = build_request(:list_endpoint_configs, params)
      req.send_request(options)
    end

    # Lists endpoints.
    #
    # @option params [String] :sort_by
    #   Sorts the list of results. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If the result of a `ListEndpoints` request was truncated, the response
    #   includes a `NextToken`. To retrieve the next set of endpoints, use the
    #   token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of endpoints to return in the response. This value
    #   defaults to 10.
    #
    # @option params [String] :name_contains
    #   A string in endpoint names. This filter returns only endpoints whose
    #   name contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only endpoints that were created before the
    #   specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only endpoints with a creation time greater than
    #   or equal to the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only endpoints that were modified before the
    #   specified timestamp.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only endpoints that were modified after the
    #   specified timestamp.
    #
    # @option params [String] :status_equals
    #   A filter that returns only endpoints with the specified status.
    #
    # @return [Types::ListEndpointsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListEndpointsOutput#endpoints #endpoints} => Array&lt;Types::EndpointSummary&gt;
    #   * {Types::ListEndpointsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_endpoints({
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "PaginationToken",
    #     max_results: 1,
    #     name_contains: "EndpointNameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     status_equals: "OutOfService", # accepts OutOfService, Creating, Updating, SystemUpdating, RollingBack, InService, Deleting, Failed
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoints #=> Array
    #   resp.endpoints[0].endpoint_name #=> String
    #   resp.endpoints[0].endpoint_arn #=> String
    #   resp.endpoints[0].creation_time #=> Time
    #   resp.endpoints[0].last_modified_time #=> Time
    #   resp.endpoints[0].endpoint_status #=> String, one of "OutOfService", "Creating", "Updating", "SystemUpdating", "RollingBack", "InService", "Deleting", "Failed"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListEndpoints AWS API Documentation
    #
    # @overload list_endpoints(params = {})
    # @param [Hash] params ({})
    def list_endpoints(params = {}, options = {})
      req = build_request(:list_endpoints, params)
      req.send_request(options)
    end

    # Lists all the experiments in your account. The list can be filtered to
    # show only experiments that were created in a specific time range. The
    # list can be sorted by experiment name or creation time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only experiments created after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only experiments created before the specified
    #   time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListExperiments` didn't return the full set
    #   of experiments, the call returns a token for getting the next set of
    #   experiments.
    #
    # @option params [Integer] :max_results
    #   The maximum number of experiments to return in the response. The
    #   default value is 10.
    #
    # @return [Types::ListExperimentsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListExperimentsResponse#experiment_summaries #experiment_summaries} => Array&lt;Types::ExperimentSummary&gt;
    #   * {Types::ListExperimentsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_experiments({
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.experiment_summaries #=> Array
    #   resp.experiment_summaries[0].experiment_arn #=> String
    #   resp.experiment_summaries[0].experiment_name #=> String
    #   resp.experiment_summaries[0].display_name #=> String
    #   resp.experiment_summaries[0].experiment_source.source_arn #=> String
    #   resp.experiment_summaries[0].experiment_source.source_type #=> String
    #   resp.experiment_summaries[0].creation_time #=> Time
    #   resp.experiment_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListExperiments AWS API Documentation
    #
    # @overload list_experiments(params = {})
    # @param [Hash] params ({})
    def list_experiments(params = {}, options = {})
      req = build_request(:list_experiments, params)
      req.send_request(options)
    end

    # List `FeatureGroup`s based on given filter and order.
    #
    # @option params [String] :name_contains
    #   A string that partially matches one or more `FeatureGroup`s names.
    #   Filters `FeatureGroup`s by name.
    #
    # @option params [String] :feature_group_status_equals
    #   A `FeatureGroup` status. Filters by `FeatureGroup` status.
    #
    # @option params [String] :offline_store_status_equals
    #   An `OfflineStore` status. Filters by `OfflineStore` status.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   Use this parameter to search for `FeatureGroups`s created after a
    #   specific date and time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   Use this parameter to search for `FeatureGroups`s created before a
    #   specific date and time.
    #
    # @option params [String] :sort_order
    #   The order in which feature groups are listed.
    #
    # @option params [String] :sort_by
    #   The value on which the feature group list is sorted.
    #
    # @option params [Integer] :max_results
    #   The maximum number of results returned by `ListFeatureGroups`.
    #
    # @option params [String] :next_token
    #   A token to resume pagination of `ListFeatureGroups` results.
    #
    # @return [Types::ListFeatureGroupsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListFeatureGroupsResponse#feature_group_summaries #feature_group_summaries} => Array&lt;Types::FeatureGroupSummary&gt;
    #   * {Types::ListFeatureGroupsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_feature_groups({
    #     name_contains: "FeatureGroupNameContains",
    #     feature_group_status_equals: "Creating", # accepts Creating, Created, CreateFailed, Deleting, DeleteFailed
    #     offline_store_status_equals: "Active", # accepts Active, Blocked, Disabled
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     sort_by: "Name", # accepts Name, FeatureGroupStatus, OfflineStoreStatus, CreationTime
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.feature_group_summaries #=> Array
    #   resp.feature_group_summaries[0].feature_group_name #=> String
    #   resp.feature_group_summaries[0].feature_group_arn #=> String
    #   resp.feature_group_summaries[0].creation_time #=> Time
    #   resp.feature_group_summaries[0].feature_group_status #=> String, one of "Creating", "Created", "CreateFailed", "Deleting", "DeleteFailed"
    #   resp.feature_group_summaries[0].offline_store_status.status #=> String, one of "Active", "Blocked", "Disabled"
    #   resp.feature_group_summaries[0].offline_store_status.blocked_reason #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListFeatureGroups AWS API Documentation
    #
    # @overload list_feature_groups(params = {})
    # @param [Hash] params ({})
    def list_feature_groups(params = {}, options = {})
      req = build_request(:list_feature_groups, params)
      req.send_request(options)
    end

    # Returns information about the flow definitions in your account.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only flow definitions with a creation time
    #   greater than or equal to the specified timestamp.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only flow definitions that were created before
    #   the specified timestamp.
    #
    # @option params [String] :sort_order
    #   An optional value that specifies whether you want the results sorted
    #   in `Ascending` or `Descending` order.
    #
    # @option params [String] :next_token
    #   A token to resume pagination.
    #
    # @option params [Integer] :max_results
    #   The total number of items to return. If the total number of available
    #   items is more than the value specified in `MaxResults`, then a
    #   `NextToken` will be provided in the output that you can use to resume
    #   pagination.
    #
    # @return [Types::ListFlowDefinitionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListFlowDefinitionsResponse#flow_definition_summaries #flow_definition_summaries} => Array&lt;Types::FlowDefinitionSummary&gt;
    #   * {Types::ListFlowDefinitionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_flow_definitions({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.flow_definition_summaries #=> Array
    #   resp.flow_definition_summaries[0].flow_definition_name #=> String
    #   resp.flow_definition_summaries[0].flow_definition_arn #=> String
    #   resp.flow_definition_summaries[0].flow_definition_status #=> String, one of "Initializing", "Active", "Failed", "Deleting"
    #   resp.flow_definition_summaries[0].creation_time #=> Time
    #   resp.flow_definition_summaries[0].failure_reason #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListFlowDefinitions AWS API Documentation
    #
    # @overload list_flow_definitions(params = {})
    # @param [Hash] params ({})
    def list_flow_definitions(params = {}, options = {})
      req = build_request(:list_flow_definitions, params)
      req.send_request(options)
    end

    # Returns information about the human task user interfaces in your
    # account.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only human task user interfaces with a creation
    #   time greater than or equal to the specified timestamp.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only human task user interfaces that were
    #   created before the specified timestamp.
    #
    # @option params [String] :sort_order
    #   An optional value that specifies whether you want the results sorted
    #   in `Ascending` or `Descending` order.
    #
    # @option params [String] :next_token
    #   A token to resume pagination.
    #
    # @option params [Integer] :max_results
    #   The total number of items to return. If the total number of available
    #   items is more than the value specified in `MaxResults`, then a
    #   `NextToken` will be provided in the output that you can use to resume
    #   pagination.
    #
    # @return [Types::ListHumanTaskUisResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListHumanTaskUisResponse#human_task_ui_summaries #human_task_ui_summaries} => Array&lt;Types::HumanTaskUiSummary&gt;
    #   * {Types::ListHumanTaskUisResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_human_task_uis({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.human_task_ui_summaries #=> Array
    #   resp.human_task_ui_summaries[0].human_task_ui_name #=> String
    #   resp.human_task_ui_summaries[0].human_task_ui_arn #=> String
    #   resp.human_task_ui_summaries[0].creation_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListHumanTaskUis AWS API Documentation
    #
    # @overload list_human_task_uis(params = {})
    # @param [Hash] params ({})
    def list_human_task_uis(params = {}, options = {})
      req = build_request(:list_human_task_uis, params)
      req.send_request(options)
    end

    # Gets a list of HyperParameterTuningJobSummary objects that describe
    # the hyperparameter tuning jobs launched in your account.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListHyperParameterTuningJobs` request
    #   was truncated, the response includes a `NextToken`. To retrieve the
    #   next set of tuning jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of tuning jobs to return. The default value is 10.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `Name`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @option params [String] :name_contains
    #   A string in the tuning job name. This filter returns only tuning jobs
    #   whose name contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only tuning jobs that were created after the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only tuning jobs that were created before the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only tuning jobs that were modified after the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only tuning jobs that were modified before the
    #   specified time.
    #
    # @option params [String] :status_equals
    #   A filter that returns only tuning jobs with the specified status.
    #
    # @return [Types::ListHyperParameterTuningJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListHyperParameterTuningJobsResponse#hyper_parameter_tuning_job_summaries #hyper_parameter_tuning_job_summaries} => Array&lt;Types::HyperParameterTuningJobSummary&gt;
    #   * {Types::ListHyperParameterTuningJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_hyper_parameter_tuning_jobs({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     sort_by: "Name", # accepts Name, Status, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     name_contains: "NameContains",
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     status_equals: "Completed", # accepts Completed, InProgress, Failed, Stopped, Stopping
    #   })
    #
    # @example Response structure
    #
    #   resp.hyper_parameter_tuning_job_summaries #=> Array
    #   resp.hyper_parameter_tuning_job_summaries[0].hyper_parameter_tuning_job_name #=> String
    #   resp.hyper_parameter_tuning_job_summaries[0].hyper_parameter_tuning_job_arn #=> String
    #   resp.hyper_parameter_tuning_job_summaries[0].hyper_parameter_tuning_job_status #=> String, one of "Completed", "InProgress", "Failed", "Stopped", "Stopping"
    #   resp.hyper_parameter_tuning_job_summaries[0].strategy #=> String, one of "Bayesian", "Random"
    #   resp.hyper_parameter_tuning_job_summaries[0].creation_time #=> Time
    #   resp.hyper_parameter_tuning_job_summaries[0].hyper_parameter_tuning_end_time #=> Time
    #   resp.hyper_parameter_tuning_job_summaries[0].last_modified_time #=> Time
    #   resp.hyper_parameter_tuning_job_summaries[0].training_job_status_counters.completed #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].training_job_status_counters.in_progress #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].training_job_status_counters.retryable_error #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].training_job_status_counters.non_retryable_error #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].training_job_status_counters.stopped #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].objective_status_counters.succeeded #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].objective_status_counters.pending #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].objective_status_counters.failed #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].resource_limits.max_number_of_training_jobs #=> Integer
    #   resp.hyper_parameter_tuning_job_summaries[0].resource_limits.max_parallel_training_jobs #=> Integer
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListHyperParameterTuningJobs AWS API Documentation
    #
    # @overload list_hyper_parameter_tuning_jobs(params = {})
    # @param [Hash] params ({})
    def list_hyper_parameter_tuning_jobs(params = {}, options = {})
      req = build_request(:list_hyper_parameter_tuning_jobs, params)
      req.send_request(options)
    end

    # Lists the versions of a specified image and their properties. The list
    # can be filtered by creation time or modified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only versions created on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only versions created on or before the specified
    #   time.
    #
    # @option params [required, String] :image_name
    #   The name of the image to list the versions of.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only versions modified on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only versions modified on or before the
    #   specified time.
    #
    # @option params [Integer] :max_results
    #   The maximum number of versions to return in the response. The default
    #   value is 10.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListImageVersions` didn't return the full
    #   set of versions, the call returns a token for getting the next set of
    #   versions.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CREATION_TIME`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `DESCENDING`.
    #
    # @return [Types::ListImageVersionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListImageVersionsResponse#image_versions #image_versions} => Array&lt;Types::ImageVersion&gt;
    #   * {Types::ListImageVersionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_image_versions({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     image_name: "ImageName", # required
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     max_results: 1,
    #     next_token: "NextToken",
    #     sort_by: "CREATION_TIME", # accepts CREATION_TIME, LAST_MODIFIED_TIME, VERSION
    #     sort_order: "ASCENDING", # accepts ASCENDING, DESCENDING
    #   })
    #
    # @example Response structure
    #
    #   resp.image_versions #=> Array
    #   resp.image_versions[0].creation_time #=> Time
    #   resp.image_versions[0].failure_reason #=> String
    #   resp.image_versions[0].image_arn #=> String
    #   resp.image_versions[0].image_version_arn #=> String
    #   resp.image_versions[0].image_version_status #=> String, one of "CREATING", "CREATED", "CREATE_FAILED", "DELETING", "DELETE_FAILED"
    #   resp.image_versions[0].last_modified_time #=> Time
    #   resp.image_versions[0].version #=> Integer
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListImageVersions AWS API Documentation
    #
    # @overload list_image_versions(params = {})
    # @param [Hash] params ({})
    def list_image_versions(params = {}, options = {})
      req = build_request(:list_image_versions, params)
      req.send_request(options)
    end

    # Lists the images in your account and their properties. The list can be
    # filtered by creation time or modified time, and whether the image name
    # contains a specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only images created on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only images created on or before the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only images modified on or after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only images modified on or before the specified
    #   time.
    #
    # @option params [Integer] :max_results
    #   The maximum number of images to return in the response. The default
    #   value is 10.
    #
    # @option params [String] :name_contains
    #   A filter that returns only images whose name contains the specified
    #   string.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListImages` didn't return the full set of
    #   images, the call returns a token for getting the next set of images.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CREATION_TIME`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `DESCENDING`.
    #
    # @return [Types::ListImagesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListImagesResponse#images #images} => Array&lt;Types::Image&gt;
    #   * {Types::ListImagesResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_images({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     max_results: 1,
    #     name_contains: "ImageNameContains",
    #     next_token: "NextToken",
    #     sort_by: "CREATION_TIME", # accepts CREATION_TIME, LAST_MODIFIED_TIME, IMAGE_NAME
    #     sort_order: "ASCENDING", # accepts ASCENDING, DESCENDING
    #   })
    #
    # @example Response structure
    #
    #   resp.images #=> Array
    #   resp.images[0].creation_time #=> Time
    #   resp.images[0].description #=> String
    #   resp.images[0].display_name #=> String
    #   resp.images[0].failure_reason #=> String
    #   resp.images[0].image_arn #=> String
    #   resp.images[0].image_name #=> String
    #   resp.images[0].image_status #=> String, one of "CREATING", "CREATED", "CREATE_FAILED", "UPDATING", "UPDATE_FAILED", "DELETING", "DELETE_FAILED"
    #   resp.images[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListImages AWS API Documentation
    #
    # @overload list_images(params = {})
    # @param [Hash] params ({})
    def list_images(params = {}, options = {})
      req = build_request(:list_images, params)
      req.send_request(options)
    end

    # Gets a list of labeling jobs.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only labeling jobs created after the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only labeling jobs created before the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only labeling jobs modified after the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only labeling jobs modified before the specified
    #   time (timestamp).
    #
    # @option params [Integer] :max_results
    #   The maximum number of labeling jobs to return in each page of the
    #   response.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListLabelingJobs` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of labeling jobs, use the token in the next request.
    #
    # @option params [String] :name_contains
    #   A string in the labeling job name. This filter returns only labeling
    #   jobs whose name contains the specified string.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @option params [String] :status_equals
    #   A filter that retrieves only labeling jobs with a specific status.
    #
    # @return [Types::ListLabelingJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListLabelingJobsResponse#labeling_job_summary_list #labeling_job_summary_list} => Array&lt;Types::LabelingJobSummary&gt;
    #   * {Types::ListLabelingJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_labeling_jobs({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     max_results: 1,
    #     next_token: "NextToken",
    #     name_contains: "NameContains",
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     status_equals: "Initializing", # accepts Initializing, InProgress, Completed, Failed, Stopping, Stopped
    #   })
    #
    # @example Response structure
    #
    #   resp.labeling_job_summary_list #=> Array
    #   resp.labeling_job_summary_list[0].labeling_job_name #=> String
    #   resp.labeling_job_summary_list[0].labeling_job_arn #=> String
    #   resp.labeling_job_summary_list[0].creation_time #=> Time
    #   resp.labeling_job_summary_list[0].last_modified_time #=> Time
    #   resp.labeling_job_summary_list[0].labeling_job_status #=> String, one of "Initializing", "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.labeling_job_summary_list[0].label_counters.total_labeled #=> Integer
    #   resp.labeling_job_summary_list[0].label_counters.human_labeled #=> Integer
    #   resp.labeling_job_summary_list[0].label_counters.machine_labeled #=> Integer
    #   resp.labeling_job_summary_list[0].label_counters.failed_non_retryable_error #=> Integer
    #   resp.labeling_job_summary_list[0].label_counters.unlabeled #=> Integer
    #   resp.labeling_job_summary_list[0].workteam_arn #=> String
    #   resp.labeling_job_summary_list[0].pre_human_task_lambda_arn #=> String
    #   resp.labeling_job_summary_list[0].annotation_consolidation_lambda_arn #=> String
    #   resp.labeling_job_summary_list[0].failure_reason #=> String
    #   resp.labeling_job_summary_list[0].labeling_job_output.output_dataset_s3_uri #=> String
    #   resp.labeling_job_summary_list[0].labeling_job_output.final_active_learning_model_arn #=> String
    #   resp.labeling_job_summary_list[0].input_config.data_source.s3_data_source.manifest_s3_uri #=> String
    #   resp.labeling_job_summary_list[0].input_config.data_source.sns_data_source.sns_topic_arn #=> String
    #   resp.labeling_job_summary_list[0].input_config.data_attributes.content_classifiers #=> Array
    #   resp.labeling_job_summary_list[0].input_config.data_attributes.content_classifiers[0] #=> String, one of "FreeOfPersonallyIdentifiableInformation", "FreeOfAdultContent"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListLabelingJobs AWS API Documentation
    #
    # @overload list_labeling_jobs(params = {})
    # @param [Hash] params ({})
    def list_labeling_jobs(params = {}, options = {})
      req = build_request(:list_labeling_jobs, params)
      req.send_request(options)
    end

    # Gets a list of labeling jobs assigned to a specified work team.
    #
    # @option params [required, String] :workteam_arn
    #   The Amazon Resource Name (ARN) of the work team for which you want to
    #   see labeling jobs for.
    #
    # @option params [Integer] :max_results
    #   The maximum number of labeling jobs to return in each page of the
    #   response.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListLabelingJobsForWorkteam` request
    #   was truncated, the response includes a `NextToken`. To retrieve the
    #   next set of labeling jobs, use the token in the next request.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only labeling jobs created after the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only labeling jobs created before the specified
    #   time (timestamp).
    #
    # @option params [String] :job_reference_code_contains
    #   A filter the limits jobs to only the ones whose job reference code
    #   contains the specified string.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListLabelingJobsForWorkteamResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListLabelingJobsForWorkteamResponse#labeling_job_summary_list #labeling_job_summary_list} => Array&lt;Types::LabelingJobForWorkteamSummary&gt;
    #   * {Types::ListLabelingJobsForWorkteamResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_labeling_jobs_for_workteam({
    #     workteam_arn: "WorkteamArn", # required
    #     max_results: 1,
    #     next_token: "NextToken",
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     job_reference_code_contains: "JobReferenceCodeContains",
    #     sort_by: "CreationTime", # accepts CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.labeling_job_summary_list #=> Array
    #   resp.labeling_job_summary_list[0].labeling_job_name #=> String
    #   resp.labeling_job_summary_list[0].job_reference_code #=> String
    #   resp.labeling_job_summary_list[0].work_requester_account_id #=> String
    #   resp.labeling_job_summary_list[0].creation_time #=> Time
    #   resp.labeling_job_summary_list[0].label_counters.human_labeled #=> Integer
    #   resp.labeling_job_summary_list[0].label_counters.pending_human #=> Integer
    #   resp.labeling_job_summary_list[0].label_counters.total #=> Integer
    #   resp.labeling_job_summary_list[0].number_of_human_workers_per_data_object #=> Integer
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListLabelingJobsForWorkteam AWS API Documentation
    #
    # @overload list_labeling_jobs_for_workteam(params = {})
    # @param [Hash] params ({})
    def list_labeling_jobs_for_workteam(params = {}, options = {})
      req = build_request(:list_labeling_jobs_for_workteam, params)
      req.send_request(options)
    end

    # Lists model bias jobs definitions that satisfy various filters.
    #
    # @option params [String] :endpoint_name
    #   Name of the endpoint to monitor for model bias.
    #
    # @option params [String] :sort_by
    #   Whether to sort results by the `Name` or `CreationTime` field. The
    #   default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   Whether to sort the results in `Ascending` or `Descending` order. The
    #   default is `Descending`.
    #
    # @option params [String] :next_token
    #   The token returned if the response is truncated. To retrieve the next
    #   set of job executions, use it in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of model bias jobs to return in the response. The
    #   default value is 10.
    #
    # @option params [String] :name_contains
    #   Filter for model bias jobs whose name contains a specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only model bias jobs created before a specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only model bias jobs created after a specified
    #   time.
    #
    # @return [Types::ListModelBiasJobDefinitionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListModelBiasJobDefinitionsResponse#job_definition_summaries #job_definition_summaries} => Array&lt;Types::MonitoringJobDefinitionSummary&gt;
    #   * {Types::ListModelBiasJobDefinitionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_model_bias_job_definitions({
    #     endpoint_name: "EndpointName",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_summaries #=> Array
    #   resp.job_definition_summaries[0].monitoring_job_definition_name #=> String
    #   resp.job_definition_summaries[0].monitoring_job_definition_arn #=> String
    #   resp.job_definition_summaries[0].creation_time #=> Time
    #   resp.job_definition_summaries[0].endpoint_name #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListModelBiasJobDefinitions AWS API Documentation
    #
    # @overload list_model_bias_job_definitions(params = {})
    # @param [Hash] params ({})
    def list_model_bias_job_definitions(params = {}, options = {})
      req = build_request(:list_model_bias_job_definitions, params)
      req.send_request(options)
    end

    # Lists model explainability job definitions that satisfy various
    # filters.
    #
    # @option params [String] :endpoint_name
    #   Name of the endpoint to monitor for model explainability.
    #
    # @option params [String] :sort_by
    #   Whether to sort results by the `Name` or `CreationTime` field. The
    #   default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   Whether to sort the results in `Ascending` or `Descending` order. The
    #   default is `Descending`.
    #
    # @option params [String] :next_token
    #   The token returned if the response is truncated. To retrieve the next
    #   set of job executions, use it in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of jobs to return in the response. The default
    #   value is 10.
    #
    # @option params [String] :name_contains
    #   Filter for model explainability jobs whose name contains a specified
    #   string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only model explainability jobs created before a
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only model explainability jobs created after a
    #   specified time.
    #
    # @return [Types::ListModelExplainabilityJobDefinitionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListModelExplainabilityJobDefinitionsResponse#job_definition_summaries #job_definition_summaries} => Array&lt;Types::MonitoringJobDefinitionSummary&gt;
    #   * {Types::ListModelExplainabilityJobDefinitionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_model_explainability_job_definitions({
    #     endpoint_name: "EndpointName",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_summaries #=> Array
    #   resp.job_definition_summaries[0].monitoring_job_definition_name #=> String
    #   resp.job_definition_summaries[0].monitoring_job_definition_arn #=> String
    #   resp.job_definition_summaries[0].creation_time #=> Time
    #   resp.job_definition_summaries[0].endpoint_name #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListModelExplainabilityJobDefinitions AWS API Documentation
    #
    # @overload list_model_explainability_job_definitions(params = {})
    # @param [Hash] params ({})
    def list_model_explainability_job_definitions(params = {}, options = {})
      req = build_request(:list_model_explainability_job_definitions, params)
      req.send_request(options)
    end

    # Gets a list of the model groups in your Amazon Web Services account.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only model groups created after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only model groups created before the specified
    #   time.
    #
    # @option params [Integer] :max_results
    #   The maximum number of results to return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the model group name. This filter returns only model
    #   groups whose name contains the specified string.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListModelPackageGroups` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of model groups, use the token in the next request.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListModelPackageGroupsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListModelPackageGroupsOutput#model_package_group_summary_list #model_package_group_summary_list} => Array&lt;Types::ModelPackageGroupSummary&gt;
    #   * {Types::ListModelPackageGroupsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_model_package_groups({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     next_token: "NextToken",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_group_summary_list #=> Array
    #   resp.model_package_group_summary_list[0].model_package_group_name #=> String
    #   resp.model_package_group_summary_list[0].model_package_group_arn #=> String
    #   resp.model_package_group_summary_list[0].model_package_group_description #=> String
    #   resp.model_package_group_summary_list[0].creation_time #=> Time
    #   resp.model_package_group_summary_list[0].model_package_group_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting", "DeleteFailed"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListModelPackageGroups AWS API Documentation
    #
    # @overload list_model_package_groups(params = {})
    # @param [Hash] params ({})
    def list_model_package_groups(params = {}, options = {})
      req = build_request(:list_model_package_groups, params)
      req.send_request(options)
    end

    # Lists the model packages that have been created.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only model packages created after the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only model packages created before the specified
    #   time (timestamp).
    #
    # @option params [Integer] :max_results
    #   The maximum number of model packages to return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the model package name. This filter returns only model
    #   packages whose name contains the specified string.
    #
    # @option params [String] :model_approval_status
    #   A filter that returns only the model packages with the specified
    #   approval status.
    #
    # @option params [String] :model_package_group_name
    #   A filter that returns only model versions that belong to the specified
    #   model group.
    #
    # @option params [String] :model_package_type
    #   A filter that returns onlyl the model packages of the specified type.
    #   This can be one of the following values.
    #
    #   * `VERSIONED` - List only versioned models.
    #
    #   * `UNVERSIONED` - List only unversioined models.
    #
    #   * `BOTH` - List both versioned and unversioned models.
    #
    # @option params [String] :next_token
    #   If the response to a previous `ListModelPackages` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of model packages, use the token in the next request.
    #
    # @option params [String] :sort_by
    #   The parameter by which to sort the results. The default is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for the results. The default is `Ascending`.
    #
    # @return [Types::ListModelPackagesOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListModelPackagesOutput#model_package_summary_list #model_package_summary_list} => Array&lt;Types::ModelPackageSummary&gt;
    #   * {Types::ListModelPackagesOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_model_packages({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     model_approval_status: "Approved", # accepts Approved, Rejected, PendingManualApproval
    #     model_package_group_name: "ArnOrName",
    #     model_package_type: "Versioned", # accepts Versioned, Unversioned, Both
    #     next_token: "NextToken",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_summary_list #=> Array
    #   resp.model_package_summary_list[0].model_package_name #=> String
    #   resp.model_package_summary_list[0].model_package_group_name #=> String
    #   resp.model_package_summary_list[0].model_package_version #=> Integer
    #   resp.model_package_summary_list[0].model_package_arn #=> String
    #   resp.model_package_summary_list[0].model_package_description #=> String
    #   resp.model_package_summary_list[0].creation_time #=> Time
    #   resp.model_package_summary_list[0].model_package_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting"
    #   resp.model_package_summary_list[0].model_approval_status #=> String, one of "Approved", "Rejected", "PendingManualApproval"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListModelPackages AWS API Documentation
    #
    # @overload list_model_packages(params = {})
    # @param [Hash] params ({})
    def list_model_packages(params = {}, options = {})
      req = build_request(:list_model_packages, params)
      req.send_request(options)
    end

    # Gets a list of model quality monitoring job definitions in your
    # account.
    #
    # @option params [String] :endpoint_name
    #   A filter that returns only model quality monitoring job definitions
    #   that are associated with the specified endpoint.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListModelQualityJobDefinitions` request
    #   was truncated, the response includes a `NextToken`. To retrieve the
    #   next set of model quality monitoring job definitions, use the token in
    #   the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of results to return in a call to
    #   `ListModelQualityJobDefinitions`.
    #
    # @option params [String] :name_contains
    #   A string in the transform job name. This filter returns only model
    #   quality monitoring job definitions whose name contains the specified
    #   string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only model quality monitoring job definitions
    #   created before the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only model quality monitoring job definitions
    #   created after the specified time.
    #
    # @return [Types::ListModelQualityJobDefinitionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListModelQualityJobDefinitionsResponse#job_definition_summaries #job_definition_summaries} => Array&lt;Types::MonitoringJobDefinitionSummary&gt;
    #   * {Types::ListModelQualityJobDefinitionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_model_quality_job_definitions({
    #     endpoint_name: "EndpointName",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.job_definition_summaries #=> Array
    #   resp.job_definition_summaries[0].monitoring_job_definition_name #=> String
    #   resp.job_definition_summaries[0].monitoring_job_definition_arn #=> String
    #   resp.job_definition_summaries[0].creation_time #=> Time
    #   resp.job_definition_summaries[0].endpoint_name #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListModelQualityJobDefinitions AWS API Documentation
    #
    # @overload list_model_quality_job_definitions(params = {})
    # @param [Hash] params ({})
    def list_model_quality_job_definitions(params = {}, options = {})
      req = build_request(:list_model_quality_job_definitions, params)
      req.send_request(options)
    end

    # Lists models created with the `CreateModel` API.
    #
    # @option params [String] :sort_by
    #   Sorts the list of results. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If the response to a previous `ListModels` request was truncated, the
    #   response includes a `NextToken`. To retrieve the next set of models,
    #   use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of models to return in the response.
    #
    # @option params [String] :name_contains
    #   A string in the model name. This filter returns only models whose name
    #   contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only models created before the specified time
    #   (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only models with a creation time greater than or
    #   equal to the specified time (timestamp).
    #
    # @return [Types::ListModelsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListModelsOutput#models #models} => Array&lt;Types::ModelSummary&gt;
    #   * {Types::ListModelsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_models({
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "PaginationToken",
    #     max_results: 1,
    #     name_contains: "ModelNameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.models #=> Array
    #   resp.models[0].model_name #=> String
    #   resp.models[0].model_arn #=> String
    #   resp.models[0].creation_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListModels AWS API Documentation
    #
    # @overload list_models(params = {})
    # @param [Hash] params ({})
    def list_models(params = {}, options = {})
      req = build_request(:list_models, params)
      req.send_request(options)
    end

    # Returns list of all monitoring job executions.
    #
    # @option params [String] :monitoring_schedule_name
    #   Name of a specific schedule to fetch jobs for.
    #
    # @option params [String] :endpoint_name
    #   Name of a specific endpoint to fetch jobs for.
    #
    # @option params [String] :sort_by
    #   Whether to sort results by `Status`, `CreationTime`, `ScheduledTime`
    #   field. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   Whether to sort the results in `Ascending` or `Descending` order. The
    #   default is `Descending`.
    #
    # @option params [String] :next_token
    #   The token returned if the response is truncated. To retrieve the next
    #   set of job executions, use it in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of jobs to return in the response. The default
    #   value is 10.
    #
    # @option params [Time,DateTime,Date,Integer,String] :scheduled_time_before
    #   Filter for jobs scheduled before a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :scheduled_time_after
    #   Filter for jobs scheduled after a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only jobs created before a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only jobs created after a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only jobs modified after a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only jobs modified before a specified time.
    #
    # @option params [String] :status_equals
    #   A filter that retrieves only jobs with a specific status.
    #
    # @option params [String] :monitoring_job_definition_name
    #   Gets a list of the monitoring job runs of the specified monitoring job
    #   definitions.
    #
    # @option params [String] :monitoring_type_equals
    #   A filter that returns only the monitoring job runs of the specified
    #   monitoring type.
    #
    # @return [Types::ListMonitoringExecutionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListMonitoringExecutionsResponse#monitoring_execution_summaries #monitoring_execution_summaries} => Array&lt;Types::MonitoringExecutionSummary&gt;
    #   * {Types::ListMonitoringExecutionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_monitoring_executions({
    #     monitoring_schedule_name: "MonitoringScheduleName",
    #     endpoint_name: "EndpointName",
    #     sort_by: "CreationTime", # accepts CreationTime, ScheduledTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #     scheduled_time_before: Time.now,
    #     scheduled_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     status_equals: "Pending", # accepts Pending, Completed, CompletedWithViolations, InProgress, Failed, Stopping, Stopped
    #     monitoring_job_definition_name: "MonitoringJobDefinitionName",
    #     monitoring_type_equals: "DataQuality", # accepts DataQuality, ModelQuality, ModelBias, ModelExplainability
    #   })
    #
    # @example Response structure
    #
    #   resp.monitoring_execution_summaries #=> Array
    #   resp.monitoring_execution_summaries[0].monitoring_schedule_name #=> String
    #   resp.monitoring_execution_summaries[0].scheduled_time #=> Time
    #   resp.monitoring_execution_summaries[0].creation_time #=> Time
    #   resp.monitoring_execution_summaries[0].last_modified_time #=> Time
    #   resp.monitoring_execution_summaries[0].monitoring_execution_status #=> String, one of "Pending", "Completed", "CompletedWithViolations", "InProgress", "Failed", "Stopping", "Stopped"
    #   resp.monitoring_execution_summaries[0].processing_job_arn #=> String
    #   resp.monitoring_execution_summaries[0].endpoint_name #=> String
    #   resp.monitoring_execution_summaries[0].failure_reason #=> String
    #   resp.monitoring_execution_summaries[0].monitoring_job_definition_name #=> String
    #   resp.monitoring_execution_summaries[0].monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListMonitoringExecutions AWS API Documentation
    #
    # @overload list_monitoring_executions(params = {})
    # @param [Hash] params ({})
    def list_monitoring_executions(params = {}, options = {})
      req = build_request(:list_monitoring_executions, params)
      req.send_request(options)
    end

    # Returns list of all monitoring schedules.
    #
    # @option params [String] :endpoint_name
    #   Name of a specific endpoint to fetch schedules for.
    #
    # @option params [String] :sort_by
    #   Whether to sort results by `Status`, `CreationTime`, `ScheduledTime`
    #   field. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   Whether to sort the results in `Ascending` or `Descending` order. The
    #   default is `Descending`.
    #
    # @option params [String] :next_token
    #   The token returned if the response is truncated. To retrieve the next
    #   set of job executions, use it in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of jobs to return in the response. The default
    #   value is 10.
    #
    # @option params [String] :name_contains
    #   Filter for monitoring schedules whose name contains a specified
    #   string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only monitoring schedules created before a
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only monitoring schedules created after a
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only monitoring schedules modified before a
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only monitoring schedules modified after a
    #   specified time.
    #
    # @option params [String] :status_equals
    #   A filter that returns only monitoring schedules modified before a
    #   specified time.
    #
    # @option params [String] :monitoring_job_definition_name
    #   Gets a list of the monitoring schedules for the specified monitoring
    #   job definition.
    #
    # @option params [String] :monitoring_type_equals
    #   A filter that returns only the monitoring schedules for the specified
    #   monitoring type.
    #
    # @return [Types::ListMonitoringSchedulesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListMonitoringSchedulesResponse#monitoring_schedule_summaries #monitoring_schedule_summaries} => Array&lt;Types::MonitoringScheduleSummary&gt;
    #   * {Types::ListMonitoringSchedulesResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_monitoring_schedules({
    #     endpoint_name: "EndpointName",
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #     name_contains: "NameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     status_equals: "Pending", # accepts Pending, Failed, Scheduled, Stopped
    #     monitoring_job_definition_name: "MonitoringJobDefinitionName",
    #     monitoring_type_equals: "DataQuality", # accepts DataQuality, ModelQuality, ModelBias, ModelExplainability
    #   })
    #
    # @example Response structure
    #
    #   resp.monitoring_schedule_summaries #=> Array
    #   resp.monitoring_schedule_summaries[0].monitoring_schedule_name #=> String
    #   resp.monitoring_schedule_summaries[0].monitoring_schedule_arn #=> String
    #   resp.monitoring_schedule_summaries[0].creation_time #=> Time
    #   resp.monitoring_schedule_summaries[0].last_modified_time #=> Time
    #   resp.monitoring_schedule_summaries[0].monitoring_schedule_status #=> String, one of "Pending", "Failed", "Scheduled", "Stopped"
    #   resp.monitoring_schedule_summaries[0].endpoint_name #=> String
    #   resp.monitoring_schedule_summaries[0].monitoring_job_definition_name #=> String
    #   resp.monitoring_schedule_summaries[0].monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListMonitoringSchedules AWS API Documentation
    #
    # @overload list_monitoring_schedules(params = {})
    # @param [Hash] params ({})
    def list_monitoring_schedules(params = {}, options = {})
      req = build_request(:list_monitoring_schedules, params)
      req.send_request(options)
    end

    # Lists notebook instance lifestyle configurations created with the
    # CreateNotebookInstanceLifecycleConfig API.
    #
    # @option params [String] :next_token
    #   If the result of a `ListNotebookInstanceLifecycleConfigs` request was
    #   truncated, the response includes a `NextToken`. To get the next set of
    #   lifecycle configurations, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of lifecycle configurations to return in the
    #   response.
    #
    # @option params [String] :sort_by
    #   Sorts the list of results. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results.
    #
    # @option params [String] :name_contains
    #   A string in the lifecycle configuration name. This filter returns only
    #   lifecycle configurations whose name contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only lifecycle configurations that were created
    #   before the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only lifecycle configurations that were created
    #   after the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only lifecycle configurations that were modified
    #   before the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only lifecycle configurations that were modified
    #   after the specified time (timestamp).
    #
    # @return [Types::ListNotebookInstanceLifecycleConfigsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListNotebookInstanceLifecycleConfigsOutput#next_token #next_token} => String
    #   * {Types::ListNotebookInstanceLifecycleConfigsOutput#notebook_instance_lifecycle_configs #notebook_instance_lifecycle_configs} => Array&lt;Types::NotebookInstanceLifecycleConfigSummary&gt;
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_notebook_instance_lifecycle_configs({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     sort_by: "Name", # accepts Name, CreationTime, LastModifiedTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     name_contains: "NotebookInstanceLifecycleConfigNameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #   })
    #
    # @example Response structure
    #
    #   resp.next_token #=> String
    #   resp.notebook_instance_lifecycle_configs #=> Array
    #   resp.notebook_instance_lifecycle_configs[0].notebook_instance_lifecycle_config_name #=> String
    #   resp.notebook_instance_lifecycle_configs[0].notebook_instance_lifecycle_config_arn #=> String
    #   resp.notebook_instance_lifecycle_configs[0].creation_time #=> Time
    #   resp.notebook_instance_lifecycle_configs[0].last_modified_time #=> Time
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListNotebookInstanceLifecycleConfigs AWS API Documentation
    #
    # @overload list_notebook_instance_lifecycle_configs(params = {})
    # @param [Hash] params ({})
    def list_notebook_instance_lifecycle_configs(params = {}, options = {})
      req = build_request(:list_notebook_instance_lifecycle_configs, params)
      req.send_request(options)
    end

    # Returns a list of the Amazon SageMaker notebook instances in the
    # requester's account in an Amazon Web Services Region.
    #
    # @option params [String] :next_token
    #   If the previous call to the `ListNotebookInstances` is truncated, the
    #   response includes a `NextToken`. You can use this token in your
    #   subsequent `ListNotebookInstances` request to fetch the next set of
    #   notebook instances.
    #
    #   <note markdown="1"> You might specify a filter or a sort order in your request. When
    #   response is truncated, you must use the same values for the filer and
    #   sort order in the next request.
    #
    #    </note>
    #
    # @option params [Integer] :max_results
    #   The maximum number of notebook instances to return.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `Name`.
    #
    # @option params [String] :sort_order
    #   The sort order for results.
    #
    # @option params [String] :name_contains
    #   A string in the notebook instances' name. This filter returns only
    #   notebook instances whose name contains the specified string.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only notebook instances that were created before
    #   the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only notebook instances that were created after
    #   the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only notebook instances that were modified
    #   before the specified time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only notebook instances that were modified after
    #   the specified time (timestamp).
    #
    # @option params [String] :status_equals
    #   A filter that returns only notebook instances with the specified
    #   status.
    #
    # @option params [String] :notebook_instance_lifecycle_config_name_contains
    #   A string in the name of a notebook instances lifecycle configuration
    #   associated with this notebook instance. This filter returns only
    #   notebook instances associated with a lifecycle configuration with a
    #   name that contains the specified string.
    #
    # @option params [String] :default_code_repository_contains
    #   A string in the name or URL of a Git repository associated with this
    #   notebook instance. This filter returns only notebook instances
    #   associated with a git repository with a name that contains the
    #   specified string.
    #
    # @option params [String] :additional_code_repository_equals
    #   A filter that returns only notebook instances with associated with the
    #   specified git repository.
    #
    # @return [Types::ListNotebookInstancesOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListNotebookInstancesOutput#next_token #next_token} => String
    #   * {Types::ListNotebookInstancesOutput#notebook_instances #notebook_instances} => Array&lt;Types::NotebookInstanceSummary&gt;
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_notebook_instances({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     name_contains: "NotebookInstanceNameContains",
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     status_equals: "Pending", # accepts Pending, InService, Stopping, Stopped, Failed, Deleting, Updating
    #     notebook_instance_lifecycle_config_name_contains: "NotebookInstanceLifecycleConfigName",
    #     default_code_repository_contains: "CodeRepositoryContains",
    #     additional_code_repository_equals: "CodeRepositoryNameOrUrl",
    #   })
    #
    # @example Response structure
    #
    #   resp.next_token #=> String
    #   resp.notebook_instances #=> Array
    #   resp.notebook_instances[0].notebook_instance_name #=> String
    #   resp.notebook_instances[0].notebook_instance_arn #=> String
    #   resp.notebook_instances[0].notebook_instance_status #=> String, one of "Pending", "InService", "Stopping", "Stopped", "Failed", "Deleting", "Updating"
    #   resp.notebook_instances[0].url #=> String
    #   resp.notebook_instances[0].instance_type #=> String, one of "ml.t2.medium", "ml.t2.large", "ml.t2.xlarge", "ml.t2.2xlarge", "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.8xlarge", "ml.m5d.12xlarge", "ml.m5d.16xlarge", "ml.m5d.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5d.xlarge", "ml.c5d.2xlarge", "ml.c5d.4xlarge", "ml.c5d.9xlarge", "ml.c5d.18xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge"
    #   resp.notebook_instances[0].creation_time #=> Time
    #   resp.notebook_instances[0].last_modified_time #=> Time
    #   resp.notebook_instances[0].notebook_instance_lifecycle_config_name #=> String
    #   resp.notebook_instances[0].default_code_repository #=> String
    #   resp.notebook_instances[0].additional_code_repositories #=> Array
    #   resp.notebook_instances[0].additional_code_repositories[0] #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListNotebookInstances AWS API Documentation
    #
    # @overload list_notebook_instances(params = {})
    # @param [Hash] params ({})
    def list_notebook_instances(params = {}, options = {})
      req = build_request(:list_notebook_instances, params)
      req.send_request(options)
    end

    # Gets a list of `PipeLineExecutionStep` objects.
    #
    # @option params [String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListPipelineExecutionSteps` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of pipeline execution steps, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of pipeline execution steps to return in the
    #   response.
    #
    # @option params [String] :sort_order
    #   The field by which to sort results. The default is `CreatedTime`.
    #
    # @return [Types::ListPipelineExecutionStepsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListPipelineExecutionStepsResponse#pipeline_execution_steps #pipeline_execution_steps} => Array&lt;Types::PipelineExecutionStep&gt;
    #   * {Types::ListPipelineExecutionStepsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_pipeline_execution_steps({
    #     pipeline_execution_arn: "PipelineExecutionArn",
    #     next_token: "NextToken",
    #     max_results: 1,
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_steps #=> Array
    #   resp.pipeline_execution_steps[0].step_name #=> String
    #   resp.pipeline_execution_steps[0].start_time #=> Time
    #   resp.pipeline_execution_steps[0].end_time #=> Time
    #   resp.pipeline_execution_steps[0].step_status #=> String, one of "Starting", "Executing", "Stopping", "Stopped", "Failed", "Succeeded"
    #   resp.pipeline_execution_steps[0].cache_hit_result.source_pipeline_execution_arn #=> String
    #   resp.pipeline_execution_steps[0].failure_reason #=> String
    #   resp.pipeline_execution_steps[0].metadata.training_job.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.processing_job.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.transform_job.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.tuning_job.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.model.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.register_model.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.condition.outcome #=> String, one of "True", "False"
    #   resp.pipeline_execution_steps[0].metadata.callback.callback_token #=> String
    #   resp.pipeline_execution_steps[0].metadata.callback.sqs_queue_url #=> String
    #   resp.pipeline_execution_steps[0].metadata.callback.output_parameters #=> Array
    #   resp.pipeline_execution_steps[0].metadata.callback.output_parameters[0].name #=> String
    #   resp.pipeline_execution_steps[0].metadata.callback.output_parameters[0].value #=> String
    #   resp.pipeline_execution_steps[0].metadata.lambda.arn #=> String
    #   resp.pipeline_execution_steps[0].metadata.lambda.output_parameters #=> Array
    #   resp.pipeline_execution_steps[0].metadata.lambda.output_parameters[0].name #=> String
    #   resp.pipeline_execution_steps[0].metadata.lambda.output_parameters[0].value #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListPipelineExecutionSteps AWS API Documentation
    #
    # @overload list_pipeline_execution_steps(params = {})
    # @param [Hash] params ({})
    def list_pipeline_execution_steps(params = {}, options = {})
      req = build_request(:list_pipeline_execution_steps, params)
      req.send_request(options)
    end

    # Gets a list of the pipeline executions.
    #
    # @option params [required, String] :pipeline_name
    #   The name of the pipeline.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns the pipeline executions that were created after
    #   a specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns the pipeline executions that were created before
    #   a specified time.
    #
    # @option params [String] :sort_by
    #   The field by which to sort results. The default is `CreatedTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListPipelineExecutions` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of pipeline executions, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of pipeline executions to return in the response.
    #
    # @return [Types::ListPipelineExecutionsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListPipelineExecutionsResponse#pipeline_execution_summaries #pipeline_execution_summaries} => Array&lt;Types::PipelineExecutionSummary&gt;
    #   * {Types::ListPipelineExecutionsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_pipeline_executions({
    #     pipeline_name: "PipelineName", # required
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "CreationTime", # accepts CreationTime, PipelineExecutionArn
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_summaries #=> Array
    #   resp.pipeline_execution_summaries[0].pipeline_execution_arn #=> String
    #   resp.pipeline_execution_summaries[0].start_time #=> Time
    #   resp.pipeline_execution_summaries[0].pipeline_execution_status #=> String, one of "Executing", "Stopping", "Stopped", "Failed", "Succeeded"
    #   resp.pipeline_execution_summaries[0].pipeline_execution_description #=> String
    #   resp.pipeline_execution_summaries[0].pipeline_execution_display_name #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListPipelineExecutions AWS API Documentation
    #
    # @overload list_pipeline_executions(params = {})
    # @param [Hash] params ({})
    def list_pipeline_executions(params = {}, options = {})
      req = build_request(:list_pipeline_executions, params)
      req.send_request(options)
    end

    # Gets a list of parameters for a pipeline execution.
    #
    # @option params [required, String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListPipelineParametersForExecution`
    #   request was truncated, the response includes a `NextToken`. To
    #   retrieve the next set of parameters, use the token in the next
    #   request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of parameters to return in the response.
    #
    # @return [Types::ListPipelineParametersForExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListPipelineParametersForExecutionResponse#pipeline_parameters #pipeline_parameters} => Array&lt;Types::Parameter&gt;
    #   * {Types::ListPipelineParametersForExecutionResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_pipeline_parameters_for_execution({
    #     pipeline_execution_arn: "PipelineExecutionArn", # required
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_parameters #=> Array
    #   resp.pipeline_parameters[0].name #=> String
    #   resp.pipeline_parameters[0].value #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListPipelineParametersForExecution AWS API Documentation
    #
    # @overload list_pipeline_parameters_for_execution(params = {})
    # @param [Hash] params ({})
    def list_pipeline_parameters_for_execution(params = {}, options = {})
      req = build_request(:list_pipeline_parameters_for_execution, params)
      req.send_request(options)
    end

    # Gets a list of pipelines.
    #
    # @option params [String] :pipeline_name_prefix
    #   The prefix of the pipeline name.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns the pipelines that were created after a
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns the pipelines that were created before a
    #   specified time.
    #
    # @option params [String] :sort_by
    #   The field by which to sort results. The default is `CreatedTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListPipelines` request was truncated,
    #   the response includes a `NextToken`. To retrieve the next set of
    #   pipelines, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of pipelines to return in the response.
    #
    # @return [Types::ListPipelinesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListPipelinesResponse#pipeline_summaries #pipeline_summaries} => Array&lt;Types::PipelineSummary&gt;
    #   * {Types::ListPipelinesResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_pipelines({
    #     pipeline_name_prefix: "PipelineName",
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_summaries #=> Array
    #   resp.pipeline_summaries[0].pipeline_arn #=> String
    #   resp.pipeline_summaries[0].pipeline_name #=> String
    #   resp.pipeline_summaries[0].pipeline_display_name #=> String
    #   resp.pipeline_summaries[0].pipeline_description #=> String
    #   resp.pipeline_summaries[0].role_arn #=> String
    #   resp.pipeline_summaries[0].creation_time #=> Time
    #   resp.pipeline_summaries[0].last_modified_time #=> Time
    #   resp.pipeline_summaries[0].last_execution_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListPipelines AWS API Documentation
    #
    # @overload list_pipelines(params = {})
    # @param [Hash] params ({})
    def list_pipelines(params = {}, options = {})
      req = build_request(:list_pipelines, params)
      req.send_request(options)
    end

    # Lists processing jobs that satisfy various filters.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only processing jobs created after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only processing jobs created after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only processing jobs modified after the
    #   specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only processing jobs modified before the
    #   specified time.
    #
    # @option params [String] :name_contains
    #   A string in the processing job name. This filter returns only
    #   processing jobs whose name contains the specified string.
    #
    # @option params [String] :status_equals
    #   A filter that retrieves only processing jobs with a specific status.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListProcessingJobs` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of processing jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of processing jobs to return in the response.
    #
    # @return [Types::ListProcessingJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListProcessingJobsResponse#processing_job_summaries #processing_job_summaries} => Array&lt;Types::ProcessingJobSummary&gt;
    #   * {Types::ListProcessingJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_processing_jobs({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "String",
    #     status_equals: "InProgress", # accepts InProgress, Completed, Failed, Stopping, Stopped
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.processing_job_summaries #=> Array
    #   resp.processing_job_summaries[0].processing_job_name #=> String
    #   resp.processing_job_summaries[0].processing_job_arn #=> String
    #   resp.processing_job_summaries[0].creation_time #=> Time
    #   resp.processing_job_summaries[0].processing_end_time #=> Time
    #   resp.processing_job_summaries[0].last_modified_time #=> Time
    #   resp.processing_job_summaries[0].processing_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.processing_job_summaries[0].failure_reason #=> String
    #   resp.processing_job_summaries[0].exit_message #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListProcessingJobs AWS API Documentation
    #
    # @overload list_processing_jobs(params = {})
    # @param [Hash] params ({})
    def list_processing_jobs(params = {}, options = {})
      req = build_request(:list_processing_jobs, params)
      req.send_request(options)
    end

    # Gets a list of the projects in an Amazon Web Services account.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns the projects that were created after a specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns the projects that were created before a
    #   specified time.
    #
    # @option params [Integer] :max_results
    #   The maximum number of projects to return in the response.
    #
    # @option params [String] :name_contains
    #   A filter that returns the projects whose name contains a specified
    #   string.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListProjects` request was truncated,
    #   the response includes a `NextToken`. To retrieve the next set of
    #   projects, use the token in the next request.
    #
    # @option params [String] :sort_by
    #   The field by which to sort results. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListProjectsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListProjectsOutput#project_summary_list #project_summary_list} => Array&lt;Types::ProjectSummary&gt;
    #   * {Types::ListProjectsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_projects({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     max_results: 1,
    #     name_contains: "ProjectEntityName",
    #     next_token: "NextToken",
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.project_summary_list #=> Array
    #   resp.project_summary_list[0].project_name #=> String
    #   resp.project_summary_list[0].project_description #=> String
    #   resp.project_summary_list[0].project_arn #=> String
    #   resp.project_summary_list[0].project_id #=> String
    #   resp.project_summary_list[0].creation_time #=> Time
    #   resp.project_summary_list[0].project_status #=> String, one of "Pending", "CreateInProgress", "CreateCompleted", "CreateFailed", "DeleteInProgress", "DeleteFailed", "DeleteCompleted"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListProjects AWS API Documentation
    #
    # @overload list_projects(params = {})
    # @param [Hash] params ({})
    def list_projects(params = {}, options = {})
      req = build_request(:list_projects, params)
      req.send_request(options)
    end

    # Lists the Studio Lifecycle Configurations in your Amazon Web Services
    # Account.
    #
    # @option params [Integer] :max_results
    #   The maximum number of Studio Lifecycle Configurations to return in the
    #   response. The default value is 10.
    #
    # @option params [String] :next_token
    #   If the previous call to ListStudioLifecycleConfigs didn't return the
    #   full set of Lifecycle Configurations, the call returns a token for
    #   getting the next set of Lifecycle Configurations.
    #
    # @option params [String] :name_contains
    #   A string in the Lifecycle Configuration name. This filter returns only
    #   Lifecycle Configurations whose name contains the specified string.
    #
    # @option params [String] :app_type_equals
    #   A parameter to search for the App Type to which the Lifecycle
    #   Configuration is attached.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only Lifecycle Configurations created on or
    #   before the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only Lifecycle Configurations created on or
    #   after the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :modified_time_before
    #   A filter that returns only Lifecycle Configurations modified before
    #   the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :modified_time_after
    #   A filter that returns only Lifecycle Configurations modified after the
    #   specified time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is CreationTime.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is Descending.
    #
    # @return [Types::ListStudioLifecycleConfigsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListStudioLifecycleConfigsResponse#next_token #next_token} => String
    #   * {Types::ListStudioLifecycleConfigsResponse#studio_lifecycle_configs #studio_lifecycle_configs} => Array&lt;Types::StudioLifecycleConfigDetails&gt;
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_studio_lifecycle_configs({
    #     max_results: 1,
    #     next_token: "NextToken",
    #     name_contains: "StudioLifecycleConfigName",
    #     app_type_equals: "JupyterServer", # accepts JupyterServer, KernelGateway
    #     creation_time_before: Time.now,
    #     creation_time_after: Time.now,
    #     modified_time_before: Time.now,
    #     modified_time_after: Time.now,
    #     sort_by: "CreationTime", # accepts CreationTime, LastModifiedTime, Name
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.next_token #=> String
    #   resp.studio_lifecycle_configs #=> Array
    #   resp.studio_lifecycle_configs[0].studio_lifecycle_config_arn #=> String
    #   resp.studio_lifecycle_configs[0].studio_lifecycle_config_name #=> String
    #   resp.studio_lifecycle_configs[0].creation_time #=> Time
    #   resp.studio_lifecycle_configs[0].last_modified_time #=> Time
    #   resp.studio_lifecycle_configs[0].studio_lifecycle_config_app_type #=> String, one of "JupyterServer", "KernelGateway"
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListStudioLifecycleConfigs AWS API Documentation
    #
    # @overload list_studio_lifecycle_configs(params = {})
    # @param [Hash] params ({})
    def list_studio_lifecycle_configs(params = {}, options = {})
      req = build_request(:list_studio_lifecycle_configs, params)
      req.send_request(options)
    end

    # Gets a list of the work teams that you are subscribed to in the Amazon
    # Web Services Marketplace. The list may be empty if no work team
    # satisfies the filter specified in the `NameContains` parameter.
    #
    # @option params [String] :name_contains
    #   A string in the work team name. This filter returns only work teams
    #   whose name contains the specified string.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListSubscribedWorkteams` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of labeling jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of work teams to return in each page of the
    #   response.
    #
    # @return [Types::ListSubscribedWorkteamsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListSubscribedWorkteamsResponse#subscribed_workteams #subscribed_workteams} => Array&lt;Types::SubscribedWorkteam&gt;
    #   * {Types::ListSubscribedWorkteamsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_subscribed_workteams({
    #     name_contains: "WorkteamName",
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.subscribed_workteams #=> Array
    #   resp.subscribed_workteams[0].workteam_arn #=> String
    #   resp.subscribed_workteams[0].marketplace_title #=> String
    #   resp.subscribed_workteams[0].seller_name #=> String
    #   resp.subscribed_workteams[0].marketplace_description #=> String
    #   resp.subscribed_workteams[0].listing_id #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListSubscribedWorkteams AWS API Documentation
    #
    # @overload list_subscribed_workteams(params = {})
    # @param [Hash] params ({})
    def list_subscribed_workteams(params = {}, options = {})
      req = build_request(:list_subscribed_workteams, params)
      req.send_request(options)
    end

    # Returns the tags for the specified Amazon SageMaker resource.
    #
    # @option params [required, String] :resource_arn
    #   The Amazon Resource Name (ARN) of the resource whose tags you want to
    #   retrieve.
    #
    # @option params [String] :next_token
    #   If the response to the previous `ListTags` request is truncated,
    #   Amazon SageMaker returns this token. To retrieve the next set of tags,
    #   use it in the subsequent request.
    #
    # @option params [Integer] :max_results
    #   Maximum number of tags to return.
    #
    # @return [Types::ListTagsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListTagsOutput#tags #tags} => Array&lt;Types::Tag&gt;
    #   * {Types::ListTagsOutput#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_tags({
    #     resource_arn: "ResourceArn", # required
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.tags #=> Array
    #   resp.tags[0].key #=> String
    #   resp.tags[0].value #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListTags AWS API Documentation
    #
    # @overload list_tags(params = {})
    # @param [Hash] params ({})
    def list_tags(params = {}, options = {})
      req = build_request(:list_tags, params)
      req.send_request(options)
    end

    # Lists training jobs.
    #
    # <note markdown="1"> When `StatusEquals` and `MaxResults` are set at the same time, the
    # `MaxResults` number of training jobs are first retrieved ignoring the
    # `StatusEquals` parameter and then they are filtered by the
    # `StatusEquals` parameter, which is returned as a response.
    #
    #  For example, if `ListTrainingJobs` is invoked with the following
    # parameters:
    #
    #  `\{ ... MaxResults: 100, StatusEquals: InProgress ... \}`
    #
    #  First, 100 trainings jobs with any status, including those other than
    # `InProgress`, are selected (sorted according to the creation time,
    # from the most current to the oldest). Next, those with a status of
    # `InProgress` are returned.
    #
    #  You can quickly test the API using the following Amazon Web Services
    # CLI code.
    #
    #  `aws sagemaker list-training-jobs --max-results 100 --status-equals
    # InProgress`
    #
    #  </note>
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListTrainingJobs` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of training jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of training jobs to return in the response.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only training jobs created after the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only training jobs created before the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only training jobs modified after the specified
    #   time (timestamp).
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only training jobs modified before the specified
    #   time (timestamp).
    #
    # @option params [String] :name_contains
    #   A string in the training job name. This filter returns only training
    #   jobs whose name contains the specified string.
    #
    # @option params [String] :status_equals
    #   A filter that retrieves only training jobs with a specific status.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListTrainingJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListTrainingJobsResponse#training_job_summaries #training_job_summaries} => Array&lt;Types::TrainingJobSummary&gt;
    #   * {Types::ListTrainingJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_training_jobs({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "NameContains",
    #     status_equals: "InProgress", # accepts InProgress, Completed, Failed, Stopping, Stopped
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.training_job_summaries #=> Array
    #   resp.training_job_summaries[0].training_job_name #=> String
    #   resp.training_job_summaries[0].training_job_arn #=> String
    #   resp.training_job_summaries[0].creation_time #=> Time
    #   resp.training_job_summaries[0].training_end_time #=> Time
    #   resp.training_job_summaries[0].last_modified_time #=> Time
    #   resp.training_job_summaries[0].training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListTrainingJobs AWS API Documentation
    #
    # @overload list_training_jobs(params = {})
    # @param [Hash] params ({})
    def list_training_jobs(params = {}, options = {})
      req = build_request(:list_training_jobs, params)
      req.send_request(options)
    end

    # Gets a list of TrainingJobSummary objects that describe the training
    # jobs that a hyperparameter tuning job launched.
    #
    # @option params [required, String] :hyper_parameter_tuning_job_name
    #   The name of the tuning job whose training jobs you want to list.
    #
    # @option params [String] :next_token
    #   If the result of the previous
    #   `ListTrainingJobsForHyperParameterTuningJob` request was truncated,
    #   the response includes a `NextToken`. To retrieve the next set of
    #   training jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of training jobs to return. The default value is
    #   10.
    #
    # @option params [String] :status_equals
    #   A filter that returns only training jobs with the specified status.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `Name`.
    #
    #   If the value of this field is `FinalObjectiveMetricValue`, any
    #   training jobs that did not return an objective metric are not listed.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @return [Types::ListTrainingJobsForHyperParameterTuningJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListTrainingJobsForHyperParameterTuningJobResponse#training_job_summaries #training_job_summaries} => Array&lt;Types::HyperParameterTrainingJobSummary&gt;
    #   * {Types::ListTrainingJobsForHyperParameterTuningJobResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_training_jobs_for_hyper_parameter_tuning_job({
    #     hyper_parameter_tuning_job_name: "HyperParameterTuningJobName", # required
    #     next_token: "NextToken",
    #     max_results: 1,
    #     status_equals: "InProgress", # accepts InProgress, Completed, Failed, Stopping, Stopped
    #     sort_by: "Name", # accepts Name, CreationTime, Status, FinalObjectiveMetricValue
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #   })
    #
    # @example Response structure
    #
    #   resp.training_job_summaries #=> Array
    #   resp.training_job_summaries[0].training_job_definition_name #=> String
    #   resp.training_job_summaries[0].training_job_name #=> String
    #   resp.training_job_summaries[0].training_job_arn #=> String
    #   resp.training_job_summaries[0].tuning_job_name #=> String
    #   resp.training_job_summaries[0].creation_time #=> Time
    #   resp.training_job_summaries[0].training_start_time #=> Time
    #   resp.training_job_summaries[0].training_end_time #=> Time
    #   resp.training_job_summaries[0].training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.training_job_summaries[0].tuned_hyper_parameters #=> Hash
    #   resp.training_job_summaries[0].tuned_hyper_parameters["HyperParameterKey"] #=> String
    #   resp.training_job_summaries[0].failure_reason #=> String
    #   resp.training_job_summaries[0].final_hyper_parameter_tuning_job_objective_metric.type #=> String, one of "Maximize", "Minimize"
    #   resp.training_job_summaries[0].final_hyper_parameter_tuning_job_objective_metric.metric_name #=> String
    #   resp.training_job_summaries[0].final_hyper_parameter_tuning_job_objective_metric.value #=> Float
    #   resp.training_job_summaries[0].objective_status #=> String, one of "Succeeded", "Pending", "Failed"
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListTrainingJobsForHyperParameterTuningJob AWS API Documentation
    #
    # @overload list_training_jobs_for_hyper_parameter_tuning_job(params = {})
    # @param [Hash] params ({})
    def list_training_jobs_for_hyper_parameter_tuning_job(params = {}, options = {})
      req = build_request(:list_training_jobs_for_hyper_parameter_tuning_job, params)
      req.send_request(options)
    end

    # Lists transform jobs.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_after
    #   A filter that returns only transform jobs created after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :creation_time_before
    #   A filter that returns only transform jobs created before the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_after
    #   A filter that returns only transform jobs modified after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :last_modified_time_before
    #   A filter that returns only transform jobs modified before the
    #   specified time.
    #
    # @option params [String] :name_contains
    #   A string in the transform job name. This filter returns only transform
    #   jobs whose name contains the specified string.
    #
    # @option params [String] :status_equals
    #   A filter that retrieves only transform jobs with a specific status.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListTransformJobs` request was
    #   truncated, the response includes a `NextToken`. To retrieve the next
    #   set of transform jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of transform jobs to return in the response. The
    #   default value is `10`.
    #
    # @return [Types::ListTransformJobsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListTransformJobsResponse#transform_job_summaries #transform_job_summaries} => Array&lt;Types::TransformJobSummary&gt;
    #   * {Types::ListTransformJobsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_transform_jobs({
    #     creation_time_after: Time.now,
    #     creation_time_before: Time.now,
    #     last_modified_time_after: Time.now,
    #     last_modified_time_before: Time.now,
    #     name_contains: "NameContains",
    #     status_equals: "InProgress", # accepts InProgress, Completed, Failed, Stopping, Stopped
    #     sort_by: "Name", # accepts Name, CreationTime, Status
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.transform_job_summaries #=> Array
    #   resp.transform_job_summaries[0].transform_job_name #=> String
    #   resp.transform_job_summaries[0].transform_job_arn #=> String
    #   resp.transform_job_summaries[0].creation_time #=> Time
    #   resp.transform_job_summaries[0].transform_end_time #=> Time
    #   resp.transform_job_summaries[0].last_modified_time #=> Time
    #   resp.transform_job_summaries[0].transform_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.transform_job_summaries[0].failure_reason #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListTransformJobs AWS API Documentation
    #
    # @overload list_transform_jobs(params = {})
    # @param [Hash] params ({})
    def list_transform_jobs(params = {}, options = {})
      req = build_request(:list_transform_jobs, params)
      req.send_request(options)
    end

    # Lists the trial components in your account. You can sort the list by
    # trial component name or creation time. You can filter the list to show
    # only components that were created in a specific time range. You can
    # also filter on one of the following:
    #
    # * `ExperimentName`
    #
    # * `SourceArn`
    #
    # * `TrialName`
    #
    # @option params [String] :experiment_name
    #   A filter that returns only components that are part of the specified
    #   experiment. If you specify `ExperimentName`, you can't filter by
    #   `SourceArn` or `TrialName`.
    #
    # @option params [String] :trial_name
    #   A filter that returns only components that are part of the specified
    #   trial. If you specify `TrialName`, you can't filter by
    #   `ExperimentName` or `SourceArn`.
    #
    # @option params [String] :source_arn
    #   A filter that returns only components that have the specified source
    #   Amazon Resource Name (ARN). If you specify `SourceArn`, you can't
    #   filter by `ExperimentName` or `TrialName`.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only components created after the specified
    #   time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only components created before the specified
    #   time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [Integer] :max_results
    #   The maximum number of components to return in the response. The
    #   default value is 10.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListTrialComponents` didn't return the full
    #   set of components, the call returns a token for getting the next set
    #   of components.
    #
    # @return [Types::ListTrialComponentsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListTrialComponentsResponse#trial_component_summaries #trial_component_summaries} => Array&lt;Types::TrialComponentSummary&gt;
    #   * {Types::ListTrialComponentsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_trial_components({
    #     experiment_name: "ExperimentEntityName",
    #     trial_name: "ExperimentEntityName",
    #     source_arn: "String256",
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_summaries #=> Array
    #   resp.trial_component_summaries[0].trial_component_name #=> String
    #   resp.trial_component_summaries[0].trial_component_arn #=> String
    #   resp.trial_component_summaries[0].display_name #=> String
    #   resp.trial_component_summaries[0].trial_component_source.source_arn #=> String
    #   resp.trial_component_summaries[0].trial_component_source.source_type #=> String
    #   resp.trial_component_summaries[0].status.primary_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.trial_component_summaries[0].status.message #=> String
    #   resp.trial_component_summaries[0].start_time #=> Time
    #   resp.trial_component_summaries[0].end_time #=> Time
    #   resp.trial_component_summaries[0].creation_time #=> Time
    #   resp.trial_component_summaries[0].created_by.user_profile_arn #=> String
    #   resp.trial_component_summaries[0].created_by.user_profile_name #=> String
    #   resp.trial_component_summaries[0].created_by.domain_id #=> String
    #   resp.trial_component_summaries[0].last_modified_time #=> Time
    #   resp.trial_component_summaries[0].last_modified_by.user_profile_arn #=> String
    #   resp.trial_component_summaries[0].last_modified_by.user_profile_name #=> String
    #   resp.trial_component_summaries[0].last_modified_by.domain_id #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListTrialComponents AWS API Documentation
    #
    # @overload list_trial_components(params = {})
    # @param [Hash] params ({})
    def list_trial_components(params = {}, options = {})
      req = build_request(:list_trial_components, params)
      req.send_request(options)
    end

    # Lists the trials in your account. Specify an experiment name to limit
    # the list to the trials that are part of that experiment. Specify a
    # trial component name to limit the list to the trials that associated
    # with that trial component. The list can be filtered to show only
    # trials that were created in a specific time range. The list can be
    # sorted by trial name or creation time.
    #
    # @option params [String] :experiment_name
    #   A filter that returns only trials that are part of the specified
    #   experiment.
    #
    # @option params [String] :trial_component_name
    #   A filter that returns only trials that are associated with the
    #   specified trial component.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_after
    #   A filter that returns only trials created after the specified time.
    #
    # @option params [Time,DateTime,Date,Integer,String] :created_before
    #   A filter that returns only trials created before the specified time.
    #
    # @option params [String] :sort_by
    #   The property used to sort results. The default value is
    #   `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order. The default value is `Descending`.
    #
    # @option params [Integer] :max_results
    #   The maximum number of trials to return in the response. The default
    #   value is 10.
    #
    # @option params [String] :next_token
    #   If the previous call to `ListTrials` didn't return the full set of
    #   trials, the call returns a token for getting the next set of trials.
    #
    # @return [Types::ListTrialsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListTrialsResponse#trial_summaries #trial_summaries} => Array&lt;Types::TrialSummary&gt;
    #   * {Types::ListTrialsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_trials({
    #     experiment_name: "ExperimentEntityName",
    #     trial_component_name: "ExperimentEntityName",
    #     created_after: Time.now,
    #     created_before: Time.now,
    #     sort_by: "Name", # accepts Name, CreationTime
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     max_results: 1,
    #     next_token: "NextToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_summaries #=> Array
    #   resp.trial_summaries[0].trial_arn #=> String
    #   resp.trial_summaries[0].trial_name #=> String
    #   resp.trial_summaries[0].display_name #=> String
    #   resp.trial_summaries[0].trial_source.source_arn #=> String
    #   resp.trial_summaries[0].trial_source.source_type #=> String
    #   resp.trial_summaries[0].creation_time #=> Time
    #   resp.trial_summaries[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListTrials AWS API Documentation
    #
    # @overload list_trials(params = {})
    # @param [Hash] params ({})
    def list_trials(params = {}, options = {})
      req = build_request(:list_trials, params)
      req.send_request(options)
    end

    # Lists user profiles.
    #
    # @option params [String] :next_token
    #   If the previous response was truncated, you will receive this token.
    #   Use it in your next request to receive the next set of results.
    #
    # @option params [Integer] :max_results
    #   Returns a list up to a specified limit.
    #
    # @option params [String] :sort_order
    #   The sort order for the results. The default is Ascending.
    #
    # @option params [String] :sort_by
    #   The parameter by which to sort the results. The default is
    #   CreationTime.
    #
    # @option params [String] :domain_id_equals
    #   A parameter by which to filter the results.
    #
    # @option params [String] :user_profile_name_contains
    #   A parameter by which to filter the results.
    #
    # @return [Types::ListUserProfilesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListUserProfilesResponse#user_profiles #user_profiles} => Array&lt;Types::UserProfileDetails&gt;
    #   * {Types::ListUserProfilesResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_user_profiles({
    #     next_token: "NextToken",
    #     max_results: 1,
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     sort_by: "CreationTime", # accepts CreationTime, LastModifiedTime
    #     domain_id_equals: "DomainId",
    #     user_profile_name_contains: "UserProfileName",
    #   })
    #
    # @example Response structure
    #
    #   resp.user_profiles #=> Array
    #   resp.user_profiles[0].domain_id #=> String
    #   resp.user_profiles[0].user_profile_name #=> String
    #   resp.user_profiles[0].status #=> String, one of "Deleting", "Failed", "InService", "Pending", "Updating", "Update_Failed", "Delete_Failed"
    #   resp.user_profiles[0].creation_time #=> Time
    #   resp.user_profiles[0].last_modified_time #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListUserProfiles AWS API Documentation
    #
    # @overload list_user_profiles(params = {})
    # @param [Hash] params ({})
    def list_user_profiles(params = {}, options = {})
      req = build_request(:list_user_profiles, params)
      req.send_request(options)
    end

    # Use this operation to list all private and vendor workforces in an
    # Amazon Web Services Region. Note that you can only have one private
    # workforce per Amazon Web Services Region.
    #
    # @option params [String] :sort_by
    #   Sort workforces using the workforce name or creation date.
    #
    # @option params [String] :sort_order
    #   Sort workforces in ascending or descending order.
    #
    # @option params [String] :name_contains
    #   A filter you can use to search for workforces using part of the
    #   workforce name.
    #
    # @option params [String] :next_token
    #   A token to resume pagination.
    #
    # @option params [Integer] :max_results
    #   The maximum number of workforces returned in the response.
    #
    # @return [Types::ListWorkforcesResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListWorkforcesResponse#workforces #workforces} => Array&lt;Types::Workforce&gt;
    #   * {Types::ListWorkforcesResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_workforces({
    #     sort_by: "Name", # accepts Name, CreateDate
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     name_contains: "WorkforceName",
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.workforces #=> Array
    #   resp.workforces[0].workforce_name #=> String
    #   resp.workforces[0].workforce_arn #=> String
    #   resp.workforces[0].last_updated_date #=> Time
    #   resp.workforces[0].source_ip_config.cidrs #=> Array
    #   resp.workforces[0].source_ip_config.cidrs[0] #=> String
    #   resp.workforces[0].sub_domain #=> String
    #   resp.workforces[0].cognito_config.user_pool #=> String
    #   resp.workforces[0].cognito_config.client_id #=> String
    #   resp.workforces[0].oidc_config.client_id #=> String
    #   resp.workforces[0].oidc_config.issuer #=> String
    #   resp.workforces[0].oidc_config.authorization_endpoint #=> String
    #   resp.workforces[0].oidc_config.token_endpoint #=> String
    #   resp.workforces[0].oidc_config.user_info_endpoint #=> String
    #   resp.workforces[0].oidc_config.logout_endpoint #=> String
    #   resp.workforces[0].oidc_config.jwks_uri #=> String
    #   resp.workforces[0].create_date #=> Time
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListWorkforces AWS API Documentation
    #
    # @overload list_workforces(params = {})
    # @param [Hash] params ({})
    def list_workforces(params = {}, options = {})
      req = build_request(:list_workforces, params)
      req.send_request(options)
    end

    # Gets a list of private work teams that you have defined in a region.
    # The list may be empty if no work team satisfies the filter specified
    # in the `NameContains` parameter.
    #
    # @option params [String] :sort_by
    #   The field to sort results by. The default is `CreationTime`.
    #
    # @option params [String] :sort_order
    #   The sort order for results. The default is `Ascending`.
    #
    # @option params [String] :name_contains
    #   A string in the work team's name. This filter returns only work teams
    #   whose name contains the specified string.
    #
    # @option params [String] :next_token
    #   If the result of the previous `ListWorkteams` request was truncated,
    #   the response includes a `NextToken`. To retrieve the next set of
    #   labeling jobs, use the token in the next request.
    #
    # @option params [Integer] :max_results
    #   The maximum number of work teams to return in each page of the
    #   response.
    #
    # @return [Types::ListWorkteamsResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::ListWorkteamsResponse#workteams #workteams} => Array&lt;Types::Workteam&gt;
    #   * {Types::ListWorkteamsResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.list_workteams({
    #     sort_by: "Name", # accepts Name, CreateDate
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     name_contains: "WorkteamName",
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.workteams #=> Array
    #   resp.workteams[0].workteam_name #=> String
    #   resp.workteams[0].member_definitions #=> Array
    #   resp.workteams[0].member_definitions[0].cognito_member_definition.user_pool #=> String
    #   resp.workteams[0].member_definitions[0].cognito_member_definition.user_group #=> String
    #   resp.workteams[0].member_definitions[0].cognito_member_definition.client_id #=> String
    #   resp.workteams[0].member_definitions[0].oidc_member_definition.groups #=> Array
    #   resp.workteams[0].member_definitions[0].oidc_member_definition.groups[0] #=> String
    #   resp.workteams[0].workteam_arn #=> String
    #   resp.workteams[0].workforce_arn #=> String
    #   resp.workteams[0].product_listing_ids #=> Array
    #   resp.workteams[0].product_listing_ids[0] #=> String
    #   resp.workteams[0].description #=> String
    #   resp.workteams[0].sub_domain #=> String
    #   resp.workteams[0].create_date #=> Time
    #   resp.workteams[0].last_updated_date #=> Time
    #   resp.workteams[0].notification_configuration.notification_topic_arn #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/ListWorkteams AWS API Documentation
    #
    # @overload list_workteams(params = {})
    # @param [Hash] params ({})
    def list_workteams(params = {}, options = {})
      req = build_request(:list_workteams, params)
      req.send_request(options)
    end

    # Adds a resouce policy to control access to a model group. For
    # information about resoure policies, see [Identity-based policies and
    # resource-based policies][1] in the *Amazon Web Services Identity and
    # Access Management User Guide.*.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_identity-vs-resource.html
    #
    # @option params [required, String] :model_package_group_name
    #   The name of the model group to add a resource policy to.
    #
    # @option params [required, String] :resource_policy
    #   The resource policy for the model group.
    #
    # @return [Types::PutModelPackageGroupPolicyOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::PutModelPackageGroupPolicyOutput#model_package_group_arn #model_package_group_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.put_model_package_group_policy({
    #     model_package_group_name: "EntityName", # required
    #     resource_policy: "PolicyString", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_group_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/PutModelPackageGroupPolicy AWS API Documentation
    #
    # @overload put_model_package_group_policy(params = {})
    # @param [Hash] params ({})
    def put_model_package_group_policy(params = {}, options = {})
      req = build_request(:put_model_package_group_policy, params)
      req.send_request(options)
    end

    # Register devices.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet.
    #
    # @option params [required, Array<Types::Device>] :devices
    #   A list of devices to register with SageMaker Edge Manager.
    #
    # @option params [Array<Types::Tag>] :tags
    #   The tags associated with devices.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.register_devices({
    #     device_fleet_name: "EntityName", # required
    #     devices: [ # required
    #       {
    #         device_name: "DeviceName", # required
    #         description: "DeviceDescription",
    #         iot_thing_name: "ThingName",
    #       },
    #     ],
    #     tags: [
    #       {
    #         key: "TagKey", # required
    #         value: "TagValue", # required
    #       },
    #     ],
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/RegisterDevices AWS API Documentation
    #
    # @overload register_devices(params = {})
    # @param [Hash] params ({})
    def register_devices(params = {}, options = {})
      req = build_request(:register_devices, params)
      req.send_request(options)
    end

    # Renders the UI template so that you can preview the worker's
    # experience.
    #
    # @option params [Types::UiTemplate] :ui_template
    #   A `Template` object containing the worker UI template to render.
    #
    # @option params [required, Types::RenderableTask] :task
    #   A `RenderableTask` object containing a representative task to render.
    #
    # @option params [required, String] :role_arn
    #   The Amazon Resource Name (ARN) that has access to the S3 objects that
    #   are used by the template.
    #
    # @option params [String] :human_task_ui_arn
    #   The `HumanTaskUiArn` of the worker UI that you want to render. Do not
    #   provide a `HumanTaskUiArn` if you use the `UiTemplate` parameter.
    #
    #   See a list of available Human Ui Amazon Resource Names (ARNs) in
    #   UiConfig.
    #
    # @return [Types::RenderUiTemplateResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::RenderUiTemplateResponse#rendered_content #rendered_content} => String
    #   * {Types::RenderUiTemplateResponse#errors #errors} => Array&lt;Types::RenderingError&gt;
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.render_ui_template({
    #     ui_template: {
    #       content: "TemplateContent", # required
    #     },
    #     task: { # required
    #       input: "TaskInput", # required
    #     },
    #     role_arn: "RoleArn", # required
    #     human_task_ui_arn: "HumanTaskUiArn",
    #   })
    #
    # @example Response structure
    #
    #   resp.rendered_content #=> String
    #   resp.errors #=> Array
    #   resp.errors[0].code #=> String
    #   resp.errors[0].message #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/RenderUiTemplate AWS API Documentation
    #
    # @overload render_ui_template(params = {})
    # @param [Hash] params ({})
    def render_ui_template(params = {}, options = {})
      req = build_request(:render_ui_template, params)
      req.send_request(options)
    end

    # Retry the execution of the pipeline.
    #
    # @option params [required, String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @option params [required, String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than once.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::RetryPipelineExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::RetryPipelineExecutionResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.retry_pipeline_execution({
    #     pipeline_execution_arn: "PipelineExecutionArn", # required
    #     client_request_token: "IdempotencyToken", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/RetryPipelineExecution AWS API Documentation
    #
    # @overload retry_pipeline_execution(params = {})
    # @param [Hash] params ({})
    def retry_pipeline_execution(params = {}, options = {})
      req = build_request(:retry_pipeline_execution, params)
      req.send_request(options)
    end

    # Finds Amazon SageMaker resources that match a search query. Matching
    # resources are returned as a list of `SearchRecord` objects in the
    # response. You can sort the search results by any resource property in
    # a ascending or descending order.
    #
    # You can query against the following value types: numeric, text,
    # Boolean, and timestamp.
    #
    # @option params [required, String] :resource
    #   The name of the Amazon SageMaker resource to search for.
    #
    # @option params [Types::SearchExpression] :search_expression
    #   A Boolean conditional statement. Resources must satisfy this condition
    #   to be included in search results. You must provide at least one
    #   subexpression, filter, or nested filter. The maximum number of
    #   recursive `SubExpressions`, `NestedFilters`, and `Filters` that can be
    #   included in a `SearchExpression` object is 50.
    #
    # @option params [String] :sort_by
    #   The name of the resource property used to sort the `SearchResults`.
    #   The default is `LastModifiedTime`.
    #
    # @option params [String] :sort_order
    #   How `SearchResults` are ordered. Valid values are `Ascending` or
    #   `Descending`. The default is `Descending`.
    #
    # @option params [String] :next_token
    #   If more than `MaxResults` resources match the specified
    #   `SearchExpression`, the response includes a `NextToken`. The
    #   `NextToken` can be passed to the next `SearchRequest` to continue
    #   retrieving results.
    #
    # @option params [Integer] :max_results
    #   The maximum number of results to return.
    #
    # @return [Types::SearchResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::SearchResponse#results #results} => Array&lt;Types::SearchRecord&gt;
    #   * {Types::SearchResponse#next_token #next_token} => String
    #
    # The returned {Seahorse::Client::Response response} is a pageable response and is Enumerable. For details on usage see {Aws::PageableResponse PageableResponse}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.search({
    #     resource: "TrainingJob", # required, accepts TrainingJob, Experiment, ExperimentTrial, ExperimentTrialComponent, Endpoint, ModelPackage, ModelPackageGroup, Pipeline, PipelineExecution, FeatureGroup, Project
    #     search_expression: {
    #       filters: [
    #         {
    #           name: "ResourcePropertyName", # required
    #           operator: "Equals", # accepts Equals, NotEquals, GreaterThan, GreaterThanOrEqualTo, LessThan, LessThanOrEqualTo, Contains, Exists, NotExists, In
    #           value: "FilterValue",
    #         },
    #       ],
    #       nested_filters: [
    #         {
    #           nested_property_name: "ResourcePropertyName", # required
    #           filters: [ # required
    #             {
    #               name: "ResourcePropertyName", # required
    #               operator: "Equals", # accepts Equals, NotEquals, GreaterThan, GreaterThanOrEqualTo, LessThan, LessThanOrEqualTo, Contains, Exists, NotExists, In
    #               value: "FilterValue",
    #             },
    #           ],
    #         },
    #       ],
    #       sub_expressions: [
    #         {
    #           # recursive SearchExpression
    #         },
    #       ],
    #       operator: "And", # accepts And, Or
    #     },
    #     sort_by: "ResourcePropertyName",
    #     sort_order: "Ascending", # accepts Ascending, Descending
    #     next_token: "NextToken",
    #     max_results: 1,
    #   })
    #
    # @example Response structure
    #
    #   resp.results #=> Array
    #   resp.results[0].training_job.training_job_name #=> String
    #   resp.results[0].training_job.training_job_arn #=> String
    #   resp.results[0].training_job.tuning_job_arn #=> String
    #   resp.results[0].training_job.labeling_job_arn #=> String
    #   resp.results[0].training_job.auto_ml_job_arn #=> String
    #   resp.results[0].training_job.model_artifacts.s3_model_artifacts #=> String
    #   resp.results[0].training_job.training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.results[0].training_job.secondary_status #=> String, one of "Starting", "LaunchingMLInstances", "PreparingTrainingStack", "Downloading", "DownloadingTrainingImage", "Training", "Uploading", "Stopping", "Stopped", "MaxRuntimeExceeded", "Completed", "Failed", "Interrupted", "MaxWaitTimeExceeded", "Updating", "Restarting"
    #   resp.results[0].training_job.failure_reason #=> String
    #   resp.results[0].training_job.hyper_parameters #=> Hash
    #   resp.results[0].training_job.hyper_parameters["HyperParameterKey"] #=> String
    #   resp.results[0].training_job.algorithm_specification.training_image #=> String
    #   resp.results[0].training_job.algorithm_specification.algorithm_name #=> String
    #   resp.results[0].training_job.algorithm_specification.training_input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.results[0].training_job.algorithm_specification.metric_definitions #=> Array
    #   resp.results[0].training_job.algorithm_specification.metric_definitions[0].name #=> String
    #   resp.results[0].training_job.algorithm_specification.metric_definitions[0].regex #=> String
    #   resp.results[0].training_job.algorithm_specification.enable_sage_maker_metrics_time_series #=> Boolean
    #   resp.results[0].training_job.role_arn #=> String
    #   resp.results[0].training_job.input_data_config #=> Array
    #   resp.results[0].training_job.input_data_config[0].channel_name #=> String
    #   resp.results[0].training_job.input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.results[0].training_job.input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.results[0].training_job.input_data_config[0].data_source.s3_data_source.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.results[0].training_job.input_data_config[0].data_source.s3_data_source.attribute_names #=> Array
    #   resp.results[0].training_job.input_data_config[0].data_source.s3_data_source.attribute_names[0] #=> String
    #   resp.results[0].training_job.input_data_config[0].data_source.file_system_data_source.file_system_id #=> String
    #   resp.results[0].training_job.input_data_config[0].data_source.file_system_data_source.file_system_access_mode #=> String, one of "rw", "ro"
    #   resp.results[0].training_job.input_data_config[0].data_source.file_system_data_source.file_system_type #=> String, one of "EFS", "FSxLustre"
    #   resp.results[0].training_job.input_data_config[0].data_source.file_system_data_source.directory_path #=> String
    #   resp.results[0].training_job.input_data_config[0].content_type #=> String
    #   resp.results[0].training_job.input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.results[0].training_job.input_data_config[0].record_wrapper_type #=> String, one of "None", "RecordIO"
    #   resp.results[0].training_job.input_data_config[0].input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.results[0].training_job.input_data_config[0].shuffle_config.seed #=> Integer
    #   resp.results[0].training_job.output_data_config.kms_key_id #=> String
    #   resp.results[0].training_job.output_data_config.s3_output_path #=> String
    #   resp.results[0].training_job.resource_config.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.results[0].training_job.resource_config.instance_count #=> Integer
    #   resp.results[0].training_job.resource_config.volume_size_in_gb #=> Integer
    #   resp.results[0].training_job.resource_config.volume_kms_key_id #=> String
    #   resp.results[0].training_job.vpc_config.security_group_ids #=> Array
    #   resp.results[0].training_job.vpc_config.security_group_ids[0] #=> String
    #   resp.results[0].training_job.vpc_config.subnets #=> Array
    #   resp.results[0].training_job.vpc_config.subnets[0] #=> String
    #   resp.results[0].training_job.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.results[0].training_job.stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.results[0].training_job.creation_time #=> Time
    #   resp.results[0].training_job.training_start_time #=> Time
    #   resp.results[0].training_job.training_end_time #=> Time
    #   resp.results[0].training_job.last_modified_time #=> Time
    #   resp.results[0].training_job.secondary_status_transitions #=> Array
    #   resp.results[0].training_job.secondary_status_transitions[0].status #=> String, one of "Starting", "LaunchingMLInstances", "PreparingTrainingStack", "Downloading", "DownloadingTrainingImage", "Training", "Uploading", "Stopping", "Stopped", "MaxRuntimeExceeded", "Completed", "Failed", "Interrupted", "MaxWaitTimeExceeded", "Updating", "Restarting"
    #   resp.results[0].training_job.secondary_status_transitions[0].start_time #=> Time
    #   resp.results[0].training_job.secondary_status_transitions[0].end_time #=> Time
    #   resp.results[0].training_job.secondary_status_transitions[0].status_message #=> String
    #   resp.results[0].training_job.final_metric_data_list #=> Array
    #   resp.results[0].training_job.final_metric_data_list[0].metric_name #=> String
    #   resp.results[0].training_job.final_metric_data_list[0].value #=> Float
    #   resp.results[0].training_job.final_metric_data_list[0].timestamp #=> Time
    #   resp.results[0].training_job.enable_network_isolation #=> Boolean
    #   resp.results[0].training_job.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.results[0].training_job.enable_managed_spot_training #=> Boolean
    #   resp.results[0].training_job.checkpoint_config.s3_uri #=> String
    #   resp.results[0].training_job.checkpoint_config.local_path #=> String
    #   resp.results[0].training_job.training_time_in_seconds #=> Integer
    #   resp.results[0].training_job.billable_time_in_seconds #=> Integer
    #   resp.results[0].training_job.debug_hook_config.local_path #=> String
    #   resp.results[0].training_job.debug_hook_config.s3_output_path #=> String
    #   resp.results[0].training_job.debug_hook_config.hook_parameters #=> Hash
    #   resp.results[0].training_job.debug_hook_config.hook_parameters["ConfigKey"] #=> String
    #   resp.results[0].training_job.debug_hook_config.collection_configurations #=> Array
    #   resp.results[0].training_job.debug_hook_config.collection_configurations[0].collection_name #=> String
    #   resp.results[0].training_job.debug_hook_config.collection_configurations[0].collection_parameters #=> Hash
    #   resp.results[0].training_job.debug_hook_config.collection_configurations[0].collection_parameters["ConfigKey"] #=> String
    #   resp.results[0].training_job.experiment_config.experiment_name #=> String
    #   resp.results[0].training_job.experiment_config.trial_name #=> String
    #   resp.results[0].training_job.experiment_config.trial_component_display_name #=> String
    #   resp.results[0].training_job.debug_rule_configurations #=> Array
    #   resp.results[0].training_job.debug_rule_configurations[0].rule_configuration_name #=> String
    #   resp.results[0].training_job.debug_rule_configurations[0].local_path #=> String
    #   resp.results[0].training_job.debug_rule_configurations[0].s3_output_path #=> String
    #   resp.results[0].training_job.debug_rule_configurations[0].rule_evaluator_image #=> String
    #   resp.results[0].training_job.debug_rule_configurations[0].instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].training_job.debug_rule_configurations[0].volume_size_in_gb #=> Integer
    #   resp.results[0].training_job.debug_rule_configurations[0].rule_parameters #=> Hash
    #   resp.results[0].training_job.debug_rule_configurations[0].rule_parameters["ConfigKey"] #=> String
    #   resp.results[0].training_job.tensor_board_output_config.local_path #=> String
    #   resp.results[0].training_job.tensor_board_output_config.s3_output_path #=> String
    #   resp.results[0].training_job.debug_rule_evaluation_statuses #=> Array
    #   resp.results[0].training_job.debug_rule_evaluation_statuses[0].rule_configuration_name #=> String
    #   resp.results[0].training_job.debug_rule_evaluation_statuses[0].rule_evaluation_job_arn #=> String
    #   resp.results[0].training_job.debug_rule_evaluation_statuses[0].rule_evaluation_status #=> String, one of "InProgress", "NoIssuesFound", "IssuesFound", "Error", "Stopping", "Stopped"
    #   resp.results[0].training_job.debug_rule_evaluation_statuses[0].status_details #=> String
    #   resp.results[0].training_job.debug_rule_evaluation_statuses[0].last_modified_time #=> Time
    #   resp.results[0].training_job.environment #=> Hash
    #   resp.results[0].training_job.environment["TrainingEnvironmentKey"] #=> String
    #   resp.results[0].training_job.retry_strategy.maximum_retry_attempts #=> Integer
    #   resp.results[0].training_job.tags #=> Array
    #   resp.results[0].training_job.tags[0].key #=> String
    #   resp.results[0].training_job.tags[0].value #=> String
    #   resp.results[0].experiment.experiment_name #=> String
    #   resp.results[0].experiment.experiment_arn #=> String
    #   resp.results[0].experiment.display_name #=> String
    #   resp.results[0].experiment.source.source_arn #=> String
    #   resp.results[0].experiment.source.source_type #=> String
    #   resp.results[0].experiment.description #=> String
    #   resp.results[0].experiment.creation_time #=> Time
    #   resp.results[0].experiment.created_by.user_profile_arn #=> String
    #   resp.results[0].experiment.created_by.user_profile_name #=> String
    #   resp.results[0].experiment.created_by.domain_id #=> String
    #   resp.results[0].experiment.last_modified_time #=> Time
    #   resp.results[0].experiment.last_modified_by.user_profile_arn #=> String
    #   resp.results[0].experiment.last_modified_by.user_profile_name #=> String
    #   resp.results[0].experiment.last_modified_by.domain_id #=> String
    #   resp.results[0].experiment.tags #=> Array
    #   resp.results[0].experiment.tags[0].key #=> String
    #   resp.results[0].experiment.tags[0].value #=> String
    #   resp.results[0].trial.trial_name #=> String
    #   resp.results[0].trial.trial_arn #=> String
    #   resp.results[0].trial.display_name #=> String
    #   resp.results[0].trial.experiment_name #=> String
    #   resp.results[0].trial.source.source_arn #=> String
    #   resp.results[0].trial.source.source_type #=> String
    #   resp.results[0].trial.creation_time #=> Time
    #   resp.results[0].trial.created_by.user_profile_arn #=> String
    #   resp.results[0].trial.created_by.user_profile_name #=> String
    #   resp.results[0].trial.created_by.domain_id #=> String
    #   resp.results[0].trial.last_modified_time #=> Time
    #   resp.results[0].trial.last_modified_by.user_profile_arn #=> String
    #   resp.results[0].trial.last_modified_by.user_profile_name #=> String
    #   resp.results[0].trial.last_modified_by.domain_id #=> String
    #   resp.results[0].trial.metadata_properties.commit_id #=> String
    #   resp.results[0].trial.metadata_properties.repository #=> String
    #   resp.results[0].trial.metadata_properties.generated_by #=> String
    #   resp.results[0].trial.metadata_properties.project_id #=> String
    #   resp.results[0].trial.tags #=> Array
    #   resp.results[0].trial.tags[0].key #=> String
    #   resp.results[0].trial.tags[0].value #=> String
    #   resp.results[0].trial.trial_component_summaries #=> Array
    #   resp.results[0].trial.trial_component_summaries[0].trial_component_name #=> String
    #   resp.results[0].trial.trial_component_summaries[0].trial_component_arn #=> String
    #   resp.results[0].trial.trial_component_summaries[0].trial_component_source.source_arn #=> String
    #   resp.results[0].trial.trial_component_summaries[0].trial_component_source.source_type #=> String
    #   resp.results[0].trial.trial_component_summaries[0].creation_time #=> Time
    #   resp.results[0].trial.trial_component_summaries[0].created_by.user_profile_arn #=> String
    #   resp.results[0].trial.trial_component_summaries[0].created_by.user_profile_name #=> String
    #   resp.results[0].trial.trial_component_summaries[0].created_by.domain_id #=> String
    #   resp.results[0].trial_component.trial_component_name #=> String
    #   resp.results[0].trial_component.display_name #=> String
    #   resp.results[0].trial_component.trial_component_arn #=> String
    #   resp.results[0].trial_component.source.source_arn #=> String
    #   resp.results[0].trial_component.source.source_type #=> String
    #   resp.results[0].trial_component.status.primary_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.results[0].trial_component.status.message #=> String
    #   resp.results[0].trial_component.start_time #=> Time
    #   resp.results[0].trial_component.end_time #=> Time
    #   resp.results[0].trial_component.creation_time #=> Time
    #   resp.results[0].trial_component.created_by.user_profile_arn #=> String
    #   resp.results[0].trial_component.created_by.user_profile_name #=> String
    #   resp.results[0].trial_component.created_by.domain_id #=> String
    #   resp.results[0].trial_component.last_modified_time #=> Time
    #   resp.results[0].trial_component.last_modified_by.user_profile_arn #=> String
    #   resp.results[0].trial_component.last_modified_by.user_profile_name #=> String
    #   resp.results[0].trial_component.last_modified_by.domain_id #=> String
    #   resp.results[0].trial_component.parameters #=> Hash
    #   resp.results[0].trial_component.parameters["TrialComponentKey256"].string_value #=> String
    #   resp.results[0].trial_component.parameters["TrialComponentKey256"].number_value #=> Float
    #   resp.results[0].trial_component.input_artifacts #=> Hash
    #   resp.results[0].trial_component.input_artifacts["TrialComponentKey64"].media_type #=> String
    #   resp.results[0].trial_component.input_artifacts["TrialComponentKey64"].value #=> String
    #   resp.results[0].trial_component.output_artifacts #=> Hash
    #   resp.results[0].trial_component.output_artifacts["TrialComponentKey64"].media_type #=> String
    #   resp.results[0].trial_component.output_artifacts["TrialComponentKey64"].value #=> String
    #   resp.results[0].trial_component.metrics #=> Array
    #   resp.results[0].trial_component.metrics[0].metric_name #=> String
    #   resp.results[0].trial_component.metrics[0].source_arn #=> String
    #   resp.results[0].trial_component.metrics[0].time_stamp #=> Time
    #   resp.results[0].trial_component.metrics[0].max #=> Float
    #   resp.results[0].trial_component.metrics[0].min #=> Float
    #   resp.results[0].trial_component.metrics[0].last #=> Float
    #   resp.results[0].trial_component.metrics[0].count #=> Integer
    #   resp.results[0].trial_component.metrics[0].avg #=> Float
    #   resp.results[0].trial_component.metrics[0].std_dev #=> Float
    #   resp.results[0].trial_component.metadata_properties.commit_id #=> String
    #   resp.results[0].trial_component.metadata_properties.repository #=> String
    #   resp.results[0].trial_component.metadata_properties.generated_by #=> String
    #   resp.results[0].trial_component.metadata_properties.project_id #=> String
    #   resp.results[0].trial_component.source_detail.source_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.training_job_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.training_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.tuning_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.labeling_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.auto_ml_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.model_artifacts.s3_model_artifacts #=> String
    #   resp.results[0].trial_component.source_detail.training_job.training_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.results[0].trial_component.source_detail.training_job.secondary_status #=> String, one of "Starting", "LaunchingMLInstances", "PreparingTrainingStack", "Downloading", "DownloadingTrainingImage", "Training", "Uploading", "Stopping", "Stopped", "MaxRuntimeExceeded", "Completed", "Failed", "Interrupted", "MaxWaitTimeExceeded", "Updating", "Restarting"
    #   resp.results[0].trial_component.source_detail.training_job.failure_reason #=> String
    #   resp.results[0].trial_component.source_detail.training_job.hyper_parameters #=> Hash
    #   resp.results[0].trial_component.source_detail.training_job.hyper_parameters["HyperParameterKey"] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.training_image #=> String
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.algorithm_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.training_input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.metric_definitions #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.metric_definitions[0].name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.metric_definitions[0].regex #=> String
    #   resp.results[0].trial_component.source_detail.training_job.algorithm_specification.enable_sage_maker_metrics_time_series #=> Boolean
    #   resp.results[0].trial_component.source_detail.training_job.role_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].channel_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.s3_data_source.s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.s3_data_source.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.s3_data_source.attribute_names #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.s3_data_source.attribute_names[0] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.file_system_data_source.file_system_id #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.file_system_data_source.file_system_access_mode #=> String, one of "rw", "ro"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.file_system_data_source.file_system_type #=> String, one of "EFS", "FSxLustre"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].data_source.file_system_data_source.directory_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].content_type #=> String
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].compression_type #=> String, one of "None", "Gzip"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].record_wrapper_type #=> String, one of "None", "RecordIO"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].input_mode #=> String, one of "Pipe", "File", "FastFile"
    #   resp.results[0].trial_component.source_detail.training_job.input_data_config[0].shuffle_config.seed #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.output_data_config.kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.training_job.output_data_config.s3_output_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.resource_config.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.p3dn.24xlarge", "ml.p4d.24xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5n.xlarge", "ml.c5n.2xlarge", "ml.c5n.4xlarge", "ml.c5n.9xlarge", "ml.c5n.18xlarge"
    #   resp.results[0].trial_component.source_detail.training_job.resource_config.instance_count #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.resource_config.volume_size_in_gb #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.resource_config.volume_kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.training_job.vpc_config.security_group_ids #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.vpc_config.security_group_ids[0] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.vpc_config.subnets #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.vpc_config.subnets[0] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.stopping_condition.max_wait_time_in_seconds #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.creation_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.training_start_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.training_end_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.last_modified_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.secondary_status_transitions #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.secondary_status_transitions[0].status #=> String, one of "Starting", "LaunchingMLInstances", "PreparingTrainingStack", "Downloading", "DownloadingTrainingImage", "Training", "Uploading", "Stopping", "Stopped", "MaxRuntimeExceeded", "Completed", "Failed", "Interrupted", "MaxWaitTimeExceeded", "Updating", "Restarting"
    #   resp.results[0].trial_component.source_detail.training_job.secondary_status_transitions[0].start_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.secondary_status_transitions[0].end_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.secondary_status_transitions[0].status_message #=> String
    #   resp.results[0].trial_component.source_detail.training_job.final_metric_data_list #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.final_metric_data_list[0].metric_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.final_metric_data_list[0].value #=> Float
    #   resp.results[0].trial_component.source_detail.training_job.final_metric_data_list[0].timestamp #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.enable_network_isolation #=> Boolean
    #   resp.results[0].trial_component.source_detail.training_job.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.results[0].trial_component.source_detail.training_job.enable_managed_spot_training #=> Boolean
    #   resp.results[0].trial_component.source_detail.training_job.checkpoint_config.s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.training_job.checkpoint_config.local_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.training_time_in_seconds #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.billable_time_in_seconds #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.local_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.s3_output_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.hook_parameters #=> Hash
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.hook_parameters["ConfigKey"] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.collection_configurations #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.collection_configurations[0].collection_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.collection_configurations[0].collection_parameters #=> Hash
    #   resp.results[0].trial_component.source_detail.training_job.debug_hook_config.collection_configurations[0].collection_parameters["ConfigKey"] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.experiment_config.experiment_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.experiment_config.trial_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.experiment_config.trial_component_display_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].rule_configuration_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].local_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].s3_output_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].rule_evaluator_image #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].volume_size_in_gb #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].rule_parameters #=> Hash
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_configurations[0].rule_parameters["ConfigKey"] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.tensor_board_output_config.local_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.tensor_board_output_config.s3_output_path #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_evaluation_statuses #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_evaluation_statuses[0].rule_configuration_name #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_evaluation_statuses[0].rule_evaluation_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_evaluation_statuses[0].rule_evaluation_status #=> String, one of "InProgress", "NoIssuesFound", "IssuesFound", "Error", "Stopping", "Stopped"
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_evaluation_statuses[0].status_details #=> String
    #   resp.results[0].trial_component.source_detail.training_job.debug_rule_evaluation_statuses[0].last_modified_time #=> Time
    #   resp.results[0].trial_component.source_detail.training_job.environment #=> Hash
    #   resp.results[0].trial_component.source_detail.training_job.environment["TrainingEnvironmentKey"] #=> String
    #   resp.results[0].trial_component.source_detail.training_job.retry_strategy.maximum_retry_attempts #=> Integer
    #   resp.results[0].trial_component.source_detail.training_job.tags #=> Array
    #   resp.results[0].trial_component.source_detail.training_job.tags[0].key #=> String
    #   resp.results[0].trial_component.source_detail.training_job.tags[0].value #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].input_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].app_managed #=> Boolean
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].s3_input.s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].s3_input.local_path #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].s3_input.s3_data_type #=> String, one of "ManifestFile", "S3Prefix"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].s3_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].s3_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].s3_input.s3_compression_type #=> String, one of "None", "Gzip"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.catalog #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.database #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.query_string #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.work_group #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.output_s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.output_format #=> String, one of "PARQUET", "ORC", "AVRO", "JSON", "TEXTFILE"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.athena_dataset_definition.output_compression #=> String, one of "GZIP", "SNAPPY", "ZLIB"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.cluster_id #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.database #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.db_user #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.query_string #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.cluster_role_arn #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.output_s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.output_format #=> String, one of "PARQUET", "CSV"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.redshift_dataset_definition.output_compression #=> String, one of "None", "GZIP", "BZIP2", "ZSTD", "SNAPPY"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.local_path #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_inputs[0].dataset_definition.input_mode #=> String, one of "Pipe", "File"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs[0].output_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs[0].s3_output.s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs[0].s3_output.local_path #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs[0].feature_store_output.feature_group_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.outputs[0].app_managed #=> Boolean
    #   resp.results[0].trial_component.source_detail.processing_job.processing_output_config.kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_job_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_resources.cluster_config.instance_count #=> Integer
    #   resp.results[0].trial_component.source_detail.processing_job.processing_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].trial_component.source_detail.processing_job.processing_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.results[0].trial_component.source_detail.processing_job.processing_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.results[0].trial_component.source_detail.processing_job.app_specification.image_uri #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.app_specification.container_entrypoint #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.app_specification.container_entrypoint[0] #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.app_specification.container_arguments #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.app_specification.container_arguments[0] #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.environment #=> Hash
    #   resp.results[0].trial_component.source_detail.processing_job.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.results[0].trial_component.source_detail.processing_job.network_config.enable_network_isolation #=> Boolean
    #   resp.results[0].trial_component.source_detail.processing_job.network_config.vpc_config.security_group_ids #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.network_config.vpc_config.subnets #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.network_config.vpc_config.subnets[0] #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.role_arn #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.experiment_config.experiment_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.experiment_config.trial_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.experiment_config.trial_component_display_name #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.results[0].trial_component.source_detail.processing_job.exit_message #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.failure_reason #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.processing_end_time #=> Time
    #   resp.results[0].trial_component.source_detail.processing_job.processing_start_time #=> Time
    #   resp.results[0].trial_component.source_detail.processing_job.last_modified_time #=> Time
    #   resp.results[0].trial_component.source_detail.processing_job.creation_time #=> Time
    #   resp.results[0].trial_component.source_detail.processing_job.monitoring_schedule_arn #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.auto_ml_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.training_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.tags #=> Array
    #   resp.results[0].trial_component.source_detail.processing_job.tags[0].key #=> String
    #   resp.results[0].trial_component.source_detail.processing_job.tags[0].value #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_job_name #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_job_status #=> String, one of "InProgress", "Completed", "Failed", "Stopping", "Stopped"
    #   resp.results[0].trial_component.source_detail.transform_job.failure_reason #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.model_name #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.max_concurrent_transforms #=> Integer
    #   resp.results[0].trial_component.source_detail.transform_job.model_client_config.invocations_timeout_in_seconds #=> Integer
    #   resp.results[0].trial_component.source_detail.transform_job.model_client_config.invocations_max_retries #=> Integer
    #   resp.results[0].trial_component.source_detail.transform_job.max_payload_in_mb #=> Integer
    #   resp.results[0].trial_component.source_detail.transform_job.batch_strategy #=> String, one of "MultiRecord", "SingleRecord"
    #   resp.results[0].trial_component.source_detail.transform_job.environment #=> Hash
    #   resp.results[0].trial_component.source_detail.transform_job.environment["TransformEnvironmentKey"] #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_input.data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.results[0].trial_component.source_detail.transform_job.transform_input.data_source.s3_data_source.s3_uri #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_input.content_type #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_input.compression_type #=> String, one of "None", "Gzip"
    #   resp.results[0].trial_component.source_detail.transform_job.transform_input.split_type #=> String, one of "None", "Line", "RecordIO", "TFRecord"
    #   resp.results[0].trial_component.source_detail.transform_job.transform_output.s3_output_path #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_output.accept #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_output.assemble_with #=> String, one of "None", "Line"
    #   resp.results[0].trial_component.source_detail.transform_job.transform_output.kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.transform_resources.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].trial_component.source_detail.transform_job.transform_resources.instance_count #=> Integer
    #   resp.results[0].trial_component.source_detail.transform_job.transform_resources.volume_kms_key_id #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.creation_time #=> Time
    #   resp.results[0].trial_component.source_detail.transform_job.transform_start_time #=> Time
    #   resp.results[0].trial_component.source_detail.transform_job.transform_end_time #=> Time
    #   resp.results[0].trial_component.source_detail.transform_job.labeling_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.auto_ml_job_arn #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.data_processing.input_filter #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.data_processing.output_filter #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.data_processing.join_source #=> String, one of "Input", "None"
    #   resp.results[0].trial_component.source_detail.transform_job.experiment_config.experiment_name #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.experiment_config.trial_name #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.experiment_config.trial_component_display_name #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.tags #=> Array
    #   resp.results[0].trial_component.source_detail.transform_job.tags[0].key #=> String
    #   resp.results[0].trial_component.source_detail.transform_job.tags[0].value #=> String
    #   resp.results[0].trial_component.tags #=> Array
    #   resp.results[0].trial_component.tags[0].key #=> String
    #   resp.results[0].trial_component.tags[0].value #=> String
    #   resp.results[0].trial_component.parents #=> Array
    #   resp.results[0].trial_component.parents[0].trial_name #=> String
    #   resp.results[0].trial_component.parents[0].experiment_name #=> String
    #   resp.results[0].endpoint.endpoint_name #=> String
    #   resp.results[0].endpoint.endpoint_arn #=> String
    #   resp.results[0].endpoint.endpoint_config_name #=> String
    #   resp.results[0].endpoint.production_variants #=> Array
    #   resp.results[0].endpoint.production_variants[0].variant_name #=> String
    #   resp.results[0].endpoint.production_variants[0].deployed_images #=> Array
    #   resp.results[0].endpoint.production_variants[0].deployed_images[0].specified_image #=> String
    #   resp.results[0].endpoint.production_variants[0].deployed_images[0].resolved_image #=> String
    #   resp.results[0].endpoint.production_variants[0].deployed_images[0].resolution_time #=> Time
    #   resp.results[0].endpoint.production_variants[0].current_weight #=> Float
    #   resp.results[0].endpoint.production_variants[0].desired_weight #=> Float
    #   resp.results[0].endpoint.production_variants[0].current_instance_count #=> Integer
    #   resp.results[0].endpoint.production_variants[0].desired_instance_count #=> Integer
    #   resp.results[0].endpoint.data_capture_config.enable_capture #=> Boolean
    #   resp.results[0].endpoint.data_capture_config.capture_status #=> String, one of "Started", "Stopped"
    #   resp.results[0].endpoint.data_capture_config.current_sampling_percentage #=> Integer
    #   resp.results[0].endpoint.data_capture_config.destination_s3_uri #=> String
    #   resp.results[0].endpoint.data_capture_config.kms_key_id #=> String
    #   resp.results[0].endpoint.endpoint_status #=> String, one of "OutOfService", "Creating", "Updating", "SystemUpdating", "RollingBack", "InService", "Deleting", "Failed"
    #   resp.results[0].endpoint.failure_reason #=> String
    #   resp.results[0].endpoint.creation_time #=> Time
    #   resp.results[0].endpoint.last_modified_time #=> Time
    #   resp.results[0].endpoint.monitoring_schedules #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_arn #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_status #=> String, one of "Pending", "Failed", "Scheduled", "Stopped"
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.results[0].endpoint.monitoring_schedules[0].failure_reason #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].creation_time #=> Time
    #   resp.results[0].endpoint.monitoring_schedules[0].last_modified_time #=> Time
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.schedule_config.schedule_expression #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.baseline_config.baselining_job_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.baseline_config.constraints_resource.s3_uri #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.baseline_config.statistics_resource.s3_uri #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.endpoint_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.local_path #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.s3_input_mode #=> String, one of "Pipe", "File"
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.s3_data_distribution_type #=> String, one of "FullyReplicated", "ShardedByS3Key"
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.features_attribute #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.inference_attribute #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.probability_attribute #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.probability_threshold_attribute #=> Float
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.start_time_offset #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_inputs[0].endpoint_input.end_time_offset #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs[0].s3_output.s3_uri #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs[0].s3_output.local_path #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.monitoring_outputs[0].s3_output.s3_upload_mode #=> String, one of "Continuous", "EndOfJob"
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_output_config.kms_key_id #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.instance_count #=> Integer
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.instance_type #=> String, one of "ml.t3.medium", "ml.t3.large", "ml.t3.xlarge", "ml.t3.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.8xlarge", "ml.r5.12xlarge", "ml.r5.16xlarge", "ml.r5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.volume_size_in_gb #=> Integer
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_resources.cluster_config.volume_kms_key_id #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.image_uri #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_entrypoint #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_entrypoint[0] #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_arguments #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.container_arguments[0] #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.record_preprocessor_source_uri #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.monitoring_app_specification.post_analytics_processor_source_uri #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.stopping_condition.max_runtime_in_seconds #=> Integer
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.environment #=> Hash
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.environment["ProcessingEnvironmentKey"] #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.network_config.enable_inter_container_traffic_encryption #=> Boolean
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.network_config.enable_network_isolation #=> Boolean
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.security_group_ids #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.security_group_ids[0] #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.subnets #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.network_config.vpc_config.subnets[0] #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition.role_arn #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_job_definition_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].monitoring_schedule_config.monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.results[0].endpoint.monitoring_schedules[0].endpoint_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.monitoring_schedule_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.scheduled_time #=> Time
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.creation_time #=> Time
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.last_modified_time #=> Time
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.monitoring_execution_status #=> String, one of "Pending", "Completed", "CompletedWithViolations", "InProgress", "Failed", "Stopping", "Stopped"
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.processing_job_arn #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.endpoint_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.failure_reason #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.monitoring_job_definition_name #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].last_monitoring_execution_summary.monitoring_type #=> String, one of "DataQuality", "ModelQuality", "ModelBias", "ModelExplainability"
    #   resp.results[0].endpoint.monitoring_schedules[0].tags #=> Array
    #   resp.results[0].endpoint.monitoring_schedules[0].tags[0].key #=> String
    #   resp.results[0].endpoint.monitoring_schedules[0].tags[0].value #=> String
    #   resp.results[0].endpoint.tags #=> Array
    #   resp.results[0].endpoint.tags[0].key #=> String
    #   resp.results[0].endpoint.tags[0].value #=> String
    #   resp.results[0].model_package.model_package_name #=> String
    #   resp.results[0].model_package.model_package_group_name #=> String
    #   resp.results[0].model_package.model_package_version #=> Integer
    #   resp.results[0].model_package.model_package_arn #=> String
    #   resp.results[0].model_package.model_package_description #=> String
    #   resp.results[0].model_package.creation_time #=> Time
    #   resp.results[0].model_package.inference_specification.containers #=> Array
    #   resp.results[0].model_package.inference_specification.containers[0].container_hostname #=> String
    #   resp.results[0].model_package.inference_specification.containers[0].image #=> String
    #   resp.results[0].model_package.inference_specification.containers[0].image_digest #=> String
    #   resp.results[0].model_package.inference_specification.containers[0].model_data_url #=> String
    #   resp.results[0].model_package.inference_specification.containers[0].product_id #=> String
    #   resp.results[0].model_package.inference_specification.containers[0].environment #=> Hash
    #   resp.results[0].model_package.inference_specification.containers[0].environment["EnvironmentKey"] #=> String
    #   resp.results[0].model_package.inference_specification.supported_transform_instance_types #=> Array
    #   resp.results[0].model_package.inference_specification.supported_transform_instance_types[0] #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].model_package.inference_specification.supported_realtime_inference_instance_types #=> Array
    #   resp.results[0].model_package.inference_specification.supported_realtime_inference_instance_types[0] #=> String, one of "ml.t2.medium", "ml.t2.large", "ml.t2.xlarge", "ml.t2.2xlarge", "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.m5d.large", "ml.m5d.xlarge", "ml.m5d.2xlarge", "ml.m5d.4xlarge", "ml.m5d.12xlarge", "ml.m5d.24xlarge", "ml.c4.large", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.large", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.c5d.large", "ml.c5d.xlarge", "ml.c5d.2xlarge", "ml.c5d.4xlarge", "ml.c5d.9xlarge", "ml.c5d.18xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge", "ml.r5.large", "ml.r5.xlarge", "ml.r5.2xlarge", "ml.r5.4xlarge", "ml.r5.12xlarge", "ml.r5.24xlarge", "ml.r5d.large", "ml.r5d.xlarge", "ml.r5d.2xlarge", "ml.r5d.4xlarge", "ml.r5d.12xlarge", "ml.r5d.24xlarge", "ml.inf1.xlarge", "ml.inf1.2xlarge", "ml.inf1.6xlarge", "ml.inf1.24xlarge"
    #   resp.results[0].model_package.inference_specification.supported_content_types #=> Array
    #   resp.results[0].model_package.inference_specification.supported_content_types[0] #=> String
    #   resp.results[0].model_package.inference_specification.supported_response_mime_types #=> Array
    #   resp.results[0].model_package.inference_specification.supported_response_mime_types[0] #=> String
    #   resp.results[0].model_package.source_algorithm_specification.source_algorithms #=> Array
    #   resp.results[0].model_package.source_algorithm_specification.source_algorithms[0].model_data_url #=> String
    #   resp.results[0].model_package.source_algorithm_specification.source_algorithms[0].algorithm_name #=> String
    #   resp.results[0].model_package.validation_specification.validation_role #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles #=> Array
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].profile_name #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.max_concurrent_transforms #=> Integer
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.max_payload_in_mb #=> Integer
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.batch_strategy #=> String, one of "MultiRecord", "SingleRecord"
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.environment #=> Hash
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.environment["TransformEnvironmentKey"] #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_input.data_source.s3_data_source.s3_data_type #=> String, one of "ManifestFile", "S3Prefix", "AugmentedManifestFile"
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_input.data_source.s3_data_source.s3_uri #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_input.content_type #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_input.compression_type #=> String, one of "None", "Gzip"
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_input.split_type #=> String, one of "None", "Line", "RecordIO", "TFRecord"
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_output.s3_output_path #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_output.accept #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_output.assemble_with #=> String, one of "None", "Line"
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_output.kms_key_id #=> String
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.instance_type #=> String, one of "ml.m4.xlarge", "ml.m4.2xlarge", "ml.m4.4xlarge", "ml.m4.10xlarge", "ml.m4.16xlarge", "ml.c4.xlarge", "ml.c4.2xlarge", "ml.c4.4xlarge", "ml.c4.8xlarge", "ml.p2.xlarge", "ml.p2.8xlarge", "ml.p2.16xlarge", "ml.p3.2xlarge", "ml.p3.8xlarge", "ml.p3.16xlarge", "ml.c5.xlarge", "ml.c5.2xlarge", "ml.c5.4xlarge", "ml.c5.9xlarge", "ml.c5.18xlarge", "ml.m5.large", "ml.m5.xlarge", "ml.m5.2xlarge", "ml.m5.4xlarge", "ml.m5.12xlarge", "ml.m5.24xlarge", "ml.g4dn.xlarge", "ml.g4dn.2xlarge", "ml.g4dn.4xlarge", "ml.g4dn.8xlarge", "ml.g4dn.12xlarge", "ml.g4dn.16xlarge"
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.instance_count #=> Integer
    #   resp.results[0].model_package.validation_specification.validation_profiles[0].transform_job_definition.transform_resources.volume_kms_key_id #=> String
    #   resp.results[0].model_package.model_package_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting"
    #   resp.results[0].model_package.model_package_status_details.validation_statuses #=> Array
    #   resp.results[0].model_package.model_package_status_details.validation_statuses[0].name #=> String
    #   resp.results[0].model_package.model_package_status_details.validation_statuses[0].status #=> String, one of "NotStarted", "InProgress", "Completed", "Failed"
    #   resp.results[0].model_package.model_package_status_details.validation_statuses[0].failure_reason #=> String
    #   resp.results[0].model_package.model_package_status_details.image_scan_statuses #=> Array
    #   resp.results[0].model_package.model_package_status_details.image_scan_statuses[0].name #=> String
    #   resp.results[0].model_package.model_package_status_details.image_scan_statuses[0].status #=> String, one of "NotStarted", "InProgress", "Completed", "Failed"
    #   resp.results[0].model_package.model_package_status_details.image_scan_statuses[0].failure_reason #=> String
    #   resp.results[0].model_package.certify_for_marketplace #=> Boolean
    #   resp.results[0].model_package.model_approval_status #=> String, one of "Approved", "Rejected", "PendingManualApproval"
    #   resp.results[0].model_package.created_by.user_profile_arn #=> String
    #   resp.results[0].model_package.created_by.user_profile_name #=> String
    #   resp.results[0].model_package.created_by.domain_id #=> String
    #   resp.results[0].model_package.metadata_properties.commit_id #=> String
    #   resp.results[0].model_package.metadata_properties.repository #=> String
    #   resp.results[0].model_package.metadata_properties.generated_by #=> String
    #   resp.results[0].model_package.metadata_properties.project_id #=> String
    #   resp.results[0].model_package.model_metrics.model_quality.statistics.content_type #=> String
    #   resp.results[0].model_package.model_metrics.model_quality.statistics.content_digest #=> String
    #   resp.results[0].model_package.model_metrics.model_quality.statistics.s3_uri #=> String
    #   resp.results[0].model_package.model_metrics.model_quality.constraints.content_type #=> String
    #   resp.results[0].model_package.model_metrics.model_quality.constraints.content_digest #=> String
    #   resp.results[0].model_package.model_metrics.model_quality.constraints.s3_uri #=> String
    #   resp.results[0].model_package.model_metrics.model_data_quality.statistics.content_type #=> String
    #   resp.results[0].model_package.model_metrics.model_data_quality.statistics.content_digest #=> String
    #   resp.results[0].model_package.model_metrics.model_data_quality.statistics.s3_uri #=> String
    #   resp.results[0].model_package.model_metrics.model_data_quality.constraints.content_type #=> String
    #   resp.results[0].model_package.model_metrics.model_data_quality.constraints.content_digest #=> String
    #   resp.results[0].model_package.model_metrics.model_data_quality.constraints.s3_uri #=> String
    #   resp.results[0].model_package.model_metrics.bias.report.content_type #=> String
    #   resp.results[0].model_package.model_metrics.bias.report.content_digest #=> String
    #   resp.results[0].model_package.model_metrics.bias.report.s3_uri #=> String
    #   resp.results[0].model_package.model_metrics.explainability.report.content_type #=> String
    #   resp.results[0].model_package.model_metrics.explainability.report.content_digest #=> String
    #   resp.results[0].model_package.model_metrics.explainability.report.s3_uri #=> String
    #   resp.results[0].model_package.last_modified_time #=> Time
    #   resp.results[0].model_package.last_modified_by.user_profile_arn #=> String
    #   resp.results[0].model_package.last_modified_by.user_profile_name #=> String
    #   resp.results[0].model_package.last_modified_by.domain_id #=> String
    #   resp.results[0].model_package.approval_description #=> String
    #   resp.results[0].model_package.tags #=> Array
    #   resp.results[0].model_package.tags[0].key #=> String
    #   resp.results[0].model_package.tags[0].value #=> String
    #   resp.results[0].model_package_group.model_package_group_name #=> String
    #   resp.results[0].model_package_group.model_package_group_arn #=> String
    #   resp.results[0].model_package_group.model_package_group_description #=> String
    #   resp.results[0].model_package_group.creation_time #=> Time
    #   resp.results[0].model_package_group.created_by.user_profile_arn #=> String
    #   resp.results[0].model_package_group.created_by.user_profile_name #=> String
    #   resp.results[0].model_package_group.created_by.domain_id #=> String
    #   resp.results[0].model_package_group.model_package_group_status #=> String, one of "Pending", "InProgress", "Completed", "Failed", "Deleting", "DeleteFailed"
    #   resp.results[0].model_package_group.tags #=> Array
    #   resp.results[0].model_package_group.tags[0].key #=> String
    #   resp.results[0].model_package_group.tags[0].value #=> String
    #   resp.results[0].pipeline.pipeline_arn #=> String
    #   resp.results[0].pipeline.pipeline_name #=> String
    #   resp.results[0].pipeline.pipeline_display_name #=> String
    #   resp.results[0].pipeline.pipeline_description #=> String
    #   resp.results[0].pipeline.role_arn #=> String
    #   resp.results[0].pipeline.pipeline_status #=> String, one of "Active"
    #   resp.results[0].pipeline.creation_time #=> Time
    #   resp.results[0].pipeline.last_modified_time #=> Time
    #   resp.results[0].pipeline.last_run_time #=> Time
    #   resp.results[0].pipeline.created_by.user_profile_arn #=> String
    #   resp.results[0].pipeline.created_by.user_profile_name #=> String
    #   resp.results[0].pipeline.created_by.domain_id #=> String
    #   resp.results[0].pipeline.last_modified_by.user_profile_arn #=> String
    #   resp.results[0].pipeline.last_modified_by.user_profile_name #=> String
    #   resp.results[0].pipeline.last_modified_by.domain_id #=> String
    #   resp.results[0].pipeline.tags #=> Array
    #   resp.results[0].pipeline.tags[0].key #=> String
    #   resp.results[0].pipeline.tags[0].value #=> String
    #   resp.results[0].pipeline_execution.pipeline_arn #=> String
    #   resp.results[0].pipeline_execution.pipeline_execution_arn #=> String
    #   resp.results[0].pipeline_execution.pipeline_execution_display_name #=> String
    #   resp.results[0].pipeline_execution.pipeline_execution_status #=> String, one of "Executing", "Stopping", "Stopped", "Failed", "Succeeded"
    #   resp.results[0].pipeline_execution.pipeline_execution_description #=> String
    #   resp.results[0].pipeline_execution.pipeline_experiment_config.experiment_name #=> String
    #   resp.results[0].pipeline_execution.pipeline_experiment_config.trial_name #=> String
    #   resp.results[0].pipeline_execution.failure_reason #=> String
    #   resp.results[0].pipeline_execution.creation_time #=> Time
    #   resp.results[0].pipeline_execution.last_modified_time #=> Time
    #   resp.results[0].pipeline_execution.created_by.user_profile_arn #=> String
    #   resp.results[0].pipeline_execution.created_by.user_profile_name #=> String
    #   resp.results[0].pipeline_execution.created_by.domain_id #=> String
    #   resp.results[0].pipeline_execution.last_modified_by.user_profile_arn #=> String
    #   resp.results[0].pipeline_execution.last_modified_by.user_profile_name #=> String
    #   resp.results[0].pipeline_execution.last_modified_by.domain_id #=> String
    #   resp.results[0].pipeline_execution.pipeline_parameters #=> Array
    #   resp.results[0].pipeline_execution.pipeline_parameters[0].name #=> String
    #   resp.results[0].pipeline_execution.pipeline_parameters[0].value #=> String
    #   resp.results[0].feature_group.feature_group_arn #=> String
    #   resp.results[0].feature_group.feature_group_name #=> String
    #   resp.results[0].feature_group.record_identifier_feature_name #=> String
    #   resp.results[0].feature_group.event_time_feature_name #=> String
    #   resp.results[0].feature_group.feature_definitions #=> Array
    #   resp.results[0].feature_group.feature_definitions[0].feature_name #=> String
    #   resp.results[0].feature_group.feature_definitions[0].feature_type #=> String, one of "Integral", "Fractional", "String"
    #   resp.results[0].feature_group.creation_time #=> Time
    #   resp.results[0].feature_group.online_store_config.security_config.kms_key_id #=> String
    #   resp.results[0].feature_group.online_store_config.enable_online_store #=> Boolean
    #   resp.results[0].feature_group.offline_store_config.s3_storage_config.s3_uri #=> String
    #   resp.results[0].feature_group.offline_store_config.s3_storage_config.kms_key_id #=> String
    #   resp.results[0].feature_group.offline_store_config.s3_storage_config.resolved_output_s3_uri #=> String
    #   resp.results[0].feature_group.offline_store_config.disable_glue_table_creation #=> Boolean
    #   resp.results[0].feature_group.offline_store_config.data_catalog_config.table_name #=> String
    #   resp.results[0].feature_group.offline_store_config.data_catalog_config.catalog #=> String
    #   resp.results[0].feature_group.offline_store_config.data_catalog_config.database #=> String
    #   resp.results[0].feature_group.role_arn #=> String
    #   resp.results[0].feature_group.feature_group_status #=> String, one of "Creating", "Created", "CreateFailed", "Deleting", "DeleteFailed"
    #   resp.results[0].feature_group.offline_store_status.status #=> String, one of "Active", "Blocked", "Disabled"
    #   resp.results[0].feature_group.offline_store_status.blocked_reason #=> String
    #   resp.results[0].feature_group.failure_reason #=> String
    #   resp.results[0].feature_group.description #=> String
    #   resp.results[0].feature_group.tags #=> Array
    #   resp.results[0].feature_group.tags[0].key #=> String
    #   resp.results[0].feature_group.tags[0].value #=> String
    #   resp.results[0].project.project_arn #=> String
    #   resp.results[0].project.project_name #=> String
    #   resp.results[0].project.project_id #=> String
    #   resp.results[0].project.project_description #=> String
    #   resp.results[0].project.service_catalog_provisioning_details.product_id #=> String
    #   resp.results[0].project.service_catalog_provisioning_details.provisioning_artifact_id #=> String
    #   resp.results[0].project.service_catalog_provisioning_details.path_id #=> String
    #   resp.results[0].project.service_catalog_provisioning_details.provisioning_parameters #=> Array
    #   resp.results[0].project.service_catalog_provisioning_details.provisioning_parameters[0].key #=> String
    #   resp.results[0].project.service_catalog_provisioning_details.provisioning_parameters[0].value #=> String
    #   resp.results[0].project.service_catalog_provisioned_product_details.provisioned_product_id #=> String
    #   resp.results[0].project.service_catalog_provisioned_product_details.provisioned_product_status_message #=> String
    #   resp.results[0].project.project_status #=> String, one of "Pending", "CreateInProgress", "CreateCompleted", "CreateFailed", "DeleteInProgress", "DeleteFailed", "DeleteCompleted"
    #   resp.results[0].project.created_by.user_profile_arn #=> String
    #   resp.results[0].project.created_by.user_profile_name #=> String
    #   resp.results[0].project.created_by.domain_id #=> String
    #   resp.results[0].project.creation_time #=> Time
    #   resp.results[0].project.tags #=> Array
    #   resp.results[0].project.tags[0].key #=> String
    #   resp.results[0].project.tags[0].value #=> String
    #   resp.next_token #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/Search AWS API Documentation
    #
    # @overload search(params = {})
    # @param [Hash] params ({})
    def search(params = {}, options = {})
      req = build_request(:search, params)
      req.send_request(options)
    end

    # Notifies the pipeline that the execution of a callback step failed,
    # along with a message describing why. When a callback step is run, the
    # pipeline generates a callback token and includes the token in a
    # message sent to Amazon Simple Queue Service (Amazon SQS).
    #
    # @option params [required, String] :callback_token
    #   The pipeline generated token from the Amazon SQS queue.
    #
    # @option params [String] :failure_reason
    #   A message describing why the step failed.
    #
    # @option params [String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than one time.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::SendPipelineExecutionStepFailureResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::SendPipelineExecutionStepFailureResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.send_pipeline_execution_step_failure({
    #     callback_token: "CallbackToken", # required
    #     failure_reason: "String256",
    #     client_request_token: "IdempotencyToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/SendPipelineExecutionStepFailure AWS API Documentation
    #
    # @overload send_pipeline_execution_step_failure(params = {})
    # @param [Hash] params ({})
    def send_pipeline_execution_step_failure(params = {}, options = {})
      req = build_request(:send_pipeline_execution_step_failure, params)
      req.send_request(options)
    end

    # Notifies the pipeline that the execution of a callback step succeeded
    # and provides a list of the step's output parameters. When a callback
    # step is run, the pipeline generates a callback token and includes the
    # token in a message sent to Amazon Simple Queue Service (Amazon SQS).
    #
    # @option params [required, String] :callback_token
    #   The pipeline generated token from the Amazon SQS queue.
    #
    # @option params [Array<Types::OutputParameter>] :output_parameters
    #   A list of the output parameters of the callback step.
    #
    # @option params [String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than one time.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::SendPipelineExecutionStepSuccessResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::SendPipelineExecutionStepSuccessResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.send_pipeline_execution_step_success({
    #     callback_token: "CallbackToken", # required
    #     output_parameters: [
    #       {
    #         name: "String256", # required
    #         value: "String1024", # required
    #       },
    #     ],
    #     client_request_token: "IdempotencyToken",
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/SendPipelineExecutionStepSuccess AWS API Documentation
    #
    # @overload send_pipeline_execution_step_success(params = {})
    # @param [Hash] params ({})
    def send_pipeline_execution_step_success(params = {}, options = {})
      req = build_request(:send_pipeline_execution_step_success, params)
      req.send_request(options)
    end

    # Starts a previously stopped monitoring schedule.
    #
    # <note markdown="1"> By default, when you successfully create a new schedule, the status of
    # a monitoring schedule is `scheduled`.
    #
    #  </note>
    #
    # @option params [required, String] :monitoring_schedule_name
    #   The name of the schedule to start.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.start_monitoring_schedule({
    #     monitoring_schedule_name: "MonitoringScheduleName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StartMonitoringSchedule AWS API Documentation
    #
    # @overload start_monitoring_schedule(params = {})
    # @param [Hash] params ({})
    def start_monitoring_schedule(params = {}, options = {})
      req = build_request(:start_monitoring_schedule, params)
      req.send_request(options)
    end

    # Launches an ML compute instance with the latest version of the
    # libraries and attaches your ML storage volume. After configuring the
    # notebook instance, Amazon SageMaker sets the notebook instance status
    # to `InService`. A notebook instance's status must be `InService`
    # before you can connect to your Jupyter notebook.
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the notebook instance to start.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.start_notebook_instance({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StartNotebookInstance AWS API Documentation
    #
    # @overload start_notebook_instance(params = {})
    # @param [Hash] params ({})
    def start_notebook_instance(params = {}, options = {})
      req = build_request(:start_notebook_instance, params)
      req.send_request(options)
    end

    # Starts a pipeline execution.
    #
    # @option params [required, String] :pipeline_name
    #   The name of the pipeline.
    #
    # @option params [String] :pipeline_execution_display_name
    #   The display name of the pipeline execution.
    #
    # @option params [Array<Types::Parameter>] :pipeline_parameters
    #   Contains a list of pipeline parameters. This list can be empty.
    #
    # @option params [String] :pipeline_execution_description
    #   The description of the pipeline execution.
    #
    # @option params [required, String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than once.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::StartPipelineExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::StartPipelineExecutionResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.start_pipeline_execution({
    #     pipeline_name: "PipelineName", # required
    #     pipeline_execution_display_name: "PipelineExecutionName",
    #     pipeline_parameters: [
    #       {
    #         name: "PipelineParameterName", # required
    #         value: "String1024", # required
    #       },
    #     ],
    #     pipeline_execution_description: "PipelineExecutionDescription",
    #     client_request_token: "IdempotencyToken", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StartPipelineExecution AWS API Documentation
    #
    # @overload start_pipeline_execution(params = {})
    # @param [Hash] params ({})
    def start_pipeline_execution(params = {}, options = {})
      req = build_request(:start_pipeline_execution, params)
      req.send_request(options)
    end

    # A method for forcing the termination of a running job.
    #
    # @option params [required, String] :auto_ml_job_name
    #   The name of the object you are requesting.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_auto_ml_job({
    #     auto_ml_job_name: "AutoMLJobName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopAutoMLJob AWS API Documentation
    #
    # @overload stop_auto_ml_job(params = {})
    # @param [Hash] params ({})
    def stop_auto_ml_job(params = {}, options = {})
      req = build_request(:stop_auto_ml_job, params)
      req.send_request(options)
    end

    # Stops a model compilation job.
    #
    # To stop a job, Amazon SageMaker sends the algorithm the SIGTERM
    # signal. This gracefully shuts the job down. If the job hasn't
    # stopped, it sends the SIGKILL signal.
    #
    # When it receives a `StopCompilationJob` request, Amazon SageMaker
    # changes the CompilationJobSummary$CompilationJobStatus of the job to
    # `Stopping`. After Amazon SageMaker stops the job, it sets the
    # CompilationJobSummary$CompilationJobStatus to `Stopped`.
    #
    # @option params [required, String] :compilation_job_name
    #   The name of the model compilation job to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_compilation_job({
    #     compilation_job_name: "EntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopCompilationJob AWS API Documentation
    #
    # @overload stop_compilation_job(params = {})
    # @param [Hash] params ({})
    def stop_compilation_job(params = {}, options = {})
      req = build_request(:stop_compilation_job, params)
      req.send_request(options)
    end

    # Request to stop an edge packaging job.
    #
    # @option params [required, String] :edge_packaging_job_name
    #   The name of the edge packaging job.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_edge_packaging_job({
    #     edge_packaging_job_name: "EntityName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopEdgePackagingJob AWS API Documentation
    #
    # @overload stop_edge_packaging_job(params = {})
    # @param [Hash] params ({})
    def stop_edge_packaging_job(params = {}, options = {})
      req = build_request(:stop_edge_packaging_job, params)
      req.send_request(options)
    end

    # Stops a running hyperparameter tuning job and all running training
    # jobs that the tuning job launched.
    #
    # All model artifacts output from the training jobs are stored in Amazon
    # Simple Storage Service (Amazon S3). All data that the training jobs
    # write to Amazon CloudWatch Logs are still available in CloudWatch.
    # After the tuning job moves to the `Stopped` state, it releases all
    # reserved resources for the tuning job.
    #
    # @option params [required, String] :hyper_parameter_tuning_job_name
    #   The name of the tuning job to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_hyper_parameter_tuning_job({
    #     hyper_parameter_tuning_job_name: "HyperParameterTuningJobName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopHyperParameterTuningJob AWS API Documentation
    #
    # @overload stop_hyper_parameter_tuning_job(params = {})
    # @param [Hash] params ({})
    def stop_hyper_parameter_tuning_job(params = {}, options = {})
      req = build_request(:stop_hyper_parameter_tuning_job, params)
      req.send_request(options)
    end

    # Stops a running labeling job. A job that is stopped cannot be
    # restarted. Any results obtained before the job is stopped are placed
    # in the Amazon S3 output bucket.
    #
    # @option params [required, String] :labeling_job_name
    #   The name of the labeling job to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_labeling_job({
    #     labeling_job_name: "LabelingJobName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopLabelingJob AWS API Documentation
    #
    # @overload stop_labeling_job(params = {})
    # @param [Hash] params ({})
    def stop_labeling_job(params = {}, options = {})
      req = build_request(:stop_labeling_job, params)
      req.send_request(options)
    end

    # Stops a previously started monitoring schedule.
    #
    # @option params [required, String] :monitoring_schedule_name
    #   The name of the schedule to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_monitoring_schedule({
    #     monitoring_schedule_name: "MonitoringScheduleName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopMonitoringSchedule AWS API Documentation
    #
    # @overload stop_monitoring_schedule(params = {})
    # @param [Hash] params ({})
    def stop_monitoring_schedule(params = {}, options = {})
      req = build_request(:stop_monitoring_schedule, params)
      req.send_request(options)
    end

    # Terminates the ML compute instance. Before terminating the instance,
    # Amazon SageMaker disconnects the ML storage volume from it. Amazon
    # SageMaker preserves the ML storage volume. Amazon SageMaker stops
    # charging you for the ML compute instance when you call
    # `StopNotebookInstance`.
    #
    # To access data on the ML storage volume for a notebook instance that
    # has been terminated, call the `StartNotebookInstance` API.
    # `StartNotebookInstance` launches another ML compute instance,
    # configures it, and attaches the preserved ML storage volume so you can
    # continue your work.
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the notebook instance to terminate.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_notebook_instance({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopNotebookInstance AWS API Documentation
    #
    # @overload stop_notebook_instance(params = {})
    # @param [Hash] params ({})
    def stop_notebook_instance(params = {}, options = {})
      req = build_request(:stop_notebook_instance, params)
      req.send_request(options)
    end

    # Stops a pipeline execution.
    #
    # **Callback Step**
    #
    # A pipeline execution won't stop while a callback step is running.
    # When you call `StopPipelineExecution` on a pipeline execution with a
    # running callback step, SageMaker Pipelines sends an additional Amazon
    # SQS message to the specified SQS queue. The body of the SQS message
    # contains a "Status" field which is set to "Stopping".
    #
    # You should add logic to your Amazon SQS message consumer to take any
    # needed action (for example, resource cleanup) upon receipt of the
    # message followed by a call to `SendPipelineExecutionStepSuccess` or
    # `SendPipelineExecutionStepFailure`.
    #
    # Only when SageMaker Pipelines receives one of these calls will it stop
    # the pipeline execution.
    #
    # **Lambda Step**
    #
    # A pipeline execution can't be stopped while a lambda step is running
    # because the Lambda function invoked by the lambda step can't be
    # stopped. If you attempt to stop the execution while the Lambda
    # function is running, the pipeline waits for the Lambda function to
    # finish or until the timeout is hit, whichever occurs first, and then
    # stops. If the Lambda function finishes, the pipeline execution status
    # is `Stopped`. If the timeout is hit the pipeline execution status is
    # `Failed`.
    #
    # @option params [required, String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @option params [required, String] :client_request_token
    #   A unique, case-sensitive identifier that you provide to ensure the
    #   idempotency of the operation. An idempotent operation completes no
    #   more than once.
    #
    #   **A suitable default value is auto-generated.** You should normally
    #   not need to pass this option.**
    #
    # @return [Types::StopPipelineExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::StopPipelineExecutionResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_pipeline_execution({
    #     pipeline_execution_arn: "PipelineExecutionArn", # required
    #     client_request_token: "IdempotencyToken", # required
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopPipelineExecution AWS API Documentation
    #
    # @overload stop_pipeline_execution(params = {})
    # @param [Hash] params ({})
    def stop_pipeline_execution(params = {}, options = {})
      req = build_request(:stop_pipeline_execution, params)
      req.send_request(options)
    end

    # Stops a processing job.
    #
    # @option params [required, String] :processing_job_name
    #   The name of the processing job to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_processing_job({
    #     processing_job_name: "ProcessingJobName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopProcessingJob AWS API Documentation
    #
    # @overload stop_processing_job(params = {})
    # @param [Hash] params ({})
    def stop_processing_job(params = {}, options = {})
      req = build_request(:stop_processing_job, params)
      req.send_request(options)
    end

    # Stops a training job. To stop a job, Amazon SageMaker sends the
    # algorithm the `SIGTERM` signal, which delays job termination for 120
    # seconds. Algorithms might use this 120-second window to save the model
    # artifacts, so the results of the training is not lost.
    #
    # When it receives a `StopTrainingJob` request, Amazon SageMaker changes
    # the status of the job to `Stopping`. After Amazon SageMaker stops the
    # job, it sets the status to `Stopped`.
    #
    # @option params [required, String] :training_job_name
    #   The name of the training job to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_training_job({
    #     training_job_name: "TrainingJobName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopTrainingJob AWS API Documentation
    #
    # @overload stop_training_job(params = {})
    # @param [Hash] params ({})
    def stop_training_job(params = {}, options = {})
      req = build_request(:stop_training_job, params)
      req.send_request(options)
    end

    # Stops a transform job.
    #
    # When Amazon SageMaker receives a `StopTransformJob` request, the
    # status of the job changes to `Stopping`. After Amazon SageMaker stops
    # the job, the status is set to `Stopped`. When you stop a transform job
    # before it is completed, Amazon SageMaker doesn't store the job's
    # output in Amazon S3.
    #
    # @option params [required, String] :transform_job_name
    #   The name of the transform job to stop.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.stop_transform_job({
    #     transform_job_name: "TransformJobName", # required
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/StopTransformJob AWS API Documentation
    #
    # @overload stop_transform_job(params = {})
    # @param [Hash] params ({})
    def stop_transform_job(params = {}, options = {})
      req = build_request(:stop_transform_job, params)
      req.send_request(options)
    end

    # Updates an action.
    #
    # @option params [required, String] :action_name
    #   The name of the action to update.
    #
    # @option params [String] :description
    #   The new description for the action.
    #
    # @option params [String] :status
    #   The new status for the action.
    #
    # @option params [Hash<String,String>] :properties
    #   The new list of properties. Overwrites the current property list.
    #
    # @option params [Array<String>] :properties_to_remove
    #   A list of properties to remove.
    #
    # @return [Types::UpdateActionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateActionResponse#action_arn #action_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_action({
    #     action_name: "ExperimentEntityName", # required
    #     description: "ExperimentDescription",
    #     status: "Unknown", # accepts Unknown, InProgress, Completed, Failed, Stopping, Stopped
    #     properties: {
    #       "StringParameterValue" => "StringParameterValue",
    #     },
    #     properties_to_remove: ["StringParameterValue"],
    #   })
    #
    # @example Response structure
    #
    #   resp.action_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateAction AWS API Documentation
    #
    # @overload update_action(params = {})
    # @param [Hash] params ({})
    def update_action(params = {}, options = {})
      req = build_request(:update_action, params)
      req.send_request(options)
    end

    # Updates the properties of an AppImageConfig.
    #
    # @option params [required, String] :app_image_config_name
    #   The name of the AppImageConfig to update.
    #
    # @option params [Types::KernelGatewayImageConfig] :kernel_gateway_image_config
    #   The new KernelGateway app to run on the image.
    #
    # @return [Types::UpdateAppImageConfigResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateAppImageConfigResponse#app_image_config_arn #app_image_config_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_app_image_config({
    #     app_image_config_name: "AppImageConfigName", # required
    #     kernel_gateway_image_config: {
    #       kernel_specs: [ # required
    #         {
    #           name: "KernelName", # required
    #           display_name: "KernelDisplayName",
    #         },
    #       ],
    #       file_system_config: {
    #         mount_path: "MountPath",
    #         default_uid: 1,
    #         default_gid: 1,
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.app_image_config_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateAppImageConfig AWS API Documentation
    #
    # @overload update_app_image_config(params = {})
    # @param [Hash] params ({})
    def update_app_image_config(params = {}, options = {})
      req = build_request(:update_app_image_config, params)
      req.send_request(options)
    end

    # Updates an artifact.
    #
    # @option params [required, String] :artifact_arn
    #   The Amazon Resource Name (ARN) of the artifact to update.
    #
    # @option params [String] :artifact_name
    #   The new name for the artifact.
    #
    # @option params [Hash<String,String>] :properties
    #   The new list of properties. Overwrites the current property list.
    #
    # @option params [Array<String>] :properties_to_remove
    #   A list of properties to remove.
    #
    # @return [Types::UpdateArtifactResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateArtifactResponse#artifact_arn #artifact_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_artifact({
    #     artifact_arn: "ArtifactArn", # required
    #     artifact_name: "ExperimentEntityName",
    #     properties: {
    #       "StringParameterValue" => "StringParameterValue",
    #     },
    #     properties_to_remove: ["StringParameterValue"],
    #   })
    #
    # @example Response structure
    #
    #   resp.artifact_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateArtifact AWS API Documentation
    #
    # @overload update_artifact(params = {})
    # @param [Hash] params ({})
    def update_artifact(params = {}, options = {})
      req = build_request(:update_artifact, params)
      req.send_request(options)
    end

    # Updates the specified Git repository with the specified values.
    #
    # @option params [required, String] :code_repository_name
    #   The name of the Git repository to update.
    #
    # @option params [Types::GitConfigForUpdate] :git_config
    #   The configuration of the git repository, including the URL and the
    #   Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
    #   secret that contains the credentials used to access the repository.
    #   The secret must have a staging label of `AWSCURRENT` and must be in
    #   the following format:
    #
    #   `\{"username": UserName, "password": Password\}`
    #
    # @return [Types::UpdateCodeRepositoryOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateCodeRepositoryOutput#code_repository_arn #code_repository_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_code_repository({
    #     code_repository_name: "EntityName", # required
    #     git_config: {
    #       secret_arn: "SecretArn",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.code_repository_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateCodeRepository AWS API Documentation
    #
    # @overload update_code_repository(params = {})
    # @param [Hash] params ({})
    def update_code_repository(params = {}, options = {})
      req = build_request(:update_code_repository, params)
      req.send_request(options)
    end

    # Updates a context.
    #
    # @option params [required, String] :context_name
    #   The name of the context to update.
    #
    # @option params [String] :description
    #   The new description for the context.
    #
    # @option params [Hash<String,String>] :properties
    #   The new list of properties. Overwrites the current property list.
    #
    # @option params [Array<String>] :properties_to_remove
    #   A list of properties to remove.
    #
    # @return [Types::UpdateContextResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateContextResponse#context_arn #context_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_context({
    #     context_name: "ExperimentEntityName", # required
    #     description: "ExperimentDescription",
    #     properties: {
    #       "StringParameterValue" => "StringParameterValue",
    #     },
    #     properties_to_remove: ["StringParameterValue"],
    #   })
    #
    # @example Response structure
    #
    #   resp.context_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateContext AWS API Documentation
    #
    # @overload update_context(params = {})
    # @param [Hash] params ({})
    def update_context(params = {}, options = {})
      req = build_request(:update_context, params)
      req.send_request(options)
    end

    # Updates a fleet of devices.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet.
    #
    # @option params [String] :role_arn
    #   The Amazon Resource Name (ARN) of the device.
    #
    # @option params [String] :description
    #   Description of the fleet.
    #
    # @option params [required, Types::EdgeOutputConfig] :output_config
    #   Output configuration for storing sample data collected by the fleet.
    #
    # @option params [Boolean] :enable_iot_role_alias
    #   Whether to create an Amazon Web Services IoT Role Alias during device
    #   fleet creation. The name of the role alias generated will match this
    #   pattern: "SageMakerEdge-\\\{DeviceFleetName\\}".
    #
    #   For example, if your device fleet is called "demo-fleet", the name
    #   of the role alias will be "SageMakerEdge-demo-fleet".
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_device_fleet({
    #     device_fleet_name: "EntityName", # required
    #     role_arn: "RoleArn",
    #     description: "DeviceFleetDescription",
    #     output_config: { # required
    #       s3_output_location: "S3Uri", # required
    #       kms_key_id: "KmsKeyId",
    #       preset_deployment_type: "GreengrassV2Component", # accepts GreengrassV2Component
    #       preset_deployment_config: "String",
    #     },
    #     enable_iot_role_alias: false,
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateDeviceFleet AWS API Documentation
    #
    # @overload update_device_fleet(params = {})
    # @param [Hash] params ({})
    def update_device_fleet(params = {}, options = {})
      req = build_request(:update_device_fleet, params)
      req.send_request(options)
    end

    # Updates one or more devices in a fleet.
    #
    # @option params [required, String] :device_fleet_name
    #   The name of the fleet the devices belong to.
    #
    # @option params [required, Array<Types::Device>] :devices
    #   List of devices to register with Edge Manager agent.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_devices({
    #     device_fleet_name: "EntityName", # required
    #     devices: [ # required
    #       {
    #         device_name: "DeviceName", # required
    #         description: "DeviceDescription",
    #         iot_thing_name: "ThingName",
    #       },
    #     ],
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateDevices AWS API Documentation
    #
    # @overload update_devices(params = {})
    # @param [Hash] params ({})
    def update_devices(params = {}, options = {})
      req = build_request(:update_devices, params)
      req.send_request(options)
    end

    # Updates the default settings for new user profiles in the domain.
    #
    # @option params [required, String] :domain_id
    #   The ID of the domain to be updated.
    #
    # @option params [Types::UserSettings] :default_user_settings
    #   A collection of settings.
    #
    # @return [Types::UpdateDomainResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateDomainResponse#domain_arn #domain_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_domain({
    #     domain_id: "DomainId", # required
    #     default_user_settings: {
    #       execution_role: "RoleArn",
    #       security_groups: ["SecurityGroupId"],
    #       sharing_settings: {
    #         notebook_output_option: "Allowed", # accepts Allowed, Disabled
    #         s3_output_path: "S3Uri",
    #         s3_kms_key_id: "KmsKeyId",
    #       },
    #       jupyter_server_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       kernel_gateway_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         custom_images: [
    #           {
    #             image_name: "ImageName", # required
    #             image_version_number: 1,
    #             app_image_config_name: "AppImageConfigName", # required
    #           },
    #         ],
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       tensor_board_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.domain_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateDomain AWS API Documentation
    #
    # @overload update_domain(params = {})
    # @param [Hash] params ({})
    def update_domain(params = {}, options = {})
      req = build_request(:update_domain, params)
      req.send_request(options)
    end

    # Deploys the new `EndpointConfig` specified in the request, switches to
    # using newly created endpoint, and then deletes resources provisioned
    # for the endpoint using the previous `EndpointConfig` (there is no
    # availability loss).
    #
    # When Amazon SageMaker receives the request, it sets the endpoint
    # status to `Updating`. After updating the endpoint, it sets the status
    # to `InService`. To check the status of an endpoint, use the
    # DescribeEndpoint API.
    #
    # <note markdown="1"> You must not delete an `EndpointConfig` in use by an endpoint that is
    # live or while the `UpdateEndpoint` or `CreateEndpoint` operations are
    # being performed on the endpoint. To update an endpoint, you must
    # create a new `EndpointConfig`.
    #
    #  If you delete the `EndpointConfig` of an endpoint that is active or
    # being created or updated you may lose visibility into the instance
    # type the endpoint is using. The endpoint must be deleted in order to
    # stop incurring charges.
    #
    #  </note>
    #
    # @option params [required, String] :endpoint_name
    #   The name of the endpoint whose configuration you want to update.
    #
    # @option params [required, String] :endpoint_config_name
    #   The name of the new endpoint configuration.
    #
    # @option params [Boolean] :retain_all_variant_properties
    #   When updating endpoint resources, enables or disables the retention of
    #   [variant properties][1], such as the instance count or the variant
    #   weight. To retain the variant properties of an endpoint when updating
    #   it, set `RetainAllVariantProperties` to `true`. To use the variant
    #   properties specified in a new `EndpointConfig` call when updating an
    #   endpoint, set `RetainAllVariantProperties` to `false`. The default is
    #   `false`.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_VariantProperty.html
    #
    # @option params [Array<Types::VariantProperty>] :exclude_retained_variant_properties
    #   When you are updating endpoint resources with
    #   UpdateEndpointInput$RetainAllVariantProperties, whose value is set to
    #   `true`, `ExcludeRetainedVariantProperties` specifies the list of type
    #   VariantProperty to override with the values provided by
    #   `EndpointConfig`. If you don't specify a value for
    #   `ExcludeAllVariantProperties`, no variant properties are overridden.
    #
    # @option params [Types::DeploymentConfig] :deployment_config
    #   The deployment configuration for the endpoint to be updated.
    #
    # @return [Types::UpdateEndpointOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateEndpointOutput#endpoint_arn #endpoint_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_endpoint({
    #     endpoint_name: "EndpointName", # required
    #     endpoint_config_name: "EndpointConfigName", # required
    #     retain_all_variant_properties: false,
    #     exclude_retained_variant_properties: [
    #       {
    #         variant_property_type: "DesiredInstanceCount", # required, accepts DesiredInstanceCount, DesiredWeight, DataCaptureConfig
    #       },
    #     ],
    #     deployment_config: {
    #       blue_green_update_policy: { # required
    #         traffic_routing_configuration: { # required
    #           type: "ALL_AT_ONCE", # required, accepts ALL_AT_ONCE, CANARY
    #           wait_interval_in_seconds: 1, # required
    #           canary_size: {
    #             type: "INSTANCE_COUNT", # required, accepts INSTANCE_COUNT, CAPACITY_PERCENT
    #             value: 1, # required
    #           },
    #         },
    #         termination_wait_in_seconds: 1,
    #         maximum_execution_timeout_in_seconds: 1,
    #       },
    #       auto_rollback_configuration: {
    #         alarms: [
    #           {
    #             alarm_name: "AlarmName",
    #           },
    #         ],
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateEndpoint AWS API Documentation
    #
    # @overload update_endpoint(params = {})
    # @param [Hash] params ({})
    def update_endpoint(params = {}, options = {})
      req = build_request(:update_endpoint, params)
      req.send_request(options)
    end

    # Updates variant weight of one or more variants associated with an
    # existing endpoint, or capacity of one variant associated with an
    # existing endpoint. When it receives the request, Amazon SageMaker sets
    # the endpoint status to `Updating`. After updating the endpoint, it
    # sets the status to `InService`. To check the status of an endpoint,
    # use the DescribeEndpoint API.
    #
    # @option params [required, String] :endpoint_name
    #   The name of an existing Amazon SageMaker endpoint.
    #
    # @option params [required, Array<Types::DesiredWeightAndCapacity>] :desired_weights_and_capacities
    #   An object that provides new capacity and weight values for a variant.
    #
    # @return [Types::UpdateEndpointWeightsAndCapacitiesOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateEndpointWeightsAndCapacitiesOutput#endpoint_arn #endpoint_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_endpoint_weights_and_capacities({
    #     endpoint_name: "EndpointName", # required
    #     desired_weights_and_capacities: [ # required
    #       {
    #         variant_name: "VariantName", # required
    #         desired_weight: 1.0,
    #         desired_instance_count: 1,
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.endpoint_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateEndpointWeightsAndCapacities AWS API Documentation
    #
    # @overload update_endpoint_weights_and_capacities(params = {})
    # @param [Hash] params ({})
    def update_endpoint_weights_and_capacities(params = {}, options = {})
      req = build_request(:update_endpoint_weights_and_capacities, params)
      req.send_request(options)
    end

    # Adds, updates, or removes the description of an experiment. Updates
    # the display name of an experiment.
    #
    # @option params [required, String] :experiment_name
    #   The name of the experiment to update.
    #
    # @option params [String] :display_name
    #   The name of the experiment as displayed. The name doesn't need to be
    #   unique. If `DisplayName` isn't specified, `ExperimentName` is
    #   displayed.
    #
    # @option params [String] :description
    #   The description of the experiment.
    #
    # @return [Types::UpdateExperimentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateExperimentResponse#experiment_arn #experiment_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_experiment({
    #     experiment_name: "ExperimentEntityName", # required
    #     display_name: "ExperimentEntityName",
    #     description: "ExperimentDescription",
    #   })
    #
    # @example Response structure
    #
    #   resp.experiment_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateExperiment AWS API Documentation
    #
    # @overload update_experiment(params = {})
    # @param [Hash] params ({})
    def update_experiment(params = {}, options = {})
      req = build_request(:update_experiment, params)
      req.send_request(options)
    end

    # Updates the properties of a SageMaker image. To change the image's
    # tags, use the AddTags and DeleteTags APIs.
    #
    # @option params [Array<String>] :delete_properties
    #   A list of properties to delete. Only the `Description` and
    #   `DisplayName` properties can be deleted.
    #
    # @option params [String] :description
    #   The new description for the image.
    #
    # @option params [String] :display_name
    #   The new display name for the image.
    #
    # @option params [required, String] :image_name
    #   The name of the image to update.
    #
    # @option params [String] :role_arn
    #   The new Amazon Resource Name (ARN) for the IAM role that enables
    #   Amazon SageMaker to perform tasks on your behalf.
    #
    # @return [Types::UpdateImageResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateImageResponse#image_arn #image_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_image({
    #     delete_properties: ["ImageDeleteProperty"],
    #     description: "ImageDescription",
    #     display_name: "ImageDisplayName",
    #     image_name: "ImageName", # required
    #     role_arn: "RoleArn",
    #   })
    #
    # @example Response structure
    #
    #   resp.image_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateImage AWS API Documentation
    #
    # @overload update_image(params = {})
    # @param [Hash] params ({})
    def update_image(params = {}, options = {})
      req = build_request(:update_image, params)
      req.send_request(options)
    end

    # Updates a versioned model.
    #
    # @option params [required, String] :model_package_arn
    #   The Amazon Resource Name (ARN) of the model.
    #
    # @option params [required, String] :model_approval_status
    #   The approval status of the model.
    #
    # @option params [String] :approval_description
    #   A description for the approval status of the model.
    #
    # @return [Types::UpdateModelPackageOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateModelPackageOutput#model_package_arn #model_package_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_model_package({
    #     model_package_arn: "ModelPackageArn", # required
    #     model_approval_status: "Approved", # required, accepts Approved, Rejected, PendingManualApproval
    #     approval_description: "ApprovalDescription",
    #   })
    #
    # @example Response structure
    #
    #   resp.model_package_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateModelPackage AWS API Documentation
    #
    # @overload update_model_package(params = {})
    # @param [Hash] params ({})
    def update_model_package(params = {}, options = {})
      req = build_request(:update_model_package, params)
      req.send_request(options)
    end

    # Updates a previously created schedule.
    #
    # @option params [required, String] :monitoring_schedule_name
    #   The name of the monitoring schedule. The name must be unique within an
    #   Amazon Web Services Region within an Amazon Web Services account.
    #
    # @option params [required, Types::MonitoringScheduleConfig] :monitoring_schedule_config
    #   The configuration object that specifies the monitoring schedule and
    #   defines the monitoring job.
    #
    # @return [Types::UpdateMonitoringScheduleResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateMonitoringScheduleResponse#monitoring_schedule_arn #monitoring_schedule_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_monitoring_schedule({
    #     monitoring_schedule_name: "MonitoringScheduleName", # required
    #     monitoring_schedule_config: { # required
    #       schedule_config: {
    #         schedule_expression: "ScheduleExpression", # required
    #       },
    #       monitoring_job_definition: {
    #         baseline_config: {
    #           baselining_job_name: "ProcessingJobName",
    #           constraints_resource: {
    #             s3_uri: "S3Uri",
    #           },
    #           statistics_resource: {
    #             s3_uri: "S3Uri",
    #           },
    #         },
    #         monitoring_inputs: [ # required
    #           {
    #             endpoint_input: { # required
    #               endpoint_name: "EndpointName", # required
    #               local_path: "ProcessingLocalPath", # required
    #               s3_input_mode: "Pipe", # accepts Pipe, File
    #               s3_data_distribution_type: "FullyReplicated", # accepts FullyReplicated, ShardedByS3Key
    #               features_attribute: "String",
    #               inference_attribute: "String",
    #               probability_attribute: "String",
    #               probability_threshold_attribute: 1.0,
    #               start_time_offset: "MonitoringTimeOffsetString",
    #               end_time_offset: "MonitoringTimeOffsetString",
    #             },
    #           },
    #         ],
    #         monitoring_output_config: { # required
    #           monitoring_outputs: [ # required
    #             {
    #               s3_output: { # required
    #                 s3_uri: "MonitoringS3Uri", # required
    #                 local_path: "ProcessingLocalPath", # required
    #                 s3_upload_mode: "Continuous", # accepts Continuous, EndOfJob
    #               },
    #             },
    #           ],
    #           kms_key_id: "KmsKeyId",
    #         },
    #         monitoring_resources: { # required
    #           cluster_config: { # required
    #             instance_count: 1, # required
    #             instance_type: "ml.t3.medium", # required, accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #             volume_size_in_gb: 1, # required
    #             volume_kms_key_id: "KmsKeyId",
    #           },
    #         },
    #         monitoring_app_specification: { # required
    #           image_uri: "ImageUri", # required
    #           container_entrypoint: ["ContainerEntrypointString"],
    #           container_arguments: ["ContainerArgument"],
    #           record_preprocessor_source_uri: "S3Uri",
    #           post_analytics_processor_source_uri: "S3Uri",
    #         },
    #         stopping_condition: {
    #           max_runtime_in_seconds: 1, # required
    #         },
    #         environment: {
    #           "ProcessingEnvironmentKey" => "ProcessingEnvironmentValue",
    #         },
    #         network_config: {
    #           enable_inter_container_traffic_encryption: false,
    #           enable_network_isolation: false,
    #           vpc_config: {
    #             security_group_ids: ["SecurityGroupId"], # required
    #             subnets: ["SubnetId"], # required
    #           },
    #         },
    #         role_arn: "RoleArn", # required
    #       },
    #       monitoring_job_definition_name: "MonitoringJobDefinitionName",
    #       monitoring_type: "DataQuality", # accepts DataQuality, ModelQuality, ModelBias, ModelExplainability
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.monitoring_schedule_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateMonitoringSchedule AWS API Documentation
    #
    # @overload update_monitoring_schedule(params = {})
    # @param [Hash] params ({})
    def update_monitoring_schedule(params = {}, options = {})
      req = build_request(:update_monitoring_schedule, params)
      req.send_request(options)
    end

    # Updates a notebook instance. NotebookInstance updates include
    # upgrading or downgrading the ML compute instance used for your
    # notebook instance to accommodate changes in your workload
    # requirements.
    #
    # @option params [required, String] :notebook_instance_name
    #   The name of the notebook instance to update.
    #
    # @option params [String] :instance_type
    #   The Amazon ML compute instance type.
    #
    # @option params [String] :role_arn
    #   The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker
    #   can assume to access the notebook instance. For more information, see
    #   [Amazon SageMaker Roles][1].
    #
    #   <note markdown="1"> To be able to pass this role to Amazon SageMaker, the caller of this
    #   API must have the `iam:PassRole` permission.
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html
    #
    # @option params [String] :lifecycle_config_name
    #   The name of a lifecycle configuration to associate with the notebook
    #   instance. For information about lifestyle configurations, see [Step
    #   2.1: (Optional) Customize a Notebook Instance][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html
    #
    # @option params [Boolean] :disassociate_lifecycle_config
    #   Set to `true` to remove the notebook instance lifecycle configuration
    #   currently associated with the notebook instance. This operation is
    #   idempotent. If you specify a lifecycle configuration that is not
    #   associated with the notebook instance when you call this method, it
    #   does not throw an error.
    #
    # @option params [Integer] :volume_size_in_gb
    #   The size, in GB, of the ML storage volume to attach to the notebook
    #   instance. The default value is 5 GB. ML storage volumes are encrypted,
    #   so Amazon SageMaker can't determine the amount of available free
    #   space on the volume. Because of this, you can increase the volume size
    #   when you update a notebook instance, but you can't decrease the
    #   volume size. If you want to decrease the size of the ML storage volume
    #   in use, create a new notebook instance with the desired size.
    #
    # @option params [String] :default_code_repository
    #   The Git repository to associate with the notebook instance as its
    #   default code repository. This can be either the name of a Git
    #   repository stored as a resource in your account, or the URL of a Git
    #   repository in [Amazon Web Services CodeCommit][1] or in any other Git
    #   repository. When you open a notebook instance, it opens in the
    #   directory that contains this repository. For more information, see
    #   [Associating Git Repositories with Amazon SageMaker Notebook
    #   Instances][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html
    #
    # @option params [Array<String>] :additional_code_repositories
    #   An array of up to three Git repositories to associate with the
    #   notebook instance. These can be either the names of Git repositories
    #   stored as resources in your account, or the URL of Git repositories in
    #   [Amazon Web Services CodeCommit][1] or in any other Git repository.
    #   These repositories are cloned at the same level as the default
    #   repository of your notebook instance. For more information, see
    #   [Associating Git Repositories with Amazon SageMaker Notebook
    #   Instances][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html
    #   [2]: https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html
    #
    # @option params [Array<String>] :accelerator_types
    #   A list of the Elastic Inference (EI) instance types to associate with
    #   this notebook instance. Currently only one EI instance type can be
    #   associated with a notebook instance. For more information, see [Using
    #   Elastic Inference in Amazon SageMaker][1].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html
    #
    # @option params [Boolean] :disassociate_accelerator_types
    #   A list of the Elastic Inference (EI) instance types to remove from
    #   this notebook instance. This operation is idempotent. If you specify
    #   an accelerator type that is not associated with the notebook instance
    #   when you call this method, it does not throw an error.
    #
    # @option params [Boolean] :disassociate_default_code_repository
    #   The name or URL of the default Git repository to remove from this
    #   notebook instance. This operation is idempotent. If you specify a Git
    #   repository that is not associated with the notebook instance when you
    #   call this method, it does not throw an error.
    #
    # @option params [Boolean] :disassociate_additional_code_repositories
    #   A list of names or URLs of the default Git repositories to remove from
    #   this notebook instance. This operation is idempotent. If you specify a
    #   Git repository that is not associated with the notebook instance when
    #   you call this method, it does not throw an error.
    #
    # @option params [String] :root_access
    #   Whether root access is enabled or disabled for users of the notebook
    #   instance. The default value is `Enabled`.
    #
    #   <note markdown="1"> If you set this to `Disabled`, users don't have root access on the
    #   notebook instance, but lifecycle configuration scripts still run with
    #   root permissions.
    #
    #    </note>
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_notebook_instance({
    #     notebook_instance_name: "NotebookInstanceName", # required
    #     instance_type: "ml.t2.medium", # accepts ml.t2.medium, ml.t2.large, ml.t2.xlarge, ml.t2.2xlarge, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.c5d.xlarge, ml.c5d.2xlarge, ml.c5d.4xlarge, ml.c5d.9xlarge, ml.c5d.18xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #     role_arn: "RoleArn",
    #     lifecycle_config_name: "NotebookInstanceLifecycleConfigName",
    #     disassociate_lifecycle_config: false,
    #     volume_size_in_gb: 1,
    #     default_code_repository: "CodeRepositoryNameOrUrl",
    #     additional_code_repositories: ["CodeRepositoryNameOrUrl"],
    #     accelerator_types: ["ml.eia1.medium"], # accepts ml.eia1.medium, ml.eia1.large, ml.eia1.xlarge, ml.eia2.medium, ml.eia2.large, ml.eia2.xlarge
    #     disassociate_accelerator_types: false,
    #     disassociate_default_code_repository: false,
    #     disassociate_additional_code_repositories: false,
    #     root_access: "Enabled", # accepts Enabled, Disabled
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateNotebookInstance AWS API Documentation
    #
    # @overload update_notebook_instance(params = {})
    # @param [Hash] params ({})
    def update_notebook_instance(params = {}, options = {})
      req = build_request(:update_notebook_instance, params)
      req.send_request(options)
    end

    # Updates a notebook instance lifecycle configuration created with the
    # CreateNotebookInstanceLifecycleConfig API.
    #
    # @option params [required, String] :notebook_instance_lifecycle_config_name
    #   The name of the lifecycle configuration.
    #
    # @option params [Array<Types::NotebookInstanceLifecycleHook>] :on_create
    #   The shell script that runs only once, when you create a notebook
    #   instance. The shell script must be a base64-encoded string.
    #
    # @option params [Array<Types::NotebookInstanceLifecycleHook>] :on_start
    #   The shell script that runs every time you start a notebook instance,
    #   including when you create the notebook instance. The shell script must
    #   be a base64-encoded string.
    #
    # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_notebook_instance_lifecycle_config({
    #     notebook_instance_lifecycle_config_name: "NotebookInstanceLifecycleConfigName", # required
    #     on_create: [
    #       {
    #         content: "NotebookInstanceLifecycleConfigContent",
    #       },
    #     ],
    #     on_start: [
    #       {
    #         content: "NotebookInstanceLifecycleConfigContent",
    #       },
    #     ],
    #   })
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateNotebookInstanceLifecycleConfig AWS API Documentation
    #
    # @overload update_notebook_instance_lifecycle_config(params = {})
    # @param [Hash] params ({})
    def update_notebook_instance_lifecycle_config(params = {}, options = {})
      req = build_request(:update_notebook_instance_lifecycle_config, params)
      req.send_request(options)
    end

    # Updates a pipeline.
    #
    # @option params [required, String] :pipeline_name
    #   The name of the pipeline to update.
    #
    # @option params [String] :pipeline_display_name
    #   The display name of the pipeline.
    #
    # @option params [String] :pipeline_definition
    #   The JSON pipeline definition.
    #
    # @option params [String] :pipeline_description
    #   The description of the pipeline.
    #
    # @option params [String] :role_arn
    #   The Amazon Resource Name (ARN) that the pipeline uses to execute.
    #
    # @return [Types::UpdatePipelineResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdatePipelineResponse#pipeline_arn #pipeline_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_pipeline({
    #     pipeline_name: "PipelineName", # required
    #     pipeline_display_name: "PipelineName",
    #     pipeline_definition: "PipelineDefinition",
    #     pipeline_description: "PipelineDescription",
    #     role_arn: "RoleArn",
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdatePipeline AWS API Documentation
    #
    # @overload update_pipeline(params = {})
    # @param [Hash] params ({})
    def update_pipeline(params = {}, options = {})
      req = build_request(:update_pipeline, params)
      req.send_request(options)
    end

    # Updates a pipeline execution.
    #
    # @option params [required, String] :pipeline_execution_arn
    #   The Amazon Resource Name (ARN) of the pipeline execution.
    #
    # @option params [String] :pipeline_execution_description
    #   The description of the pipeline execution.
    #
    # @option params [String] :pipeline_execution_display_name
    #   The display name of the pipeline execution.
    #
    # @return [Types::UpdatePipelineExecutionResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdatePipelineExecutionResponse#pipeline_execution_arn #pipeline_execution_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_pipeline_execution({
    #     pipeline_execution_arn: "PipelineExecutionArn", # required
    #     pipeline_execution_description: "PipelineExecutionDescription",
    #     pipeline_execution_display_name: "PipelineExecutionName",
    #   })
    #
    # @example Response structure
    #
    #   resp.pipeline_execution_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdatePipelineExecution AWS API Documentation
    #
    # @overload update_pipeline_execution(params = {})
    # @param [Hash] params ({})
    def update_pipeline_execution(params = {}, options = {})
      req = build_request(:update_pipeline_execution, params)
      req.send_request(options)
    end

    # Update a model training job to request a new Debugger profiling
    # configuration.
    #
    # @option params [required, String] :training_job_name
    #   The name of a training job to update the Debugger profiling
    #   configuration.
    #
    # @option params [Types::ProfilerConfigForUpdate] :profiler_config
    #   Configuration information for Debugger system monitoring, framework
    #   profiling, and storage paths.
    #
    # @option params [Array<Types::ProfilerRuleConfiguration>] :profiler_rule_configurations
    #   Configuration information for Debugger rules for profiling system and
    #   framework metrics.
    #
    # @return [Types::UpdateTrainingJobResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateTrainingJobResponse#training_job_arn #training_job_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_training_job({
    #     training_job_name: "TrainingJobName", # required
    #     profiler_config: {
    #       s3_output_path: "S3Uri",
    #       profiling_interval_in_milliseconds: 1,
    #       profiling_parameters: {
    #         "ConfigKey" => "ConfigValue",
    #       },
    #       disable_profiler: false,
    #     },
    #     profiler_rule_configurations: [
    #       {
    #         rule_configuration_name: "RuleConfigurationName", # required
    #         local_path: "DirectoryPath",
    #         s3_output_path: "S3Uri",
    #         rule_evaluator_image: "AlgorithmImage", # required
    #         instance_type: "ml.t3.medium", # accepts ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m4.xlarge, ml.m4.2xlarge, ml.m4.4xlarge, ml.m4.10xlarge, ml.m4.16xlarge, ml.c4.xlarge, ml.c4.2xlarge, ml.c4.4xlarge, ml.c4.8xlarge, ml.p2.xlarge, ml.p2.8xlarge, ml.p2.16xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.18xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.12xlarge, ml.m5.24xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge
    #         volume_size_in_gb: 1,
    #         rule_parameters: {
    #           "ConfigKey" => "ConfigValue",
    #         },
    #       },
    #     ],
    #   })
    #
    # @example Response structure
    #
    #   resp.training_job_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateTrainingJob AWS API Documentation
    #
    # @overload update_training_job(params = {})
    # @param [Hash] params ({})
    def update_training_job(params = {}, options = {})
      req = build_request(:update_training_job, params)
      req.send_request(options)
    end

    # Updates the display name of a trial.
    #
    # @option params [required, String] :trial_name
    #   The name of the trial to update.
    #
    # @option params [String] :display_name
    #   The name of the trial as displayed. The name doesn't need to be
    #   unique. If `DisplayName` isn't specified, `TrialName` is displayed.
    #
    # @return [Types::UpdateTrialResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateTrialResponse#trial_arn #trial_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_trial({
    #     trial_name: "ExperimentEntityName", # required
    #     display_name: "ExperimentEntityName",
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateTrial AWS API Documentation
    #
    # @overload update_trial(params = {})
    # @param [Hash] params ({})
    def update_trial(params = {}, options = {})
      req = build_request(:update_trial, params)
      req.send_request(options)
    end

    # Updates one or more properties of a trial component.
    #
    # @option params [required, String] :trial_component_name
    #   The name of the component to update.
    #
    # @option params [String] :display_name
    #   The name of the component as displayed. The name doesn't need to be
    #   unique. If `DisplayName` isn't specified, `TrialComponentName` is
    #   displayed.
    #
    # @option params [Types::TrialComponentStatus] :status
    #   The new status of the component.
    #
    # @option params [Time,DateTime,Date,Integer,String] :start_time
    #   When the component started.
    #
    # @option params [Time,DateTime,Date,Integer,String] :end_time
    #   When the component ended.
    #
    # @option params [Hash<String,Types::TrialComponentParameterValue>] :parameters
    #   Replaces all of the component's hyperparameters with the specified
    #   hyperparameters.
    #
    # @option params [Array<String>] :parameters_to_remove
    #   The hyperparameters to remove from the component.
    #
    # @option params [Hash<String,Types::TrialComponentArtifact>] :input_artifacts
    #   Replaces all of the component's input artifacts with the specified
    #   artifacts.
    #
    # @option params [Array<String>] :input_artifacts_to_remove
    #   The input artifacts to remove from the component.
    #
    # @option params [Hash<String,Types::TrialComponentArtifact>] :output_artifacts
    #   Replaces all of the component's output artifacts with the specified
    #   artifacts.
    #
    # @option params [Array<String>] :output_artifacts_to_remove
    #   The output artifacts to remove from the component.
    #
    # @return [Types::UpdateTrialComponentResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateTrialComponentResponse#trial_component_arn #trial_component_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_trial_component({
    #     trial_component_name: "ExperimentEntityName", # required
    #     display_name: "ExperimentEntityName",
    #     status: {
    #       primary_status: "InProgress", # accepts InProgress, Completed, Failed, Stopping, Stopped
    #       message: "TrialComponentStatusMessage",
    #     },
    #     start_time: Time.now,
    #     end_time: Time.now,
    #     parameters: {
    #       "TrialComponentKey256" => {
    #         string_value: "StringParameterValue",
    #         number_value: 1.0,
    #       },
    #     },
    #     parameters_to_remove: ["TrialComponentKey256"],
    #     input_artifacts: {
    #       "TrialComponentKey64" => {
    #         media_type: "MediaType",
    #         value: "TrialComponentArtifactValue", # required
    #       },
    #     },
    #     input_artifacts_to_remove: ["TrialComponentKey256"],
    #     output_artifacts: {
    #       "TrialComponentKey64" => {
    #         media_type: "MediaType",
    #         value: "TrialComponentArtifactValue", # required
    #       },
    #     },
    #     output_artifacts_to_remove: ["TrialComponentKey256"],
    #   })
    #
    # @example Response structure
    #
    #   resp.trial_component_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateTrialComponent AWS API Documentation
    #
    # @overload update_trial_component(params = {})
    # @param [Hash] params ({})
    def update_trial_component(params = {}, options = {})
      req = build_request(:update_trial_component, params)
      req.send_request(options)
    end

    # Updates a user profile.
    #
    # @option params [required, String] :domain_id
    #   The domain ID.
    #
    # @option params [required, String] :user_profile_name
    #   The user profile name.
    #
    # @option params [Types::UserSettings] :user_settings
    #   A collection of settings.
    #
    # @return [Types::UpdateUserProfileResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateUserProfileResponse#user_profile_arn #user_profile_arn} => String
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_user_profile({
    #     domain_id: "DomainId", # required
    #     user_profile_name: "UserProfileName", # required
    #     user_settings: {
    #       execution_role: "RoleArn",
    #       security_groups: ["SecurityGroupId"],
    #       sharing_settings: {
    #         notebook_output_option: "Allowed", # accepts Allowed, Disabled
    #         s3_output_path: "S3Uri",
    #         s3_kms_key_id: "KmsKeyId",
    #       },
    #       jupyter_server_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       kernel_gateway_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #         custom_images: [
    #           {
    #             image_name: "ImageName", # required
    #             image_version_number: 1,
    #             app_image_config_name: "AppImageConfigName", # required
    #           },
    #         ],
    #         lifecycle_config_arns: ["StudioLifecycleConfigArn"],
    #       },
    #       tensor_board_app_settings: {
    #         default_resource_spec: {
    #           sage_maker_image_arn: "ImageArn",
    #           sage_maker_image_version_arn: "ImageVersionArn",
    #           instance_type: "system", # accepts system, ml.t3.micro, ml.t3.small, ml.t3.medium, ml.t3.large, ml.t3.xlarge, ml.t3.2xlarge, ml.m5.large, ml.m5.xlarge, ml.m5.2xlarge, ml.m5.4xlarge, ml.m5.8xlarge, ml.m5.12xlarge, ml.m5.16xlarge, ml.m5.24xlarge, ml.m5d.large, ml.m5d.xlarge, ml.m5d.2xlarge, ml.m5d.4xlarge, ml.m5d.8xlarge, ml.m5d.12xlarge, ml.m5d.16xlarge, ml.m5d.24xlarge, ml.c5.large, ml.c5.xlarge, ml.c5.2xlarge, ml.c5.4xlarge, ml.c5.9xlarge, ml.c5.12xlarge, ml.c5.18xlarge, ml.c5.24xlarge, ml.p3.2xlarge, ml.p3.8xlarge, ml.p3.16xlarge, ml.p3dn.24xlarge, ml.g4dn.xlarge, ml.g4dn.2xlarge, ml.g4dn.4xlarge, ml.g4dn.8xlarge, ml.g4dn.12xlarge, ml.g4dn.16xlarge, ml.r5.large, ml.r5.xlarge, ml.r5.2xlarge, ml.r5.4xlarge, ml.r5.8xlarge, ml.r5.12xlarge, ml.r5.16xlarge, ml.r5.24xlarge
    #           lifecycle_config_arn: "StudioLifecycleConfigArn",
    #         },
    #       },
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.user_profile_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateUserProfile AWS API Documentation
    #
    # @overload update_user_profile(params = {})
    # @param [Hash] params ({})
    def update_user_profile(params = {}, options = {})
      req = build_request(:update_user_profile, params)
      req.send_request(options)
    end

    # Use this operation to update your workforce. You can use this
    # operation to require that workers use specific IP addresses to work on
    # tasks and to update your OpenID Connect (OIDC) Identity Provider (IdP)
    # workforce configuration.
    #
    # Use `SourceIpConfig` to restrict worker access to tasks to a specific
    # range of IP addresses. You specify allowed IP addresses by creating a
    # list of up to ten [CIDRs][1]. By default, a workforce isn't
    # restricted to specific IP addresses. If you specify a range of IP
    # addresses, workers who attempt to access tasks using any IP address
    # outside the specified range are denied and get a `Not Found` error
    # message on the worker portal.
    #
    # Use `OidcConfig` to update the configuration of a workforce created
    # using your own OIDC IdP.
    #
    # You can only update your OIDC IdP configuration when there are no work
    # teams associated with your workforce. You can delete work teams using
    # the operation.
    #
    # After restricting access to a range of IP addresses or updating your
    # OIDC IdP configuration with this operation, you can view details about
    # your update workforce using the operation.
    #
    # This operation only applies to private workforces.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html
    #
    # @option params [required, String] :workforce_name
    #   The name of the private workforce that you want to update. You can
    #   find your workforce name by using the operation.
    #
    # @option params [Types::SourceIpConfig] :source_ip_config
    #   A list of one to ten worker IP address ranges ([CIDRs][1]) that can be
    #   used to access tasks assigned to this workforce.
    #
    #   Maximum: Ten CIDR values
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html
    #
    # @option params [Types::OidcConfig] :oidc_config
    #   Use this parameter to update your OIDC Identity Provider (IdP)
    #   configuration for a workforce made using your own IdP.
    #
    # @return [Types::UpdateWorkforceResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateWorkforceResponse#workforce #workforce} => Types::Workforce
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_workforce({
    #     workforce_name: "WorkforceName", # required
    #     source_ip_config: {
    #       cidrs: ["Cidr"], # required
    #     },
    #     oidc_config: {
    #       client_id: "ClientId", # required
    #       client_secret: "ClientSecret", # required
    #       issuer: "OidcEndpoint", # required
    #       authorization_endpoint: "OidcEndpoint", # required
    #       token_endpoint: "OidcEndpoint", # required
    #       user_info_endpoint: "OidcEndpoint", # required
    #       logout_endpoint: "OidcEndpoint", # required
    #       jwks_uri: "OidcEndpoint", # required
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.workforce.workforce_name #=> String
    #   resp.workforce.workforce_arn #=> String
    #   resp.workforce.last_updated_date #=> Time
    #   resp.workforce.source_ip_config.cidrs #=> Array
    #   resp.workforce.source_ip_config.cidrs[0] #=> String
    #   resp.workforce.sub_domain #=> String
    #   resp.workforce.cognito_config.user_pool #=> String
    #   resp.workforce.cognito_config.client_id #=> String
    #   resp.workforce.oidc_config.client_id #=> String
    #   resp.workforce.oidc_config.issuer #=> String
    #   resp.workforce.oidc_config.authorization_endpoint #=> String
    #   resp.workforce.oidc_config.token_endpoint #=> String
    #   resp.workforce.oidc_config.user_info_endpoint #=> String
    #   resp.workforce.oidc_config.logout_endpoint #=> String
    #   resp.workforce.oidc_config.jwks_uri #=> String
    #   resp.workforce.create_date #=> Time
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateWorkforce AWS API Documentation
    #
    # @overload update_workforce(params = {})
    # @param [Hash] params ({})
    def update_workforce(params = {}, options = {})
      req = build_request(:update_workforce, params)
      req.send_request(options)
    end

    # Updates an existing work team with new member definitions or
    # description.
    #
    # @option params [required, String] :workteam_name
    #   The name of the work team to update.
    #
    # @option params [Array<Types::MemberDefinition>] :member_definitions
    #   A list of `MemberDefinition` objects that contains objects that
    #   identify the workers that make up the work team.
    #
    #   Workforces can be created using Amazon Cognito or your own OIDC
    #   Identity Provider (IdP). For private workforces created using Amazon
    #   Cognito use `CognitoMemberDefinition`. For workforces created using
    #   your own OIDC identity provider (IdP) use `OidcMemberDefinition`. You
    #   should not provide input for both of these parameters in a single
    #   request.
    #
    #   For workforces created using Amazon Cognito, private work teams
    #   correspond to Amazon Cognito *user groups* within the user pool used
    #   to create a workforce. All of the `CognitoMemberDefinition` objects
    #   that make up the member definition must have the same `ClientId` and
    #   `UserPool` values. To add a Amazon Cognito user group to an existing
    #   worker pool, see [Adding groups to a User Pool](). For more
    #   information about user pools, see [Amazon Cognito User Pools][1].
    #
    #   For workforces created using your own OIDC IdP, specify the user
    #   groups that you want to include in your private work team in
    #   `OidcMemberDefinition` by listing those groups in `Groups`. Be aware
    #   that user groups that are already in the work team must also be listed
    #   in `Groups` when you make this request to remain on the work team. If
    #   you do not include these user groups, they will no longer be
    #   associated with the work team you update.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html
    #
    # @option params [String] :description
    #   An updated description for the work team.
    #
    # @option params [Types::NotificationConfiguration] :notification_configuration
    #   Configures SNS topic notifications for available or expiring work
    #   items
    #
    # @return [Types::UpdateWorkteamResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::UpdateWorkteamResponse#workteam #workteam} => Types::Workteam
    #
    # @example Request syntax with placeholder values
    #
    #   resp = client.update_workteam({
    #     workteam_name: "WorkteamName", # required
    #     member_definitions: [
    #       {
    #         cognito_member_definition: {
    #           user_pool: "CognitoUserPool", # required
    #           user_group: "CognitoUserGroup", # required
    #           client_id: "ClientId", # required
    #         },
    #         oidc_member_definition: {
    #           groups: ["Group"], # required
    #         },
    #       },
    #     ],
    #     description: "String200",
    #     notification_configuration: {
    #       notification_topic_arn: "NotificationTopicArn",
    #     },
    #   })
    #
    # @example Response structure
    #
    #   resp.workteam.workteam_name #=> String
    #   resp.workteam.member_definitions #=> Array
    #   resp.workteam.member_definitions[0].cognito_member_definition.user_pool #=> String
    #   resp.workteam.member_definitions[0].cognito_member_definition.user_group #=> String
    #   resp.workteam.member_definitions[0].cognito_member_definition.client_id #=> String
    #   resp.workteam.member_definitions[0].oidc_member_definition.groups #=> Array
    #   resp.workteam.member_definitions[0].oidc_member_definition.groups[0] #=> String
    #   resp.workteam.workteam_arn #=> String
    #   resp.workteam.workforce_arn #=> String
    #   resp.workteam.product_listing_ids #=> Array
    #   resp.workteam.product_listing_ids[0] #=> String
    #   resp.workteam.description #=> String
    #   resp.workteam.sub_domain #=> String
    #   resp.workteam.create_date #=> Time
    #   resp.workteam.last_updated_date #=> Time
    #   resp.workteam.notification_configuration.notification_topic_arn #=> String
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/sagemaker-2017-07-24/UpdateWorkteam AWS API Documentation
    #
    # @overload update_workteam(params = {})
    # @param [Hash] params ({})
    def update_workteam(params = {}, options = {})
      req = build_request(:update_workteam, params)
      req.send_request(options)
    end

    # @!endgroup

    # @param params ({})
    # @api private
    def build_request(operation_name, params = {})
      handlers = @handlers.for(operation_name)
      context = Seahorse::Client::RequestContext.new(
        operation_name: operation_name,
        operation: config.api.operation(operation_name),
        client: self,
        params: params,
        config: config)
      context[:gem_name] = 'aws-sdk-sagemaker'
      context[:gem_version] = '1.103.0'
      Seahorse::Client::Request.new(handlers, context)
    end

    # Polls an API operation until a resource enters a desired state.
    #
    # ## Basic Usage
    #
    # A waiter will call an API operation until:
    #
    # * It is successful
    # * It enters a terminal state
    # * It makes the maximum number of attempts
    #
    # In between attempts, the waiter will sleep.
    #
    #     # polls in a loop, sleeping between attempts
    #     client.wait_until(waiter_name, params)
    #
    # ## Configuration
    #
    # You can configure the maximum number of polling attempts, and the
    # delay (in seconds) between each polling attempt. You can pass
    # configuration as the final arguments hash.
    #
    #     # poll for ~25 seconds
    #     client.wait_until(waiter_name, params, {
    #       max_attempts: 5,
    #       delay: 5,
    #     })
    #
    # ## Callbacks
    #
    # You can be notified before each polling attempt and before each
    # delay. If you throw `:success` or `:failure` from these callbacks,
    # it will terminate the waiter.
    #
    #     started_at = Time.now
    #     client.wait_until(waiter_name, params, {
    #
    #       # disable max attempts
    #       max_attempts: nil,
    #
    #       # poll for 1 hour, instead of a number of attempts
    #       before_wait: -> (attempts, response) do
    #         throw :failure if Time.now - started_at > 3600
    #       end
    #     })
    #
    # ## Handling Errors
    #
    # When a waiter is unsuccessful, it will raise an error.
    # All of the failure errors extend from
    # {Aws::Waiters::Errors::WaiterFailed}.
    #
    #     begin
    #       client.wait_until(...)
    #     rescue Aws::Waiters::Errors::WaiterFailed
    #       # resource did not enter the desired state in time
    #     end
    #
    # ## Valid Waiters
    #
    # The following table lists the valid waiter names, the operations they call,
    # and the default `:delay` and `:max_attempts` values.
    #
    # | waiter_name                         | params                              | :delay   | :max_attempts |
    # | ----------------------------------- | ----------------------------------- | -------- | ------------- |
    # | endpoint_deleted                    | {Client#describe_endpoint}          | 30       | 60            |
    # | endpoint_in_service                 | {Client#describe_endpoint}          | 30       | 120           |
    # | image_created                       | {Client#describe_image}             | 60       | 60            |
    # | image_deleted                       | {Client#describe_image}             | 60       | 60            |
    # | image_updated                       | {Client#describe_image}             | 60       | 60            |
    # | image_version_created               | {Client#describe_image_version}     | 60       | 60            |
    # | image_version_deleted               | {Client#describe_image_version}     | 60       | 60            |
    # | notebook_instance_deleted           | {Client#describe_notebook_instance} | 30       | 60            |
    # | notebook_instance_in_service        | {Client#describe_notebook_instance} | 30       | 60            |
    # | notebook_instance_stopped           | {Client#describe_notebook_instance} | 30       | 60            |
    # | processing_job_completed_or_stopped | {Client#describe_processing_job}    | 60       | 60            |
    # | training_job_completed_or_stopped   | {Client#describe_training_job}      | 120      | 180           |
    # | transform_job_completed_or_stopped  | {Client#describe_transform_job}     | 60       | 60            |
    #
    # @raise [Errors::FailureStateError] Raised when the waiter terminates
    #   because the waiter has entered a state that it will not transition
    #   out of, preventing success.
    #
    # @raise [Errors::TooManyAttemptsError] Raised when the configured
    #   maximum number of attempts have been made, and the waiter is not
    #   yet successful.
    #
    # @raise [Errors::UnexpectedError] Raised when an error is encounted
    #   while polling for a resource that is not expected.
    #
    # @raise [Errors::NoSuchWaiterError] Raised when you request to wait
    #   for an unknown state.
    #
    # @return [Boolean] Returns `true` if the waiter was successful.
    # @param [Symbol] waiter_name
    # @param [Hash] params ({})
    # @param [Hash] options ({})
    # @option options [Integer] :max_attempts
    # @option options [Integer] :delay
    # @option options [Proc] :before_attempt
    # @option options [Proc] :before_wait
    def wait_until(waiter_name, params = {}, options = {})
      w = waiter(waiter_name, options)
      yield(w.waiter) if block_given? # deprecated
      w.wait(params)
    end

    # @api private
    # @deprecated
    def waiter_names
      waiters.keys
    end

    private

    # @param [Symbol] waiter_name
    # @param [Hash] options ({})
    def waiter(waiter_name, options = {})
      waiter_class = waiters[waiter_name]
      if waiter_class
        waiter_class.new(options.merge(client: self))
      else
        raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
      end
    end

    def waiters
      {
        endpoint_deleted: Waiters::EndpointDeleted,
        endpoint_in_service: Waiters::EndpointInService,
        image_created: Waiters::ImageCreated,
        image_deleted: Waiters::ImageDeleted,
        image_updated: Waiters::ImageUpdated,
        image_version_created: Waiters::ImageVersionCreated,
        image_version_deleted: Waiters::ImageVersionDeleted,
        notebook_instance_deleted: Waiters::NotebookInstanceDeleted,
        notebook_instance_in_service: Waiters::NotebookInstanceInService,
        notebook_instance_stopped: Waiters::NotebookInstanceStopped,
        processing_job_completed_or_stopped: Waiters::ProcessingJobCompletedOrStopped,
        training_job_completed_or_stopped: Waiters::TrainingJobCompletedOrStopped,
        transform_job_completed_or_stopped: Waiters::TransformJobCompletedOrStopped
      }
    end

    class << self

      # @api private
      attr_reader :identifier

      # @api private
      def errors_module
        Errors
      end

    end
  end
end
