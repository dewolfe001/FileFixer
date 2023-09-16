@echo off
setlocal enabledelayedexpansion

if "%~2"=="" (
    echo Usage: %0 directory prefix
    exit /b 1
)

set "directory=%~1"
set "prefix=%~2"

pushd "%directory%" || exit /b

for %%f in (*) do (
    set "filename=%%~nf"
    set "extension=%%~xf"
    ren "%%f" "!prefix!!filename!!extension!"
)

endlocal
