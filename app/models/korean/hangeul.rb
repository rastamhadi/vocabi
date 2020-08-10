# frozen_string_literal: true

module Korean
  class Hangeul
    def initialize(character)
      @character = Gimchi::Char.new(character)
    end

    def ends_with_vowel?
      last_component.vowel?
    end

    private

    def last_component
      jongsung || jungsung
    end

    def chosung
      @chosung ||= @character.chosung.extend(Gimchi::Char::Component)
    end

    def jungsung
      @jungsung ||= @character.jungsung.extend(Gimchi::Char::Component)
    end

    def jongsung
      @jongsung ||= @character.jongsung.extend(Gimchi::Char::Component)
    end
  end
end
