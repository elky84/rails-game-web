require 'test_helper'

class ItemEnchantEffectsControllerTest < ActionController::TestCase
  setup do
    @item_enchant_effect = item_enchant_effects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_enchant_effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_enchant_effect" do
    assert_difference('ItemEnchantEffect.count') do
      post :create, item_enchant_effect: { BASIC_EFFECT: @item_enchant_effect.BASIC_EFFECT, BONUS_EFFECT: @item_enchant_effect.BONUS_EFFECT, ENCHANT: @item_enchant_effect.ENCHANT, GRADE: @item_enchant_effect.GRADE, ITEM_CATEGORY: @item_enchant_effect.ITEM_CATEGORY, ITEM_ENCHANT_EFFECT_ID: @item_enchant_effect.ITEM_ENCHANT_EFFECT_ID, LEVEL: @item_enchant_effect.LEVEL }
    end

    assert_redirected_to item_enchant_effect_path(assigns(:item_enchant_effect))
  end

  test "should show item_enchant_effect" do
    get :show, id: @item_enchant_effect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_enchant_effect
    assert_response :success
  end

  test "should update item_enchant_effect" do
    patch :update, id: @item_enchant_effect, item_enchant_effect: { BASIC_EFFECT: @item_enchant_effect.BASIC_EFFECT, BONUS_EFFECT: @item_enchant_effect.BONUS_EFFECT, ENCHANT: @item_enchant_effect.ENCHANT, GRADE: @item_enchant_effect.GRADE, ITEM_CATEGORY: @item_enchant_effect.ITEM_CATEGORY, ITEM_ENCHANT_EFFECT_ID: @item_enchant_effect.ITEM_ENCHANT_EFFECT_ID, LEVEL: @item_enchant_effect.LEVEL }
    assert_redirected_to item_enchant_effect_path(assigns(:item_enchant_effect))
  end

  test "should destroy item_enchant_effect" do
    assert_difference('ItemEnchantEffect.count', -1) do
      delete :destroy, id: @item_enchant_effect
    end

    assert_redirected_to item_enchant_effects_path
  end
end
