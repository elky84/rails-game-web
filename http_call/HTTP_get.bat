REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "http_get:item/all.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error



ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/SKILL_INSTANCE.xlsx" "SKILL_INSTANCE" "SKILL_NO" "http_get:skill/all.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/SKILL_INSTANCE.xlsx" "SKILL_INSTANCE" "SKILL_NO" "http_get:skill/learn.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_INSTANCE.xlsx" "MASTERY_INSTANCE" "GROUP_NO" "http_get:mastery_drop/get.json:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/VERSION_INSTANCE.xlsx" "VERSION_INSTANCE" "VALUE" "http_get:version/get.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/sign_in.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/sign_up.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/lastestchr.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/get.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/getrandlist.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/search.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INSTANCE.xlsx" "CHARACTER_INSTANCE" "CHARACTER_NO" "http_get:character/new.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INSTANCE.xlsx" "CHARACTER_INSTANCE" "CHARACTER_NO" "http_get:character/delete.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INSTANCE.xlsx" "CHARACTER_INSTANCE" "CHARACTER_NO" "http_get:character/get.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_get:monster/all.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_get:monster/get.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/CHARACTER_INSTANCE.xlsx" "CHARACTER_INSTANCE" "CHARACTER_NO" "http_get:character/list.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/COUPON_INSTANCE.xlsx" "COUPON_INSTANCE" "COUPON_INDEX" "http_get:coupon/use.json:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_get:stage/all.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_get:stage/get.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_get:stage/destroy.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_get:stage_result/result.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_CLEAR_INSTANCE.xlsx" "STAGE_CLEAR_INSTANCE" "CHARACTER_NO" "http_get:stage_clear/get.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_CLEAR_INSTANCE.xlsx" "STAGE_CLEAR_INSTANCE" "CHARACTER_NO" "http_get:stage_clear/new.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_CLEAR_INSTANCE.xlsx" "STAGE_CLEAR_INSTANCE" "CHARACTER_NO" "http_get:stage_clear/save.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_CLEAR_INSTANCE.xlsx" "STAGE_CLEAR_INSTANCE" "CHARACTER_NO" "http_get:stage_clear/destroy.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_INSTANCE.xlsx" "MASTERY_INSTANCE" "GROUP_NO" "http_get:mastery/all.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MAIL_INSTANCE.xlsx" "MAIL_INSTANCE" "MAIL_NO" "http_get:mail/all.json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/new.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/get.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/search.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/set.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/result.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/nomercy.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_RECORD_INSTANCE.xlsx" "PVP_RECORD_INSTANCE" "PVP_RECORD_INSTANCE_NO" "http_get:pvp/getrecord.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/DAYCHECK_INSTANCE.xlsx" "DAYCHECK_INSTANCE" "DAYCHECK_NO" "http_get:daycheck/get.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "http_get:friend/get.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "http_get:friend/delete.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "http_get:friend/answer.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "http_get:friend/sendpoint.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "http_get:friend/propose.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/FRIEND_INSTANCE.xlsx" "FRIEND_INSTANCE" "FRIEND_NO" "http_get:friend/sendgift.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO" "http_get:quest/get.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_INFO_ID" "http_get:quest/set.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO" "http_get:quest/create.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO" "http_get:quest/update.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_INFO_ID"  "http_get:stamp/set.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO"  "http_get:stamp/get.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/SERVER_LIST.xlsx" "SERVER_LIST" "INDEX" "http_get:server_list/get.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_get:stage_result/continue.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_INSTANCE.xlsx" "MASTERY_INSTANCE" "GROUP_NO" "http_get:mastery_save/reset.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MAX_VALUE_INFO.xlsx" "MAX_VALUE_INFO" "MAX_VALUE_ID" "http_get:maxvalue/get.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_RANK_CACHE_INSTANCE.xlsx" "PVP_RANK_CACHE_INSTANCE" "PVP_RANK_CACHE_INSTANCE_NO" "http_get:pvp/getrank.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/end_of_competition.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/reply_action.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_get:monster_evolution/evolution.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_get:monster_evolution/evolution_confirm.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/nickname_duplicate_check.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/battle_info.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_get:user/get_user_and_lastestchr.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/TUTORIAL_INSTANCE.xlsx" "TUTORIAL_INSTANCE" "TUTORIAL_NO" "http_get:tutorial/set.json:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/TUTORIAL_INSTANCE.xlsx" "TUTORIAL_INSTANCE" "TUTORIAL_NO" "http_get:tutorial/get.json:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO" "http_get:quest/set_quest.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/NOTICE_INSTANCE.xlsx" "NOTICE_INSTANCE" "NOTICE_NO" "http_get:notice/get.json:result_multi" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/HTTP_DUMMY.xlsx" "RESULT_CUSTOM" "RESULT_CUSTOM" "http_get:shop/get_key.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/end_of_competition_1st.json:param_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "http_get:pvp/end_of_competition_2nd.json:param_single" "../../program"
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