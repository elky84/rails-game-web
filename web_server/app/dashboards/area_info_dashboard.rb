require "administrate/base_dashboard"

class AreaInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    AREA_ID: Field::Number,
    OPEN: Field::Text,
    START_DATE: Field::DateTime,
    END_DATE: Field::DateTime,
    AREA_TYPE: Field::Text,
    BG_COLOR: Field::Text,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    CHARACTER_LEVEL: Field::Text,
    IMAGE: Field::Text,
    MISSION: Field::Text,
    MONSTER: Field::Text,
    ITEM: Field::Text,
    SCENARIO_START: Field::Text,
    SCENARIO_END: Field::Text,
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
    :AREA_ID,
    :OPEN,
    :START_DATE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :AREA_ID,
    :OPEN,
    :START_DATE,
    :END_DATE,
    :AREA_TYPE,
    :BG_COLOR,
    :NAME,
    :EXPLAIN,
    :CHARACTER_LEVEL,
    :IMAGE,
    :MISSION,
    :MONSTER,
    :ITEM,
    :SCENARIO_START,
    :SCENARIO_END,
  ]

  # Overwrite this method to customize how area infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(area_info)
  #   "AreaInfo ##{area_info.id}"
  # end
end
