require "administrate/base_dashboard"

class PhaseInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    PHASE_ID: Field::Number,
    INIT_POS: Field::Text,
    MOVE_TIME: Field::Text,
    CLEAR: Field::Text,
    STAY_TIME: Field::Text,
    MONSTER: Field::Text,
    MONSTER_GEN_INFO: Field::Text,
    MONSTER_LV: Field::Text,
    APPEAR_SPEED: Field::Text,
    APPEAR_TIME: Field::Text,
    TEAM_INDEX: Field::Text,
    START_SCENARIO: Field::Text,
    END_SCENARIO: Field::Text,
    IS_BOSS_PHASE: Field::Number,
    PHASE_WIDTH: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    WAIT_TIME: Field::Number.with_options(decimals: 2),
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :PHASE_ID,
    :INIT_POS,
    :MOVE_TIME,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :PHASE_ID,
    :INIT_POS,
    :MOVE_TIME,
    :CLEAR,
    :STAY_TIME,
    :MONSTER,
    :MONSTER_GEN_INFO,
    :MONSTER_LV,
    :APPEAR_SPEED,
    :APPEAR_TIME,
    :TEAM_INDEX,
    :START_SCENARIO,
    :END_SCENARIO,
    :IS_BOSS_PHASE,
    :PHASE_WIDTH,
    :WAIT_TIME,
  ]

  # Overwrite this method to customize how phase infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(phase_info)
  #   "PhaseInfo ##{phase_info.id}"
  # end
end
