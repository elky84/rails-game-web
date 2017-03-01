require 'test_helper'

class GachaRewardMonstersControllerTest < ActionController::TestCase
  setup do
    @gacha_reward_monster = gacha_reward_monsters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gacha_reward_monsters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gacha_reward_monster" do
    assert_difference('GachaRewardMonster.count') do
      post :create, gacha_reward_monster: { GACHA_REWARD_MONSTER_ID: @gacha_reward_monster.GACHA_REWARD_MONSTER_ID, MONSTER_ID: @gacha_reward_monster.MONSTER_ID }
    end

    assert_redirected_to gacha_reward_monster_path(assigns(:gacha_reward_monster))
  end

  test "should show gacha_reward_monster" do
    get :show, id: @gacha_reward_monster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gacha_reward_monster
    assert_response :success
  end

  test "should update gacha_reward_monster" do
    patch :update, id: @gacha_reward_monster, gacha_reward_monster: { GACHA_REWARD_MONSTER_ID: @gacha_reward_monster.GACHA_REWARD_MONSTER_ID, MONSTER_ID: @gacha_reward_monster.MONSTER_ID }
    assert_redirected_to gacha_reward_monster_path(assigns(:gacha_reward_monster))
  end

  test "should destroy gacha_reward_monster" do
    assert_difference('GachaRewardMonster.count', -1) do
      delete :destroy, id: @gacha_reward_monster
    end

    assert_redirected_to gacha_reward_monsters_path
  end
end
