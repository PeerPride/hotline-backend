# frozen_string_literal: true

class SerializableLanguage < JSONAPI::Serializable::Resource # :nodoc:😀
  type 'Languages'

  attributes :name, :local_name, :active

  # link :self do
  #   @url_helpers.api_v1_user_url(@object.id)
  # end
end
