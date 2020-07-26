# frozen_string_literal: true

require 'test_helper'

module HowToStudyKorean
  class LessonGroupTest < ActiveSupport::TestCase
    test '#lessons' do
      lessons = LessonGroup.new('1-3', nil).lessons

      assert_equal(3, lessons.size)
      lessons.each do |lesson|
        assert_kind_of(Lesson, lesson)
      end
    end
  end
end
