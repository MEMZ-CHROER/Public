@echo off
net start Netman
net start Winmgmt
net continue Netman
net continue Winmgmt
:end
mshta vbscript:msgbox("������ɣ����������Բ鿴Ч����",64,"��ܰ��ʾ")(window.close)