require 'test_helper'

class SlaydersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slayder = slayders(:one)
  end

  test "should get index" do
    get slayders_url
    assert_response :success
  end

  test "should get new" do
    get new_slayder_url
    assert_response :success
  end

  test "should create slayder" do
    assert_difference('Slayder.count') do
      post slayders_url, params: { slayder: { title: @slayder.title } }
    end

    assert_redirected_to slayder_url(Slayder.last)
  end

  test "should show slayder" do
    get slayder_url(@slayder)
    assert_response :success
  end

  test "should get edit" do
    get edit_slayder_url(@slayder)
    assert_response :success
  end

  test "should update slayder" do
    patch slayder_url(@slayder), params: { slayder: { title: @slayder.title } }
    assert_redirected_to slayder_url(@slayder)
  end

  test "should destroy slayder" do
    assert_difference('Slayder.count', -1) do
      delete slayder_url(@slayder)
    end

    assert_redirected_to slayders_url
  end
end
