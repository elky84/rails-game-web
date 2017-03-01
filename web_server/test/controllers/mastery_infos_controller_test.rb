require 'test_helper'

class MasteryInfosControllerTest < ActionController::TestCase
  setup do
    @mastery_info = mastery_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mastery_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mastery_info" do
    assert_difference('MasteryInfo.count') do
      post :create, mastery_info: { EFFECT_TARGET: @mastery_info.EFFECT_TARGET, EXPLAIN: @mastery_info.EXPLAIN, GRADE: @mastery_info.GRADE, ICON: @mastery_info.ICON, MASTERY_ID: @mastery_info.MASTERY_ID, MASTERY_TYPE: @mastery_info.MASTERY_TYPE, MAX_LEVEL: @mastery_info.MAX_LEVEL, NAME: @mastery_info.NAME, OPTION_EFFECT: @mastery_info.OPTION_EFFECT, OPTION_ID: @mastery_info.OPTION_ID, PRE_CONDITION: @mastery_info.PRE_CONDITION, PRE_LEVEL: @mastery_info.PRE_LEVEL }
    end

    assert_redirected_to mastery_info_path(assigns(:mastery_info))
  end

  test "should show mastery_info" do
    get :show, id: @mastery_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mastery_info
    assert_response :success
  end

  test "should update mastery_info" do
    patch :update, id: @mastery_info, mastery_info: { EFFECT_TARGET: @mastery_info.EFFECT_TARGET, EXPLAIN: @mastery_info.EXPLAIN, GRADE: @mastery_info.GRADE, ICON: @mastery_info.ICON, MASTERY_ID: @mastery_info.MASTERY_ID, MASTERY_TYPE: @mastery_info.MASTERY_TYPE, MAX_LEVEL: @mastery_info.MAX_LEVEL, NAME: @mastery_info.NAME, OPTION_EFFECT: @mastery_info.OPTION_EFFECT, OPTION_ID: @mastery_info.OPTION_ID, PRE_CONDITION: @mastery_info.PRE_CONDITION, PRE_LEVEL: @mastery_info.PRE_LEVEL }
    assert_redirected_to mastery_info_path(assigns(:mastery_info))
  end

  test "should destroy mastery_info" do
    assert_difference('MasteryInfo.count', -1) do
      delete :destroy, id: @mastery_info
    end

    assert_redirected_to mastery_infos_path
  end
end
