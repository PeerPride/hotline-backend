FactoryBot.define do
  factory :conversation_participant do
    conversation_id { "" }
    user_id { "" }
    started_at { "2022-07-16 19:31:29" }
    ended_at { "2022-07-16 19:31:29" }
    leader { false }
  end
end
