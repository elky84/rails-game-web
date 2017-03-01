require 'test_helper'

class MailInstancesControllerTest < ActionController::TestCase
  setup do
    @mail_instance = mail_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_instance" do
    assert_difference('MailInstance.count') do
      post :create, mail_instance: { CONTENT: @mail_instance.CONTENT, END_DATE: @mail_instance.END_DATE, MAIL_NO: @mail_instance.MAIL_NO, MAIL_TYPE: @mail_instance.MAIL_TYPE, OPENED: @mail_instance.OPENED, REWARD: @mail_instance.REWARD, SENDER: @mail_instance.SENDER, SENDER_ACTOR_ID: @mail_instance.SENDER_ACTOR_ID, SENDER_USER_NO: @mail_instance.SENDER_USER_NO, TITLE: @mail_instance.TITLE, USER_NO: @mail_instance.USER_NO }
    end

    assert_redirected_to mail_instance_path(assigns(:mail_instance))
  end

  test "should show mail_instance" do
    get :show, id: @mail_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_instance
    assert_response :success
  end

  test "should update mail_instance" do
    patch :update, id: @mail_instance, mail_instance: { CONTENT: @mail_instance.CONTENT, END_DATE: @mail_instance.END_DATE, MAIL_NO: @mail_instance.MAIL_NO, MAIL_TYPE: @mail_instance.MAIL_TYPE, OPENED: @mail_instance.OPENED, REWARD: @mail_instance.REWARD, SENDER: @mail_instance.SENDER, SENDER_ACTOR_ID: @mail_instance.SENDER_ACTOR_ID, SENDER_USER_NO: @mail_instance.SENDER_USER_NO, TITLE: @mail_instance.TITLE, USER_NO: @mail_instance.USER_NO }
    assert_redirected_to mail_instance_path(assigns(:mail_instance))
  end

  test "should destroy mail_instance" do
    assert_difference('MailInstance.count', -1) do
      delete :destroy, id: @mail_instance
    end

    assert_redirected_to mail_instances_path
  end
end
