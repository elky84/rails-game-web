require 'test_helper'

class TutorialInstancesControllerTest < ActionController::TestCase
  setup do
    @tutorial_instance = tutorial_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tutorial_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutorial_instance" do
    assert_difference('TutorialInstance.count') do
      post :create, tutorial_instance: { FLOW_NO: @tutorial_instance.FLOW_NO, GACHA_GET_INSTANCE_NO: @tutorial_instance.GACHA_GET_INSTANCE_NO, STAGE_GET_INSTANCE_NO: @tutorial_instance.STAGE_GET_INSTANCE_NO, TUTORIAL_NO: @tutorial_instance.TUTORIAL_NO, USER_NO: @tutorial_instance.USER_NO }
    end

    assert_redirected_to tutorial_instance_path(assigns(:tutorial_instance))
  end

  test "should show tutorial_instance" do
    get :show, id: @tutorial_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tutorial_instance
    assert_response :success
  end

  test "should update tutorial_instance" do
    patch :update, id: @tutorial_instance, tutorial_instance: { FLOW_NO: @tutorial_instance.FLOW_NO, GACHA_GET_INSTANCE_NO: @tutorial_instance.GACHA_GET_INSTANCE_NO, STAGE_GET_INSTANCE_NO: @tutorial_instance.STAGE_GET_INSTANCE_NO, TUTORIAL_NO: @tutorial_instance.TUTORIAL_NO, USER_NO: @tutorial_instance.USER_NO }
    assert_redirected_to tutorial_instance_path(assigns(:tutorial_instance))
  end

  test "should destroy tutorial_instance" do
    assert_difference('TutorialInstance.count', -1) do
      delete :destroy, id: @tutorial_instance
    end

    assert_redirected_to tutorial_instances_path
  end
end
