# frozen_string_literal: true

class Language < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save :update_local_name
  has_and_belongs_to_many :users
  has_and_belongs_to_many :incoming_lines

  private
    def update_local_name
      if self.local_name.to_s.strip.length == 0
        self.local_name = self.name
      end
    end
end
