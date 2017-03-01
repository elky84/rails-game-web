REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_INSTANCE.xlsx" "ITEM_INSTANCE" "ITEM_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_INFO.xlsx" "ITEM_INFO" "ITEM_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_OPTION.xlsx" "ITEM_OPTION" "ITEM_OPTION_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_CATEGORY_INFO.xlsx" "ITEM_CATEGORY_INFO" "CATEGORY" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_ENCHANT.xlsx" "ITEM_ENCHANT" "ITEM_ENCHANT_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_ENCHANT_EFFECT.xlsx" "ITEM_ENCHANT_EFFECT" "ITEM_ENCHANT_EFFECT_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "ITEM_REOPTION.xlsx" "ITEM_REOPTION" "ITEM_REOPTION_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "EQUIP_TYPE_INFO.xlsx" "EQUIP_TYPE_INFO" "LIMIT_TYPE" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.