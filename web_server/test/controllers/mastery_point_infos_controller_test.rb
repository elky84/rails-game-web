require 'test_helper'

class MasteryPointInfosControllerTest < ActionController::TestCase
  setup do
    @mastery_point_info = mastery_point_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mastery_point_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mastery_point_info" do
    assert_difference('MasteryPointInfo.count') do
      post :create, mastery_point_info: { MASTERY_POINT: @mastery_point_info.MASTERY_POINT, PRICE: @mastery_point_info.PRICE, PRICE_TYPE: @mastery_point_info.PRICE_TYPE }
    end

    assert_redirected_to mastery_point_info_path(assigns(:mastery_point_info))
  end

  test "should show mastery_point_info" do
    get :show, id: @mastery_point_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mastery_point_info
    assert_response :success
  end

  test "should update mastery_point_info" do
    patch :update, id: @mastery_point_info, mastery_point_info: { MASTERY_POINT: @mastery_point_info.MASTERY_POINT, PRICE: @mastery_point_info.PRICE, PRICE_TYPE: @mastery_point_info.PRICE_TYPE }
    assert_redirected_to mastery_point_info_path(assigns(:mastery_point_info))
  end

  test "should destroy mastery_point_info" do
    assert_difference('MasteryPointInfo.count', -1) do
      delete :destroy, id: @mastery_point_info
    end

    assert_redirected_to mastery_point_infos_path
  end
end
