require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  test 'Conversation status must be valid' do
    c = Conversation.new
    c.provider_id = 1
    c.method = 'Phone'
    c.status = 'abcd'

    assert_raises(ActiveRecord::RecordInvalid) do
      c.save!
    end
  end

  test 'Conversation method must be valid' do
    c = Conversation.new
    c.provider_id = 2
    c.method = 'abcd'

    assert_raises(ActiveRecord::RecordInvalid) do
      c.save!
    end
  end

  test 'Conversation calculates and saves length when finished' do
    c = Conversation.new
    c.started_at = DateTime.now
    c.ended_at = c.started_at + 30.seconds
    c.method = 'Phone'
    c.provider_id = 1
    c.status = 'Finished'
    c.save
    c.reload

    assert_equal 30, c.length
  end

  test 'Conversation only requires provider ID for phone/text/whatsapp' do
    c = Conversation.new
    c.method = 'Phone'
    assert_raises(ActiveRecord::RecordInvalid) do
      c.save!
    end

    c1 = Conversation.new
    c1.method = 'Web'
    assert c1.save!
  end
end
