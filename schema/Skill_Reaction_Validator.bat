REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_skillreaction_index.rb" "SKILL_REACTION_SCRIPT.xlsx" "SKILL_REACTION_SCRIPT" "REACTION" "skill/reaction/" "00_REACTIONS_SYSTEM.xlsx"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_skillreaction_index.rb" "SKILL_REACTION_SCRIPT.xlsx" "SKILL_REACTION_SCRIPT" "HIT_REACTION" "skill/reaction/" "00_REACTIONS_SYSTEM.xlsx"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "skill/reaction/02_REACTION_AREA_DEBUF.xlsx" "REACTION_AREA_DEBUF" "buf_skill_index" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/03_REACTION_AREA_DAMAGE.xlsx" "REACTION_AREA_DAMAGE" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/04_REACTION_AREA_DAMAGE_TIME.xlsx" "REACTION_AREA_DAMAGE_TIME" "damage_per_second"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/05_REACTION_AREA_EFFECT.xlsx" "REACTION_AREA_EFFECT" "effect_prefeb_name" "../../../Sunbee/program/Assets/NotIncludeResources/@Effect" "prefab"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/07_REACTION_AREA_LINK_HEAL_TIME.xlsx" "REACTION_AREA_LINK_HEAL_TIME" "heal_per_second"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/09_REACTION_BOUNCING_BULLET.xlsx" "REACTION_BOUNCING_BULLET" "bullet_prefeb" "../../../Sunbee/program/Assets/Resources/Prefebs/Spine" "prefab"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/10_REACTION_DASH_NEAR_ATTACK.xlsx" "REACTION_DASH_NEAR_ATTACK" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/11_REACTION_FIRE_BULLET.xlsx" "REACTION_FIRE_BULLET" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "skill/reaction/11_REACTION_FIRE_BULLET.xlsx" "REACTION_FIRE_BULLET" "apply_buf" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/11_REACTION_FIRE_BULLET.xlsx" "REACTION_FIRE_BULLET" "bullet_prefeb" "../../../Sunbee/program/Assets/Resources/Prefebs" "prefab"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/12_REACTION_FIRE_BULLET_CONE.xlsx" "REACTION_FIRE_BULLET_CONE" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/12_REACTION_FIRE_BULLET_CONE.xlsx" "REACTION_FIRE_BULLET_CONE" "bullet_prefeb" "../../../Sunbee/program/Assets/Resources" "prefab"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/13_REACTION_GUIDED_MISSILE.xlsx" "REACTION_GUIDED_MISSILE" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/13_REACTION_GUIDED_MISSILE.xlsx" "REACTION_GUIDED_MISSILE" "bullet_prefeb" "../../../Sunbee/program/Assets/Resources/Prefebs" "prefab"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "skill/reaction/15_REACTION_MAKE_LAND_MINE.xlsx" "REACTION_MAKE_LAND_MINE" "BUF_LIST" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/18_REACTION_NEAR_ATTACK.xlsx" "REACTION_NEAR_ATTACK" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/19_REACTION_PLAY_CFX_EFFECT.xlsx" "REACTION_PLAY_CFX_EFFECT" "obj_play" "../../../Sunbee/program/Assets/NotIncludeResources/@Effect" "prefab"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "skill/reaction/20_REACTION_SELF_BUF.xlsx" "REACTION_SELF_BUF" "buf_skill" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/23_REACTION_COMBO.xlsx" "REACTION_COMBO" "damage_list"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/25_REACTION_WHEEL_WIND.xlsx" "REACTION_WHEEL_WIND" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "skill/reaction/26_REACTION_AREA_BUF.xlsx" "REACTION_AREA_BUF" "buf_skill_index" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_damage.rb" "skill/reaction/27_REACTION_FORCED_MOVE.xlsx" "REACTION_FORCED_MOVE" "damage"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_index.rb" "skill/reaction/30_REACTION_CHANGE_SKILL.xlsx" "REACTION_CHANGE_SKILL" "link_skill" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/Validator_file_exist.rb" "skill/reaction/33_REACTION_PLAY_SOUND.xlsx" "REACTION_PLAY_SOUND" "SOUND_NAME" "../../../Sunbee/program/Assets/NotIncludeResources/@Sound" "mp3"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.