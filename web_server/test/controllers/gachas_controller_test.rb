require 'test_helper'

class GachasControllerTest < ActionController::TestCase
  setup do
    @gacha = gachas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gachas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gacha" do
    assert_difference('Gacha.count') do
      post :create, gacha: { GACHA_ID: @gacha.GACHA_ID, GACHA_MACHINE_TYPE: @gacha.GACHA_MACHINE_TYPE, GACHA_NAME: @gacha.GACHA_NAME, GROUP_ID: @gacha.GROUP_ID, REWARD_PROBABILITY: @gacha.REWARD_PROBABILITY }
    end

    assert_redirected_to gacha_path(assigns(:gacha))
  end

  test "should show gacha" do
    get :show, id: @gacha
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gacha
    assert_response :success
  end

  test "should update gacha" do
    patch :update, id: @gacha, gacha: { GACHA_ID: @gacha.GACHA_ID, GACHA_MACHINE_TYPE: @gacha.GACHA_MACHINE_TYPE, GACHA_NAME: @gacha.GACHA_NAME, GROUP_ID: @gacha.GROUP_ID, REWARD_PROBABILITY: @gacha.REWARD_PROBABILITY }
    assert_redirected_to gacha_path(assigns(:gacha))
  end

  test "should destroy gacha" do
    assert_difference('Gacha.count', -1) do
      delete :destroy, id: @gacha
    end

    assert_redirected_to gachas_path
  end
end
