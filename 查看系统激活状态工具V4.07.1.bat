::��֤ϵͳ�Ƿ񼤻�2014.3.27

@echo off

ver|find "5.1"&&goto winxp
ver|find "6."&&goto win7
ver|find "10."&&goto win7
goto end
:winxp
@echo ���ڼ��ϵͳ����״̬�������Եȡ���
start "" "c:\windows\system32\oobe\msoobe.exe" /a
goto end
:win7
@echo ���ڼ��ϵͳ����״̬�������Եȡ���
start slmgr.vbs -xpr
goto end
:end
cls
exit
 