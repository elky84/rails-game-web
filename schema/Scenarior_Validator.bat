REM Scenario_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "APPLY_CHARACTER" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "index" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "SPEECH_BACK" "../../../Sunbee/program/Assets/NotIncludeResources/UI/Atlas/Source" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "CHARACTER_FACE" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Scenario" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "CHARACOTR_INDEX" "string_table/charactor_name_text_script.xlsx" "CHARACTOR_NAME" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "STRING_INDEX" "string_table/scenario_text_script.xlsx" "SCENARIO_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.