@echo off

rem 获取当前网络连接名称
for /f "tokens=3 delims=\" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /f "DhcpIPAddress"') do (
    set "connectionName=%%a"
)

echo 当前网络连接名称为: %connectionName%
