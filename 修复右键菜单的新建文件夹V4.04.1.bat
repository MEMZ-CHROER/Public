reg add "HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\New" /ve /d "{D969A300-E7FF-11d0-A93B-00A0C90F2719}" /t REG_SZ /f
start mshta vbscript:msgbox("操作完成 ",,"提示")(window.close) 