# frozen_string_literal: true

FactoryBot.define do
  factory :inflection do
    headword
    word { Faker::Lorem.word }
    inflector { Faker::Lorem.word }
  end
end
