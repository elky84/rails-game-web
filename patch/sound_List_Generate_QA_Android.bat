REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off


set VERSION=QA_20151118_00
set IP=211.253.11.167
set PORT=30021
set ID=admin
set PASSWORD=lv999ftp


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "sound_list.xlsx" "SOUND_LIST" "INDEX" "json:patchdata" "../../program" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\Area\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\SFX\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\Skill\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\Voice\\"
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