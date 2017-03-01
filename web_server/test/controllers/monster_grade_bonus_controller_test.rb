require 'test_helper'

class MonsterGradeBonusControllerTest < ActionController::TestCase
  setup do
    @monster_grade_bonu = monster_grade_bonus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_grade_bonus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_grade_bonu" do
    assert_difference('MonsterGradeBonu.count') do
      post :create, monster_grade_bonu: { GRADE: @monster_grade_bonu.GRADE, STATUS_ID: @monster_grade_bonu.STATUS_ID }
    end

    assert_redirected_to monster_grade_bonu_path(assigns(:monster_grade_bonu))
  end

  test "should show monster_grade_bonu" do
    get :show, id: @monster_grade_bonu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_grade_bonu
    assert_response :success
  end

  test "should update monster_grade_bonu" do
    patch :update, id: @monster_grade_bonu, monster_grade_bonu: { GRADE: @monster_grade_bonu.GRADE, STATUS_ID: @monster_grade_bonu.STATUS_ID }
    assert_redirected_to monster_grade_bonu_path(assigns(:monster_grade_bonu))
  end

  test "should destroy monster_grade_bonu" do
    assert_difference('MonsterGradeBonu.count', -1) do
      delete :destroy, id: @monster_grade_bonu
    end

    assert_redirected_to monster_grade_bonus_path
  end
end
