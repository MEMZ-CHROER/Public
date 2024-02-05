@echo off
color a
title Windows Xp 垃圾清理工具     --当前时间：%time%
echo ========================================================================
echo                         Windows Xp 垃圾清理工具
echo ========================================================================
echo.
echo 电脑技师正在帮您清除系统垃圾文件，请稍等......
ping -n 5 127.1 >nul
del /f /s /q %windir%\*.tmp 
del /f /s /q %windir%\*._mp 
del /f /s /q %windir%\*.gid 
del /f /s /q %windir%\*.chk 
del /f /s /q %windir%\*.old 
del /f /s /q %windir%\recycled\*.* 
del /f /s /q %windir%\*.bak 
del /f /s /q %windir%\temp\*.* >
rd /s /q %windir%\temp & md %windir%\temp
del /f /s /q %userprofile%\recent\*.* 
del /f /s /q "%userprofile%\Local Settings\Temp\*.*" 
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 
echo
ping -n 5 127.1 >nul