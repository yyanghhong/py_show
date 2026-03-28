for /f %%a in ('date /t') do set DAY=%%a
echo %DAY%
echo.


IF %DAY% EQU       Sat GOTO stock_check_time

GOTO exit

:stock_check_time

cd D:\git\panda-test\py_show
git commit -am "test"
git push origin master

:exit

rem exit 