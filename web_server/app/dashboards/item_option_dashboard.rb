require "administrate/base_dashboard"

class ItemOptionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    ITEM_OPTION_ID: Field::Number,
    OPTION_ID: Field::Number,
    DESCRIPTION: Field::Text,
    GRADE: Field::Text,
    DETAIL_ID: Field::Number,
    MIN: Field::Number,
    MAX: Field::Number,
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
    :ITEM_OPTION_ID,
    :OPTION_ID,
    :DESCRIPTION,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :ITEM_OPTION_ID,
    :OPTION_ID,
    :DESCRIPTION,
    :GRADE,
    :DETAIL_ID,
    :MIN,
    :MAX,
  ]

  # Overwrite this method to customize how item options are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item_option)
  #   "ItemOption ##{item_option.id}"
  # end
end
