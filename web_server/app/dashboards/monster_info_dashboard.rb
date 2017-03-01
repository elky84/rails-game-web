require "administrate/base_dashboard"

class MonsterInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    MONSTER_ID: Field::Number,
    MONSTER_TYPE: Field::Text,
    MONSTER_GRADE: Field::Number,
    GROW_TYPE: Field::Text,
    GROW_TYPE_DETAIL: Field::Text,
    MONSTER_PRICE: Field::Number,
    ACTOR_ID: Field::Number,
    SKIN_NUM: Field::Number,
    GACHA_SPEECH: Field::Text,
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
    :MONSTER_ID,
    :MONSTER_TYPE,
    :MONSTER_GRADE,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :MONSTER_ID,
    :MONSTER_TYPE,
    :MONSTER_GRADE,
    :GROW_TYPE,
    :GROW_TYPE_DETAIL,
    :MONSTER_PRICE,
    :ACTOR_ID,
    :SKIN_NUM,
    :GACHA_SPEECH,
  ]

  # Overwrite this method to customize how monster infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(monster_info)
  #   "MonsterInfo ##{monster_info.id}"
  # end
end
