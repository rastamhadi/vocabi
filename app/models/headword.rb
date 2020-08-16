# frozen_string_literal: true

class Headword < ApplicationRecord
  enum part_of_speech: %i[noun verb adjective adverb]

  validates :word, presence: true
  validates :definition, presence: true
  validates :part_of_speech, presence: true

  has_many :inflections

  def imported?
    Headword.exists?(word: word)
  end

  def build_creatable_inflections
    unused_inflectors.each do |inflector|
      inflections.build(inflector: inflector, word: inflector.constantize.new(word).inflect)
    end
  end

  def inflectors
    Rails.configuration.x.inflectors[:korean][part_of_speech.to_sym]
  end

  private

  def unused_inflectors
    inflectors - inflections.pluck(:inflector)
  end
end
