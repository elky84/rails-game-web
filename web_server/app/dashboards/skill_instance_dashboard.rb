require "administrate/base_dashboard"

class SkillInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    SKILL_NO: Field::Number,
    CHARACTER_NO: Field::Number,
    SKILL_ID: Field::Number,
    SKILL_LEVEL: Field::Number,
    SLOT_NO: Field::Number,
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
    :SKILL_NO,
    :CHARACTER_NO,
    :SKILL_ID,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :SKILL_NO,
    :CHARACTER_NO,
    :SKILL_ID,
    :SKILL_LEVEL,
    :SLOT_NO,
  ]

  # Overwrite this method to customize how skill instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(skill_instance)
  #   "SkillInstance ##{skill_instance.id}"
  # end
end
