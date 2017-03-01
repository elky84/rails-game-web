require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status" do
    assert_difference('Status.count') do
      post :create, status: { ATTACK: @status.ATTACK, ATTACK_SPEED: @status.ATTACK_SPEED, COOL_TIME_ALL: @status.COOL_TIME_ALL, CRITICAL_AVOID: @status.CRITICAL_AVOID, CRITICAL_DAMAGE: @status.CRITICAL_DAMAGE, CRITICAL_RATE: @status.CRITICAL_RATE, DEFENSE: @status.DEFENSE, DODGE_RATE: @status.DODGE_RATE, HIT_RATE: @status.HIT_RATE, HP: @status.HP, HP_REGEN: @status.HP_REGEN, LEVEL: @status.LEVEL, MOVE_SPEED_X: @status.MOVE_SPEED_X, MOVE_SPEED_Z: @status.MOVE_SPEED_Z, MP: @status.MP, MP_REGEN: @status.MP_REGEN, RAGE_BASE: @status.RAGE_BASE, RAGE_REGEN: @status.RAGE_REGEN, RESIST_POISON: @status.RESIST_POISON, RESIST_SILENCE: @status.RESIST_SILENCE, RESIST_SLOW: @status.RESIST_SLOW, RESIST_STUN: @status.RESIST_STUN, STATUS_ID: @status.STATUS_ID }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status
    assert_response :success
  end

  test "should update status" do
    patch :update, id: @status, status: { ATTACK: @status.ATTACK, ATTACK_SPEED: @status.ATTACK_SPEED, COOL_TIME_ALL: @status.COOL_TIME_ALL, CRITICAL_AVOID: @status.CRITICAL_AVOID, CRITICAL_DAMAGE: @status.CRITICAL_DAMAGE, CRITICAL_RATE: @status.CRITICAL_RATE, DEFENSE: @status.DEFENSE, DODGE_RATE: @status.DODGE_RATE, HIT_RATE: @status.HIT_RATE, HP: @status.HP, HP_REGEN: @status.HP_REGEN, LEVEL: @status.LEVEL, MOVE_SPEED_X: @status.MOVE_SPEED_X, MOVE_SPEED_Z: @status.MOVE_SPEED_Z, MP: @status.MP, MP_REGEN: @status.MP_REGEN, RAGE_BASE: @status.RAGE_BASE, RAGE_REGEN: @status.RAGE_REGEN, RESIST_POISON: @status.RESIST_POISON, RESIST_SILENCE: @status.RESIST_SILENCE, RESIST_SLOW: @status.RESIST_SLOW, RESIST_STUN: @status.RESIST_STUN, STATUS_ID: @status.STATUS_ID }
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
