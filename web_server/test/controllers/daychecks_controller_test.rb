require 'test_helper'

class DaychecksControllerTest < ActionController::TestCase
  setup do
    @daycheck = daychecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daychecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daycheck" do
    assert_difference('Daycheck.count') do
      post :create, daycheck: { DAY: @daycheck.DAY, DAYCHECK_ID: @daycheck.DAYCHECK_ID, ICON: @daycheck.ICON, REWARD: @daycheck.REWARD, UI_LABEL: @daycheck.UI_LABEL, USER_TYPE: @daycheck.USER_TYPE }
    end

    assert_redirected_to daycheck_path(assigns(:daycheck))
  end

  test "should show daycheck" do
    get :show, id: @daycheck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daycheck
    assert_response :success
  end

  test "should update daycheck" do
    patch :update, id: @daycheck, daycheck: { DAY: @daycheck.DAY, DAYCHECK_ID: @daycheck.DAYCHECK_ID, ICON: @daycheck.ICON, REWARD: @daycheck.REWARD, UI_LABEL: @daycheck.UI_LABEL, USER_TYPE: @daycheck.USER_TYPE }
    assert_redirected_to daycheck_path(assigns(:daycheck))
  end

  test "should destroy daycheck" do
    assert_difference('Daycheck.count', -1) do
      delete :destroy, id: @daycheck
    end

    assert_redirected_to daychecks_path
  end
end
