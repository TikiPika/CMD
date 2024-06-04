@echo off

rem 获取当前活动的网络连接名称
for /f "tokens=1,2,3,4,5*" %%a in ('netsh interface show interface ^| findstr /i "connected"') do (
    rem 设置DNS地址
    netsh interface ipv4 set dns name="%%e" static 8.8.8.8
    netsh interface ipv4 add dns name="%%e" 8.8.4.4 index=2
    netsh interface ipv4 add dns name="%%e" 1.1.1.1 index=3
    netsh interface ipv4 add dns name="%%e" 1.0.0.1 index=4
    goto :done
)

:done
echo DNS addresses have been updated to 8.8.8.8, 8.8.4.4, 1.1.1.1, 1.0.0.1
pause
