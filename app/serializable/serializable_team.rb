# frozen_string_literal: true

class SerializableTeam < JSONAPI::Serializable::Resource # :nodoc:😀
  type 'Teams'

  attributes :name, :description

  has_many :members do
    data do
      @object.members
    end

    meta do
      { count: @object.members.count }
    end
  end
  

  # link :self do
  #   @url_helpers.api_v1_user_url(@object.id)
  # end
end
