@echo off
sc config RpcSs start= auto
net start RpcSs
sc config VaultSvc start= demand
net start VaultSvc
sc config wudfsvc start= demand
net start wudfsvc
sc config WbioSrvc start= demand
net start WbioSrvc 
mshta vbscript:msgbox("������ɣ����������Բ鿴Ч����",64,"��ܰ��ʾ")(window.close)
exit