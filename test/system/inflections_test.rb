# frozen_string_literal: true

require 'application_system_test_case'

class InflectionsTest < ApplicationSystemTestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'visiting the index' do
    visit inflections_url
    assert_selector 'h1', text: 'Inflections'
  end

  test 'creating a Inflection' do
    inflection = build_stubbed(:inflection)

    visit inflections_url
    click_on 'New'

    fill_in 'Headword', with: inflection.headword_id
    fill_in 'Inflector', with: inflection.inflector
    fill_in 'Word', with: inflection.word
    click_on 'Create Inflection'

    assert_text 'Inflection was successfully created'
    assert_text inflection.headword_id
    assert_text inflection.inflector
    assert_text inflection.word
    click_on 'Back'
  end

  test 'updating a Inflection' do
    _old_inflection = create(:inflection)
    new_inflection = build_stubbed(:inflection)

    visit inflections_url
    click_on 'Edit', match: :first

    fill_in 'Headword', with: new_inflection.headword_id
    fill_in 'Inflector', with: new_inflection.inflector
    fill_in 'Word', with: new_inflection.word
    click_on 'Update Inflection'

    assert_text 'Inflection was successfully updated'
    assert_text new_inflection.headword_id
    assert_text new_inflection.inflector
    assert_text new_inflection.word
    click_on 'Back'
  end

  test 'destroying a Inflection' do
    create(:inflection)

    visit inflections_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Inflection was successfully destroyed'
  end
end
