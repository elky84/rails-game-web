require 'test_helper'

class MonsterEvolutionControllerTest < ActionController::TestCase
  test "should get evolution" do
    get :evolution
    assert_response :success
  end

end
