require "administrate/base_dashboard"

class MonsterGenInfoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    INDEX: Field::Number,
    APPEAR_TYPE: Field::Text,
    POSITION: Field::Text,
    MOVE_FROM: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    CURVE: Field::Number,
    DIRECTION: Field::Number,
    JUMP_SPEED: Field::Text,
    DEAD_AFTER_APPEAR: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :INDEX,
    :APPEAR_TYPE,
    :POSITION,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :INDEX,
    :APPEAR_TYPE,
    :POSITION,
    :MOVE_FROM,
    :CURVE,
    :DIRECTION,
    :JUMP_SPEED,
    :DEAD_AFTER_APPEAR,
  ]

  # Overwrite this method to customize how monster gen infos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(monster_gen_info)
  #   "MonsterGenInfo ##{monster_gen_info.id}"
  # end
end
