@ECHO OFF

REM This file depends on ldoc being defined

title Building Project Documentation with LDoc

set BUILDDIR=api

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.Please use `make ^<target^>` where ^<target^> is one of:
	echo.
	echo.    clean       to delete old doc files and generate new html files
	echo.    html        to generate HTML files
	echo.    cleanonly   to deleete old generated doc files
	goto end
)

if "%1" == "cleanonly" (
	echo "Cleaning up and exiting..."
	for /d %%i in (%BUILDDIR%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR%\*
	goto end
)

if "%1" == "clean" (
	echo "Cleaning up and building html..."
	for /d %%i in (%BUILDDIR%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR%\*
	echo ldoc . --verbose
	ldoc . --verbose
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished, HTML pages are in directory: %BUILDDIR%
	goto end
)

if "%1" == "html" (
	echo ldoc . --verbose
	ldoc . --verbose
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished, HTML pages are in directory: %BUILDDIR%
	goto end
)

:end
