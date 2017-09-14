require 'test_helper'

class PhotoInEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo_in_event = photo_in_events(:one)
  end

  test "should get index" do
    get photo_in_events_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_in_event_url
    assert_response :success
  end

  test "should create photo_in_event" do
    assert_difference('PhotoInEvent.count') do
      post photo_in_events_url, params: { photo_in_event: { event: @photo_in_event.event, photo: @photo_in_event.photo } }
    end

    assert_redirected_to photo_in_event_url(PhotoInEvent.last)
  end

  test "should show photo_in_event" do
    get photo_in_event_url(@photo_in_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_in_event_url(@photo_in_event)
    assert_response :success
  end

  test "should update photo_in_event" do
    patch photo_in_event_url(@photo_in_event), params: { photo_in_event: { event: @photo_in_event.event, photo: @photo_in_event.photo } }
    assert_redirected_to photo_in_event_url(@photo_in_event)
  end

  test "should destroy photo_in_event" do
    assert_difference('PhotoInEvent.count', -1) do
      delete photo_in_event_url(@photo_in_event)
    end

    assert_redirected_to photo_in_events_url
  end
end
