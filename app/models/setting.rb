# frozen_string_literal: true

class Setting < ApplicationRecord
  @@valid_type_hints = %w[string json boolean phone email number]

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :type_hint, presence: true, inclusion: { in: @@valid_type_hints }

  def name_as_env_var
    name.downcase.gsub(/ /, '_').gsub(/[^0-9a-z_]/, '')
  end

  def self.valid_type_hints
    @@valid_type_hints
  end
end
