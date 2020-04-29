require "application_system_test_case"

class HeadwordsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit headwords_url
    assert_selector "h1", text: "Headwords"
  end

  test "creating a Headword" do
    @headword = build_stubbed(:headword)

    visit headwords_url
    click_on "New Headword"

    fill_in "Word", with: @headword.word
    click_on "Create Headword"

    assert_text "Headword was successfully created"
    click_on "Back"
  end

  test "updating a Headword" do
    @headword = create(:headword)

    visit headwords_url
    click_on "Edit", match: :first

    fill_in "Word", with: @headword.word
    click_on "Update Headword"

    assert_text "Headword was successfully updated"
    click_on "Back"
  end

  test "destroying a Headword" do
    @headword = create(:headword)

    visit headwords_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Headword was successfully destroyed"
  end
end
