require "administrate/base_dashboard"

class MasteryInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    MASTERY_ID: Field::Number,
    MASTERY_TYPE: Field::Text,
    GRADE: Field::Number,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    MAX_LEVEL: Field::Number,
    OPTION_ID: Field::Text,
    OPTION_EFFECT: Field::Text,
    EFFECT_TARGET: Field::Text,
    PRE_LEVEL: Field::Number,
    PRE_CONDITION: Field::Number,
    ICON: Field::Text,
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
    :MASTERY_ID,
    :MASTERY_TYPE,
    :GRADE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :MASTERY_ID,
    :MASTERY_TYPE,
    :GRADE,
    :NAME,
    :EXPLAIN,
    :MAX_LEVEL,
    :OPTION_ID,
    :OPTION_EFFECT,
    :EFFECT_TARGET,
    :PRE_LEVEL,
    :PRE_CONDITION,
    :ICON,
  ]

  # Overwrite this method to customize how mastery infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(mastery_info)
  #   "MasteryInfo ##{mastery_info.id}"
  # end
end
