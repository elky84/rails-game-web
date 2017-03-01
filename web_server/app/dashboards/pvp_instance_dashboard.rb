require "administrate/base_dashboard"

class PvpInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    CHARACTER_NO: Field::Number,
    CHARACTER_LV: Field::Number,
    CHARACTER_ID: Field::Number,
    USER_NICKNAME: Field::Text,
    USER_LV: Field::Number,
    RATING: Field::Number,
    PARTY_ATTACKER: Field::Text,
    ATTACKER_POWER: Field::Text,
    PARTY_DEFENDER: Field::Text,
    DEFENDER_POWER: Field::Text,
    SEASON_NUM: Field::Number,
    IS_SUCCESSION_VICTORY: Field::Text,
    SUCCESSION_COUNT: Field::Number,
    VICTORY_COUNT: Field::Number,
    DEFEAT_COUNT: Field::Number,
    CUR_MATCH_NO: Field::Number,
    RANK: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    COSTUME_ID: Field::Number,
    USER_NO: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :CHARACTER_NO,
    :CHARACTER_LV,
    :CHARACTER_ID,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :CHARACTER_NO,
    :CHARACTER_LV,
    :CHARACTER_ID,
    :USER_NICKNAME,
    :USER_LV,
    :RATING,
    :PARTY_ATTACKER,
    :ATTACKER_POWER,
    :PARTY_DEFENDER,
    :DEFENDER_POWER,
    :SEASON_NUM,
    :IS_SUCCESSION_VICTORY,
    :SUCCESSION_COUNT,
    :VICTORY_COUNT,
    :DEFEAT_COUNT,
    :CUR_MATCH_NO,
    :RANK,
    :COSTUME_ID,
    :USER_NO,
  ]

  # Overwrite this method to customize how pvp instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pvp_instance)
  #   "PvpInstance ##{pvp_instance.id}"
  # end
end
