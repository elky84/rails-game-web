REM Parameter_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "OPTION.xlsx" "OPTION" "CONDITION_ID" "CONDITION.xlsx" "CONDITION" "CONDITION_ID" 
IF %errorlevel% NEQ 0 GOTO :error

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_index.rb" "OPTION.xlsx" "OPTION" "PARAMETER_ID" "PARAMETER.xlsx" "PARAMETER" "PARAMETER_ID" 
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.