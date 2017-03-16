REM Gacha_Validator.bat start
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/Validator_pail.rb" "GACHA.xlsx" "GACHA" "GROUP_ID" "REWARD_PROBABILITY"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/Validator_index.rb" "GACHA.xlsx" "GACHA" "GROUP_ID" "GACHA_GROUP.xlsx" "GACHA_GROUP" "GACHA_GROUP_ID" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.