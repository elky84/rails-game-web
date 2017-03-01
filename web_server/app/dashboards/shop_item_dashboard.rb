require "administrate/base_dashboard"

class ShopItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    SHOP_ITEM_ID: Field::Number,
    HIDE: Field::Number,
    STORE: Field::Text,
    ICON: Field::Text,
    PRICE_TYPE: Field::Text,
    PRICE: Field::Number,
    SHOP_CATEGORY: Field::Text,
    CAPACITY: Field::Number,
    ITEM_ID: Field::Number,
    GACHA: Field::Number,
    BONUS_ID: Field::Text,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    START_DATE: Field::DateTime,
    END_DATE: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    BONUS_STRING: Field::String,
    GIFT: Field::String,
    NSTORE_PID: Field::String,
    PLAY_PID: Field::String,
    CHARACTER_LEVEL: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :SHOP_ITEM_ID,
    :HIDE,
    :STORE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :SHOP_ITEM_ID,
    :HIDE,
    :STORE,
    :ICON,
    :PRICE_TYPE,
    :PRICE,
    :SHOP_CATEGORY,
    :CAPACITY,
    :ITEM_ID,
    :GACHA,
    :BONUS_ID,
    :NAME,
    :EXPLAIN,
    :START_DATE,
    :END_DATE,
    :BONUS_STRING,
    :GIFT,
    :NSTORE_PID,
    :PLAY_PID,
    :CHARACTER_LEVEL,
  ]

  # Overwrite this method to customize how shop items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shop_item)
  #   "ShopItem ##{shop_item.id}"
  # end
end
