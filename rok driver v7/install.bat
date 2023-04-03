setlocal >NUL 2>NUL
cd /d %~dp0 >NUL 2>NUL
sc stop vgc
sc stop vgk
sc delete vgc
sc delete vgk
64 remove "HID\makubex*"
64 remove "root\makubex"
qw  >NUL 2>NUL
64 install makubex.inf "root\makubex"

sc query mmm | find "RUNNING"
if "%ERRORLEVEL%"=="0" (
    echo service is running
) else (
    sc create mmm binpath="%~dp0Driver.sys" type=kernel >NUL 2>NUL
    sc start mmm >NUL 2>NUL
)

qw -e  >NUL 2>NUL
pause