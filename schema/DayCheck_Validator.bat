REM DayCheck_Validator.bat start
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/Validator_file_exist.rb" "DAYCHECK.xlsx" "DAYCHECK" "ICON" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Icons" "png"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.