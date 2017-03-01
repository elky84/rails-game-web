require "administrate/base_dashboard"

class DaycheckInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    DAYCHECK_NO: Field::Number,
    USER_NO: Field::Number,
    USER_TYPE: Field::Number,
    DAYCHECK_ID: Field::Number,
    TIME: Field::Text,
    CHECK: Field::Number,
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
    :DAYCHECK_NO,
    :USER_NO,
    :USER_TYPE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :DAYCHECK_NO,
    :USER_NO,
    :USER_TYPE,
    :DAYCHECK_ID,
    :TIME,
    :CHECK,
  ]

  # Overwrite this method to customize how daycheck instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(daycheck_instance)
  #   "DaycheckInstance ##{daycheck_instance.id}"
  # end
end
