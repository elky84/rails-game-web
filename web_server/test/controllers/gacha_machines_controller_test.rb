require 'test_helper'

class GachaMachinesControllerTest < ActionController::TestCase
  setup do
    @gacha_machine = gacha_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gacha_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gacha_machine" do
    assert_difference('GachaMachine.count') do
      post :create, gacha_machine: { GACHA_MACHINE_ID: @gacha_machine.GACHA_MACHINE_ID, GACHA_MACHINE_TYPE: @gacha_machine.GACHA_MACHINE_TYPE }
    end

    assert_redirected_to gacha_machine_path(assigns(:gacha_machine))
  end

  test "should show gacha_machine" do
    get :show, id: @gacha_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gacha_machine
    assert_response :success
  end

  test "should update gacha_machine" do
    patch :update, id: @gacha_machine, gacha_machine: { GACHA_MACHINE_ID: @gacha_machine.GACHA_MACHINE_ID, GACHA_MACHINE_TYPE: @gacha_machine.GACHA_MACHINE_TYPE }
    assert_redirected_to gacha_machine_path(assigns(:gacha_machine))
  end

  test "should destroy gacha_machine" do
    assert_difference('GachaMachine.count', -1) do
      delete :destroy, id: @gacha_machine
    end

    assert_redirected_to gacha_machines_path
  end
end
