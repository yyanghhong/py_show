

for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do set datetime=%%a
set month=%datetime:~4,2%

:: 2. 去掉月份前的 0 (防止 CMD 将 08, 09 误认为八进制)
set /a month_num=1%month% - 100
echo %month_num%
:: 3. 计算奇偶 (取余数)
set /a result=%month_num% %% 2

:: 4. 逻辑判断
if %result% equ 1 GOTO stock_check_time


GOTO exit

:stock_check_time

for /f %%a in ('date /t') do set DAY=%%a
echo %DAY%
echo.

IF %DAY% EQU       Sat GOTO stock_check_time2


GOTO exit


:stock_check_time2

cd D:\git\panda-test\py_show
git add .
git commit -am "test"
git push origin main

:exit



rem exit 