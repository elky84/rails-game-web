require 'test_helper'

class MailControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get receive" do
    get :receive
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

end
