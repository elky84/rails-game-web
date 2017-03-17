REM 파라미터 순서
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off


ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "../schema/QUEST_INSTANCE.xlsx" "QUEST_INSTANCE" "QUEST_NO" "json:parser:result_single" "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.

pause