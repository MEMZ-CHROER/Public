@echo off
netsh int tcp set heuristics disabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global rss=enabled
netsh int tcp show global
echo [��������˳�]

pause>nul
exit


