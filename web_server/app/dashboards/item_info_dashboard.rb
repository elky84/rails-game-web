require "administrate/base_dashboard"

class ItemInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    ITEM_ID: Field::Number,
    ICON: Field::Text,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    LEVEL: Field::Number,
    GRADE: Field::Number,
    LIMIT: Field::Text,
    CATEGORY: Field::Text,
    COSTUME_ID: Field::Number,
    DEFAULT_OPTION: Field::Text,
    ITEM_OPTION_LIST: Field::Text,
    PRICE: Field::Number,
    VALUE: Field::Number,
    EXPIRE_TYPE: Field::Text,
    DURABILITY: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    IS_SELL: Field::Number,
    IS_ENCHANT: Field::Number,
    IS_REOPTION: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :ITEM_ID,
    :ICON,
    :NAME,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ITEM_ID,
    :ICON,
    :NAME,
    :EXPLAIN,
    :LEVEL,
    :GRADE,
    :LIMIT,
    :CATEGORY,
    :COSTUME_ID,
    :DEFAULT_OPTION,
    :ITEM_OPTION_LIST,
    :PRICE,
    :VALUE,
    :EXPIRE_TYPE,
    :DURABILITY,
    :IS_SELL,
    :IS_ENCHANT,
    :IS_REOPTION,
  ]

  # Overwrite this method to customize how item infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item_info)
  #   "ItemInfo ##{item_info.id}"
  # end
end
