REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "AREA_INFO.xlsx" "AREA_INFO" "AREA_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "STAGE_INFO.xlsx" "STAGE_INFO" "STAGE_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "PHASE_INFO.xlsx" "PHASE_INFO" "PHASE_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "MONSTER_GEN_INFO.xlsx" "MONSTER_GEN_INFO" "INDEX" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "STAGE_INSTANCE.xlsx" "STAGE_INSTANCE" "STAGE_PROGRESS_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "STAGE_CLEAR_INSTANCE.xlsx" "STAGE_CLEAR_INSTANCE" "CHARACTER_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.