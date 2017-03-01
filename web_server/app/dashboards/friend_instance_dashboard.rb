require "administrate/base_dashboard"

class FriendInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    FRIEND_NO: Field::Number,
    USER_NO: Field::Number,
    FRIEND_USER_NO: Field::Number,
    STATE: Field::Number,
    USER_SEND_POINT_DATE: Field::DateTime,
    FRIEND_USER_SEND_POINT_DATE: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    IS_BOT: Field::Number,
    USER_ADV_TOGETHER_DATE: Field::DateTime,
    FRIEND_USER_ADV_TOGETHER_DATE: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :FRIEND_NO,
    :USER_NO,
    :FRIEND_USER_NO,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :FRIEND_NO,
    :USER_NO,
    :FRIEND_USER_NO,
    :STATE,
    :USER_SEND_POINT_DATE,
    :FRIEND_USER_SEND_POINT_DATE,
    :IS_BOT,
    :USER_ADV_TOGETHER_DATE,
    :FRIEND_USER_ADV_TOGETHER_DATE,
  ]

  # Overwrite this method to customize how friend instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(friend_instance)
  #   "FriendInstance ##{friend_instance.id}"
  # end
end
