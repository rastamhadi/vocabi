# frozen_string_literal: true

FactoryBot.define do
  factory :headword do
    word { Faker::Lorem.word }
    part_of_speech { Headword.parts_of_speech.values.sample }
  end
end
