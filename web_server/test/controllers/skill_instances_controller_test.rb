require 'test_helper'

class SkillInstancesControllerTest < ActionController::TestCase
  setup do
    @skill_instance = skill_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_instance" do
    assert_difference('SkillInstance.count') do
      post :create, skill_instance: { CHARACTER_NO: @skill_instance.CHARACTER_NO, SKILL_ID: @skill_instance.SKILL_ID, SKILL_LEVEL: @skill_instance.SKILL_LEVEL, SKILL_NO: @skill_instance.SKILL_NO, SLOT_NO: @skill_instance.SLOT_NO }
    end

    assert_redirected_to skill_instance_path(assigns(:skill_instance))
  end

  test "should show skill_instance" do
    get :show, id: @skill_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_instance
    assert_response :success
  end

  test "should update skill_instance" do
    patch :update, id: @skill_instance, skill_instance: { CHARACTER_NO: @skill_instance.CHARACTER_NO, SKILL_ID: @skill_instance.SKILL_ID, SKILL_LEVEL: @skill_instance.SKILL_LEVEL, SKILL_NO: @skill_instance.SKILL_NO, SLOT_NO: @skill_instance.SLOT_NO }
    assert_redirected_to skill_instance_path(assigns(:skill_instance))
  end

  test "should destroy skill_instance" do
    assert_difference('SkillInstance.count', -1) do
      delete :destroy, id: @skill_instance
    end

    assert_redirected_to skill_instances_path
  end
end
