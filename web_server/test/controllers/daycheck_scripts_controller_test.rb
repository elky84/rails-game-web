require 'test_helper'

class DaycheckScriptsControllerTest < ActionController::TestCase
  setup do
    @daycheck_script = daycheck_scripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daycheck_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daycheck_script" do
    assert_difference('DaycheckScript.count') do
      post :create, daycheck_script: { DAY: @daycheck_script.DAY, DAYCHECK_ID: @daycheck_script.DAYCHECK_ID, ICON: @daycheck_script.ICON, REWARD: @daycheck_script.REWARD, UI_LABEL: @daycheck_script.UI_LABEL, USER_TYPE: @daycheck_script.USER_TYPE }
    end

    assert_redirected_to daycheck_script_path(assigns(:daycheck_script))
  end

  test "should show daycheck_script" do
    get :show, id: @daycheck_script
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daycheck_script
    assert_response :success
  end

  test "should update daycheck_script" do
    patch :update, id: @daycheck_script, daycheck_script: { DAY: @daycheck_script.DAY, DAYCHECK_ID: @daycheck_script.DAYCHECK_ID, ICON: @daycheck_script.ICON, REWARD: @daycheck_script.REWARD, UI_LABEL: @daycheck_script.UI_LABEL, USER_TYPE: @daycheck_script.USER_TYPE }
    assert_redirected_to daycheck_script_path(assigns(:daycheck_script))
  end

  test "should destroy daycheck_script" do
    assert_difference('DaycheckScript.count', -1) do
      delete :destroy, id: @daycheck_script
    end

    assert_redirected_to daycheck_scripts_path
  end
end
