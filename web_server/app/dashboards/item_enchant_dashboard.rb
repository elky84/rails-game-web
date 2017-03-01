require "administrate/base_dashboard"

class ItemEnchantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    ITEM_ENCHANT_ID: Field::Number,
    GRADE: Field::Number,
    ENCHANT: Field::Number,
    ENCHANT_PROBABILITY: Field::Text,
    MONEY: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    LEVEL: Field::Number,
    ITEM_CATEGORY: Field::Text,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :ITEM_ENCHANT_ID,
    :GRADE,
    :ENCHANT,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ITEM_ENCHANT_ID,
    :GRADE,
    :ENCHANT,
    :ENCHANT_PROBABILITY,
    :MONEY,
    :LEVEL,
    :ITEM_CATEGORY,
  ]

  # Overwrite this method to customize how item enchants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item_enchant)
  #   "ItemEnchant ##{item_enchant.id}"
  # end
end
