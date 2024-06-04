@echo off
setlocal enabledelayedexpansion

rem 设置要使用的 DNS 地址
set dns1=8.8.8.8
set dns2=8.8.4.4
set dns3=1.1.1.1
set dns4=1.0.0.1

rem 获取当前的连接名称
for /f "tokens=*" %%a in ('netsh interface ipv4 show interfaces ^| findstr /R /C:"[0-9]"') do (
    set connectionName=%%a
    goto :continue
)

:continue

rem 设置 DNS 地址
netsh interface ipv4 set dns name="!connectionName!" source=static addr=%dns1%
netsh interface ipv4 add dns name="!connectionName!" addr=%dns2% index=2
netsh interface ipv4 add dns name="!connectionName!" addr=%dns3% index=3
netsh interface ipv4 add dns name="!connectionName!" addr=%dns4% index=4

echo DNS 地址已经更新为 %dns1%, %dns2%, %dns3%, %dns4%
