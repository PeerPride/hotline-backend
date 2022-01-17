include CodenameGeneratorHelper

class Contact < ApplicationRecord
  validates :codename, presence: true, uniqueness: { case_insensitive: false }

  before_validation :set_codename, on: [:create]


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
