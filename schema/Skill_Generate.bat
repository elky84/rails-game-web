REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "SKILL_SCRIPT.xlsx" "SKILL_SCRIPT" "SKILL_ID" "unity|json|rails_scaffold"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "SKILL_REACTION_SCRIPT.xlsx" "SKILL_REACTION_SCRIPT" "SKILL_REACTION_ID" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "DAMAGE_SCRIPT.xlsx" "DAMAGE_SCRIPT" "index" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "SKILL_ENCHANT.xlsx" "SKILL_ENCHANT" "SKILL_ENCHANT_ID" "unity|json|rails_scaffold"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "SKILL_INSTANCE.xlsx" "SKILL_INSTANCE" "SKILL_NO" "unity|rails_scaffold"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "SKILL_ACTIVE_SCRIPT.xlsx" "SKILL_ACTIVE_SCRIPT" "SKILL_ACTIVE_ID" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.