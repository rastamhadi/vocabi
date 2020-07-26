# frozen_string_literal: true

require 'test_helper'

module HowToStudyKorean
  class UnitTest < ActiveSupport::TestCase
    test '.all' do
      units = Unit.all

      assert_equal(7, units.size)
      units.each do |unit|
        assert_kind_of(Unit, unit)
      end
      assert_equal(%w[1 2 3 4 5 6 7], units.map(&:number))
    end

    test '#lesson_groups' do
      lesson_groups = Unit.new(:unit_4).lesson_groups

      assert_equal(3, lesson_groups.size)
      lesson_groups.each do |lesson_group|
        assert_kind_of(LessonGroup, lesson_group)
      end
      assert_equal(%w[76-83 84-91 92-100], lesson_groups.map(&:name))
    end

    test '#number' do
      unit = Unit.new(:unit_123)

      assert_equal('123', unit.number)
    end
  end
end
