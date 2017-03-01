require "administrate/base_dashboard"

class ActorStatusScriptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    index: Field::Number,
    SKILL_TYPE: Field::Text,
    scale_x: Field::Text,
    scale_y: Field::Text,
    spine_name: Field::Text,
    ui_sprite_name: Field::Text,
    actor_name: Field::Text,
    skill_list: Field::Text,
    random_skill_list: Field::Text,
    random_skill_percent: Field::Text,
    shadow: Field::Number,
    shadow_scale_x: Field::Text,
    shadow_scale_y: Field::Text,
    attack_count_max: Field::Number,
    ai_index: Field::Number,
    die_animation_curve: Field::Number,
    HP: Field::Text,
    MP: Field::Text,
    ATTACK: Field::Text,
    DEFENCE: Field::Text,
    HIT: Field::Text,
    AVOID: Field::Text,
    CRITICAL_HIT: Field::Text,
    CRITICAL_AVOID: Field::Text,
    CRITICAL_DAMAGE_PERCENT: Field::Text,
    REGEN_HEALTH: Field::Text,
    REGEN_MP: Field::Text,
    MOVE_SPEED_X: Field::Text,
    MOVE_SPEED_Z: Field::Text,
    ATTACK_SPEED: Field::Text,
    RAGE_BASE: Field::Text,
    RAGE_REGEN: Field::Text,
    COOL_TIME_ALL: Field::Text,
    RESIST_POISON: Field::Text,
    RESIST_SILENCE: Field::Text,
    RESIST_STUN: Field::Text,
    RESIST_SLOW: Field::Text,
    LEVEL: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    VOICE: Field::String,
    actor_group_id: Field::Number,
    group_rank_id: Field::Number,
    special_skill: Field::Text,
    special_skill_percent: Field::Text,
    OTHER_IDLE_USE: Field::Text,
    DOWN_TIME: Field::Text,
    die_animation_lenth: Field::Text,
    die_animation_speed: Field::Text,
    home_ani: Field::Text,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :index,
    :SKILL_TYPE,
    :scale_x,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :index,
    :SKILL_TYPE,
    :scale_x,
    :scale_y,
    :spine_name,
    :ui_sprite_name,
    :actor_name,
    :skill_list,
    :random_skill_list,
    :random_skill_percent,
    :shadow,
    :shadow_scale_x,
    :shadow_scale_y,
    :attack_count_max,
    :ai_index,
    :die_animation_curve,
    :HP,
    :MP,
    :ATTACK,
    :DEFENCE,
    :HIT,
    :AVOID,
    :CRITICAL_HIT,
    :CRITICAL_AVOID,
    :CRITICAL_DAMAGE_PERCENT,
    :REGEN_HEALTH,
    :REGEN_MP,
    :MOVE_SPEED_X,
    :MOVE_SPEED_Z,
    :ATTACK_SPEED,
    :RAGE_BASE,
    :RAGE_REGEN,
    :COOL_TIME_ALL,
    :RESIST_POISON,
    :RESIST_SILENCE,
    :RESIST_STUN,
    :RESIST_SLOW,
    :LEVEL,
    :VOICE,
    :actor_group_id,
    :group_rank_id,
    :special_skill,
    :special_skill_percent,
    :OTHER_IDLE_USE,
    :DOWN_TIME,
    :die_animation_lenth,
    :die_animation_speed,
    :home_ani,
  ]

  # Overwrite this method to customize how actor status scripts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(actor_status_script)
  #   "ActorStatusScript ##{actor_status_script.id}"
  # end
end
