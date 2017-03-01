require 'test_helper'

class GachaControllerTest < ActionController::TestCase
  test "should get result" do
    get :result
    assert_response :success
  end

end
