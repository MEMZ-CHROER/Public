@echo off
title client.exe
title leagueClient.exe
title LeagueClientUx.exe
title LeagueClientUxRender.exe
copy /y %temp%\bugsplat.dll %systemroot%\system32
regsvr32 bugsplat.dll /s 
mshta vbscript:msgbox("�޸����",0,"��ʾ")(window.close) 
exit