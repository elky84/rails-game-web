REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "USER_INSTANCE.xlsx" "USER_INSTANCE" "USER_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "USER_GROW.xlsx" "USER_GROW" "GROW_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "USER_GIVE_INSTANCE.xlsx" "USER_GIVE_INSTANCE" "USER_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "USER_NICKNAME_PROHIBITED_LIST.xlsx" "USER_NICKNAME_PROHIBITED_LIST" "PROHIBITED_LIST_ID" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error


GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.