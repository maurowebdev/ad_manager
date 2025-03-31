FactoryBot.define do
  factory :ad do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    view_count { 0 }
    association :account
  end
end
