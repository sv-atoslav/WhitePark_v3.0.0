require 'test_helper'

class CategoryEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_event = category_events(:one)
  end

  test "should get index" do
    get category_events_url
    assert_response :success
  end

  test "should get new" do
    get new_category_event_url
    assert_response :success
  end

  test "should create category_event" do
    assert_difference('CategoryEvent.count') do
      post category_events_url, params: { category_event: { description: @category_event.description, icon: @category_event.icon, title: @category_event.title } }
    end

    assert_redirected_to category_event_url(CategoryEvent.last)
  end

  test "should show category_event" do
    get category_event_url(@category_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_event_url(@category_event)
    assert_response :success
  end

  test "should update category_event" do
    patch category_event_url(@category_event), params: { category_event: { description: @category_event.description, icon: @category_event.icon, title: @category_event.title } }
    assert_redirected_to category_event_url(@category_event)
  end

  test "should destroy category_event" do
    assert_difference('CategoryEvent.count', -1) do
      delete category_event_url(@category_event)
    end

    assert_redirected_to category_events_url
  end
end
