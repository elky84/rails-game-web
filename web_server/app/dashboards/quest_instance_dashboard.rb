require "administrate/base_dashboard"

class QuestInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    QUEST_NO: Field::Number,
    TYPE: Field::Text,
    QUEST_INFO_ID: Field::Number,
    USER_NO: Field::Number,
    QUEST_VALUE: Field::Number,
    ACTIVE_TIME: Field::DateTime,
    CLEAR_TIME: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    QUEST_APPLY_TYPE: Field::Text,
    GRADE: Field::Number,
    GROUP_ID: Field::Number,
    CLEAR: Field::Text,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :QUEST_NO,
    :TYPE,
    :QUEST_INFO_ID,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :QUEST_NO,
    :TYPE,
    :QUEST_INFO_ID,
    :USER_NO,
    :QUEST_VALUE,
    :ACTIVE_TIME,
    :CLEAR_TIME,
    :QUEST_APPLY_TYPE,
    :GRADE,
    :GROUP_ID,
    :CLEAR,
  ]

  # Overwrite this method to customize how quest instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(quest_instance)
  #   "QuestInstance ##{quest_instance.id}"
  # end
end
