REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

set IP=211.253.11.167
set PORT=30021
set ID=admin
set PASSWORD=lv999ftp

REM @@@ Making BG @@@
ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "BG_list.xlsx" "BG_LIST" "INDEX" "json:patchdata" "" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby BG_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android
IF %errorlevel% NEQ 0 GOTO :error


REM @@@ Making Effect @@@
ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "effect_list.xlsx" "EFFECT_LIST" "INDEX" "json:patchdata" "" "Android"
IF %errorlevel% NEQ 0 GOTO :error


ruby EFFECT_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android
IF %errorlevel% NEQ 0 GOTO :error

REM  @@@ Makeing Sound @@@
ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "sound_list.xlsx" "SOUND_LIST" "INDEX" "json:patchdata" "../../program" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\Area\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\SFX\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\Skill\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby sound_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "Sound\\Clip\\Voice\\"
IF %errorlevel% NEQ 0 GOTO :error


REM @@@ Making Spine @@@

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "spine_list.xlsx" "SPINE_LIST" "INDEX" "json:patchdata" "../../program" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby spine_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android
IF %errorlevel% NEQ 0 GOTO :error


REM @@@ Making Texture @@@
ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "texture_list.xlsx" "TEXTURE_LIST" "INDEX" "json:patchdata" "../../program" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "texture_list.xlsx" "ALPHA_TEXTURE_LIST" "INDEX" "json:patchdata" "../../program" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Equipments\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Event\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Loading\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Mastery\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Scenario_Chr_Imgs\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Shop_Items\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Skills\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Skills\\Buff\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Thumbnails\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Title\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Img_Textures\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Img_Textures\\Ad_Img\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Img_Textures\\Guide_UI_Img\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Img_Textures\\Tutorial_Img\\"
IF %errorlevel% NEQ 0 GOTO :error

ruby texture_Patch.rb %VERSION% %IP% %PORT% %ID% %PASSWORD% Android "UI\\Textures\\Icon\\"
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