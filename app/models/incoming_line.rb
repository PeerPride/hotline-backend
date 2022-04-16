# frozen_string_literal: true

# An incoming line is a phone line
class IncomingLine < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :languages
end
