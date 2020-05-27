# frozen_string_literal: true

require 'application_system_test_case'

class ExamplesTest < ApplicationSystemTestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'visiting the index' do
    visit examples_url
    assert_selector 'h1', text: 'Examples'
  end

  test 'creating an Example' do
    example = build_stubbed(:example)

    visit examples_url
    click_on 'New'

    fill_in 'Meaning', with: example.meaning
    fill_in 'Sentence', with: example.sentence
    click_on 'Create Example'

    assert_text 'Example was successfully created'
    assert_text example.meaning
    assert_text example.sentence
    click_on 'Back'
  end

  test 'updating an Example' do
    _old_example = create(:example)
    new_example = build_stubbed(:example)

    visit examples_url
    click_on 'Edit', match: :first

    fill_in 'Meaning', with: new_example.meaning
    fill_in 'Sentence', with: new_example.sentence
    click_on 'Update Example'

    assert_text 'Example was successfully updated'
    assert_text new_example.meaning
    assert_text new_example.sentence
    click_on 'Back'
  end

  test 'destroying an Example' do
    create(:example)

    visit examples_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Example was successfully destroyed'
  end
end
