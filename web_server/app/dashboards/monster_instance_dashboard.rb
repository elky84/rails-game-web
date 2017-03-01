require "administrate/base_dashboard"

class MonsterInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    MONSTER_NO: Field::Number,
    USER_NO: Field::Number,
    CHARACTER_NO: Field::Number,
    MONSTER_ID: Field::Number,
    GROW_TYPE_DETAIL: Field::Text,
    LEVEL: Field::Number,
    EXP: Field::Number,
    SKILL: Field::Text,
    TEAM_SLOT: Field::Number,
    NEW: Field::Number,
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
    :MONSTER_NO,
    :USER_NO,
    :CHARACTER_NO,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :MONSTER_NO,
    :USER_NO,
    :CHARACTER_NO,
    :MONSTER_ID,
    :GROW_TYPE_DETAIL,
    :LEVEL,
    :EXP,
    :SKILL,
    :TEAM_SLOT,
    :NEW,
  ]

  # Overwrite this method to customize how monster instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(monster_instance)
  #   "MonsterInstance ##{monster_instance.id}"
  # end
end
