# frozen_string_literal: true

class SerializableUser < JSONAPI::Serializable::Resource # :nodoc:😀
  type 'Users'

  attributes :email

  link :self do
    # @url_helpers.api_v1_user_url(@object.id)
  end
end
