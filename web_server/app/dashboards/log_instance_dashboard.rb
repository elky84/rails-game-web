require "administrate/base_dashboard"

class LogInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    LOG_NO: Field::Number,
    USER_NO: Field::Number,
    CHARACTER_NO: Field::Number,
    LOG_TYPE: Field::Text,
    VALUE: Field::Text,
    CASH: Field::Number,
    MONEY: Field::Number,
    USER_LV: Field::Number,
    EXP: Field::Number,
    ACTION_TIME: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    IP: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :LOG_NO,
    :USER_NO,
    :CHARACTER_NO,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :LOG_NO,
    :USER_NO,
    :CHARACTER_NO,
    :LOG_TYPE,
    :VALUE,
    :CASH,
    :MONEY,
    :USER_LV,
    :EXP,
    :ACTION_TIME,
    :IP,
  ]

  # Overwrite this method to customize how log instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(log_instance)
  #   "LogInstance ##{log_instance.id}"
  # end
end
