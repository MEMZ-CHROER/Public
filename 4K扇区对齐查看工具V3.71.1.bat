@echo ���̷�������������
@echo off&setlocal EnableDelayedExpansion
color 2f & title ���������ѯ
::��������������ѯ,��Ҫ��Ϊ�˷����Ҳ鿴���Է�����û��4K����,4K������˵����ʲô�¼���,�������д󲿷ֵ���û�ж����,�ر��ڹ�̬Ӳ�������ռ��Ľ���,4K����ͷǳ��б�Ҫ�ˡ�
::�����еӲ��ҲҪ4K����,���˲��Թ�,�����ļ�ʱ,����4K�������������Ե����,�ر�������ɢС�ļ�����,���Žӽ�һ��������,��Ҳ���֤���˶���4K��,������Ч����ϵͳ�������������
::�ڱ�д���������˲�����·,��лbatman��fastslz��Broly�İ���.
::2013.9.20��Ӷ�U�̺��ƶ�Ӳ�̵Ĳ�ѯ.
>%temp%\tmp.vbs echo Wscript.Echo round(wscript.arguments(0)/wscript.arguments(1),2)
for /f "skip=1" %%i in ('wmic path Win32_LogicalDiskToPartition get StartingAddress') do (set /a n+=1 & set StartingAddress_!n!=%%i)
for %%i in (3,2) do (
  for /f "tokens=1,2,3 delims= " %%a in ('wmic logicaldisk where "drivetype=%%i" get deviceid^,size^,freespace 2^>nul^|find ":"') do (
    if %%i equ 3 (echo.Disk %%a) else (echo.Usb Disk %%a)
    set /a n_2+=1
    call :calculate %%b 1073741824 availableGB
    call :calculate %%c 1073741824 allGB
    for %%z in (!n_2!) do (set StartingAddress=!StartingAddress_%%z!)
    call :calculate !StartingAddress! 4096 4K
    if "!4k!"=="!4k:.=!" (set 4k=��) else (set 4k=��)
    call :calculate !StartingAddress! 1048576 1M
    if "!1m!"=="!1M:.=!" (set 1m=��) else (set 1m=��)
    call :calculate !StartingAddress! 2097152 2M
    if "!2m!"=="!2M:.=!" (set 2m=��) else (set 2m=��)
    call :calculate !StartingAddress! 3145728 3M
    if "!3m!"=="!3M:.=!" (set 3m=��) else (set 3m=��)
    call :calculate !StartingAddress! 4194304 4M
    if "!4m!"=="!4M:.=!" (set 4m=��) else (set 4m=��)
    set availableGB=       !availableGB!
    set allGB=       !allGB!
    echo.�ܿռ�:!allGB:~-7!GB  ����:!availableGB:~-7!GB  4K(!4K!^)  1M(!1M!^)  2M(!2M!^)  3M(!3M!^)  4M(!4M!^)
    echo.
  )
)
del %temp%\tmp.vbs&echo.---���,��������˳�---&pause>nul&exit

:calculate
for /f "delims=" %%i in ('cscript //nologo %temp%\tmp.vbs %1 %2') do (set %3=%%i)
goto :eof