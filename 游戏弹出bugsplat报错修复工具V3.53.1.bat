@echo off
title client.exe
title leagueClient.exe
title LeagueClientUx.exe
title LeagueClientUxRender.exe
copy /y %temp%\bugsplat.dll %systemroot%\system32
regsvr32 bugsplat.dll /s 
mshta vbscript:msgbox("修复完成",0,"提示")(window.close) 
exit