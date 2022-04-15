# frozen_string_literal: true

FactoryBot.define do
  factory :incoming_line do
    name { 'MyString' }
    number { 'MyString' }
    is_active { false }
    phone_greeting_message { 'MyText' }
    text_greeting_message { 'MyText' }
    greeting_audio { 'MyString' }
  end
end
