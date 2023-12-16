@echo off
color 9
:: BatchGotAdmin
:-------------------------------------

REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)


REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
:menu
cls
echo `OooOOo.                                   o       o.oOOOo.                                 
echo o     `o                                 O         o     o                                 
echo O      O                                 o         O     O                                 
echo o     .O                                 o         oOooOO.                                 
echo OOooOO'  .oOo. 'o     O .oOoO' .oOo  .oOoO         o     `O O   o .oOo. .oOoO' .oOo  .oOo  
echo o    o   OooO'  O  o  o O   o  `Ooo. o   O         O      o o   O O   o O   o  `Ooo. `Ooo. 
echo O     O  O      o  O  O o   O      O O   o         o     .O O   o o   O o   O      O     O 
echo O      o `OoO'  `Oo'oO' `OoO'o `OoO' `OoO'o        `OooOO'  `OoOO oOoO' `OoO'o `OoO' `OoO' 
echo                                                                 o O                        
echo                                                              OoO' o'                       
echo Made By Noam
echo -------------------------
echo Run these steps from 1-5!:)
echo -------------------------
echo 1) Change Volume ID
echo 2) New Hardware Profile
echo 3) New UUID
echo 4) Uninstall reWASD
echo 5) Download Latest Rewasd Version
echo Press ctrl C to exit
SET /p question=?


IF %question%==1 goto :volid
IF %question%==2 goto :hardware
IF %question%==3 goto :UUID
IF %question%==4 goto :uninstall
IF %question%==5 goto :install

:install
explorer "https://www.rewasd.com/"
echo 
echo -----------------------------------
echo DONE! Press any button to continue
echo -----------------------------------
pause
GOTO :menu

:uninstall
echo What is the reWASD install location?
echo 1) Default
echo 2) Custom
SET /p uninstall=?
IF %uninstall%==1 cls && echo READ THE INSTRUCTIONS CAREFULLY && echo ---------------------------------- && echo When the uninstaller opens press "SKIP THE QUESTIONNAIRE" and then ONLY TICK the "Remove my settings and activation info" box and then press "Uninstall". When it finished uninstalling press "Restart" and after the computer restarted download the latest reWASD version, install it on the computer and activate the free trial. ENJOY! && echo NOTE: you will need to do this process everytime the free trial ends to reactivate it && echo ---------------------------------- && echo wait a few seconds for the uninstaller to launch... && echo ---------------------------------- && "C:\Program Files\reWASD\uninst.exe"
IF %uninstall%==2 goto customun
echo 
echo -----------------------------------
echo Press Any Button When Uninstaller finished Uninstalling
echo -----------------------------------
pause
GOTO :menu

:customun
echo what is the reWASD folder location?
echo (eg. C:\Program Files\reWASD)
SET /p locationcu=? 
cls && echo READ THE INSTRUCTIONS CAREFULLY && echo ---------------------------------- && echo When the uninstaller opens press "SKIP THE QUESTIONNAIRE" and then ONLY TICK the "Remove my settings and activation info" box and then press "Uninstall". When it finished uninstalling press "Restart" and after the computer restarted download the latest reWASD version, install it on the computer and activate the free trial. ENJOY! && echo ---------------------------------- && echo wait a few seconds for the uninstaller to launch... && echo ---------------------------------- && "%locationcu%\uninst.exe"
echo 
echo -----------------------------------
echo Press Any Button When Uninstaller finished Uninstalling
echo -----------------------------------
pause
GOTO :menu


:volid
setlocal enabledelayedexpansion
REM Generate random numbers for the first and second parts of the serial
set "part1="
set "part2="
for /l %%i in (1,1,3) do (
    set /a "rand1=!random! %% 10"
    set /a "rand2=!random! %% 10"
    for %%x in (!rand1!) do set "part1=!part1!%%x"
    for %%x in (!rand2!) do set "part2=!part2!%%x"
)

set "serial=%part1%-%part2%"
echo Generated Serial: %serial%
volumeid64.exe c: %serial%
echo 
echo -----------------------------------
echo DONE! Press any button to continue
echo -----------------------------------
pause
GOTO :menu

:hardware
REM Query the current value
for /f "tokens=2,*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware Profiles\0001" /v HwProfileGuid ^| find "HwProfileGuid"') do set "currentValue=%%b"

echo Current Value: !currentValue!

REM Generate 4 random numbers
set "newNumbers="
for /l %%i in (1,1,4) do (
    set /a "rand=!random! %% 10"
    set "newNumbers=!newNumbers!!rand!"
)

echo Generated Numbers: !newNumbers!

REM Update the last 4 numbers in the value
set "newValue=!currentValue:~0,-5!!newNumbers!}"

echo New Value: !newValue!

REM Set the updated value in the registry
reg add "HKLM\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware Profiles\0001" /v HwProfileGuid /t REG_SZ /d "!newValue!" /f
echo 
echo -----------------------------------
echo DONE! Press any button to continue
echo -----------------------------------
pause
GOTO :menu


:UUID
REM Step 1: Generate a new System UUID and save it for later use
for /f "tokens=5" %%a in ('AMIDEWINx64.EXE /SU auto ^| find "(/SU)System UUID"') do set "newUUID=%%a"
echo Generated System UUID: %newUUID%

REM Step 2: Perform the /BS command with the generated UUID (replace the last three numbers)
set "modifiedUUID=%newUUID:~0,-4%123"
echo Modifying System UUID: %modifiedUUID%
AMIDEWINx64.EXE /BS %modifiedUUID%

REM Display a message indicating the process is complete
echo 
echo -----------------------------------
echo DONE! Press any button to continue
echo -----------------------------------
pause
GOTO :menu

endlocal
pause