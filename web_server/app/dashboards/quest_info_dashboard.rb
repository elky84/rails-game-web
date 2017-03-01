require "administrate/base_dashboard"

class QuestInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    QUEST_INFO_ID: Field::Number,
    NEXT_QUEST_ID: Field::Number,
    QUEST_SCHEDULE_ID: Field::Number,
    QUEST_TYPE_ID: Field::Number,
    QUEST_GRADE_TYPE: Field::Text,
    GRADE: Field::Number,
    PREVIEW: Field::Text,
    MAXVALUE: Field::Number,
    REWARD: Field::Text,
    SHORT_CUT: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    GROUP_ID: Field::Number,
    QUEST_APPLY_TYPE: Field::Text,
    LEVEL_LIMIT: Field::Number,
    COMPLETE_IMAGE: Field::Text,
    COMPLETE_SCENE: Field::Text,
    COMPLETE_EXPLAN: Field::Text,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :QUEST_INFO_ID,
    :NEXT_QUEST_ID,
    :QUEST_SCHEDULE_ID,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :QUEST_INFO_ID,
    :NEXT_QUEST_ID,
    :QUEST_SCHEDULE_ID,
    :QUEST_TYPE_ID,
    :QUEST_GRADE_TYPE,
    :GRADE,
    :PREVIEW,
    :MAXVALUE,
    :REWARD,
    :SHORT_CUT,
    :GROUP_ID,
    :QUEST_APPLY_TYPE,
    :LEVEL_LIMIT,
    :COMPLETE_IMAGE,
    :COMPLETE_SCENE,
    :COMPLETE_EXPLAN,
  ]

  # Overwrite this method to customize how quest infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(quest_info)
  #   "QuestInfo ##{quest_info.id}"
  # end
end
