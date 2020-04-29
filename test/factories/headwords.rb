# frozen_string_literal: true

FactoryBot.define do
  factory :headword do
    word { Faker::Lorem.word }
  end
end
