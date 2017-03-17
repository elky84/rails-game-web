REM Skill_Validator.bat start
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "BUF_SKILL.xlsx" "BUF_SKILL" "OPTION_LINK" "OPTION.xlsx" "OPTION" "OPTION_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_ICON_NAME" "../../../Sunbee/program/Assets/NotIncludeResources/UI/Atlas/Source/Buff" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_pail.rb" "SKILL_ENCHANT.xlsx" "SKILL_ENCHANT" "ENCHANT_RESULT" "ENCHANT_PERCENT"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "PRE_SKILL" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "PASSIVE_APPLY_SKILL" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_ICON_NAME" "../../../Sunbee/program/Assets/NotIncludeResources/UI/Atlas/Source/Buff" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "ACTIVE_ID" "SKILL_ACTIVE_SCRIPT.xlsx" "SKILL_ACTIVE_SCRIPT" "SKILL_ACTIVE_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_REACTION_ID" "SKILL_REACTION_SCRIPT.xlsx" "SKILL_REACTION_SCRIPT" "SKILL_REACTION_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_OPTION_ID" "OPTION.xlsx" "OPTION" "OPTION_ID" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.