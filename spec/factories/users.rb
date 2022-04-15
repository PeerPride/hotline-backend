# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.unique.name }
    name { Faker::Name.first_name }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.unique.cell_phone_in_e164 }
  end
end
