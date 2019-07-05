require 'test_helper'

class CalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get calenders_new_url
    assert_response :success
  end

  test "should get update" do
    get calenders_update_url
    assert_response :success
  end

  test "should get delete" do
    get calenders_delete_url
    assert_response :success
  end

  test "should get show" do
    get calenders_show_url
    assert_response :success
  end

end
