# frozen_string_literal: true

class TagCategory < ApplicationRecord
  include Orderable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
