REM Item_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "EQUIP_TYPE_INFO.xlsx" "EQUIP_TYPE_INFO" "NAME" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "ITEM_CATEGORY_INFO.xlsx" "ITEM_CATEGORY_INFO" "NAME" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "ITEM_INFO.xlsx" "ITEM_INFO" "ICON" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Equipments|../../../Sunbee/program/Assets/NotIncludeResources/UI/@Costume" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "ITEM_OPTION.xlsx" "ITEM_OPTION" "OPTION_ID" "OPTION.xlsx" "OPTION" "OPTION_ID" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.