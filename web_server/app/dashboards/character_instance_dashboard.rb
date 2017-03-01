require "administrate/base_dashboard"

class CharacterInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    CHARACTER_NO: Field::Number,
    USER_NO: Field::Number,
    CHARACTER_ID: Field::Number,
    LEVEL: Field::Number,
    EXP: Field::Number,
    LASTEST_ACTIVE_TIME: Field::DateTime,
    MASTERY_GROUP_ID: Field::Number,
    PARTY_MONSTER_ID: Field::Text,
    STAGE_INSTANCE_NO: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    COSTUME_ID: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :CHARACTER_NO,
    :USER_NO,
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
    :USER_NO,
    :CHARACTER_ID,
    :LEVEL,
    :EXP,
    :LASTEST_ACTIVE_TIME,
    :MASTERY_GROUP_ID,
    :PARTY_MONSTER_ID,
    :STAGE_INSTANCE_NO,
    :COSTUME_ID,
  ]

  # Overwrite this method to customize how character instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(character_instance)
  #   "CharacterInstance ##{character_instance.id}"
  # end
end
