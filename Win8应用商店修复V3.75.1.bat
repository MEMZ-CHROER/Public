@echo off
echo.
sc config MpsSvc start= Auto
net start MpsSvc
echo.
start mshta vbscript:msgbox("操作完成 ",,"提示")(window.close) 