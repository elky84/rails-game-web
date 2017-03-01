REM Character_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "GROW_INFO.xlsx" "GROW_INFO" "NAME" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.