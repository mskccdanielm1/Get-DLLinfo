@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

for /R "C:\Windows\Microsoft.NET\" %%* in (*System.directoryservices.dll*) do call :Sub %%*
goto :eof

:Sub

set pc=%*
set str=%*
set str=%str:\=\\%

FOR /F "skip=1 delims=" %%T IN ('wmic datafile where "name='%STR%'" get version ^| findstr /r /v "^$" ') DO echo %pc% %%T