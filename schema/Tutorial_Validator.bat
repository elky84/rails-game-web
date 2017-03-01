REM Tutorial_Validator.bat start
@echo off

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/Validator_file_exist.rb" "TUTORIAL.xlsx" "TUTORIAL" "SPINE" "../../../Sunbee/program/Assets/NotIncludeResources/@Spine_01" "asset"
IF %errorlevel% NEQ 0 GOTO :error

GOTO :end


:error
echo error caught. invalid excel files.
color c
pause
EXIT 1

:end
echo Perfectly success.