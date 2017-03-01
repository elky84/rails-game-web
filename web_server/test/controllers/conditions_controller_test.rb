require 'test_helper'

class ConditionsControllerTest < ActionController::TestCase
  setup do
    @condition = conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create condition" do
    assert_difference('Condition.count') do
      post :create, condition: { CONDITION_APPLY_TYPE: @condition.CONDITION_APPLY_TYPE, CONDITION_EFFECT: @condition.CONDITION_EFFECT, CONDITION_ID: @condition.CONDITION_ID, CONDITION_INFO: @condition.CONDITION_INFO, PERCENT: @condition.PERCENT }
    end

    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should show condition" do
    get :show, id: @condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @condition
    assert_response :success
  end

  test "should update condition" do
    patch :update, id: @condition, condition: { CONDITION_APPLY_TYPE: @condition.CONDITION_APPLY_TYPE, CONDITION_EFFECT: @condition.CONDITION_EFFECT, CONDITION_ID: @condition.CONDITION_ID, CONDITION_INFO: @condition.CONDITION_INFO, PERCENT: @condition.PERCENT }
    assert_redirected_to condition_path(assigns(:condition))
  end

  test "should destroy condition" do
    assert_difference('Condition.count', -1) do
      delete :destroy, id: @condition
    end

    assert_redirected_to conditions_path
  end
end
