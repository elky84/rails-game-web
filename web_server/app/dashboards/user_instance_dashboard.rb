require "administrate/base_dashboard"

class UserInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    USER_NO: Field::Number,
    USER_ID: Field::Text,
    USER_LV: Field::Number,
    EXP: Field::Number,
    NICKNAME: Field::Text,
    CASH: Field::Number,
    MONEY: Field::Number,
    STAMINA_ADVENTURE_TIME: Field::DateTime,
    STAMINA_ADVENTURE: Field::Number,
    STAMINA_SPECIAL_TIME: Field::DateTime,
    STAMINA_SPECIAL: Field::Number,
    STAMINA_PVP_TIME: Field::DateTime,
    STAMINA_PVP: Field::Number,
    FRIEND_POINT: Field::Number,
    POSTBOX_SLOT: Field::Number,
    CACHE_MONSTER_SLOT: Field::Number,
    EXT_MONSTER_SLOT: Field::Number,
    CACHE_ITEM_SLOT: Field::Number,
    EXT_ITEM_SLOT: Field::Number,
    CACHE_FRIEND_SLOT: Field::Number,
    EXT_FRIEND_COUNT: Field::Number,
    MASTERY_RESET_COUNT: Field::Number,
    LASTEST_ACTIVE_TIME: Field::DateTime,
    PERMISSION: Field::Text,
    LASTEST_CHR_ID: Field::Number,
    LASTEST_CHR_LV: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    MASTERY_POINT: Field::Number,
    INFI_TOWER_FLOOR: Field::Number,
    FRIEND_DELETE_COUNT: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :USER_NO,
    :USER_ID,
    :USER_LV,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :USER_NO,
    :USER_ID,
    :USER_LV,
    :EXP,
    :NICKNAME,
    :CASH,
    :MONEY,
    :STAMINA_ADVENTURE_TIME,
    :STAMINA_ADVENTURE,
    :STAMINA_SPECIAL_TIME,
    :STAMINA_SPECIAL,
    :STAMINA_PVP_TIME,
    :STAMINA_PVP,
    :FRIEND_POINT,
    :POSTBOX_SLOT,
    :CACHE_MONSTER_SLOT,
    :EXT_MONSTER_SLOT,
    :CACHE_ITEM_SLOT,
    :EXT_ITEM_SLOT,
    :CACHE_FRIEND_SLOT,
    :EXT_FRIEND_COUNT,
    :MASTERY_RESET_COUNT,
    :LASTEST_ACTIVE_TIME,
    :PERMISSION,
    :LASTEST_CHR_ID,
    :LASTEST_CHR_LV,
    :MASTERY_POINT,
    :INFI_TOWER_FLOOR,
    :FRIEND_DELETE_COUNT,
  ]

  # Overwrite this method to customize how user instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user_instance)
  #   "UserInstance ##{user_instance.id}"
  # end
end
