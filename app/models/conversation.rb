# frozen_string_literal: true

# A conversation happens via any of the methods available (phone, text, web, etc)
class Conversation < ApplicationRecord
  @valid_statuses = ['Incoming', 'Language Selection', 'Pending Operator', 'Answered', 'Finished']
  @valid_methods = %w[Phone Text Web Signal WhatsApp]

  validates :status, presence: true, inclusion: { in: @valid_statuses }
  validates :method, presence: true, inclusion: { in: @valid_methods }
  validates :provider_id, presence: true, uniqueness: true, if: :can_have_provider_identification?

  belongs_to :contact, optional: true
  belongs_to :contactphone, optional: true
  belongs_to :conversation, optional: true
  belongs_to :incoming_line

  has_many :conversation_participant

  before_save :calculate_length

  def finish
    self.status = 'Finished'
    save
  end

  def can_have_provider_identification?
    %w[Phone Text WhatsApp].include? method
  end

  private

  def calculate_length
    return if status != 'Finished'

    self.length = ((ended_at.to_datetime - started_at.to_datetime) * 24 * 60 * 60).to_i
  end
end
