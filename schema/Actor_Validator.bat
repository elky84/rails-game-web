REM Actor_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "random_skill_list" "random_skill_percent"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_pail.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "special_skill" "special_skill_percent"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_file_exist.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "spine_name" "../../../Sunbee/program/Assets/NotIncludeResources/@Spine_01" "asset"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_file_exist.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "ui_sprite_name" "../../../Sunbee/program/Assets/NotIncludeResources/UI/@Thumbnails" "png"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_file_exist.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "VOICE" "../../../Sunbee/program/Assets/NotIncludeResources/@Sound" "mp3"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "skill_list" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "random_skill_list" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "ACTOR_STATUS_SCRIPT.xlsx" "ACTOR_STATUS_SCRIPT" "special_skill" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

ac
:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.