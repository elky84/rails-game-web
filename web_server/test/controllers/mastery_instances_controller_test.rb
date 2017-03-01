require 'test_helper'

class MasteryInstancesControllerTest < ActionController::TestCase
  setup do
    @mastery_instance = mastery_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mastery_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mastery_instance" do
    assert_difference('MasteryInstance.count') do
      post :create, mastery_instance: { CHARACTER_NO: @mastery_instance.CHARACTER_NO, GROUP_NO: @mastery_instance.GROUP_NO, MASTERY: @mastery_instance.MASTERY, MASTERY_NO: @mastery_instance.MASTERY_NO, USER_NO: @mastery_instance.USER_NO }
    end

    assert_redirected_to mastery_instance_path(assigns(:mastery_instance))
  end

  test "should show mastery_instance" do
    get :show, id: @mastery_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mastery_instance
    assert_response :success
  end

  test "should update mastery_instance" do
    patch :update, id: @mastery_instance, mastery_instance: { CHARACTER_NO: @mastery_instance.CHARACTER_NO, GROUP_NO: @mastery_instance.GROUP_NO, MASTERY: @mastery_instance.MASTERY, MASTERY_NO: @mastery_instance.MASTERY_NO, USER_NO: @mastery_instance.USER_NO }
    assert_redirected_to mastery_instance_path(assigns(:mastery_instance))
  end

  test "should destroy mastery_instance" do
    assert_difference('MasteryInstance.count', -1) do
      delete :destroy, id: @mastery_instance
    end

    assert_redirected_to mastery_instances_path
  end
end
