require "administrate/base_dashboard"

class ServerListDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    INDEX: Field::Number,
    SERVER_TYPE: Field::Text,
    ADDRESS: Field::Text,
    NAME: Field::Text,
    CU: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    RU: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :INDEX,
    :SERVER_TYPE,
    :ADDRESS,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :INDEX,
    :SERVER_TYPE,
    :ADDRESS,
    :NAME,
    :CU,
    :RU,
  ]

  # Overwrite this method to customize how server lists are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(server_list)
  #   "ServerList ##{server_list.id}"
  # end
end
