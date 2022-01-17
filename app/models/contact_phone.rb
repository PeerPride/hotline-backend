class ContactPhone < ApplicationRecord
  validates :phone, presence: true, uniqueness: true

  after_destroy :update_primary
  after_save :update_primary

  belongs_to :contact

  private
    def update_primary
      return if self.destroyed?
      self.contact.update_primary_phone

      if cp1.contact_id_changed?
        Contact.where(:id => cp1.contact_id_was).update_primary_phone
      end

      self.reload
    end
end
