FactoryBot.define do
  factory :group do
    name { Faker::Lorem.word }
    user
  end
end
