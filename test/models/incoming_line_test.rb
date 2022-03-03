require "test_helper"

class IncomingLineTest < ActiveSupport::TestCase
  test 'Incoming Line requires a name' do
    l1 = IncomingLine.new
    assert_not l1.save

    l2 = IncomingLine.new
    l2.name = 'A Name Here'
    l2.number = '123'
    assert l2.save
  end

  test 'Incoming Line requires a unique name' do
    l1 = IncomingLine.new
    l1.name = 'Main line'
    l1.number = '123456'
    l1.save!

    l2 = IncomingLine.new
    l2.name = 'Main line'
    l2.number = '344'
    assert_not l2.save
  end

  test 'Incoming Line requires a phone number' do
    l1 = IncomingLine.new
    l1.name = 'Main Line'
    l1.number = '12345'
    l1.save

    l2 = IncomingLine.new
    l2.name = 'Main Line 2'
    l2.number = '12345'
    assert_not l2.save
  end
end
