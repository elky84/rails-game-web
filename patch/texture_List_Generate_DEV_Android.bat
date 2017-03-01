REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

set VERSION=Dev
set IP=lv999.net
set PORT=21
set ID=admin
set PASSWORD=lv999ftp

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "texture_list.xlsx" "TEXTURE_LIST" "INDEX" "json:patchdata" "../../program" "Android"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "texture_list.xlsx" "ALPHA_TEXTURE_LIST" "INDEX" "json:patchdata" "../../program" "Android"
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