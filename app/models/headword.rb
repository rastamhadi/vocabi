# frozen_string_literal: true

class Headword < ApplicationRecord
  enum part_of_speech: %i[noun verb adjective adverb]

  validates :word, presence: true

  def imported?
    Headword.exists?(word: word)
  end
end
