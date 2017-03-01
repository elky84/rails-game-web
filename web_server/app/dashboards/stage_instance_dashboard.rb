require "administrate/base_dashboard"

class StageInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    STAGE_PROGRESS_NO: Field::Number,
    USER_NO: Field::Number,
    STAGE_ID: Field::Number,
    CLEAR_EXP_NO: Field::Text,
    CLEAR_MONEY_NO: Field::Text,
    CLEAR_REWARD_NO: Field::Text,
    START_DATE: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    CHARACTER_NO: Field::Number,
    PARTY_MONSTER_ID: Field::Text,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :STAGE_PROGRESS_NO,
    :USER_NO,
    :STAGE_ID,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :STAGE_PROGRESS_NO,
    :USER_NO,
    :STAGE_ID,
    :CLEAR_EXP_NO,
    :CLEAR_MONEY_NO,
    :CLEAR_REWARD_NO,
    :START_DATE,
    :CHARACTER_NO,
    :PARTY_MONSTER_ID,
  ]

  # Overwrite this method to customize how stage instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(stage_instance)
  #   "StageInstance ##{stage_instance.id}"
  # end
end
