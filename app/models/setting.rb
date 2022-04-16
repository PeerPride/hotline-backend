# frozen_string_literal: true

# General non-app config settings
class Setting < ApplicationRecord
  @valid_type_hints = %w[string json boolean phone email number]

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :type_hint, presence: true, inclusion: { in: @valid_type_hints }

  def name_as_env_var
    name.upcase.gsub(/ /, '_').gsub(/[^0-9A-Z_]/, '')
  end

  # Any database Setting can be overridden by an environment variable.
  # While setting in ENV vars is ideal, some folks won't have tech skill,
  # or the ability in some environments.
  def value
    if ENV[name_as_env_var].nil?
      self[:value]
    else
      ENV[name_as_env_var]
    end
  end

  def overridden?
    self[:value] != value
  end

  class << self
    attr_reader :valid_type_hints
  end
end
