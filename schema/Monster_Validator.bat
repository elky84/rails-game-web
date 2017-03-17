REM Monster_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_pail.rb" "MONSTER_ENCHANT.xlsx" "MONSTER_ENCHANT" "ENCHANT_RESULT" "ENCHANT_PERCENT"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_pail.rb" "MONSTER_ENCHANT.xlsx" "MONSTER_ENCHANT" "BASE_EXP" "LEVEL_BONUS_EXP"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MONSTER_ENCHANT_BONUS.xlsx" "MONSTER_ENCHANT_BONUS" "STATUS_ID" "STATUS.xlsx" "STATUS" "STATUS_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MONSTER_GRADE_BONUS.xlsx" "MONSTER_GRADE_BONUS" "STATUS_ID" "STATUS.xlsx" "STATUS" "STATUS_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MONSTER_GROW.xlsx" "MONSTER_GROW" "STATUS_ID" "STATUS.xlsx" "STATUS" "STATUS_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MONSTER_INFO.xlsx" "MONSTER_INFO" "ACTOR_ID" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "index" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "MONSTER_SORT_INFO.xlsx" "MONSTER_SORT_INFO" "NAME" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.