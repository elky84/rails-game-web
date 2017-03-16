REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_INSTANCE.xlsx" "PVP_INSTANCE" "CHARACTER_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_SUCCESSION_BONUS_INFO.xlsx" "PVP_SUCCESSION_BONUS_INFO" "PVP_SUCCESSION_BONUS_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_RECORD_INSTANCE.xlsx" "PVP_RECORD_INSTANCE" "PVP_RECORD_INSTANCE_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_RANGE.xlsx" "PVP_RANGE" "PVP_RANGE_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_RANK_CACHE_INSTANCE.xlsx" "PVP_RANK_CACHE_INSTANCE" "PVP_RANK_CACHE_INSTANCE_NO" "rails_scaffold|unity"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_REWARD_INFO.xlsx" "PVP_REWARD_INFO" "PVP_REWARD_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/ExcelReader.rb" "PVP_PERIOD.xlsx" "PVP_PERIOD" "PVP_PERIOD_ID" "rails_scaffold|unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end

:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.