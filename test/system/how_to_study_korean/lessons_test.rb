# frozen_string_literal: true

require 'application_system_test_case'

module Scrapers
  module HowToStudyKorean
    class LessonsTest < ApplicationSystemTestCase
      setup do
        user = create(:user)
        sign_in user
      end

      test 'creating a headword from How To Study Korean' do
        visit how_to_study_korean_lessons_url

        assert_selector 'h1', text: 'How to Study Korean'

        VCR.use_cassette('how_to_study_korean') do
          click_on '1'

          within('#new_headword_한국') do
            click_on 'Create Headword'

            assert_no_button 'Create Headword'
          end
        end
      end
    end
  end
end
