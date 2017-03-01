require "administrate/base_dashboard"

class StageInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    STAGE_ID: Field::Number,
    AREA_ID: Field::Number,
    STAGE_NUMBER: Field::Text,
    OPEN: Field::Text,
    TYPE: Field::Text,
    LEVEL: Field::Text,
    COORDINATE: Field::Text,
    BG_COLOR: Field::Text,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    CHARACTER_LEVEL: Field::Text,
    STAMINA: Field::Text,
    PHASE: Field::Text,
    MONSTER: Field::Text,
    ITEM: Field::Text,
    STAGE_ICON: Field::Text,
    CLEAR_SCORE: Field::Text,
    CLEAR_EXP: Field::Text,
    CLEAR_MONEY: Field::Text,
    CLEAR_1_REWARD: Field::Text,
    CLEAR_1_REWARD_PROBABILITY: Field::Text,
    CLEAR_2_REWARD: Field::Text,
    CLEAR_2_REWARD_PROBABILITY: Field::Text,
    CLEAR_3_REWARD: Field::Text,
    CLEAR_3_REWARD_PROBABILITY: Field::Text,
    START_SCENARIO: Field::Text,
    END_SCENARIO: Field::Text,
    BG_PREFEB: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    BGM: Field::String,
    INFI_TOWER_SP_REWARD: Field::String,
    INFI_TOWER_PREVIEW: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :STAGE_ID,
    :AREA_ID,
    :STAGE_NUMBER,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :STAGE_ID,
    :AREA_ID,
    :STAGE_NUMBER,
    :OPEN,
    :TYPE,
    :LEVEL,
    :COORDINATE,
    :BG_COLOR,
    :NAME,
    :EXPLAIN,
    :CHARACTER_LEVEL,
    :STAMINA,
    :PHASE,
    :MONSTER,
    :ITEM,
    :STAGE_ICON,
    :CLEAR_SCORE,
    :CLEAR_EXP,
    :CLEAR_MONEY,
    :CLEAR_1_REWARD,
    :CLEAR_1_REWARD_PROBABILITY,
    :CLEAR_2_REWARD,
    :CLEAR_2_REWARD_PROBABILITY,
    :CLEAR_3_REWARD,
    :CLEAR_3_REWARD_PROBABILITY,
    :START_SCENARIO,
    :END_SCENARIO,
    :BG_PREFEB,
    :BGM,
    :INFI_TOWER_SP_REWARD,
    :INFI_TOWER_PREVIEW,
  ]

  # Overwrite this method to customize how stage infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(stage_info)
  #   "StageInfo ##{stage_info.id}"
  # end
end
