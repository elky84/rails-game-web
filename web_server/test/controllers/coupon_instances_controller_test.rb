require 'test_helper'

class CouponInstancesControllerTest < ActionController::TestCase
  setup do
    @coupon_instance = coupon_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupon_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon_instance" do
    assert_difference('CouponInstance.count') do
      post :create, coupon_instance: { COUPON_GROUP: @coupon_instance.COUPON_GROUP, COUPON_INDEX: @coupon_instance.COUPON_INDEX, COUPON_STRING: @coupon_instance.COUPON_STRING, REWARD: @coupon_instance.REWARD, SERVER_INDEX: @coupon_instance.SERVER_INDEX, TIME: @coupon_instance.TIME, USER_NO: @coupon_instance.USER_NO }
    end

    assert_redirected_to coupon_instance_path(assigns(:coupon_instance))
  end

  test "should show coupon_instance" do
    get :show, id: @coupon_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon_instance
    assert_response :success
  end

  test "should update coupon_instance" do
    patch :update, id: @coupon_instance, coupon_instance: { COUPON_GROUP: @coupon_instance.COUPON_GROUP, COUPON_INDEX: @coupon_instance.COUPON_INDEX, COUPON_STRING: @coupon_instance.COUPON_STRING, REWARD: @coupon_instance.REWARD, SERVER_INDEX: @coupon_instance.SERVER_INDEX, TIME: @coupon_instance.TIME, USER_NO: @coupon_instance.USER_NO }
    assert_redirected_to coupon_instance_path(assigns(:coupon_instance))
  end

  test "should destroy coupon_instance" do
    assert_difference('CouponInstance.count', -1) do
      delete :destroy, id: @coupon_instance
    end

    assert_redirected_to coupon_instances_path
  end
end
