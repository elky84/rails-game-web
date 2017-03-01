require 'test_helper'

class QuestSchedulesControllerTest < ActionController::TestCase
  setup do
    @quest_schedule = quest_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quest_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quest_schedule" do
    assert_difference('QuestSchedule.count') do
      post :create, quest_schedule: { END: @quest_schedule.END, EXPLAIN: @quest_schedule.EXPLAIN, ODD_OR_EVEN: @quest_schedule.ODD_OR_EVEN, QUEST_SCHEDULE_ID: @quest_schedule.QUEST_SCHEDULE_ID, QUEST_SCHEDULE_TYPE: @quest_schedule.QUEST_SCHEDULE_TYPE, START: @quest_schedule.START }
    end

    assert_redirected_to quest_schedule_path(assigns(:quest_schedule))
  end

  test "should show quest_schedule" do
    get :show, id: @quest_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quest_schedule
    assert_response :success
  end

  test "should update quest_schedule" do
    patch :update, id: @quest_schedule, quest_schedule: { END: @quest_schedule.END, EXPLAIN: @quest_schedule.EXPLAIN, ODD_OR_EVEN: @quest_schedule.ODD_OR_EVEN, QUEST_SCHEDULE_ID: @quest_schedule.QUEST_SCHEDULE_ID, QUEST_SCHEDULE_TYPE: @quest_schedule.QUEST_SCHEDULE_TYPE, START: @quest_schedule.START }
    assert_redirected_to quest_schedule_path(assigns(:quest_schedule))
  end

  test "should destroy quest_schedule" do
    assert_difference('QuestSchedule.count', -1) do
      delete :destroy, id: @quest_schedule
    end

    assert_redirected_to quest_schedules_path
  end
end
