require 'test_helper'

class ItemEquipControllerTest < ActionController::TestCase
  test "should get equip" do
    get :equip
    assert_response :success
  end

end
