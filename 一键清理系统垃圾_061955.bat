@echo off
color a
title Windows Xp ����������     --��ǰʱ�䣺%time%
echo ========================================================================
echo                         Windows Xp ����������
echo ========================================================================
echo.
echo ���Լ�ʦ���ڰ������ϵͳ�����ļ������Ե�......
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