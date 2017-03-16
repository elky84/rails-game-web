REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off


ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_INSTANCE.xlsx" "MONSTER_INSTANCE" "MONSTER_NO" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_INFO.xlsx" "MONSTER_INFO" "MONSTER_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_GROW.xlsx" "MONSTER_GROW" "GROW_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_GRADE_BONUS.xlsx" "MONSTER_GRADE_BONUS" "GRADE" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_ENCHANT_BONUS.xlsx" "MONSTER_ENCHANT_BONUS" "MONSTER_TYPE" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_ENCHANT.xlsx" "MONSTER_ENCHANT" "MONSTER_ENCHANT_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.