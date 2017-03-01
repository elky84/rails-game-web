@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "SHORT_CUT.xlsx" "SHORT_CUT" "SHORT_CUT_ID" "unity|json" "../../program"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error


GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.