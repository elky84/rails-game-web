require "administrate/base_dashboard"

class StageClearInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    USER_NO: Field::Number,
    CHARACTER_NO: Field::Number,
    PLAY_STAGE: Field::Text,
    CLEAR_STAGE: Field::Text,
    STAGE_SCORE: Field::Text,
    LAST_DATE: Field::DateTime,
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
    :USER_NO,
    :CHARACTER_NO,
    :PLAY_STAGE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :USER_NO,
    :CHARACTER_NO,
    :PLAY_STAGE,
    :CLEAR_STAGE,
    :STAGE_SCORE,
    :LAST_DATE,
  ]

  # Overwrite this method to customize how stage clear instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(stage_clear_instance)
  #   "StageClearInstance ##{stage_clear_instance.id}"
  # end
end
