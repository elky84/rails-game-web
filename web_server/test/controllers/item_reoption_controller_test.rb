require 'test_helper'

class ItemReoptionControllerTest < ActionController::TestCase
  test "should get reoption" do
    get :reoption
    assert_response :success
  end

end
