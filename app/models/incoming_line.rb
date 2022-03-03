class IncomingLine < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :languages
end
