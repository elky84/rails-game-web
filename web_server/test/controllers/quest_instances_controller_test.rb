require 'test_helper'

class QuestInstancesControllerTest < ActionController::TestCase
  setup do
    @quest_instance = quest_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_instance" do
    assert_difference('QuestInstance.count') do
      post :create, quest_instance: { ACTIVE_TIME: @quest_instance.ACTIVE_TIME, CLEAR: @quest_instance.CLEAR, CLEAR_TIME: @quest_instance.CLEAR_TIME, GRADE: @quest_instance.GRADE, GROUP_ID: @quest_instance.GROUP_ID, QUEST_APPLY_TYPE: @quest_instance.QUEST_APPLY_TYPE, QUEST_INFO_ID: @quest_instance.QUEST_INFO_ID, QUEST_NO: @quest_instance.QUEST_NO, QUEST_VALUE: @quest_instance.QUEST_VALUE, TYPE: @quest_instance.TYPE, USER_NO: @quest_instance.USER_NO }
    end

    assert_redirected_to quest_instance_path(assigns(:quest_instance))
  end

  test "should show quest_instance" do
    get :show, id: @quest_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_instance
    assert_response :success
  end

  test "should update quest_instance" do
    patch :update, id: @quest_instance, quest_instance: { ACTIVE_TIME: @quest_instance.ACTIVE_TIME, CLEAR: @quest_instance.CLEAR, CLEAR_TIME: @quest_instance.CLEAR_TIME, GRADE: @quest_instance.GRADE, GROUP_ID: @quest_instance.GROUP_ID, QUEST_APPLY_TYPE: @quest_instance.QUEST_APPLY_TYPE, QUEST_INFO_ID: @quest_instance.QUEST_INFO_ID, QUEST_NO: @quest_instance.QUEST_NO, QUEST_VALUE: @quest_instance.QUEST_VALUE, TYPE: @quest_instance.TYPE, USER_NO: @quest_instance.USER_NO }
    assert_redirected_to quest_instance_path(assigns(:quest_instance))
  end

  test "should destroy quest_instance" do
    assert_difference('QuestInstance.count', -1) do
      delete :destroy, id: @quest_instance
    end

    assert_redirected_to quest_instances_path
  end
end
