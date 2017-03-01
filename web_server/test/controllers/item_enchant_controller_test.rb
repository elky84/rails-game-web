require 'test_helper'

class ItemEnchantControllerTest < ActionController::TestCase
  test "should get enchant" do
    get :enchant
    assert_response :success
  end

end
