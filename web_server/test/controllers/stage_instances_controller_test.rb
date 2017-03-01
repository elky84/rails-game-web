require 'test_helper'

class StageInstancesControllerTest < ActionController::TestCase
  setup do
    @stage_instance = stage_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_instance" do
    assert_difference('StageInstance.count') do
      post :create, stage_instance: { CHARACTER_NO: @stage_instance.CHARACTER_NO, CLEAR_EXP_NO: @stage_instance.CLEAR_EXP_NO, CLEAR_MONEY_NO: @stage_instance.CLEAR_MONEY_NO, CLEAR_REWARD_NO: @stage_instance.CLEAR_REWARD_NO, PARTY_MONSTER_ID: @stage_instance.PARTY_MONSTER_ID, STAGE_ID: @stage_instance.STAGE_ID, STAGE_PROGRESS_NO: @stage_instance.STAGE_PROGRESS_NO, START_DATE: @stage_instance.START_DATE, USER_NO: @stage_instance.USER_NO }
    end

    assert_redirected_to stage_instance_path(assigns(:stage_instance))
  end

  test "should show stage_instance" do
    get :show, id: @stage_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stage_instance
    assert_response :success
  end

  test "should update stage_instance" do
    patch :update, id: @stage_instance, stage_instance: { CHARACTER_NO: @stage_instance.CHARACTER_NO, CLEAR_EXP_NO: @stage_instance.CLEAR_EXP_NO, CLEAR_MONEY_NO: @stage_instance.CLEAR_MONEY_NO, CLEAR_REWARD_NO: @stage_instance.CLEAR_REWARD_NO, PARTY_MONSTER_ID: @stage_instance.PARTY_MONSTER_ID, STAGE_ID: @stage_instance.STAGE_ID, STAGE_PROGRESS_NO: @stage_instance.STAGE_PROGRESS_NO, START_DATE: @stage_instance.START_DATE, USER_NO: @stage_instance.USER_NO }
    assert_redirected_to stage_instance_path(assigns(:stage_instance))
  end

  test "should destroy stage_instance" do
    assert_difference('StageInstance.count', -1) do
      delete :destroy, id: @stage_instance
    end

    assert_redirected_to stage_instances_path
  end
end
