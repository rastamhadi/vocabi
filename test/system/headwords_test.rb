# frozen_string_literal: true

require 'application_system_test_case'

class HeadwordsTest < ApplicationSystemTestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'visiting the index' do
    visit headwords_url
    assert_selector 'h1', text: 'Headwords'
  end

  test 'creating a Headword' do
    headword = build_stubbed(:headword)

    visit headwords_url
    click_on 'New Headword'

    fill_in 'Word', with: headword.word
    select headword.part_of_speech, from: 'Part of speech'
    click_on 'Create Headword'

    assert_text 'Headword was successfully created'
    assert_text headword.word
    assert_text headword.part_of_speech
    click_on 'Back'
  end

  test 'updating a Headword' do
    _old_headword = create(:headword)
    new_headword = build_stubbed(:headword)

    visit headwords_url
    click_on 'Edit', match: :first

    fill_in 'Word', with: new_headword.word
    select new_headword.part_of_speech, from: 'Part of speech'
    click_on 'Update Headword'

    assert_text 'Headword was successfully updated'
    assert_text new_headword.word
    assert_text new_headword.part_of_speech
    click_on 'Back'
  end

  test 'destroying a Headword' do
    create(:headword)

    visit headwords_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Headword was successfully destroyed'
  end
end
