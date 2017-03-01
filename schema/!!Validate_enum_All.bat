REM Character_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_data.rb" "../enum" "." "string_table/" "skill/reaction"
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