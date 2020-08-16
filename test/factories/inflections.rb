# frozen_string_literal: true

FactoryBot.define do
  factory :inflection do
    headword
    inflector { headword.inflectors.sample }
    word do
      I18n.with_locale(:ko) { Faker::Lorem.word }
    end
  end
end
