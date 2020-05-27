FactoryBot.define do
  factory :example do
    sentence { Faker::Lorem.sentence }
    meaning { Faker::Lorem.sentence }
  end
end
