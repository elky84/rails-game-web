require "administrate/base_dashboard"

class DaycheckScriptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    DAYCHECK_ID: Field::Number,
    USER_TYPE: Field::Number,
    DAY: Field::Number,
    REWARD: Field::String,
    UI_LABEL: Field::String,
    ICON: Field::String,
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
    :DAYCHECK_ID,
    :USER_TYPE,
    :DAY,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :DAYCHECK_ID,
    :USER_TYPE,
    :DAY,
    :REWARD,
    :UI_LABEL,
    :ICON,
  ]

  # Overwrite this method to customize how daycheck scripts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(daycheck_script)
  #   "DaycheckScript ##{daycheck_script.id}"
  # end
end
