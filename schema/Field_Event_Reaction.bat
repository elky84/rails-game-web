REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FIELD_EVENT_REACTION_LIST.xlsx" "FIELD_EVENT_REACTION_LIST" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_REACTION_AREA_DAMAGE.xlsx" "FE_REACTION_AREA_DAMAGE" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_REACTION_GENERATE_ACTOR.xlsx" "FE_REACTION_GENERATE_ACTOR" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_REACTION_PLAY_CFX_EFFECT.xlsx" "FE_REACTION_PLAY_CFX_EFFECT" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_REACTION_DIALOG.xlsx" "FE_REACTION_DIALOG" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.