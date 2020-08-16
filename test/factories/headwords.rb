# frozen_string_literal: true

FactoryBot.define do
  factory :headword do
    part_of_speech { Headword.parts_of_speech.values.sample }
    definition { Faker::Lorem.sentence }
    word do
      I18n.with_locale(:ko) { Faker::Lorem.word }
    end
  end
end
