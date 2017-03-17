REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "http_update:item/sell.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "http_update:item_equip/save.json:param_multi" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "http_update:item_reoption/reoption.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "http_update:item_enchant/enchant.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error



ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/SKILL_INSTANCE.xlsx" "SKILL_INSTANCE" "SKILL_NO" "http_update:skill/enchant.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/SKILL_INSTANCE.xlsx" "SKILL_INSTANCE" "SKILL_NO" "http_update:skill/save.json:param_multi" "../../program"
IF %errorlevel% NEQ 0 GOTO :error



ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MASTERY_INSTANCE.xlsx" "MASTERY_INSTANCE" "MASTERY_NO" "http_update:mastery_save/save.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_update:stage/save.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "http_update:stage/get.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/STAGE_CLEAR_INSTANCE.xlsx" "STAGE_CLEAR_INSTANCE" "CHARACTER_NO" "http_update:stage_clear/save.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_update:user/heartbeat.json:param_single:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_update:monster/save.json:param_multi" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_update:monster/new.json:param_multi" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/HTTP_DUMMY.xlsx" "RESULT_CUSTOM" "RESULT_CUSTOM" "http_update:monster/destroy.json:param_none:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/HTTP_DUMMY.xlsx" "RESULT_CUSTOM" "RESULT_CUSTOM" "http_update:mail/receive.json:param_none:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/HTTP_DUMMY.xlsx" "RESULT_CUSTOM" "RESULT_CUSTOM" "http_update:mail/receive_all.json:param_none:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/HTTP_DUMMY.xlsx" "RESULT_CUSTOM" "RESULT_CUSTOM" "http_update:quest/drop.json:param_none:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/HTTP_DUMMY.xlsx" "RESULT_CUSTOM" "RESULT_CUSTOM" "http_update:shop/buy.json:param_none:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_update:monster/enchant.json:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "http_update:mastery/buypoint.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_INFO_ID" "http_update:quest/create.json:param_multi:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/TUTORIAL_INSTANCE.xlsx" "TUTORIAL_INSTANCE" "TUTORIAL_NO" "http_update:tutorial/update.json:param_single:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO" "http_update:quest/update_quest.json:param_multi" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/REPORT_INSTANCE.xlsx" "REPORT_INSTANCE" "REPORT_NO" "http_update:report/write.json:param_none:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "http_update:item/select_sell.json:param_multi:result_custom" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "http_update:monster_evolution/evolution.json:param_multi:result_custom" "../../program"
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