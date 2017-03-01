REM Guide_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "GUIDE_INFO.xlsx" "GUIDE_INFO" "CATEGORY_NAME" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "GUIDE_INFO.xlsx" "GUIDE_INFO" "UI_TEXT" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_file_exist.rb" "GUIDE_INFO.xlsx" "GUIDE_INFO" "IMG_PREFEBS" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Img_Textures" "png"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.