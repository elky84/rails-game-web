require 'test_helper'

class EventInstancesControllerTest < ActionController::TestCase
  setup do
    @event_instance = event_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_instance" do
    assert_difference('EventInstance.count') do
      post :create, event_instance: { END_DATE: @event_instance.END_DATE, EVENT_NO: @event_instance.EVENT_NO, EVENT_TYPE: @event_instance.EVENT_TYPE, REWARD: @event_instance.REWARD, START_DATE: @event_instance.START_DATE }
    end

    assert_redirected_to event_instance_path(assigns(:event_instance))
  end

  test "should show event_instance" do
    get :show, id: @event_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_instance
    assert_response :success
  end

  test "should update event_instance" do
    patch :update, id: @event_instance, event_instance: { END_DATE: @event_instance.END_DATE, EVENT_NO: @event_instance.EVENT_NO, EVENT_TYPE: @event_instance.EVENT_TYPE, REWARD: @event_instance.REWARD, START_DATE: @event_instance.START_DATE }
    assert_redirected_to event_instance_path(assigns(:event_instance))
  end

  test "should destroy event_instance" do
    assert_difference('EventInstance.count', -1) do
      delete :destroy, id: @event_instance
    end

    assert_redirected_to event_instances_path
  end
end
