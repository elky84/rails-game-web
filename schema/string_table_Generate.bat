REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" "json|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "string_table/scenario_text_script.xlsx" "SCENARIO_TEXT" "INDEX" "json|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "string_table/charactor_name_text_script.xlsx" "CHARACTOR_NAME" "INDEX" "json|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.