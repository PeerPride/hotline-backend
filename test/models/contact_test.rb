require "test_helper"

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
end
