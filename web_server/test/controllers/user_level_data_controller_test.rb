require 'test_helper'

class UserLevelDataControllerTest < ActionController::TestCase
  setup do
    @user_level_datum = user_level_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_level_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_level_datum" do
    assert_difference('UserLevelDatum.count') do
      post :create, user_level_datum: { LEVEL: @user_level_datum.LEVEL, REQUIRE_EXP: @user_level_datum.REQUIRE_EXP, STAMINA: @user_level_datum.STAMINA }
    end

    assert_redirected_to user_level_datum_path(assigns(:user_level_datum))
  end

  test "should show user_level_datum" do
    get :show, id: @user_level_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_level_datum
    assert_response :success
  end

  test "should update user_level_datum" do
    patch :update, id: @user_level_datum, user_level_datum: { LEVEL: @user_level_datum.LEVEL, REQUIRE_EXP: @user_level_datum.REQUIRE_EXP, STAMINA: @user_level_datum.STAMINA }
    assert_redirected_to user_level_datum_path(assigns(:user_level_datum))
  end

  test "should destroy user_level_datum" do
    assert_difference('UserLevelDatum.count', -1) do
      delete :destroy, id: @user_level_datum
    end

    assert_redirected_to user_level_data_path
  end
end
