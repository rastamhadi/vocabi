# frozen_string_literal: true

module HowToStudyKorean
  class LessonGroup
    attr_reader :name, :unit

    def initialize(name, unit)
      @name = name
      @unit = unit
    end

    def lessons
      lesson_numbers.map do |number|
        Lesson.new(number, self)
      end
    end

    private

    def lesson_numbers
      Range.new(*@name.split('-'))
    end
  end
end
