# frozen_string_literal: true

module Korean
  class Subject
    def initialize(headword)
      @headword = headword
    end

    def inflect
      last_character.ends_with_vowel? ? "#{@headword}는" : "#{@headword}은"
    end

    private

    def last_character
      Hangeul.new(@headword.chars.last)
    end
  end
end
