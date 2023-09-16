@echo off
setlocal enabledelayedexpansion

rem Check if both directory and prefix arguments are provided
if "%~2"=="" (
    echo Usage: %0 directory prefix
    exit /b 1
)

set "directory=%~1"
set "prefix=%~2"

pushd "%directory%" || exit /b

for %%f in (*%prefix%*) do (
    set "filename=%%~nf"
    set "extension=%%~xf"
    set "newname=!filename:%prefix%=!"
    if not "!newname!"=="!filename!" (
        ren "%%f" "!newname!!extension!"
    )
)

endlocal