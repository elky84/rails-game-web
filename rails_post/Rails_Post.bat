@echo off

set ADDRESS=%1
ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "index" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/USER_GIVE_INSTANCE.xlsx" "USER_GIVE_INSTANCE" "USER_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/USER_GROW.xlsx" "USER_GROW" "GROW_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INSTANCE.xlsx" "CHARACTER_INSTANCE" "CHARACTER_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error



ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INFO.xlsx" "CHARACTER_INFO" "CHARACTER_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_GROW.xlsx" "CHARACTER_GROW" "GROW_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_GROW.xlsx" "MONSTER_GROW" "GROW_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INFO.xlsx" "ITEM_INFO" "ITEM_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/ITEM_OPTION.xlsx" "ITEM_OPTION" "ITEM_OPTION_ID" "rails_post:%ADDRESS%|multimap"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/ITEM_ENCHANT.xlsx" "ITEM_ENCHANT" "ITEM_ENCHANT_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/ITEM_ENCHANT_EFFECT.xlsx" "ITEM_ENCHANT_EFFECT" "ITEM_ENCHANT_EFFECT_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/ITEM_REOPTION.xlsx" "ITEM_REOPTION" "ITEM_REOPTION_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INFO.xlsx" "CHARACTER_INFO" "CHARACTER_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INFO.xlsx" "MONSTER_INFO" "MONSTER_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/OPTION.xlsx" "OPTION" "OPTION_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INFO.xlsx" "STAGE_INFO" "STAGE_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PARAMETER.xlsx" "PARAMETER" "PARAMETER_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_INFO.xlsx" "MASTERY_INFO" "MASTERY_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/SKILL_ENCHANT.xlsx" "SKILL_ENCHANT" "SKILL_ENCHANT_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/GACHA.xlsx" "GACHA" "GACHA_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/GACHA_GROUP.xlsx" "GACHA_GROUP" "GACHA_GROUP_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/GACHA_REWARD_MONSTER.xlsx" "GACHA_REWARD_MONSTER" "GACHA_REWARD_MONSTER_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/GACHA_REWARD_ITEM.xlsx" "GACHA_REWARD_ITEM" "GACHA_REWARD_ITEM_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/STATUS.xlsx" "STATUS" "STATUS_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/VERSION_INSTANCE.xlsx" "VERSION_INSTANCE" "VALUE" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INFO.xlsx" "STAGE_INFO" "STAGE_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/SHOP_ITEM.xlsx" "SHOP_ITEM" "SHOP_ITEM_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PVP_SUCCESSION_BONUS_INFO.xlsx" "PVP_SUCCESSION_BONUS_INFO" "PVP_SUCCESSION_BONUS_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PVP_RANGE.xlsx" "PVP_RANGE" "PVP_RANGE_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PVP_REWARD_INFO.xlsx" "PVP_REWARD_INFO" "PVP_REWARD_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PVP_PERIOD.xlsx" "PVP_PERIOD" "PVP_PERIOD_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/DAYCHECK.xlsx" "DAYCHECK" "DAYCHECK_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_INFO_ID" "rails_post:%ADDRESS%" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/QUEST_SCHEDULE.xlsx" "QUEST_SCHEDULE" "QUEST_SCHEDULE_ID" "rails_post:%ADDRESS%" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/QUEST_TYPE.xlsx" "QUEST_TYPE" "QUEST_TYPE_ID" "rails_post:%ADDRESS%" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/COUPON.xlsx" "COUPON" "COUPON_INDEX" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MAX_VALUE_INFO.xlsx" "MAX_VALUE_INFO" "MAX_VALUE_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_RESET.xlsx" "MASTERY_RESET" "MASTERY_RESET_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/EVOLUTION_INFO.xlsx" "EVOLUTION_INFO" "EVOLUTION_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_ENCHANT.xlsx" "MONSTER_ENCHANT" "MONSTER_ENCHANT_ID" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_POINT_INFO.xlsx" "MASTERY_POINT_INFO" "MASTERY_POINT" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/SKILL_INSTANCE.xlsx" "SKILL_INSTANCE" "SKILL_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "../schema/PVP_RANK_CACHE_INSTANCE.xlsx" "PVP_RANK_CACHE_INSTANCE" "PVP_RANK_CACHE_INSTANCE_NO" "rails_post:%ADDRESS%"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.

pause