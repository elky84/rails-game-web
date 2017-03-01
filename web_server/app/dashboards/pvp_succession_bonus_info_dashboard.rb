require "administrate/base_dashboard"

class PvpSuccessionBonusInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    PVP_SUCCESSION_BONUS_ID: Field::Number,
    BONUS_POINT: Field::Number,
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
    :PVP_SUCCESSION_BONUS_ID,
    :BONUS_POINT,
    :created_at,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :PVP_SUCCESSION_BONUS_ID,
    :BONUS_POINT,
  ]

  # Overwrite this method to customize how pvp succession bonus infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pvp_succession_bonus_info)
  #   "PvpSuccessionBonusInfo ##{pvp_succession_bonus_info.id}"
  # end
end
