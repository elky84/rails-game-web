require "administrate/base_dashboard"

class MaxValueInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    MAX_VALUE_ID: Field::Number,
    MAX_SLOT_TYPE: Field::Text,
    EXT_SLOT: Field::Number,
    NEXT_EXT_SLOT: Field::Number,
    NEXT_COST: Field::Text,
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
    :MAX_VALUE_ID,
    :MAX_SLOT_TYPE,
    :EXT_SLOT,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :MAX_VALUE_ID,
    :MAX_SLOT_TYPE,
    :EXT_SLOT,
    :NEXT_EXT_SLOT,
    :NEXT_COST,
  ]

  # Overwrite this method to customize how max value infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(max_value_info)
  #   "MaxValueInfo ##{max_value_info.id}"
  # end
end
