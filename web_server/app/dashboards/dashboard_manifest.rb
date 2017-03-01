# DashboardManifest tells Administrate which dashboards to display
class DashboardManifest
  # `DASHBOARDS`
  # a list of dashboards to display in the side navigation menu
  #
  # These are all of the rails models that we found in your database
  # at the time you installed Administrate.
  #
  # To show or hide dashboards, add or remove the model name from this list.
  # Dashboards returned from this method must be Rails models for Administrate
  # to work correctly.
  DASHBOARDS = [
    :actor_status_scripts,
    :ai_scripts,
    :area_infos,
    :auth_instances,
    :character_grows,
    :character_infos,
    :character_instances,
    :conditions,
    :connect_restricts,
    :coupon_instances,
    :daychecks,
    :daycheck_instances,
    :daycheck_scripts,
    :event_instances,
    :evolution_infos,
    :friend_instances,
    :gachas,
    :gacha_groups,
    :item_enchants,
    :item_enchant_effects,
    :item_infos,
    :item_instances,
    :item_options,
    :item_reoptions,
    :log_instances,
    :mail_instances,
    :mastery_infos,
    :mastery_instances,
    :mastery_point_infos,
    :mastery_resets,
    :max_value_infos,
    :monster_enchants,
    :monster_enchant_bonus,
    :monster_gen_infos,
    :monster_grade_bonus,
    :monster_grows,
    :monster_infos,
    :monster_instances,
    :notice_instances,
    :options,
    :parameters,
    :phase_infos,
    :pvp_instances,
    :pvp_periods,
    :pvp_ranges,
    :pvp_rank_cache_instances,
    :pvp_record_instances,
    :pvp_reward_infos,
    :pvp_succession_bonus_infos,
    :quest_infos,
    :quest_instances,
    :quest_schedules,
    :quest_short_cuts,
    :quest_types,
    :rate_statuses,
    :report_instances,
    :scenario_scripts,
    :server_lists,
    :shop_items,
    :skill_enchants,
    :skill_instances,
    :skill_scripts,
    :stage_clear_instances,
    :stage_infos,
    :stage_instances,
    :statistics_instances,
    :statuses,
    :tutorial_instances,
    :user_give_instances,
    :user_grows,
    :user_instances,
    :version_instances,
  ]

  # `ROOT_DASHBOARD`
  # the name of the dashboard that will be displayed
  # at "http://your_site.com/admin"
  #
  # This dashboard will likely be the first page that admins see
  # when they log into the dashboard.
  ROOT_DASHBOARD = DASHBOARDS.first
end
