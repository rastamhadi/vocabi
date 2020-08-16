# frozen_string_literal: true

require 'application_system_test_case'

class InflectionsTest < ApplicationSystemTestCase
  setup do
    @headword = create(:headword, :noun, word: '한국')
    user = create(:user)
    sign_in user
  end

  test 'creating an Inflection' do
    visit headwords_url
    click_on @headword.id.to_s

    within('#inflection_한국은') do
      click_on 'Create Inflection'

      refute_button 'Create Inflection'
      assert_button 'Update Inflection'
    end

    click_on 'Back'
  end
end
