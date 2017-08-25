@echo off
REM Touch the batch file to keep it on top

REM Get the date using windows api and split the data into variables
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "skip=1 tokens=1-6" %%A IN ('WMIC ^Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table ') DO (
	IF %%A GTR 0 (
		SET Day=%%A
		SET Hour=%%B
		SET Min=%%C
		SET Month=%%D
		SET Sec=%%E
		SET Year=%%F
	)
)

REM Format the month and day to keep file name length same
if %Month% LSS 10 set Month=0%Month%
if %Day% LSS 10 set Day=0%Day%

REM Generate file name based on variables required - can modify as per need
set now=%Day%%Month%%Year%
set now=%now%

REM Add any message and open it with associated application
echo Good Morning > %now%.txt
%now%.txt