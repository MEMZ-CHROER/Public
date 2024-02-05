@echo off
sc config RpcSs start= auto
net start RpcSs
sc config VaultSvc start= demand
net start VaultSvc
sc config wudfsvc start= demand
net start wudfsvc
sc config WbioSrvc start= demand
net start WbioSrvc 
mshta vbscript:msgbox("操作完成！请重启电脑查看效果。",64,"温馨提示")(window.close)
exit