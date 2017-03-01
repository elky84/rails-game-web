REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "LOG_INSTANCE.xlsx" "LOG_INSTANCE" "LOG_NO" "rails_scaffold"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.