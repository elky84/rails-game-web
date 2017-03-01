require "administrate/base_dashboard"

class ParameterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    PARAMETER_ID: Field::Number,
    NAME: Field::Text,
    DESCRIPTION: Field::Text,
    EXPLAIN: Field::Text,
    APPLY_STAT: Field::Text,
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
    :PARAMETER_ID,
    :NAME,
    :DESCRIPTION,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :PARAMETER_ID,
    :NAME,
    :DESCRIPTION,
    :EXPLAIN,
    :APPLY_STAT,
  ]

  # Overwrite this method to customize how parameters are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(parameter)
  #   "Parameter ##{parameter.id}"
  # end
end
