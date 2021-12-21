# frozen_string_literal: true

class SerializableUser < JSONAPI::Serializable::Resource # :nodoc:😀
  type 'Users'

  attributes :email, :name, :created_at

  belongs_to :team

  link :self do
    # @url_helpers.api_v1_user_url(@object.id)
  end
end
