require "administrate/base_dashboard"

class StatusDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    STATUS_ID: Field::Number,
    ATTACK: Field::Text,
    DEFENSE: Field::Text,
    HP: Field::Text,
    MP: Field::Text,
    RAGE_BASE: Field::Text,
    ATTACK_SPEED: Field::Text,
    MOVE_SPEED_X: Field::Text,
    MOVE_SPEED_Z: Field::Text,
    CRITICAL_RATE: Field::Text,
    CRITICAL_AVOID: Field::Text,
    CRITICAL_DAMAGE: Field::Text,
    HIT_RATE: Field::Text,
    DODGE_RATE: Field::Text,
    HP_REGEN: Field::Text,
    MP_REGEN: Field::Text,
    RAGE_REGEN: Field::Text,
    COOL_TIME_ALL: Field::Text,
    RESIST_POISON: Field::Text,
    RESIST_SILENCE: Field::Text,
    RESIST_STUN: Field::Text,
    RESIST_SLOW: Field::Text,
    LEVEL: Field::Number,
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
    :STATUS_ID,
    :ATTACK,
    :DEFENSE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :STATUS_ID,
    :ATTACK,
    :DEFENSE,
    :HP,
    :MP,
    :RAGE_BASE,
    :ATTACK_SPEED,
    :MOVE_SPEED_X,
    :MOVE_SPEED_Z,
    :CRITICAL_RATE,
    :CRITICAL_AVOID,
    :CRITICAL_DAMAGE,
    :HIT_RATE,
    :DODGE_RATE,
    :HP_REGEN,
    :MP_REGEN,
    :RAGE_REGEN,
    :COOL_TIME_ALL,
    :RESIST_POISON,
    :RESIST_SILENCE,
    :RESIST_STUN,
    :RESIST_SLOW,
    :LEVEL,
  ]

  # Overwrite this method to customize how statuses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(status)
  #   "Status ##{status.id}"
  # end
end
