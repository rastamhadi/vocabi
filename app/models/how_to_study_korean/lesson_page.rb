# frozen_string_literal: true

module HowToStudyKorean
  class LessonPage
    def self.get(unit, group, lesson)
      new(Mechanize.new.get("https://www.howtostudykorean.com/unit#{unit}/unit-#{unit}-lessons-#{group}/unit-#{unit}-lesson-#{lesson}/"))
    end

    def initialize(page)
      @page = page
    end

    def words
      @words ||= @page.search('.noarrow').map do |span|
        Word.new(span.parent)
      end
    end

    class Word
      def initialize(fragment)
        @fragment = fragment
      end

      def korean
        @korean ||= @fragment.search('a').text
      end

      def definition
        @definition ||= @fragment.search('.noarrow').text
      end

      def part_of_speech
        first_word if part_of_speech?
      end

      def part_of_speech?
        first_word.in?(Headword.parts_of_speech)
      end

      private

      def first_word
        @first_word ||= @fragment.text.split(':').first.split.first.singularize.downcase
      end
    end
  end
end
