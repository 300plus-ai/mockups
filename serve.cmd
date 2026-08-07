@echo off
REM Serve the mockups locally. Double-click this file, then open the printed URL.
REM They are ES-module SPAs, so they must be served over HTTP -- opening
REM index.html directly from the filesystem renders a blank page.

setlocal
set PORT=8099
cd /d "%~dp0"

echo.
echo   300Plus mockups
echo   ---------------
echo   index         http://localhost:%PORT%/
echo   client        http://localhost:%PORT%/client/
echo   exam          http://localhost:%PORT%/exam/
echo   super-admin   http://localhost:%PORT%/super-admin/
echo.
echo   Press Ctrl+C to stop.
echo.

start "" "http://localhost:%PORT%/"

python -m http.server %PORT% --bind 127.0.0.1
if errorlevel 1 (
  echo.
  echo   python not found -- trying npx serve instead...
  npx --yes serve -l %PORT% .
)
