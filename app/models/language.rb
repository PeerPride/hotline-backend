# frozen_string_literal: true

# Languages offered by lines and used by operators
class Language < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :update_local_name
  has_and_belongs_to_many :users
  has_and_belongs_to_many :incoming_lines
  has_and_belongs_to_many :conversations

  private

  def update_local_name
    self.local_name = name if local_name.to_s.strip.length.zero?
  end
end
