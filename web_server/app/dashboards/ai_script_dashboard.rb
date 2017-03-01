require "administrate/base_dashboard"

class AiScriptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    index: Field::Number,
    ai_type: Field::Text,
    protect_object_name: Field::Text,
    protect_range: Field::Text,
    search_range: Field::Text,
    search_enemy_type: Field::Text,
    idle_time_stop: Field::Text,
    idle_time_random_range: Field::Text,
    attack_time_stop: Field::Text,
    idle_move_range: Field::Text,
    go_away_time: Field::Text,
    go_away_plus_random: Field::Text,
    state_stay_time: Field::Text,
    state_stay_fix_time: Field::Text,
    skill_use_percent: Field::Text,
    attack_after_type: Field::Text,
    is_all_include_phase: Field::Number,
    is_reset_under_attack: Field::Number,
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
    :index,
    :ai_type,
    :protect_object_name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :index,
    :ai_type,
    :protect_object_name,
    :protect_range,
    :search_range,
    :search_enemy_type,
    :idle_time_stop,
    :idle_time_random_range,
    :attack_time_stop,
    :idle_move_range,
    :go_away_time,
    :go_away_plus_random,
    :state_stay_time,
    :state_stay_fix_time,
    :skill_use_percent,
    :attack_after_type,
    :is_all_include_phase,
    :is_reset_under_attack,
  ]

  # Overwrite this method to customize how ai scripts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(ai_script)
  #   "AiScript ##{ai_script.id}"
  # end
end
