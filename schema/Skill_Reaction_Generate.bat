REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/00_REACTIONS_SYSTEM.xlsx" "REACTION_LIST" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/01_REACTION_AREA_AIR_BORNE.xlsx" "REACTION_AREA_AIR_BORNE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/02_REACTION_AREA_DEBUF.xlsx" "REACTION_AREA_DEBUF" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/03_REACTION_AREA_DAMAGE.xlsx" "REACTION_AREA_DAMAGE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/04_REACTION_AREA_DAMAGE_TIME.xlsx" "REACTION_AREA_DAMAGE_TIME" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/05_REACTION_AREA_EFFECT.xlsx" "REACTION_AREA_EFFECT" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/06_REACTION_AREA_KNOCK_BACK.xlsx" "REACTION_AREA_KNOCK_BACK" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/07_REACTION_AREA_LINK_HEAL_TIME.xlsx" "REACTION_AREA_LINK_HEAL_TIME" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/08_REACTION_AREA_STUN.xlsx" "REACTION_AREA_STUN" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/09_REACTION_BOUNCING_BULLET.xlsx" "REACTION_BOUNCING_BULLET" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/10_REACTION_DASH_NEAR_ATTACK.xlsx" "REACTION_DASH_NEAR_ATTACK" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/11_REACTION_FIRE_BULLET.xlsx" "REACTION_FIRE_BULLET" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/12_REACTION_FIRE_BULLET_CONE.xlsx" "REACTION_FIRE_BULLET_CONE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/13_REACTION_GUIDED_MISSILE.xlsx" "REACTION_GUIDED_MISSILE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/14_REACTION_MAKE_CLONE.xlsx" "REACTION_MAKE_CLONE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/15_REACTION_MAKE_LAND_MINE.xlsx" "REACTION_MAKE_LAND_MINE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/16_REACTION_MAKE_SHIELD.xlsx" "REACTION_MAKE_SHIELD" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/17_REACTION_MAKE_TOTEM.xlsx" "REACTION_MAKE_TOTEM" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/18_REACTION_NEAR_ATTACK.xlsx" "REACTION_NEAR_ATTACK" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/19_REACTION_PLAY_CFX_EFFECT.xlsx" "REACTION_PLAY_CFX_EFFECT" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/20_REACTION_SELF_BUF.xlsx" "REACTION_SELF_BUF" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/21_REACTION_SPEND_MANA.xlsx" "REACTION_SPEND_MANA" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/22_REACTION_BACK_DASH.xlsx" "REACTION_BACK_DASH" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/23_REACTION_COMBO.xlsx" "REACTION_COMBO" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/24_REACTION_SUMMON_ACTOR.xlsx" "REACTION_SUMMON_ACTOR" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/25_REACTION_WHEEL_WIND.xlsx" "REACTION_WHEEL_WIND" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/26_REACTION_AREA_BUF.xlsx" "REACTION_AREA_BUF" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/27_REACTION_FORCED_MOVE.xlsx" "REACTION_FORCED_MOVE" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/30_REACTION_CHANGE_SKILL.xlsx" "REACTION_CHANGE_SKILL" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/31_REACTION_BULLET_TIME.xlsx" "REACTION_BULLET_TIME" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/32_REACTION_DOWN_ATTACK.xlsx" "REACTION_DOWN_ATTACK" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/33_REACTION_PLAY_SOUND.xlsx" "REACTION_PLAY_SOUND" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/34_REACTION_CHANGE_SPINE_COLOR.xlsx" "REACTION_CHANGE_SPINE_COLOR" "index" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "skill/reaction/35_REACTION_MAKE_COLOR_SCREEN.xlsx" "REACTION_MAKE_COLOR_SCREEN" "INDEX" "unity|json" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.