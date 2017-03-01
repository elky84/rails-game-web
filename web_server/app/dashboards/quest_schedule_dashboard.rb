require "administrate/base_dashboard"

class QuestScheduleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    QUEST_SCHEDULE_ID: Field::Number,
    QUEST_SCHEDULE_TYPE: Field::Text,
    ODD_OR_EVEN: Field::Text,
    START: Field::DateTime,
    END: Field::DateTime,
    EXPLAIN: Field::Text,
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
    :QUEST_SCHEDULE_ID,
    :QUEST_SCHEDULE_TYPE,
    :ODD_OR_EVEN,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :QUEST_SCHEDULE_ID,
    :QUEST_SCHEDULE_TYPE,
    :ODD_OR_EVEN,
    :START,
    :END,
    :EXPLAIN,
  ]

  # Overwrite this method to customize how quest schedules are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(quest_schedule)
  #   "QuestSchedule ##{quest_schedule.id}"
  # end
end
