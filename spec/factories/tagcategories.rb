# frozen_string_literal: true

FactoryBot.define do
  factory :tagcategory, class: TagCategory do
    name { Faker::Name }
  end
end
