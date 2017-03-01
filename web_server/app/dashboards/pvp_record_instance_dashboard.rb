require "administrate/base_dashboard"

class PvpRecordInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    PVP_RECORD_INSTANCE_NO: Field::Number,
    SEASON_NUM: Field::Number,
    CHARACTER_NO: Field::Number,
    RESULT: Field::Text,
    RESULT_TIME: Field::DateTime,
    ADD_RATING: Field::Number,
    RESULT_RATING: Field::Number,
    MATCH_CHARACTER_NO: Field::Number,
    MATCH_CHR_LV: Field::Number,
    MATCH_CHR_ID: Field::Number,
    MATCH_USER_NICKNAME: Field::Text,
    MATCH_USER_LV: Field::Number,
    MATCH_CHR_DEF_POWER: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    MATCH_MONSTER_ID: Field::String,
    MATCH_MONSTER_LV: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :PVP_RECORD_INSTANCE_NO,
    :SEASON_NUM,
    :CHARACTER_NO,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :PVP_RECORD_INSTANCE_NO,
    :SEASON_NUM,
    :CHARACTER_NO,
    :RESULT,
    :RESULT_TIME,
    :ADD_RATING,
    :RESULT_RATING,
    :MATCH_CHARACTER_NO,
    :MATCH_CHR_LV,
    :MATCH_CHR_ID,
    :MATCH_USER_NICKNAME,
    :MATCH_USER_LV,
    :MATCH_CHR_DEF_POWER,
    :MATCH_MONSTER_ID,
    :MATCH_MONSTER_LV,
  ]

  # Overwrite this method to customize how pvp record instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pvp_record_instance)
  #   "PvpRecordInstance ##{pvp_record_instance.id}"
  # end
end
