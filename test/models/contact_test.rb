# frozen_string_literal: true

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'Contact must have a codename' do
    c = Contact.new
    c.save!
    assert_not c.codename.nil?

    c.codename = nil
    assert_raises(ActiveRecord::RecordInvalid) do
      c.save!
    end
  end

  test 'Contact must have a unique codename' do
    c = Contact.new
    c.save!
    c.codename = '123'
    assert c.save!

    c1 = Contact.new
    c1.save!
    c1.codename = '123'
    assert_raises(ActiveRecord::RecordInvalid) do
      c1.save!
    end
  end

  test 'Deleting contact deletes all phones' do
    c = Contact.new
    c.save!
    cp1 = ContactPhone.new
    cp1.contact_id = c.id
    cp1.phone = '+5555555555'
    cp1.save!

    c.destroy
    assert_equal ContactPhone.where(phone: '+5555555555').count, 0
  end

  test 'Assigning first ContactPhone sets it as primary' do
    c = Contact.new
    c.save!

    cp1 = ContactPhone.new
    cp1.contact_id = c.id
    cp1.phone = 1
    cp1.save!

    assert cp1.is_primary?
  end
end
