REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "SORT_INFO.xlsx" "SORT_INFO" "SORT" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error
 
ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_SORT_INFO.xlsx" "MONSTER_SORT_INFO" "SORT" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error


GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.