@echo off 
title=���ǿ��Ҫ������ǩ�����ù���
mode con cols=56 lines=25 
color 2F

:menu
cls
echo.
echo ���ǿ��Ҫ������ǩ�����ù���              
echo ====================================================
echo.
echo ����1 ����ǿ��Ҫ������ǩ��
echo.
echo ����2 �رտ���ǿ��Ҫ������ǩ��
echo.
echo ����0 ��������
echo.
echo.
echo ====================================================
echo.
set /p u=���������֣�
if %u% equ 1 goto set1
if %u% equ  2 goto set2  
if %u% equ  0 goto end  
:set1
echo ���ڿ�������
bcdedit -set loadoptions DDISABLE_INTEGRITY_CHECKS
bcdedit -set TESTSIGNING ON
pause
goto menu
:set2 
echo ���ڹر�����
bcdedit -set loadoptions ENABLE_INTEGRITY_CHECKS
bcdedit -set TESTSIGNING OFF

pause
goto menu

pause
:end
exit