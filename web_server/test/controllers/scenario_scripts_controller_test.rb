require 'test_helper'

class ScenarioScriptsControllerTest < ActionController::TestCase
  setup do
    @scenario_script = scenario_scripts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scenario_scripts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scenario_script" do
    assert_difference('ScenarioScript.count') do
      post :create, scenario_script: { CHARACOTR_INDEX: @scenario_script.CHARACOTR_INDEX, CHARACTER_FACE: @scenario_script.CHARACTER_FACE, DIALOGUE_EFFECT: @scenario_script.DIALOGUE_EFFECT, DIALOGUE_TYPE: @scenario_script.DIALOGUE_TYPE, FACE_POS: @scenario_script.FACE_POS, INDEX: @scenario_script.INDEX, SPEECH_BACK: @scenario_script.SPEECH_BACK, STRING_INDEX: @scenario_script.STRING_INDEX }
    end

    assert_redirected_to scenario_script_path(assigns(:scenario_script))
  end

  test "should show scenario_script" do
    get :show, id: @scenario_script
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scenario_script
    assert_response :success
  end

  test "should update scenario_script" do
    patch :update, id: @scenario_script, scenario_script: { CHARACOTR_INDEX: @scenario_script.CHARACOTR_INDEX, CHARACTER_FACE: @scenario_script.CHARACTER_FACE, DIALOGUE_EFFECT: @scenario_script.DIALOGUE_EFFECT, DIALOGUE_TYPE: @scenario_script.DIALOGUE_TYPE, FACE_POS: @scenario_script.FACE_POS, INDEX: @scenario_script.INDEX, SPEECH_BACK: @scenario_script.SPEECH_BACK, STRING_INDEX: @scenario_script.STRING_INDEX }
    assert_redirected_to scenario_script_path(assigns(:scenario_script))
  end

  test "should destroy scenario_script" do
    assert_difference('ScenarioScript.count', -1) do
      delete :destroy, id: @scenario_script
    end

    assert_redirected_to scenario_scripts_path
  end
end
