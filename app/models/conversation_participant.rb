class ConversationParticipant < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  def self.active (converation_id = nil)
    if !converation_id.nil?
      self.where(:ended_at => nil)
    else
      self.where(:ended_at => nil, :conversation_id => converation_id)
    end
  end
end
