REM �Ķ���� ����
REM excel_file_name, sheet_name, key, option, destination, web_address
@echo off

ruby -I "../../gundam_base/SazabiExcel" "../../gundam_base/SazabiExcel/ExcelReader.rb" "BUF_SKILL.xlsx" "BUF_SKILL" "BUF_INDEX" "unity|json"  "../../program"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.