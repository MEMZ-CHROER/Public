@echo off
cls
@echo off
if exist "C:\Program Files\Lenovo\Energy Management\Energy Management.exe" (goto regPM32) else if exist "C:\Program Files (x86)\Lenovo\Energy Management\Energy Management.exe" (goto regPM64) else goto hotkey
:regPM32
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v "Energy Management" /t REG_SZ /d "C:\Program Files\Lenovo\Energy Management\Energy Management.exe"  
goto hotkey
:regPM64
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v "Energy Management" /t REG_SZ /d "C:\Program Files (x86)\Lenovo\Energy Management\Energy Management.exe"
goto hotkey
:hotkey
ver | find "5.1">NUL && IF errorlevel 0 goto xp
if exist "C:\Program Files\Lenovo\Energy Management\Utility.exe" (goto reghotkey32) else ( if exist "C:\Program Files (x86)\Lenovo\Energy Management\Utility.exe" (goto reghotkey64) else ( goto nointall )) 
:reghotkeyxp
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v "EnergyUtilty" /t REG_SZ /d "C:\Program Files\Lenovo\Energy Management\Utilty.exe"
goto run
:reghotkey32
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v "EnergyUtilty" /t REG_SZ /d "C:\Program Files\Lenovo\Energy Management\Utility.exe"
goto run
:reghotkey64
REG add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v "EnergyUtility" /t REG_SZ /d "C:\Program Files (x86)\Lenovo\Energy Management\Utility.exe"
goto run
:xp
if exist "C:\Program Files\Lenovo\Energy Management\Utilty.exe" (goto reghotkeyxp) else (goto nointall)
goto end
:run
if exist "C:\Program Files\Lenovo\Energy Management\Utility.exe" (goto runUtility) else ( if exist "C:\Program Files\Lenovo\Energy Management\Utilty.exe" (goto runUtility) else ( if exist "C:\Program Files (x86)\Lenovo\Energy Management\Utility.exe" (goto runUtility64) else ( goto nointall)))
:runUtility
start "" "C:\Program Files\Lenovo\Energy Management\Utility.exe" 
goto end
:runUtilty
start "" "C:\Program Files\Lenovo\Energy Management\Utilty.exe" 
goto end
:runUtility64
start "" "C:\Program Files (x86)\Lenovo\Energy Management\Utility.exe" 
goto end
:end
start mshta vbscript:msgbox("设置完成！",vbInformation,"提示信息")(window.close)&&exit

exit
:nointall
start mshta vbscript:msgbox("请先安装Lenovo电源管理程序！",vbInformation,"提示信息")(window.close)&&exit
pause

