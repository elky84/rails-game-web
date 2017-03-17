REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

set VERSION=DevTest
set IP=elky.ddns.net
set PORT=21
set ID=admin
set PASSWORD=lv999ftp


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "JSON_LIST.xlsx" "LIST" "INDEX" "json:patchdata" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby JSON_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD%
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