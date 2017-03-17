REM Mastery_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_pail.rb" "MASTERY_INFO.xlsx" "MASTERY_INFO" "OPTION_ID" "OPTION_EFFECT"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MASTERY_INFO.xlsx" "MASTERY_INFO" "OPTION_ID" "OPTION.xlsx" "OPTION" "OPTION_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MASTERY_INFO.xlsx" "MASTERY_INFO" "PRE_CONDITION" "MASTERY_INFO.xlsx" "MASTERY_INFO" "MASTERY_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "MASTERY_INFO.xlsx" "MASTERY_INFO" "ICON" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Mastery" "png"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.