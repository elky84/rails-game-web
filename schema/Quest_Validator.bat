REM Quest_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "ACHIEVE_INFO.xlsx" "ACHIEVE_INFO" "ACHIEVE_ICON" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Scenario" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "QUEST_INFO.xlsx" "QUEST_INFO" "NEXT_QUEST_ID" "QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_INFO_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_SCHEDULE_ID" "QUEST_SCHEDULE.xlsx" "QUEST_SCHEDULE" "QUEST_SCHEDULE_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "QUEST_INFO.xlsx" "QUEST_INFO" "QUEST_TYPE_ID" "QUEST_TYPE.xlsx" "QUEST_TYPE" "QUEST_TYPE_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "QUEST_INFO.xlsx" "QUEST_INFO" "SHORT_CUT" "SHORT_CUT.xlsx" "SHORT_CUT" "SHORT_CUT_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "QUEST_INFO.xlsx" "QUEST_INFO" "COMPLETE_IMAGE" "../../../Sunbee/program/Assets/NotIncludeResources/@Spine_01" "asset"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.