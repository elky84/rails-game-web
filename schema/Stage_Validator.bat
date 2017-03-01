REM Stage_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "AREA_INFO.xlsx" "AREA_INFO" "SCENARIO_START" "string_table/scenario_text_script.xlsx" "SCENARIO_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "AREA_INFO.xlsx" "AREA_INFO" "SCENARIO_END" "string_table/scenario_text_script.xlsx" "SCENARIO_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "PHASE_INFO.xlsx" "PHASE_INFO" "MONSTER" "MONSTER_GEN_INFO" "MONSTER_LV" "APPEAR_SPEED" "APPEAR_TIME" "TEAM_INDEX"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "PHASE_INFO.xlsx" "PHASE_INFO" "MONSTER" "MONSTER_INFO.xlsx" "MONSTER_INFO" "MONSTER_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "PHASE_INFO.xlsx" "PHASE_INFO" "MONSTER_GEN_INFO" "MONSTER_GEN_INFO.xlsx" "MONSTER_GEN_INFO" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "PHASE_INFO.xlsx" "PHASE_INFO" "START_SCENARIO" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "PHASE_INFO.xlsx" "PHASE_INFO" "END_SCENARIO" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "PHASE" "PHASE_INFO.xlsx" "PHASE_INFO" "PHASE_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "MONSTER" "MONSTER_INFO.xlsx" "MONSTER_INFO" "MONSTER_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "ITEM" "ITEM_INFO.xlsx" "ITEM_INFO" "ITEM_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "CLEAR_SCORE" "CLEAR_EXP" "CLEAR_MONEY"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "CLEAR_1_REWARD_PROBABILITY" "CLEAR_1_REWARD" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "CLEAR_2_REWARD" "CLEAR_2_REWARD_PROBABILITY" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "CLEAR_3_REWARD" "CLEAR_3_REWARD_PROBABILITY"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "START_SCENARIO" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "END_SCENARIO" "SCENARIO_SCRIPT.xlsx" "SCENARIO_SCRIPT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.