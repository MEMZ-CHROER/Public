@echo off
sc config RpcSs start= auto
net start RpcSs
sc config EventSystem start= auto
net start EventSystem
sc config SENS start= auto
net start SENS
mshta vbscript:msgbox("操作完成！请重启电脑查看效果。",64,"温馨提示")(window.close)