REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

set VERSION=Dev
set IP=lv999.net
set PORT=21
set ID=admin
set PASSWORD=lv999ftp


ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "BG_list.xlsx" "BG_LIST" "INDEX" "json:patchdata" "" "PC"
IF %errorlevel% NEQ 0 GOTO :error

ruby BG_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% PC
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