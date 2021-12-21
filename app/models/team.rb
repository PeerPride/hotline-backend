class Team < ApplicationRecord
  belongs_to :lead, :class_name => 'User', :optional => true
  has_and_belongs_to_many :members, class_name: 'User', join_table: 'teams_users'

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  after_update :remove_lead_from_members

  def is_active?
    self.members.count > 0
  end

  private
    def remove_lead_from_members
      self.members.delete(self.lead)
    end
end
