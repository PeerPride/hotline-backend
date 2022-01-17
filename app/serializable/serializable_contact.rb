# frozen_string_literal: true

class SerializableContact < JSONAPI::Serializable::Resource # :nodoc:😀
  type 'Contacts'

  attributes :codename, :notes, :blocked


  # link :self do
  #   @url_helpers.api_v1_user_url(@object.id)
  # end
end
