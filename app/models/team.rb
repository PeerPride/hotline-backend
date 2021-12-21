class Team < ApplicationRecord
  belongs_to :lead, :class_name => 'User', :optional => true
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def is_active?
    self.users.count > 0
  end
end
