require "administrate/base_dashboard"

class QuestTypeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    QUEST_TYPE_ID: Field::Number,
    QUEST_ICON: Field::Text,
    TYPE: Field::Text,
    QUEST_NAME: Field::Text,
    QUEST_EXPLAIN: Field::Text,
    GUIDE_CHAR_IMAGE: Field::Text,
    QUEST_COMPLETE_EXPLAIN: Field::Text,
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
    :QUEST_TYPE_ID,
    :QUEST_ICON,
    :TYPE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :QUEST_TYPE_ID,
    :QUEST_ICON,
    :TYPE,
    :QUEST_NAME,
    :QUEST_EXPLAIN,
    :GUIDE_CHAR_IMAGE,
    :QUEST_COMPLETE_EXPLAIN,
  ]

  # Overwrite this method to customize how quest types are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(quest_type)
  #   "QuestType ##{quest_type.id}"
  # end
end
