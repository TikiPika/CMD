@echo off

rem 获取当前网络连接接口的 GUID
for /f "tokens=3 delims=\" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /f "IPAddress"') do (
    set "interfaceGuid=%%a"
    goto :foundInterfaceGuid
)
:foundInterfaceGuid

echo 当前网络连接接口的 GUID 为: %interfaceGuid%
