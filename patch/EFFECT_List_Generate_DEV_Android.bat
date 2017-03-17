REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

set VERSION=Dev
set IP=elky.ddns.net
set PORT=21
set ID=admin
set PASSWORD=lv999ftp


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "effect_list.xlsx" "EFFECT_LIST" "INDEX" "json:patchdata" "" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby EFFECT_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.

pause