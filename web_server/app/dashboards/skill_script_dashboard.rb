require "administrate/base_dashboard"

class SkillScriptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    SKILL_ID: Field::Number,
    CHARACTER_TYPE: Field::Text,
    SKILL_CATEGORY: Field::Text,
    TYPE: Field::Text,
    LEVEL: Field::Number,
    LEARN_LEVEL: Field::Number,
    SKILL_GROUP_ID: Field::Number,
    PRE_SKILL: Field::Text,
    PASSIVE_APPLY_SKILL: Field::Text,
    LEARN_CONDITION: Field::Text,
    ICON: Field::Text,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    ACTIVE_ID: Field::Number,
    TRIGGER: Field::Text,
    SKILL_REACTION_ID: Field::Text,
    SKILL_OPTION_ID: Field::Text,
    POWER: Field::Text,
    SPEND_MP: Field::Text,
    SPEND_HP: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    RANGE_CHECK_REACTION_INDEX: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :SKILL_ID,
    :CHARACTER_TYPE,
    :SKILL_CATEGORY,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :SKILL_ID,
    :CHARACTER_TYPE,
    :SKILL_CATEGORY,
    :TYPE,
    :LEVEL,
    :LEARN_LEVEL,
    :SKILL_GROUP_ID,
    :PRE_SKILL,
    :PASSIVE_APPLY_SKILL,
    :LEARN_CONDITION,
    :ICON,
    :NAME,
    :EXPLAIN,
    :ACTIVE_ID,
    :TRIGGER,
    :SKILL_REACTION_ID,
    :SKILL_OPTION_ID,
    :POWER,
    :SPEND_MP,
    :SPEND_HP,
    :RANGE_CHECK_REACTION_INDEX,
  ]

  # Overwrite this method to customize how skill scripts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(skill_script)
  #   "SkillScript ##{skill_script.id}"
  # end
end
