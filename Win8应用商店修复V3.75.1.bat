@echo off
echo.
sc config MpsSvc start= Auto
net start MpsSvc
echo.
start mshta vbscript:msgbox("������� ",,"��ʾ")(window.close) 