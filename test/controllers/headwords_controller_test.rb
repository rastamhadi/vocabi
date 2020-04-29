require 'test_helper'

class HeadwordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @headword = headwords(:one)
  end

  test "should get index" do
    get headwords_url
    assert_response :success
  end

  test "should get new" do
    get new_headword_url
    assert_response :success
  end

  test "should create headword" do
    assert_difference('Headword.count') do
      post headwords_url, params: { headword: { word: @headword.word } }
    end

    assert_redirected_to headword_url(Headword.last)
  end

  test "should show headword" do
    get headword_url(@headword)
    assert_response :success
  end

  test "should get edit" do
    get edit_headword_url(@headword)
    assert_response :success
  end

  test "should update headword" do
    patch headword_url(@headword), params: { headword: { word: @headword.word } }
    assert_redirected_to headword_url(@headword)
  end

  test "should destroy headword" do
    assert_difference('Headword.count', -1) do
      delete headword_url(@headword)
    end

    assert_redirected_to headwords_url
  end
end
