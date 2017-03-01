require "administrate/base_dashboard"

class CharacterInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    CHARACTER_ID: Field::Number,
    TYPE: Field::Text,
    GROW_TYPE_DETAIL: Field::Text,
    EQUIP_TYPE: Field::Text,
    NAME: Field::Text,
    EXPLAIN: Field::Text,
    ACTOR_ID: Field::Number,
    PRICE: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    RELEASE: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :CHARACTER_ID,
    :TYPE,
    :GROW_TYPE_DETAIL,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :CHARACTER_ID,
    :TYPE,
    :GROW_TYPE_DETAIL,
    :EQUIP_TYPE,
    :NAME,
    :EXPLAIN,
    :ACTOR_ID,
    :PRICE,
    :RELEASE,
  ]

  # Overwrite this method to customize how character infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(character_info)
  #   "CharacterInfo ##{character_info.id}"
  # end
end
