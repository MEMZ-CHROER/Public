@echo off
sc config RpcSs start= auto
net start RpcSs
sc config EventSystem start= auto
net start EventSystem
sc config SENS start= auto
net start SENS
mshta vbscript:msgbox("������ɣ����������Բ鿴Ч����",64,"��ܰ��ʾ")(window.close)