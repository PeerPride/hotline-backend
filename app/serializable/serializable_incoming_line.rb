# frozen_string_literal: true

class SerializableIncomingLine < JSONAPI::Serializable::Resource # :nodoc:😀
  type 'IncomingLines'

  attributes :name, :number, :active


  # link :self do
  #   @url_helpers.api_v1_user_url(@object.id)
  # end
end
