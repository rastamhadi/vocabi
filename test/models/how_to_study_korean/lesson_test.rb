# frozen_string_literal: true

require 'test_helper'

module HowToStudyKorean
  class LessonTest < ActiveSupport::TestCase
    test '.all' do
      lessons = Lesson.all

      assert_equal(175, lessons.size)
      lessons.each do |lesson|
        assert_kind_of(Lesson, lesson)
      end
    end

    test '#headwords' do
      VCR.use_cassette('how_to_study_korean') do
        unit = Unit.new(:unit_1)
        group = LessonGroup.new('1-8', unit)
        headwords = Lesson.new(1, group).headwords

        assert_equal(33, headwords.size)
        headwords.each do |headword|
          assert_kind_of(Headword, headword)
          assert(headword.valid?)
          refute(headword.persisted?)
          refute_nil(headword.part_of_speech)
        end
      end
    end
  end
end
