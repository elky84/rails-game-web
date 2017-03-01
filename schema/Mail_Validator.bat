REM Mail_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "MAIL_RECEIVE_TYPE.xlsx" "MAIL_RECEIVE_TYPE" "CONTENT_STR_INDEX" "string_table/ui_text_script.xlsx" "UI_TEXT" "INDEX" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.