require "administrate/base_dashboard"

class EventInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    EVENT_NO: Field::Number,
    EVENT_TYPE: Field::Text,
    REWARD: Field::Text,
    START_DATE: Field::DateTime,
    END_DATE: Field::DateTime,
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
    :EVENT_NO,
    :EVENT_TYPE,
    :REWARD,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :EVENT_NO,
    :EVENT_TYPE,
    :REWARD,
    :START_DATE,
    :END_DATE,
  ]

  # Overwrite this method to customize how event instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event_instance)
  #   "EventInstance ##{event_instance.id}"
  # end
end
