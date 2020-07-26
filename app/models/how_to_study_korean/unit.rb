# frozen_string_literal: true

module HowToStudyKorean
  class Unit
    def self.all
      Rails.configuration.x.how_to_study_korean.keys.map do |name|
        new(name)
      end
    end

    def initialize(name)
      @name = name
    end

    def lesson_groups
      Rails.configuration.x.how_to_study_korean[@name].map do |lesson_group|
        LessonGroup.new(lesson_group, self)
      end
    end

    def number
      @name.to_s.split('_').last
    end
  end
end
