require 'test_helper'

class VersionInstancesControllerTest < ActionController::TestCase
  setup do
    @version_instance = version_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:version_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create version_instance" do
    assert_difference('VersionInstance.count') do
      post :create, version_instance: { EXPLAIN: @version_instance.EXPLAIN, VALUE: @version_instance.VALUE }
    end

    assert_redirected_to version_instance_path(assigns(:version_instance))
  end

  test "should show version_instance" do
    get :show, id: @version_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @version_instance
    assert_response :success
  end

  test "should update version_instance" do
    patch :update, id: @version_instance, version_instance: { EXPLAIN: @version_instance.EXPLAIN, VALUE: @version_instance.VALUE }
    assert_redirected_to version_instance_path(assigns(:version_instance))
  end

  test "should destroy version_instance" do
    assert_difference('VersionInstance.count', -1) do
      delete :destroy, id: @version_instance
    end

    assert_redirected_to version_instances_path
  end
end
