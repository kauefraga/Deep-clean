echo off
cls
color 4 
echo ==================================================================
echo.
echo            Panel of deep cleaning and optimizations
echo.
echo ==================================================================
echo.
echo.
echo [1] Proceed to deep clean
echo.
echo [2] Exit

set /p option=Type your option: 

if "%option%" == "1" goto op1
if "%option%" == "2" goto op2

:op1
echo cleaning...
if exist c:\windows\temp\ del /f /s /q c:\windows\temp\ 
del /f /s /q %temp%\
del /f /s /q c:\windows\prefetch\
"C:\WINDOWS\system32\dfrgui" > nul
pause
goto op2


:op2
exit > nul
