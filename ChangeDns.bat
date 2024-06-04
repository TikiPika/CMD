@echo off
setlocal

REM 替换为你的DNS服务器地址
set primaryDNS=8.8.8.8
set secondaryDNS=8.8.4.4
set tertiaryDNS=1.1.1.1
set quaternaryDNS=1.0.0.1

REM 获取所有启用的网络适配器名称
for /f "tokens=*" %%A in ('wmic nic where "NetEnabled=true" get NetConnectionID ^| findstr /r /v "^$" ^| findstr /v "NetConnectionID"') do (
    REM 设置DNS服务器地址
    netsh interface ipv4 set dns name="%%A" static %primaryDNS%
    netsh interface ipv4 add dns name="%%A" addr=%secondaryDNS% index=2
    netsh interface ipv4 add dns name="%%A" addr=%tertiaryDNS% index=3
    netsh interface ipv4 add dns name="%%A" addr=%quaternaryDNS% index=4
)

endlocal
pause
