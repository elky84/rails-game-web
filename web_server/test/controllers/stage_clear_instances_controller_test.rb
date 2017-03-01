require 'test_helper'

class StageClearInstancesControllerTest < ActionController::TestCase
  setup do
    @stage_clear_instance = stage_clear_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_clear_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_clear_instance" do
    assert_difference('StageClearInstance.count') do
      post :create, stage_clear_instance: { CHARACTER_NO: @stage_clear_instance.CHARACTER_NO, CLEAR_STAGE: @stage_clear_instance.CLEAR_STAGE, LAST_DATE: @stage_clear_instance.LAST_DATE, PLAY_STAGE: @stage_clear_instance.PLAY_STAGE, STAGE_SCORE: @stage_clear_instance.STAGE_SCORE, USER_NO: @stage_clear_instance.USER_NO }
    end

    assert_redirected_to stage_clear_instance_path(assigns(:stage_clear_instance))
  end

  test "should show stage_clear_instance" do
    get :show, id: @stage_clear_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stage_clear_instance
    assert_response :success
  end

  test "should update stage_clear_instance" do
    patch :update, id: @stage_clear_instance, stage_clear_instance: { CHARACTER_NO: @stage_clear_instance.CHARACTER_NO, CLEAR_STAGE: @stage_clear_instance.CLEAR_STAGE, LAST_DATE: @stage_clear_instance.LAST_DATE, PLAY_STAGE: @stage_clear_instance.PLAY_STAGE, STAGE_SCORE: @stage_clear_instance.STAGE_SCORE, USER_NO: @stage_clear_instance.USER_NO }
    assert_redirected_to stage_clear_instance_path(assigns(:stage_clear_instance))
  end

  test "should destroy stage_clear_instance" do
    assert_difference('StageClearInstance.count', -1) do
      delete :destroy, id: @stage_clear_instance
    end

    assert_redirected_to stage_clear_instances_path
  end
end
