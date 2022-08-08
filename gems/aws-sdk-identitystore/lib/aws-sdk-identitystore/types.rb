# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::IdentityStore
  module Types

    # You do not have sufficient access to perform this action.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @!attribute [rw] request_id
    #   The identifier for each request. This value is a globally unique ID
    #   that is generated by the identity store service for each sent
    #   request, and is then returned inside the exception if the request
    #   fails.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/AccessDeniedException AWS API Documentation
    #
    class AccessDeniedException < Struct.new(
      :message,
      :request_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DescribeGroupRequest
    #   data as a hash:
    #
    #       {
    #         identity_store_id: "IdentityStoreId", # required
    #         group_id: "ResourceId", # required
    #       }
    #
    # @!attribute [rw] identity_store_id
    #   The globally unique identifier for the identity store, such as
    #   `d-1234567890`. In this example, `d-` is a fixed prefix, and
    #   `1234567890` is a randomly generated string that contains number and
    #   lower case letters. This value is generated at the time that a new
    #   identity store is created.
    #   @return [String]
    #
    # @!attribute [rw] group_id
    #   The identifier for a group in the identity store.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/DescribeGroupRequest AWS API Documentation
    #
    class DescribeGroupRequest < Struct.new(
      :identity_store_id,
      :group_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] group_id
    #   The identifier for a group in the identity store.
    #   @return [String]
    #
    # @!attribute [rw] display_name
    #   Contains the group’s display name value. The length limit is 1,024
    #   characters. This value can consist of letters, accented characters,
    #   symbols, numbers, punctuation, tab, new line, carriage return,
    #   space, and nonbreaking space in this attribute. The characters
    #   `<>;:%` are excluded. This value is specified at the time that the
    #   group is created and stored as an attribute of the group object in
    #   the identity store.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/DescribeGroupResponse AWS API Documentation
    #
    class DescribeGroupResponse < Struct.new(
      :group_id,
      :display_name)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DescribeUserRequest
    #   data as a hash:
    #
    #       {
    #         identity_store_id: "IdentityStoreId", # required
    #         user_id: "ResourceId", # required
    #       }
    #
    # @!attribute [rw] identity_store_id
    #   The globally unique identifier for the identity store, such as
    #   `d-1234567890`. In this example, `d-` is a fixed prefix, and
    #   `1234567890` is a randomly generated string that contains number and
    #   lower case letters. This value is generated at the time that a new
    #   identity store is created.
    #   @return [String]
    #
    # @!attribute [rw] user_id
    #   The identifier for a user in the identity store.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/DescribeUserRequest AWS API Documentation
    #
    class DescribeUserRequest < Struct.new(
      :identity_store_id,
      :user_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] user_name
    #   Contains the user’s user name value. The length limit is 128
    #   characters. This value can consist of letters, accented characters,
    #   symbols, numbers, and punctuation. The characters `<>;:%` are
    #   excluded. This value is specified at the time the user is created
    #   and stored as an attribute of the user object in the identity store.
    #   @return [String]
    #
    # @!attribute [rw] user_id
    #   The identifier for a user in the identity store.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/DescribeUserResponse AWS API Documentation
    #
    class DescribeUserResponse < Struct.new(
      :user_name,
      :user_id)
      SENSITIVE = [:user_name]
      include Aws::Structure
    end

    # A query filter used by `ListUsers` and `ListGroups`. This filter
    # object provides the attribute name and attribute value to search users
    # or groups.
    #
    # @note When making an API call, you may pass Filter
    #   data as a hash:
    #
    #       {
    #         attribute_path: "AttributePath", # required
    #         attribute_value: "SensitiveStringType", # required
    #       }
    #
    # @!attribute [rw] attribute_path
    #   The attribute path that is used to specify which attribute name to
    #   search. Length limit is 255 characters. For example, `UserName` is a
    #   valid attribute path for the `ListUsers` API, and `DisplayName` is a
    #   valid attribute path for the `ListGroups` API.
    #   @return [String]
    #
    # @!attribute [rw] attribute_value
    #   Represents the data for an attribute. Each attribute value is
    #   described as a name-value pair.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/Filter AWS API Documentation
    #
    class Filter < Struct.new(
      :attribute_path,
      :attribute_value)
      SENSITIVE = [:attribute_value]
      include Aws::Structure
    end

    # A group object, which contains a specified group’s metadata and
    # attributes.
    #
    # @!attribute [rw] group_id
    #   The identifier for a group in the identity store.
    #   @return [String]
    #
    # @!attribute [rw] display_name
    #   Contains the group’s display name value. The length limit is 1,024
    #   characters. This value can consist of letters, accented characters,
    #   symbols, numbers, punctuation, tab, new line, carriage return,
    #   space, and nonbreaking space in this attribute. The characters
    #   `<>;:%` are excluded. This value is specified at the time the group
    #   is created and stored as an attribute of the group object in the
    #   identity store.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/Group AWS API Documentation
    #
    class Group < Struct.new(
      :group_id,
      :display_name)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request processing has failed because of an unknown error,
    # exception or failure with an internal server.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @!attribute [rw] request_id
    #   The identifier for each request. This value is a globally unique ID
    #   that is generated by the identity store service for each sent
    #   request, and is then returned inside the exception if the request
    #   fails.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/InternalServerException AWS API Documentation
    #
    class InternalServerException < Struct.new(
      :message,
      :request_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ListGroupsRequest
    #   data as a hash:
    #
    #       {
    #         identity_store_id: "IdentityStoreId", # required
    #         max_results: 1,
    #         next_token: "NextToken",
    #         filters: [
    #           {
    #             attribute_path: "AttributePath", # required
    #             attribute_value: "SensitiveStringType", # required
    #           },
    #         ],
    #       }
    #
    # @!attribute [rw] identity_store_id
    #   The globally unique identifier for the identity store, such as
    #   `d-1234567890`. In this example, `d-` is a fixed prefix, and
    #   `1234567890` is a randomly generated string that contains number and
    #   lower case letters. This value is generated at the time that a new
    #   identity store is created.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of results to be returned per request. This
    #   parameter is used in the `ListUsers` and `ListGroups` request to
    #   specify how many results to return in one page. The length limit is
    #   50 characters.
    #   @return [Integer]
    #
    # @!attribute [rw] next_token
    #   The pagination token used for the `ListUsers` and `ListGroups` API
    #   operations. This value is generated by the identity store service.
    #   It is returned in the API response if the total results are more
    #   than the size of one page. This token is also returned when it is
    #   used in the API request to search for the next page.
    #   @return [String]
    #
    # @!attribute [rw] filters
    #   A list of `Filter` objects, which is used in the `ListUsers` and
    #   `ListGroups` request.
    #   @return [Array<Types::Filter>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ListGroupsRequest AWS API Documentation
    #
    class ListGroupsRequest < Struct.new(
      :identity_store_id,
      :max_results,
      :next_token,
      :filters)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] groups
    #   A list of `Group` objects in the identity store.
    #   @return [Array<Types::Group>]
    #
    # @!attribute [rw] next_token
    #   The pagination token used for the `ListUsers` and `ListGroups` API
    #   operations. This value is generated by the identity store service.
    #   It is returned in the API response if the total results are more
    #   than the size of one page. This token is also returned when it1 is
    #   used in the API request to search for the next page.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ListGroupsResponse AWS API Documentation
    #
    class ListGroupsResponse < Struct.new(
      :groups,
      :next_token)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ListUsersRequest
    #   data as a hash:
    #
    #       {
    #         identity_store_id: "IdentityStoreId", # required
    #         max_results: 1,
    #         next_token: "NextToken",
    #         filters: [
    #           {
    #             attribute_path: "AttributePath", # required
    #             attribute_value: "SensitiveStringType", # required
    #           },
    #         ],
    #       }
    #
    # @!attribute [rw] identity_store_id
    #   The globally unique identifier for the identity store, such as
    #   `d-1234567890`. In this example, `d-` is a fixed prefix, and
    #   `1234567890` is a randomly generated string that contains number and
    #   lower case letters. This value is generated at the time that a new
    #   identity store is created.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of results to be returned per request. This
    #   parameter is used in the `ListUsers` and `ListGroups` request to
    #   specify how many results to return in one page. The length limit is
    #   50 characters.
    #   @return [Integer]
    #
    # @!attribute [rw] next_token
    #   The pagination token used for the `ListUsers` and `ListGroups` API
    #   operations. This value is generated by the identity store service.
    #   It is returned in the API response if the total results are more
    #   than the size of one page. This token is also returned when it is
    #   used in the API request to search for the next page.
    #   @return [String]
    #
    # @!attribute [rw] filters
    #   A list of `Filter` objects, which is used in the `ListUsers` and
    #   `ListGroups` request.
    #   @return [Array<Types::Filter>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ListUsersRequest AWS API Documentation
    #
    class ListUsersRequest < Struct.new(
      :identity_store_id,
      :max_results,
      :next_token,
      :filters)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] users
    #   A list of `User` objects in the identity store.
    #   @return [Array<Types::User>]
    #
    # @!attribute [rw] next_token
    #   The pagination token used for the `ListUsers` and `ListGroups` API
    #   operations. This value is generated by the identity store service.
    #   It is returned in the API response if the total results are more
    #   than the size of one page. This token is also returned when it is
    #   used in the API request to search for the next page.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ListUsersResponse AWS API Documentation
    #
    class ListUsersResponse < Struct.new(
      :users,
      :next_token)
      SENSITIVE = []
      include Aws::Structure
    end

    # Indicates that a requested resource is not found.
    #
    # @!attribute [rw] resource_type
    #   The type of resource in the identity store service, which is an enum
    #   object. Valid values include USER, GROUP, and IDENTITY\_STORE.
    #   @return [String]
    #
    # @!attribute [rw] resource_id
    #   The identifier for a resource in the identity store, which can be
    #   used as `UserId` or `GroupId`. The format for `ResourceId` is either
    #   `UUID` or `1234567890-UUID`, where `UUID` is a randomly generated
    #   value for each resource when it is created and `1234567890`
    #   represents the `IdentityStoreId` string value. In the case that the
    #   identity store is migrated from a legacy single sign-on identity
    #   store, the `ResourceId` for that identity store will be in the
    #   format of `UUID`. Otherwise, it will be in the `1234567890-UUID`
    #   format.
    #   @return [String]
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @!attribute [rw] request_id
    #   The identifier for each request. This value is a globally unique ID
    #   that is generated by the identity store service for each sent
    #   request, and is then returned inside the exception if the request
    #   fails.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ResourceNotFoundException AWS API Documentation
    #
    class ResourceNotFoundException < Struct.new(
      :resource_type,
      :resource_id,
      :message,
      :request_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # Indicates that the principal has crossed the throttling limits of the
    # API operations.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @!attribute [rw] request_id
    #   The identifier for each request. This value is a globally unique ID
    #   that is generated by the identity store service for each sent
    #   request, and is then returned inside the exception if the request
    #   fails.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ThrottlingException AWS API Documentation
    #
    class ThrottlingException < Struct.new(
      :message,
      :request_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # A user object, which contains a specified user’s metadata and
    # attributes.
    #
    # @!attribute [rw] user_name
    #   Contains the user’s user name value. The length limit is 128
    #   characters. This value can consist of letters, accented characters,
    #   symbols, numbers, and punctuation. The characters `<>;:%` are
    #   excluded. This value is specified at the time the user is created
    #   and stored as an attribute of the user object in the identity store.
    #   @return [String]
    #
    # @!attribute [rw] user_id
    #   The identifier for a user in the identity store.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/User AWS API Documentation
    #
    class User < Struct.new(
      :user_name,
      :user_id)
      SENSITIVE = [:user_name]
      include Aws::Structure
    end

    # The request failed because it contains a syntax error.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @!attribute [rw] request_id
    #   The identifier for each request. This value is a globally unique ID
    #   that is generated by the identity store service for each sent
    #   request, and is then returned inside the exception if the request
    #   fails.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/identitystore-2020-06-15/ValidationException AWS API Documentation
    #
    class ValidationException < Struct.new(
      :message,
      :request_id)
      SENSITIVE = []
      include Aws::Structure
    end

  end
end
