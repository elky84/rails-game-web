require "administrate/base_dashboard"

class CouponInstanceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    COUPON_INDEX: Field::Number,
    REWARD: Field::Text,
    COUPON_STRING: Field::Text,
    USER_NO: Field::Number,
    TIME: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    COUPON_GROUP: Field::String,
    SERVER_INDEX: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :COUPON_INDEX,
    :REWARD,
    :COUPON_STRING,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :COUPON_INDEX,
    :REWARD,
    :COUPON_STRING,
    :USER_NO,
    :TIME,
    :COUPON_GROUP,
    :SERVER_INDEX,
  ]

  # Overwrite this method to customize how coupon instances are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(coupon_instance)
  #   "CouponInstance ##{coupon_instance.id}"
  # end
end
