@echo off
setlocal >NUL 2>NUL
cd /d %~dp0 >NUL 2>NUL
64 remove "HID\makubex*"
64 remove "root\makubex"
sc delete makubex
sc stop mmm
sc delete mmm
pause