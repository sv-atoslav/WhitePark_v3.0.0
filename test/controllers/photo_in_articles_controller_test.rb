require 'test_helper'

class PhotoInArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_in_article = photo_in_articles(:one)
  end

  test "should get index" do
    get photo_in_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_in_article_url
    assert_response :success
  end

  test "should create photo_in_article" do
    assert_difference('PhotoInArticle.count') do
      post photo_in_articles_url, params: { photo_in_article: { article: @photo_in_article.article, photo: @photo_in_article.photo } }
    end

    assert_redirected_to photo_in_article_url(PhotoInArticle.last)
  end

  test "should show photo_in_article" do
    get photo_in_article_url(@photo_in_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_in_article_url(@photo_in_article)
    assert_response :success
  end

  test "should update photo_in_article" do
    patch photo_in_article_url(@photo_in_article), params: { photo_in_article: { article: @photo_in_article.article, photo: @photo_in_article.photo } }
    assert_redirected_to photo_in_article_url(@photo_in_article)
  end

  test "should destroy photo_in_article" do
    assert_difference('PhotoInArticle.count', -1) do
      delete photo_in_article_url(@photo_in_article)
    end

    assert_redirected_to photo_in_articles_url
  end
end
