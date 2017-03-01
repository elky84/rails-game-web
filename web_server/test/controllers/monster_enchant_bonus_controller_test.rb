require 'test_helper'

class MonsterEnchantBonusControllerTest < ActionController::TestCase
  setup do
    @monster_enchant_bonu = monster_enchant_bonus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_enchant_bonus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_enchant_bonu" do
    assert_difference('MonsterEnchantBonu.count') do
      post :create, monster_enchant_bonu: { MONSTER_TYPE: @monster_enchant_bonu.MONSTER_TYPE, STATUS_ID: @monster_enchant_bonu.STATUS_ID }
    end

    assert_redirected_to monster_enchant_bonu_path(assigns(:monster_enchant_bonu))
  end

  test "should show monster_enchant_bonu" do
    get :show, id: @monster_enchant_bonu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_enchant_bonu
    assert_response :success
  end

  test "should update monster_enchant_bonu" do
    patch :update, id: @monster_enchant_bonu, monster_enchant_bonu: { MONSTER_TYPE: @monster_enchant_bonu.MONSTER_TYPE, STATUS_ID: @monster_enchant_bonu.STATUS_ID }
    assert_redirected_to monster_enchant_bonu_path(assigns(:monster_enchant_bonu))
  end

  test "should destroy monster_enchant_bonu" do
    assert_difference('MonsterEnchantBonu.count', -1) do
      delete :destroy, id: @monster_enchant_bonu
    end

    assert_redirected_to monster_enchant_bonus_path
  end
end
