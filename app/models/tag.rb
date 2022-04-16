# frozen_string_literal: true

class Tag < ApplicationRecord # :nodoc:
  validates :name, presence: true
end
