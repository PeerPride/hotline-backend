class Team < ApplicationRecord
  belongs_to :lead, :class_name => 'User', :optional => true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
