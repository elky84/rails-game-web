require 'test_helper'

class RateStatusesControllerTest < ActionController::TestCase
  setup do
    @rate_status = rate_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rate_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rate_status" do
    assert_difference('RateStatus.count') do
      post :create, rate_status: { HP_STEAL_DAMAGE: @rate_status.HP_STEAL_DAMAGE, HP_STEAL_HIT: @rate_status.HP_STEAL_HIT, LAST_DATE: @rate_status.LAST_DATE, MP_STEAL_DAMAGE: @rate_status.MP_STEAL_DAMAGE, MP_STEAL_HIT: @rate_status.MP_STEAL_HIT, PARALYZE_RATE: @rate_status.PARALYZE_RATE, POISON_RATE: @rate_status.POISON_RATE, RATE_NO: @rate_status.RATE_NO, RESIST_PARALYZE: @rate_status.RESIST_PARALYZE, RESIST_POISON: @rate_status.RESIST_POISON, RESIST_SILENCE: @rate_status.RESIST_SILENCE, RESIST_SLOW: @rate_status.RESIST_SLOW, SILENCE_RATE: @rate_status.SILENCE_RATE, SLOW_RATE: @rate_status.SLOW_RATE, USER_NO: @rate_status.USER_NO }
    end

    assert_redirected_to rate_status_path(assigns(:rate_status))
  end

  test "should show rate_status" do
    get :show, id: @rate_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rate_status
    assert_response :success
  end

  test "should update rate_status" do
    patch :update, id: @rate_status, rate_status: { HP_STEAL_DAMAGE: @rate_status.HP_STEAL_DAMAGE, HP_STEAL_HIT: @rate_status.HP_STEAL_HIT, LAST_DATE: @rate_status.LAST_DATE, MP_STEAL_DAMAGE: @rate_status.MP_STEAL_DAMAGE, MP_STEAL_HIT: @rate_status.MP_STEAL_HIT, PARALYZE_RATE: @rate_status.PARALYZE_RATE, POISON_RATE: @rate_status.POISON_RATE, RATE_NO: @rate_status.RATE_NO, RESIST_PARALYZE: @rate_status.RESIST_PARALYZE, RESIST_POISON: @rate_status.RESIST_POISON, RESIST_SILENCE: @rate_status.RESIST_SILENCE, RESIST_SLOW: @rate_status.RESIST_SLOW, SILENCE_RATE: @rate_status.SILENCE_RATE, SLOW_RATE: @rate_status.SLOW_RATE, USER_NO: @rate_status.USER_NO }
    assert_redirected_to rate_status_path(assigns(:rate_status))
  end

  test "should destroy rate_status" do
    assert_difference('RateStatus.count', -1) do
      delete :destroy, id: @rate_status
    end

    assert_redirected_to rate_statuses_path
  end
end
