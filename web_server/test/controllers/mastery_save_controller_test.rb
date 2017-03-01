require 'test_helper'

class MasterySaveControllerTest < ActionController::TestCase
  test "should get save" do
    get :save
    assert_response :success
  end

end
