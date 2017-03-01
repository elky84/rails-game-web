require 'test_helper'

class LogControllerTest < ActionController::TestCase
  test "should get find_by_nickname" do
    get :find_by_nickname
    assert_response :success
  end

end
