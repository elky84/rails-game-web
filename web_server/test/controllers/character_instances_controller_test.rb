require 'test_helper'

class CharacterInstancesControllerTest < ActionController::TestCase
  setup do
    @character_instance = character_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_instance" do
    assert_difference('CharacterInstance.count') do
      post :create, character_instance: { CHARACTER_ID: @character_instance.CHARACTER_ID, CHARACTER_NO: @character_instance.CHARACTER_NO, COSTUME_ID: @character_instance.COSTUME_ID, EXP: @character_instance.EXP, LASTEST_ACTIVE_TIME: @character_instance.LASTEST_ACTIVE_TIME, LEVEL: @character_instance.LEVEL, MASTERY_GROUP_ID: @character_instance.MASTERY_GROUP_ID, PARTY_MONSTER_ID: @character_instance.PARTY_MONSTER_ID, STAGE_INSTANCE_NO: @character_instance.STAGE_INSTANCE_NO, USER_NO: @character_instance.USER_NO }
    end

    assert_redirected_to character_instance_path(assigns(:character_instance))
  end

  test "should show character_instance" do
    get :show, id: @character_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_instance
    assert_response :success
  end

  test "should update character_instance" do
    patch :update, id: @character_instance, character_instance: { CHARACTER_ID: @character_instance.CHARACTER_ID, CHARACTER_NO: @character_instance.CHARACTER_NO, COSTUME_ID: @character_instance.COSTUME_ID, EXP: @character_instance.EXP, LASTEST_ACTIVE_TIME: @character_instance.LASTEST_ACTIVE_TIME, LEVEL: @character_instance.LEVEL, MASTERY_GROUP_ID: @character_instance.MASTERY_GROUP_ID, PARTY_MONSTER_ID: @character_instance.PARTY_MONSTER_ID, STAGE_INSTANCE_NO: @character_instance.STAGE_INSTANCE_NO, USER_NO: @character_instance.USER_NO }
    assert_redirected_to character_instance_path(assigns(:character_instance))
  end

  test "should destroy character_instance" do
    assert_difference('CharacterInstance.count', -1) do
      delete :destroy, id: @character_instance
    end

    assert_redirected_to character_instances_path
  end
end
