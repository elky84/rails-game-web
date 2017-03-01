require 'test_helper'

class ConnectRestrictsControllerTest < ActionController::TestCase
  setup do
    @connect_restrict = connect_restricts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:connect_restricts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create connect_restrict" do
    assert_difference('ConnectRestrict.count') do
      post :create, connect_restrict: { CONNECT_RESTRICT_ID: @connect_restrict.CONNECT_RESTRICT_ID, TYPE: @connect_restrict.TYPE, VALUE: @connect_restrict.VALUE }
    end

    assert_redirected_to connect_restrict_path(assigns(:connect_restrict))
  end

  test "should show connect_restrict" do
    get :show, id: @connect_restrict
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @connect_restrict
    assert_response :success
  end

  test "should update connect_restrict" do
    patch :update, id: @connect_restrict, connect_restrict: { CONNECT_RESTRICT_ID: @connect_restrict.CONNECT_RESTRICT_ID, TYPE: @connect_restrict.TYPE, VALUE: @connect_restrict.VALUE }
    assert_redirected_to connect_restrict_path(assigns(:connect_restrict))
  end

  test "should destroy connect_restrict" do
    assert_difference('ConnectRestrict.count', -1) do
      delete :destroy, id: @connect_restrict
    end

    assert_redirected_to connect_restricts_path
  end
end
