# frozen_string_literal: true

require 'test_helper'

module HowToStudyKorean
  class LessonPageTest < ActiveSupport::TestCase
    test '#words' do
      VCR.use_cassette('how_to_study_korean') do
        words = LessonPage.get(1, '1-8', 1).words

        assert_equal(33, words.size)
        words.each do |word|
          assert_kind_of(LessonPage::Word, word)
        end
        assert_equal('한국', words.first.korean)
        assert_equal('아니', words.last.korean)
      end
    end
  end

  class LessonPageWordTest < ActiveSupport::TestCase
    test '#korean' do
      word = build(:how_to_study_korean_lesson_page_word, korean: '이름')

      assert_equal('이름', word.korean)
    end

    test '#definition' do
      word = build(:how_to_study_korean_lesson_page_word, definition: 'name')

      assert_equal('name', word.definition)
    end

    test '#part_of_speech' do
      noun = build(:how_to_study_korean_lesson_page_word, part_of_speech: 'Nouns')
      adverb = build(:how_to_study_korean_lesson_page_word, part_of_speech: 'Adverbs and Other words')
      no_part_of_speech = build(:how_to_study_korean_lesson_page_word)

      assert_equal('noun', noun.part_of_speech)
      assert_equal('adverb', adverb.part_of_speech)
      assert_nil(no_part_of_speech.part_of_speech)
    end

    test '#part_of_speech?' do
      noun = build(:how_to_study_korean_lesson_page_word, part_of_speech: 'Nouns')
      adverb = build(:how_to_study_korean_lesson_page_word, part_of_speech: 'Adverbs and Other words')
      no_part_of_speech = build(:how_to_study_korean_lesson_page_word)

      assert(noun.part_of_speech?)
      assert(adverb.part_of_speech?)
      refute(no_part_of_speech.part_of_speech?)
    end
  end
end
