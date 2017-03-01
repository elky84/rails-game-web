REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "GACHA.xlsx" "GACHA" "GACHA_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "GACHA_GROUP.xlsx" "GACHA_GROUP" "GACHA_GROUP_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "GACHA_MACHINE.xlsx" "GACHA_MACHINE" "GACHA_MACHINE_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error


GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.