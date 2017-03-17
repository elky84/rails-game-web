REM Shop_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "COSTUME_TYPE.xlsx" "COSTUME_TYPE" "SPINE_NAME" "../../../Sunbee/program/Assets/NotIncludeResources/@Spine_01" "asset"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "COSTUME_TYPE.xlsx" "COSTUME_TYPE" "THUMBNAIL_IMAGE" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Thumbnails" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SHOP_EVENT.xlsx" "SHOP_EVENT" "SHOP_ITEM_ID" "SHOP_ITEM.xlsx" "SHOP_ITEM" "SHOP_ITEM_ID" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.