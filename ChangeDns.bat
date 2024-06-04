@echo off

rem 获取当前网络连接接口的 GUID
for /f "tokens=3 delims=\" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /f "IPAddress"') do (
    for /f "tokens=2 delims=:" %%i in ('netsh interface ip show address "%%a" ^| findstr /c:"Address"') do (
        set "ip=%%i"
        if "!ip:~0,8!"=="172.24.2" (
            rem 在注册表中设置 DNS 地址
            reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "NameServer" /t REG_SZ /d "8.8.8.8,8.8.4.4,1.1.1.1,1.0.0.1" /f
            echo 已将 DNS 地址更新为 8.8.8.8, 8.8.4.4, 1.1.1.1, 1.0.0.1。
        )
    )
)
