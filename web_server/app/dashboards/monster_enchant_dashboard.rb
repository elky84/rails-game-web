require "administrate/base_dashboard"

class MonsterEnchantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    MONSTER_ENCHANT_ID: Field::Number,
    MONSTER_GRADE: Field::Number,
    ENCHANT_RESULT: Field::Text,
    ENCHANT_PERCENT: Field::Text,
    BASE_EXP: Field::Text,
    LEVEL_BONUS_EXP: Field::Text,
    EQUAL_MONSTER_EXP_BONUS: Field::Text,
    BASE_MONEY: Field::Number,
    LEVEL_MONEY: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    EQUAL_MONSTER_SKILL_BONUS: Field::Number.with_options(decimals: 2),
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :MONSTER_ENCHANT_ID,
    :MONSTER_GRADE,
    :ENCHANT_RESULT,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :MONSTER_ENCHANT_ID,
    :MONSTER_GRADE,
    :ENCHANT_RESULT,
    :ENCHANT_PERCENT,
    :BASE_EXP,
    :LEVEL_BONUS_EXP,
    :EQUAL_MONSTER_EXP_BONUS,
    :BASE_MONEY,
    :LEVEL_MONEY,
    :EQUAL_MONSTER_SKILL_BONUS,
  ]

  # Overwrite this method to customize how monster enchants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(monster_enchant)
  #   "MonsterEnchant ##{monster_enchant.id}"
  # end
end
