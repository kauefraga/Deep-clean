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

echo [1] Prosseguir com a limpeza profunda
echo [2] Activate energy plan (ReviOS energyplan)
echo.
echo [3] Exit

set /p opcao=Write your op 

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

:: pega as guid e joga pra i.txt
powercfg /l > C:\energyplan\i.txt

:: pega o guid e joga pra h.txt
for /f "tokens=6 skip=4" %%a in (C:\energyplan\i.txt) do echo %%a > c:\energyplan\h.txt

:: pega o guid h.txt e joga na variavel "g"
set /p g= < c:\energyplan\h.txt

echo %g%

:: se "g" existe joga pra gr
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