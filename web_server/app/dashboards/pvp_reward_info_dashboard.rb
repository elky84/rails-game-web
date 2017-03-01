require "administrate/base_dashboard"

class PvpRewardInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    PVP_REWARD_ID: Field::Number,
    RANGE_TYPE: Field::Text,
    MIN: Field::Number,
    MAX: Field::Number,
    REWARD_TYPE_AND_CAPACITY: Field::Text,
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
    :PVP_REWARD_ID,
    :RANGE_TYPE,
    :MIN,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :PVP_REWARD_ID,
    :RANGE_TYPE,
    :MIN,
    :MAX,
    :REWARD_TYPE_AND_CAPACITY,
  ]

  # Overwrite this method to customize how pvp reward infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pvp_reward_info)
  #   "PvpRewardInfo ##{pvp_reward_info.id}"
  # end
end
