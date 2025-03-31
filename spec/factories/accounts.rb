FactoryBot.define do
  factory :account, class: 'Account' do
    name { Faker::Company.name }
  end
end
