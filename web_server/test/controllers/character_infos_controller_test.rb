require 'test_helper'

class CharacterInfosControllerTest < ActionController::TestCase
  setup do
    @character_info = character_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_info" do
    assert_difference('CharacterInfo.count') do
      post :create, character_info: { ACTOR_ID: @character_info.ACTOR_ID, CHARACTER_ID: @character_info.CHARACTER_ID, EQUIP_TYPE: @character_info.EQUIP_TYPE, EXPLAIN: @character_info.EXPLAIN, GROW_TYPE_DETAIL: @character_info.GROW_TYPE_DETAIL, NAME: @character_info.NAME, PRICE: @character_info.PRICE, RELEASE: @character_info.RELEASE, TYPE: @character_info.TYPE }
    end

    assert_redirected_to character_info_path(assigns(:character_info))
  end

  test "should show character_info" do
    get :show, id: @character_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_info
    assert_response :success
  end

  test "should update character_info" do
    patch :update, id: @character_info, character_info: { ACTOR_ID: @character_info.ACTOR_ID, CHARACTER_ID: @character_info.CHARACTER_ID, EQUIP_TYPE: @character_info.EQUIP_TYPE, EXPLAIN: @character_info.EXPLAIN, GROW_TYPE_DETAIL: @character_info.GROW_TYPE_DETAIL, NAME: @character_info.NAME, PRICE: @character_info.PRICE, RELEASE: @character_info.RELEASE, TYPE: @character_info.TYPE }
    assert_redirected_to character_info_path(assigns(:character_info))
  end

  test "should destroy character_info" do
    assert_difference('CharacterInfo.count', -1) do
      delete :destroy, id: @character_info
    end

    assert_redirected_to character_infos_path
  end
end
