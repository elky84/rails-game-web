require 'test_helper'

class CostumeTypesControllerTest < ActionController::TestCase
  setup do
    @costume_type = costume_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costume_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costume_type" do
    assert_difference('CostumeType.count') do
      post :create, costume_type: { ACTOR_ID: @costume_type.ACTOR_ID, COSTUME_ID: @costume_type.COSTUME_ID, SKIN_NAME: @costume_type.SKIN_NAME }
    end

    assert_redirected_to costume_type_path(assigns(:costume_type))
  end

  test "should show costume_type" do
    get :show, id: @costume_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costume_type
    assert_response :success
  end

  test "should update costume_type" do
    patch :update, id: @costume_type, costume_type: { ACTOR_ID: @costume_type.ACTOR_ID, COSTUME_ID: @costume_type.COSTUME_ID, SKIN_NAME: @costume_type.SKIN_NAME }
    assert_redirected_to costume_type_path(assigns(:costume_type))
  end

  test "should destroy costume_type" do
    assert_difference('CostumeType.count', -1) do
      delete :destroy, id: @costume_type
    end

    assert_redirected_to costume_types_path
  end
end
