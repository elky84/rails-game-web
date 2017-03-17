REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FIELD_EVENT_TRIGER_LIST.xlsx" "FIELD_EVENT_TRIGER_LIST" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_TRIGER_AREA_CHECK.xlsx" "FE_TRIGER_AREA_CHECK" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_TRIGER_STAGE_CHECK.xlsx" "FE_TRIGER_STAGE_CHECK" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "field_event/FE_TRIGER_STAGE_CLEAR.xlsx" "FE_TRIGER_STAGE_CLEAR" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.