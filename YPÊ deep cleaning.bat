:inicio
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
echo [2] Activate energy plan (ReviOS energyplan)
echo.
echo [3] Exit

set /p opcao=Type your option: 

if "%opcao%" == "1" goto op1
if "%opcao%" == "2" goto op2
if "%opcao%" == "3" goto op3

:op1
if exist c:\windows\temp\ del /f /s /q c:\windows\temp\ 
del /f /s /q %temp%\
del /f /s /q c:\windows\prefetch\
"C:\WINDOWS\system32\dfrgui" > nul
goto inicio

:op2
powercfg /import C:\energyplan\RevisionPlan.pow

powercfg /l > C:\energyplan\i.txt

for /f "tokens=6 skip=4" %%a in (C:\energyplan\i.txt) do echo %%a > c:\energyplan\h.txt

set /p g= < c:\energyplan\h.txt

echo %g%

if exist %g% goto :gr

:gr

powercfg /s %g%

echo %g%

del /f /s /q c:\energyplan\i.txt > nul 
del /f /s /q c:\energyplan\h.txt > nul

echo let's clean temp files and optimizing local disc
pause
goto op1

:op3
exit > nul
