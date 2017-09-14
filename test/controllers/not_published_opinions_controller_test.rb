require 'test_helper'

class NotPublishedOpinionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @not_published_opinion = not_published_opinions(:one)
  end

  test "should get index" do
    get not_published_opinions_url
    assert_response :success
  end

  test "should get new" do
    get new_not_published_opinion_url
    assert_response :success
  end

  test "should create not_published_opinion" do
    assert_difference('NotPublishedOpinion.count') do
      post not_published_opinions_url, params: { not_published_opinion: { author: @not_published_opinion.author, email: @not_published_opinion.email, phone: @not_published_opinion.phone, visit: @not_published_opinion.visit, words: @not_published_opinion.words } }
    end

    assert_redirected_to not_published_opinion_url(NotPublishedOpinion.last)
  end

  test "should show not_published_opinion" do
    get not_published_opinion_url(@not_published_opinion)
    assert_response :success
  end

  test "should get edit" do
    get edit_not_published_opinion_url(@not_published_opinion)
    assert_response :success
  end

  test "should update not_published_opinion" do
    patch not_published_opinion_url(@not_published_opinion), params: { not_published_opinion: { author: @not_published_opinion.author, email: @not_published_opinion.email, phone: @not_published_opinion.phone, visit: @not_published_opinion.visit, words: @not_published_opinion.words } }
    assert_redirected_to not_published_opinion_url(@not_published_opinion)
  end

  test "should destroy not_published_opinion" do
    assert_difference('NotPublishedOpinion.count', -1) do
      delete not_published_opinion_url(@not_published_opinion)
    end

    assert_redirected_to not_published_opinions_url
  end
end
