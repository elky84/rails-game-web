require 'test_helper'

class EvolutionInfosControllerTest < ActionController::TestCase
  setup do
    @evolution_info = evolution_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evolution_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evolution_info" do
    assert_difference('EvolutionInfo.count') do
      post :create, evolution_info: { END_DATE_TIME: @evolution_info.END_DATE_TIME, EVOLUTION_EVENT_TYPE: @evolution_info.EVOLUTION_EVENT_TYPE, EVOLUTION_ID: @evolution_info.EVOLUTION_ID, GRADE: @evolution_info.GRADE, PERCENT_UP: @evolution_info.PERCENT_UP, PRICE_COIN: @evolution_info.PRICE_COIN, PRICE_DIAMOND: @evolution_info.PRICE_DIAMOND, RAW: @evolution_info.RAW, RESULT: @evolution_info.RESULT, RESULT_PERCENT: @evolution_info.RESULT_PERCENT, SPECIAL_MONSTER_LIST: @evolution_info.SPECIAL_MONSTER_LIST, SPECIAL_SKILL_LIST: @evolution_info.SPECIAL_SKILL_LIST, START_DATE_TIME: @evolution_info.START_DATE_TIME }
    end

    assert_redirected_to evolution_info_path(assigns(:evolution_info))
  end

  test "should show evolution_info" do
    get :show, id: @evolution_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evolution_info
    assert_response :success
  end

  test "should update evolution_info" do
    patch :update, id: @evolution_info, evolution_info: { END_DATE_TIME: @evolution_info.END_DATE_TIME, EVOLUTION_EVENT_TYPE: @evolution_info.EVOLUTION_EVENT_TYPE, EVOLUTION_ID: @evolution_info.EVOLUTION_ID, GRADE: @evolution_info.GRADE, PERCENT_UP: @evolution_info.PERCENT_UP, PRICE_COIN: @evolution_info.PRICE_COIN, PRICE_DIAMOND: @evolution_info.PRICE_DIAMOND, RAW: @evolution_info.RAW, RESULT: @evolution_info.RESULT, RESULT_PERCENT: @evolution_info.RESULT_PERCENT, SPECIAL_MONSTER_LIST: @evolution_info.SPECIAL_MONSTER_LIST, SPECIAL_SKILL_LIST: @evolution_info.SPECIAL_SKILL_LIST, START_DATE_TIME: @evolution_info.START_DATE_TIME }
    assert_redirected_to evolution_info_path(assigns(:evolution_info))
  end

  test "should destroy evolution_info" do
    assert_difference('EvolutionInfo.count', -1) do
      delete :destroy, id: @evolution_info
    end

    assert_redirected_to evolution_infos_path
  end
end
