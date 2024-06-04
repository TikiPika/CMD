@echo off
setlocal enabledelayedexpansion

rem 获取当前网络连接名称
for /f "tokens=* delims=" %a in ('netsh interface show interface') do (
    set "connectionName=%a"
)

rem 提取最后一行非空数据作为当前网络连接名称
for /f "tokens=* delims=" %b in ("%connectionName%") do (
    if not "%b"=="" (
        set "connectionName=%b"
    )
)

echo 当前网络连接名称为: %connectionName%
