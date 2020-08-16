# frozen_string_literal: true

class Inflection < ApplicationRecord
  validates :word, presence: true
  validates :inflector, presence: true

  belongs_to :headword
end
