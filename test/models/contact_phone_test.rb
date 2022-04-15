# frozen_string_literal: true

require 'test_helper'

class ContactPhoneTest < ActiveSupport::TestCase
  test 'Phone numbers must be unique' do
    cp1 = ContactPhone.new
    cp1.contact_id = Contact.first.id
    cp1.phone = '+12035551212'
    cp1.save!

    cp2 = ContactPhone.new
    cp2.contact_id = Contact.first.id
    cp2.phone = '+12035551212'
    assert_raises(ActiveRecord::RecordInvalid) do
      cp2.save!
    end
  end

  test 'Phone number must exist' do
    cp1 = ContactPhone.new
    cp1.contact_id = Contact.first.id
    assert_raises(ActiveRecord::RecordInvalid) do
      cp1.save!
    end
  end
end
