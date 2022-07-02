# frozen_string_literal: true

# A contact can have many phone numbers
class ContactPhone < ApplicationRecord
  validates :phone, phone: true, uniqueness: true

  def phone_number=(val)
    write_attribute(:phone_number, Phonelib.parse(val).international)
  end

  after_destroy :update_primary
  after_save :update_primary

  belongs_to :contact

  has_many :conversations

  

  private

  def update_primary
    return if destroyed?

    contact.update_primary_phone

    Contact.where(id: contact_id_was).update_primary_phone if contact_id_changed?

    reload
  end
end
