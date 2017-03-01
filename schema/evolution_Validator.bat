REM evolution_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "EVOLUTION_INFO.xlsx" "EVOLUTION_INFO" "SPECIAL_MONSTER_LIST" "MONSTER_INFO.xlsx" "MONSTER_INFO" "MONSTER_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "EVOLUTION_INFO.xlsx" "EVOLUTION_INFO" "SPECIAL_SKILL_LIST" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "EVOLUTION_INFO.xlsx" "EVOLUTION_INFO" "RESULT" "GACHA_GROUP.xlsx" "GACHA_GROUP" "GACHA_GROUP_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "EVOLUTION_INFO.xlsx" "EVOLUTION_INFO" "RESULT" "RESULT_PERCENT"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.