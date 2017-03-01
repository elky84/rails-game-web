require "administrate/base_dashboard"

class ScenarioScriptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    INDEX: Field::Number,
    DIALOGUE_TYPE: Field::String,
    DIALOGUE_EFFECT: Field::String,
    SPEECH_BACK: Field::String,
    CHARACTER_FACE: Field::String,
    FACE_POS: Field::String,
    CHARACOTR_INDEX: Field::Number,
    STRING_INDEX: Field::Number,
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
    :INDEX,
    :DIALOGUE_TYPE,
    :DIALOGUE_EFFECT,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :INDEX,
    :DIALOGUE_TYPE,
    :DIALOGUE_EFFECT,
    :SPEECH_BACK,
    :CHARACTER_FACE,
    :FACE_POS,
    :CHARACOTR_INDEX,
    :STRING_INDEX,
  ]

  # Overwrite this method to customize how scenario scripts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(scenario_script)
  #   "ScenarioScript ##{scenario_script.id}"
  # end
end
