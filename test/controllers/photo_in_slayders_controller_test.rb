require 'test_helper'

class PhotoInSlaydersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_in_slayder = photo_in_slayders(:one)
  end

  test "should get index" do
    get photo_in_slayders_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_in_slayder_url
    assert_response :success
  end

  test "should create photo_in_slayder" do
    assert_difference('PhotoInSlayder.count') do
      post photo_in_slayders_url, params: { photo_in_slayder: { photo: @photo_in_slayder.photo, slyder: @photo_in_slayder.slyder } }
    end

    assert_redirected_to photo_in_slayder_url(PhotoInSlayder.last)
  end

  test "should show photo_in_slayder" do
    get photo_in_slayder_url(@photo_in_slayder)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_in_slayder_url(@photo_in_slayder)
    assert_response :success
  end

  test "should update photo_in_slayder" do
    patch photo_in_slayder_url(@photo_in_slayder), params: { photo_in_slayder: { photo: @photo_in_slayder.photo, slyder: @photo_in_slayder.slyder } }
    assert_redirected_to photo_in_slayder_url(@photo_in_slayder)
  end

  test "should destroy photo_in_slayder" do
    assert_difference('PhotoInSlayder.count', -1) do
      delete photo_in_slayder_url(@photo_in_slayder)
    end

    assert_redirected_to photo_in_slayders_url
  end
end
