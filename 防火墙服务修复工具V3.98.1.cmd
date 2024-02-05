@echo off
net start Netman
net start Winmgmt
net continue Netman
net continue Winmgmt
:end
mshta vbscript:msgbox("操作完成！请重启电脑查看效果。",64,"温馨提示")(window.close)