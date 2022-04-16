# frozen_string_literal: true

# A Contact is someone who has used the service in some way
class Contact < ApplicationRecord
  include CodenameGeneratorHelper

  validates :codename, presence: true, uniqueness: { case_insensitive: false }

  before_validation :set_codename, on: [:create]

  has_many :contact_phones, dependent: :destroy
  has_many :conversations

  def primary_phone
    contact_phones.where(is_primary: true)
  end

  def update_primary_phone
    return if destroyed?

    return unless primary_phone.empty?

    new_primary = contact_phones.first
    return if new_primary.nil?

    new_primary.is_primary = true
    new_primary.save
  end

  private

  def set_codename
    cn = ''
    loop do
      cn = generate_codename
      break if Contact.where(codename: cn).count.zero?
    end

    self.codename = cn
  end
end
