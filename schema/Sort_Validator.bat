REM Sort_Validator.bat start
@echo off

ruby -I "../../../gundam_base/SazabiExcel" "../../../gundam_base/SazabiExcel/Validator_index.rb" "SORT_INFO.xlsx" "SORT_INFO" "NAME" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.