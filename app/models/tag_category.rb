# frozen_string_literal: true

class TagCategory < ApplicationRecord # :nodoc:
  include Orderable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
