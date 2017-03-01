REM DayCheck_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_file_exist.rb" "DAYCHECK.xlsx" "DAYCHECK" "ICON" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Icons" "png"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.