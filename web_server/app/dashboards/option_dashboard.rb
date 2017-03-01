require "administrate/base_dashboard"

class OptionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    OPTION_ID: Field::Number,
    CONDITION_ID: Field::Number,
    PARAMETER_ID: Field::Text,
    DESCRIPTION: Field::Text,
    UI_SCRIPT: Field::Text,
    VALUE: Field::Text,
    MAX_VALUE: Field::Text,
    RANDON_ACTIVITY: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    PERCENT: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :OPTION_ID,
    :CONDITION_ID,
    :PARAMETER_ID,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :OPTION_ID,
    :CONDITION_ID,
    :PARAMETER_ID,
    :DESCRIPTION,
    :UI_SCRIPT,
    :VALUE,
    :MAX_VALUE,
    :RANDON_ACTIVITY,
    :PERCENT,
  ]

  # Overwrite this method to customize how options are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(option)
  #   "Option ##{option.id}"
  # end
end
