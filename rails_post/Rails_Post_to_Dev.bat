set SERVER=http://lv999.net:3000/

call Rails_Post.bat %SERVER%

ruby -I "../../../GundamBase/SazabiExcel" "../../../GundamBase/SazabiExcel/ExcelReader.rb" "SERVER_LIST_DEV.xlsx" "SERVER_LIST" "INDEX" "rails_post:%SERVER%"
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