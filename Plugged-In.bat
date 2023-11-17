@echo off
cls
color 0f


Title Plugged In Rebuilder for UE5.3.2 by IndieUnlimited

goto menu: 

:menu
echo ******************************************************************
echo *            PLUGIN REBUILD TOOL     By Mr_Asterisk_Ceo        *
echo ******************************************************************

echo Note: Drag this script into the BatchFiles folder of your Unreal Engine installation.

echo Strike any Key to Continue To Rebuild a Plugin
pause >nul

setlocal enabledelayedexpansion

rem Check if the script is in the BATCHFILES folder
if /i not "%~dp0"=="%~dp0BatchFiles\" (
    echo Error: Drag this script into the BatchFiles folder of your Unreal Engine installation.
    pause
    exit /b 1
)

rem Find BatchFiles directory
for /r %%i in (BatchFiles) do set "BATCHFILES=%%i"
set "BATCHFILES=%BATCHFILES%"

rem Find Marketplace directory
for /r %%i in (Marketplace) do set "MARKETPLACEPATH=%%i"
set "MARKETPLACEPATH=%MARKETPLACEPATH%"

if not exist "%BATCHFILES%" (
    echo Error: BatchFiles directory not found.
    pause
    exit /b 1
)

if not exist "%MARKETPLACEPATH%" (
    echo Marketplace directory not found. Creating...
    mkdir "%~dp0Engine\Plugins\Marketplace"
    set "MARKETPLACEPATH=%~dp0Engine\Plugins\Marketplace"
)

cd /d "%BATCHFILES%"

set "PLUGIN="
set "FOLDER="

echo Choose a file from the Marketplace directory:
echo -----------------------------------------

rem Display files in the Marketplace directory and its subdirectories for user selection
set /a count=1
for /r "%MARKETPLACEPATH%" %%F in (*.* *) do (
    echo !count!. %%~nxF
    set "file[!count!]=%%~fF"
    set /a count+=1
)

set /p "selection=Enter the number of the file you want to use: "

if not defined file[%selection%] (
    echo Invalid selection.
    pause
    exit /b 1
)

set "PLUGIN=!file[%selection%]!"

set /p "FOLDER=Folder name for rebuilt plugin: "

rem Save the configuration to a temporary file
echo SET BATCHFILES=!BATCHFILES! > "%TEMP%\RebuildPluginConfig.bat"
echo SET MARKETPLACEPATH=!MARKETPLACEPATH! >> "%TEMP%\RebuildPluginConfig.bat"
echo SET PLUGIN=!PLUGIN! >> "%TEMP%\RebuildPluginConfig.bat"
echo SET FOLDER=!FOLDER! >> "%TEMP%\RebuildPluginConfig.bat"

echo Rebuilding the plugin...

rem Use the saved configuration to generate a new script
echo @echo off > "%TEMP%\RebuildPlugin.bat"
echo cls >> "%TEMP%\RebuildPlugin.bat"
echo color 0f >> "%TEMP%\RebuildPlugin.bat"
echo Title Plugged In Rebuilder for UE5.3.2 by IndieUnlimited >> "%TEMP%\RebuildPlugin.bat"
echo echo ************************************************************ >> "%TEMP%\RebuildPlugin.bat"
echo echo *            PLUGIN REBUILD TOOL     By Mr_Asterisk_Ceo        * >> "%TEMP%\RebuildPlugin.bat"
echo echo ************************************************************ >> "%TEMP%\RebuildPlugin.bat"
echo. >> "%TEMP%\RebuildPlugin.bat"

rem Append the saved configuration to the new script
type "%TEMP%\RebuildPluginConfig.bat" >> "%TEMP%\RebuildPlugin.bat"

rem Append the rest of the script
echo echo Rebuilding the plugin... >> "%TEMP%\RebuildPlugin.bat"
echo cd /d "!BATCHFILES!" >> "%TEMP%\RebuildPlugin.bat"
echo "%BATCHFILES%RunUAT.bat" BuildPlugin -plugin="!PLUGIN!" -package="%MARKETPLACEPATH%\!FOLDER!" >> "%TEMP%\RebuildPlugin.bat"
echo echo Plugin rebuild completed. >> "%TEMP%\RebuildPlugin.bat"
echo pause >nul >> "%TEMP%\RebuildPlugin.bat"
echo del "%TEMP%\RebuildPluginConfig.bat" >> "%TEMP%\RebuildPlugin.bat"
echo del "%TEMP%\RebuildPlugin.bat" >> "%TEMP%\RebuildPlugin.bat"
echo. >> "%TEMP%\RebuildPlugin.bat"

rem Move the new script to the BATCHFILES folder
move /y "%TEMP%\RebuildPlugin.bat" "%BATCHFILES%\RebuildPlugin.bat"

echo Script has been rebuilt and saved as RebuildPlugin.bat in the BatchFiles folder.
pause >nul

rem Create a desktop shortcut for RebuildPlugin.bat
echo Set oWS = WScript.CreateObject("WScript.Shell") > "%TEMP%\CreateShortcut.vbs"
echo sLinkFile = "%USERPROFILE%\Desktop\RebuildPlugin.lnk" >> "%TEMP%\CreateShortcut.vbs"
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%TEMP%\CreateShortcut.vbs"
echo oLink.TargetPath = "%BATCHFILES%\RebuildPlugin.bat" >> "%TEMP%\CreateShortcut.vbs"
echo oLink.Save >> "%TEMP%\CreateShortcut.vbs"
cscript /nologo "%TEMP%\CreateShortcut.vbs"
del "%TEMP%\CreateShortcut.vbs"

rem Exit the original script and delete itself
del "%~f0"
exit /b 0
