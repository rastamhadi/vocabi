# frozen_string_literal: true

module HowToStudyKorean
  class Lesson
    attr_reader :number, :group

    def self.all
      @all ||= Unit.all.flat_map(&:lesson_groups).flat_map(&:lessons).index_by(&:number)
    end

    def initialize(number, group)
      @number = number
      @group = group
    end

    def headwords
      page.words.chunk(&:part_of_speech?).map(&:last).in_groups_of(2).flat_map do |first_word, other_words|
        other_words.unshift(first_word.first).map do |word|
          Headword.new(word: word.korean, definition: word.definition, part_of_speech: first_word.first.part_of_speech)
        end
      end
    end

    private

    def page
      @page ||= LessonPage.get(@group.unit.number, @group.name, @number)
    end
  end
end
