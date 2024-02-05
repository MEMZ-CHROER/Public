reg add "HKLM\SOFTWARE\Classes\Folder" /ve /d Folder /t REG_SZ /f
start mshta vbscript:msgbox("操作完成 ",,"提示")(window.close) 