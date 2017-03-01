require 'test_helper'

class QuestInfosControllerTest < ActionController::TestCase
  setup do
    @quest_info = quest_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_info" do
    assert_difference('QuestInfo.count') do
      post :create, quest_info: { COMPLETE_EXPLAN: @quest_info.COMPLETE_EXPLAN, COMPLETE_IMAGE: @quest_info.COMPLETE_IMAGE, COMPLETE_SCENE: @quest_info.COMPLETE_SCENE, GRADE: @quest_info.GRADE, GROUP_ID: @quest_info.GROUP_ID, LEVEL_LIMIT: @quest_info.LEVEL_LIMIT, MAXVALUE: @quest_info.MAXVALUE, NEXT_QUEST_ID: @quest_info.NEXT_QUEST_ID, PREVIEW: @quest_info.PREVIEW, QUEST_APPLY_TYPE: @quest_info.QUEST_APPLY_TYPE, QUEST_GRADE_TYPE: @quest_info.QUEST_GRADE_TYPE, QUEST_INFO_ID: @quest_info.QUEST_INFO_ID, QUEST_SCHEDULE_ID: @quest_info.QUEST_SCHEDULE_ID, QUEST_TYPE_ID: @quest_info.QUEST_TYPE_ID, REWARD: @quest_info.REWARD, SHORT_CUT: @quest_info.SHORT_CUT }
    end

    assert_redirected_to quest_info_path(assigns(:quest_info))
  end

  test "should show quest_info" do
    get :show, id: @quest_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_info
    assert_response :success
  end

  test "should update quest_info" do
    patch :update, id: @quest_info, quest_info: { COMPLETE_EXPLAN: @quest_info.COMPLETE_EXPLAN, COMPLETE_IMAGE: @quest_info.COMPLETE_IMAGE, COMPLETE_SCENE: @quest_info.COMPLETE_SCENE, GRADE: @quest_info.GRADE, GROUP_ID: @quest_info.GROUP_ID, LEVEL_LIMIT: @quest_info.LEVEL_LIMIT, MAXVALUE: @quest_info.MAXVALUE, NEXT_QUEST_ID: @quest_info.NEXT_QUEST_ID, PREVIEW: @quest_info.PREVIEW, QUEST_APPLY_TYPE: @quest_info.QUEST_APPLY_TYPE, QUEST_GRADE_TYPE: @quest_info.QUEST_GRADE_TYPE, QUEST_INFO_ID: @quest_info.QUEST_INFO_ID, QUEST_SCHEDULE_ID: @quest_info.QUEST_SCHEDULE_ID, QUEST_TYPE_ID: @quest_info.QUEST_TYPE_ID, REWARD: @quest_info.REWARD, SHORT_CUT: @quest_info.SHORT_CUT }
    assert_redirected_to quest_info_path(assigns(:quest_info))
  end

  test "should destroy quest_info" do
    assert_difference('QuestInfo.count', -1) do
      delete :destroy, id: @quest_info
    end

    assert_redirected_to quest_infos_path
  end
end
