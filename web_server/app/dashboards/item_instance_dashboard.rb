require "administrate/base_dashboard"

class ItemInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    ITEM_NO: Field::Number,
    ITEM_ID: Field::Number,
    USER_NO: Field::Number,
    CHARACTER_NO: Field::Number,
    START_DATE: Field::DateTime,
    END_DATE: Field::DateTime,
    ITEM_NAME: Field::Text,
    LEVEL: Field::Number,
    GRADE: Field::Number,
    LIMIT: Field::Text,
    VALUE: Field::Number,
    DEFAULT_OPTION: Field::Text,
    OPTION_LIST: Field::Text,
    SLOT_TYPE: Field::Text,
    EXPIRE_TYPE: Field::Text,
    DURABILITY: Field::Number,
    ENCHANT: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :ITEM_NO,
    :ITEM_ID,
    :USER_NO,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ITEM_NO,
    :ITEM_ID,
    :USER_NO,
    :CHARACTER_NO,
    :START_DATE,
    :END_DATE,
    :ITEM_NAME,
    :LEVEL,
    :GRADE,
    :LIMIT,
    :VALUE,
    :DEFAULT_OPTION,
    :OPTION_LIST,
    :SLOT_TYPE,
    :EXPIRE_TYPE,
    :DURABILITY,
    :ENCHANT,
  ]

  # Overwrite this method to customize how item instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item_instance)
  #   "ItemInstance ##{item_instance.id}"
  # end
end
