require 'test_helper'

class QuestShortCutsControllerTest < ActionController::TestCase
  setup do
    @quest_short_cut = quest_short_cuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_short_cuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_short_cut" do
    assert_difference('QuestShortCut.count') do
      post :create, quest_short_cut: { SHORT_CUT_NO: @quest_short_cut.SHORT_CUT_NO, SHORT_CUT_TYPE: @quest_short_cut.SHORT_CUT_TYPE }
    end

    assert_redirected_to quest_short_cut_path(assigns(:quest_short_cut))
  end

  test "should show quest_short_cut" do
    get :show, id: @quest_short_cut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_short_cut
    assert_response :success
  end

  test "should update quest_short_cut" do
    patch :update, id: @quest_short_cut, quest_short_cut: { SHORT_CUT_NO: @quest_short_cut.SHORT_CUT_NO, SHORT_CUT_TYPE: @quest_short_cut.SHORT_CUT_TYPE }
    assert_redirected_to quest_short_cut_path(assigns(:quest_short_cut))
  end

  test "should destroy quest_short_cut" do
    assert_difference('QuestShortCut.count', -1) do
      delete :destroy, id: @quest_short_cut
    end

    assert_redirected_to quest_short_cuts_path
  end
end
