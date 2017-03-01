require 'test_helper'

class MasteryResetsControllerTest < ActionController::TestCase
  setup do
    @mastery_reset = mastery_resets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mastery_resets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mastery_reset" do
    assert_difference('MasteryReset.count') do
      post :create, mastery_reset: { COST: @mastery_reset.COST, MASTERY_RESET_ID: @mastery_reset.MASTERY_RESET_ID }
    end

    assert_redirected_to mastery_reset_path(assigns(:mastery_reset))
  end

  test "should show mastery_reset" do
    get :show, id: @mastery_reset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mastery_reset
    assert_response :success
  end

  test "should update mastery_reset" do
    patch :update, id: @mastery_reset, mastery_reset: { COST: @mastery_reset.COST, MASTERY_RESET_ID: @mastery_reset.MASTERY_RESET_ID }
    assert_redirected_to mastery_reset_path(assigns(:mastery_reset))
  end

  test "should destroy mastery_reset" do
    assert_difference('MasteryReset.count', -1) do
      delete :destroy, id: @mastery_reset
    end

    assert_redirected_to mastery_resets_path
  end
end
