include CodenameGeneratorHelper

class Contact < ApplicationRecord
  validates :codename, presence: true, uniqueness: { case_insensitive: false }

  before_validation :set_codename, on: [:create]

  has_many :contact_phones, dependent: :destroy

  def primary_phone
    self.contact_phones.where(:is_primary => true)
  end

  def update_primary_phone
    return if self.destroyed?
    if self.primary_phone.empty?
      new_primary = self.contact_phones.first
      return if new_primary.nil?

      new_primary.is_primary = true
      new_primary.save
    end
    
  end

  private
    def set_codename
      cn = ''
      loop do
        cn = generate_codename
        break if Contact::where(:codename => cn).count == 0
      end

      self.codename = cn
    end
end
