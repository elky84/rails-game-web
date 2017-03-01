require 'test_helper'

class QuestTypesControllerTest < ActionController::TestCase
  setup do
    @quest_type = quest_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_type" do
    assert_difference('QuestType.count') do
      post :create, quest_type: { GUIDE_CHAR_IMAGE: @quest_type.GUIDE_CHAR_IMAGE, QUEST_COMPLETE_EXPLAIN: @quest_type.QUEST_COMPLETE_EXPLAIN, QUEST_EXPLAIN: @quest_type.QUEST_EXPLAIN, QUEST_ICON: @quest_type.QUEST_ICON, QUEST_NAME: @quest_type.QUEST_NAME, QUEST_TYPE_ID: @quest_type.QUEST_TYPE_ID, TYPE: @quest_type.TYPE }
    end

    assert_redirected_to quest_type_path(assigns(:quest_type))
  end

  test "should show quest_type" do
    get :show, id: @quest_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_type
    assert_response :success
  end

  test "should update quest_type" do
    patch :update, id: @quest_type, quest_type: { GUIDE_CHAR_IMAGE: @quest_type.GUIDE_CHAR_IMAGE, QUEST_COMPLETE_EXPLAIN: @quest_type.QUEST_COMPLETE_EXPLAIN, QUEST_EXPLAIN: @quest_type.QUEST_EXPLAIN, QUEST_ICON: @quest_type.QUEST_ICON, QUEST_NAME: @quest_type.QUEST_NAME, QUEST_TYPE_ID: @quest_type.QUEST_TYPE_ID, TYPE: @quest_type.TYPE }
    assert_redirected_to quest_type_path(assigns(:quest_type))
  end

  test "should destroy quest_type" do
    assert_difference('QuestType.count', -1) do
      delete :destroy, id: @quest_type
    end

    assert_redirected_to quest_types_path
  end
end
