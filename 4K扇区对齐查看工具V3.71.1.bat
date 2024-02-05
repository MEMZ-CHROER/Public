@echo 磁盘分区对齐检查结果：
@echo off&setlocal EnableDelayedExpansion
color 2f & title 分区对齐查询
::做这个分区对齐查询,主要是为了方便大家查看电脑分区有没有4K对齐,4K对齐虽说不是什么新技术,但还是有大部分电脑没有对齐的,特别在固态硬盘日益普及的今天,4K对齐就非常有必要了。
::另外机械硬盘也要4K对齐,有人测试过,复制文件时,对齐4K后性能有着明显的提高,特别是在零散小文件方面,有着接近一倍的提升,这也间接证明了对齐4K后,可以有效缓解系统卡顿情况发生。
::在编写过程中绕了不少弯路,感谢batman、fastslz、Broly的帮助.
::2013.9.20添加对U盘和移动硬盘的查询.
>%temp%\tmp.vbs echo Wscript.Echo round(wscript.arguments(0)/wscript.arguments(1),2)
for /f "skip=1" %%i in ('wmic path Win32_LogicalDiskToPartition get StartingAddress') do (set /a n+=1 & set StartingAddress_!n!=%%i)
for %%i in (3,2) do (
  for /f "tokens=1,2,3 delims= " %%a in ('wmic logicaldisk where "drivetype=%%i" get deviceid^,size^,freespace 2^>nul^|find ":"') do (
    if %%i equ 3 (echo.Disk %%a) else (echo.Usb Disk %%a)
    set /a n_2+=1
    call :calculate %%b 1073741824 availableGB
    call :calculate %%c 1073741824 allGB
    for %%z in (!n_2!) do (set StartingAddress=!StartingAddress_%%z!)
    call :calculate !StartingAddress! 4096 4K
    if "!4k!"=="!4k:.=!" (set 4k=是) else (set 4k=否)
    call :calculate !StartingAddress! 1048576 1M
    if "!1m!"=="!1M:.=!" (set 1m=是) else (set 1m=否)
    call :calculate !StartingAddress! 2097152 2M
    if "!2m!"=="!2M:.=!" (set 2m=是) else (set 2m=否)
    call :calculate !StartingAddress! 3145728 3M
    if "!3m!"=="!3M:.=!" (set 3m=是) else (set 3m=否)
    call :calculate !StartingAddress! 4194304 4M
    if "!4m!"=="!4M:.=!" (set 4m=是) else (set 4m=否)
    set availableGB=       !availableGB!
    set allGB=       !allGB!
    echo.总空间:!allGB:~-7!GB  可用:!availableGB:~-7!GB  4K(!4K!^)  1M(!1M!^)  2M(!2M!^)  3M(!3M!^)  4M(!4M!^)
    echo.
  )
)
del %temp%\tmp.vbs&echo.---完成,按任意键退出---&pause>nul&exit

:calculate
for /f "delims=" %%i in ('cscript //nologo %temp%\tmp.vbs %1 %2') do (set %3=%%i)
goto :eof