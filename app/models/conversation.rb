class Conversation < ApplicationRecord
  @@valid_statuses = ['Incoming', 'Language Selection', 'Pending Operator', 'Answered', 'Finished']
  @@valid_methods = %w[Phone Text Web Signal WhatsApp]

  validates :status, presence: true, inclusion: { in: @@valid_statuses }
  validates :method, presence: true, inclusion: { in: @@valid_methods }
  validates :provider_id, presence: true, uniqueness: true, if: :can_have_provider_identification?

  belongs_to :contact, :optional => true
  belongs_to :contactphone, :optional => true

  before_save :calculate_length

  def finish
    self.status = 'Finished'
    self.save
  end

  def can_have_provider_identification?
    return %w[Phone Text WhatsApp].include? self.method
  end

  private
    def calculate_length
      return if self.status != 'Finished'

      self.length = ((self.ended_at.to_datetime - self.started_at.to_datetime) * 24 * 60 * 60).to_i
    end
end
