# frozen_string_literal: true

module Korean
  class Object
    def initialize(headword)
      @headword = headword
    end

    def inflect
      last_character.ends_with_vowel? ? "#{@headword}를" : "#{@headword}을"
    end

    private

    def last_character
      Hangeul.new(@headword.chars.last)
    end
  end
end
