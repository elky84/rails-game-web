require 'test_helper'

class ItemGenerateProbabilitiesControllerTest < ActionController::TestCase
  setup do
    @item_generate_probability = item_generate_probabilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_generate_probabilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_generate_probability" do
    assert_difference('ItemGenerateProbability.count') do
      post :create, item_generate_probability: { ITEM_GENERATE_ID: @item_generate_probability.ITEM_GENERATE_ID, ITEM_ID: @item_generate_probability.ITEM_ID, PROBABILITY: @item_generate_probability.PROBABILITY }
    end

    assert_redirected_to item_generate_probability_path(assigns(:item_generate_probability))
  end

  test "should show item_generate_probability" do
    get :show, id: @item_generate_probability
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_generate_probability
    assert_response :success
  end

  test "should update item_generate_probability" do
    patch :update, id: @item_generate_probability, item_generate_probability: { ITEM_GENERATE_ID: @item_generate_probability.ITEM_GENERATE_ID, ITEM_ID: @item_generate_probability.ITEM_ID, PROBABILITY: @item_generate_probability.PROBABILITY }
    assert_redirected_to item_generate_probability_path(assigns(:item_generate_probability))
  end

  test "should destroy item_generate_probability" do
    assert_difference('ItemGenerateProbability.count', -1) do
      delete :destroy, id: @item_generate_probability
    end

    assert_redirected_to item_generate_probabilities_path
  end
end
