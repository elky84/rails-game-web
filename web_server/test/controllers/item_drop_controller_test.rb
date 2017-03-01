require 'test_helper'

class ItemDropControllerTest < ActionController::TestCase
  test "should get drop" do
    get :drop
    assert_response :success
  end

end
