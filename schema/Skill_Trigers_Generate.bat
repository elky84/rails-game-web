REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "skill/triger/TRIGER_LIST.xlsx" "TRIGER_LIST" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "skill/triger/TRIGER_MANA_CHECK_SCRIPT.xlsx" "TRIGER_MANA_CHECK_SCRIPT" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "skill/triger/TRIGER_CHANCE_SCRIPT.xlsx" "TRIGER_CHANCE_SCRIPT" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "skill/triger/TRIGER_HP_CHECK_SCRIPT.xlsx" "TRIGER_HP_CHECK_SCRIPT" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error



GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.