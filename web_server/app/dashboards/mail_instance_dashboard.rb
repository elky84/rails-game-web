require "administrate/base_dashboard"

class MailInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    MAIL_NO: Field::Number,
    USER_NO: Field::Number,
    TITLE: Field::Text,
    CONTENT: Field::Text,
    SENDER: Field::Text,
    SENDER_ACTOR_ID: Field::Number,
    SENDER_USER_NO: Field::Number,
    OPENED: Field::Text,
    REWARD: Field::Text,
    END_DATE: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    MAIL_TYPE: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :MAIL_NO,
    :USER_NO,
    :TITLE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :MAIL_NO,
    :USER_NO,
    :TITLE,
    :CONTENT,
    :SENDER,
    :SENDER_ACTOR_ID,
    :SENDER_USER_NO,
    :OPENED,
    :REWARD,
    :END_DATE,
    :MAIL_TYPE,
  ]

  # Overwrite this method to customize how mail instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(mail_instance)
  #   "MailInstance ##{mail_instance.id}"
  # end
end
