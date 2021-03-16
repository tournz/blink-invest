require 'test_helper'

class PollOptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get poll_options_new_url
    assert_response :success
  end

  test "should get create" do
    get poll_options_create_url
    assert_response :success
  end

end
