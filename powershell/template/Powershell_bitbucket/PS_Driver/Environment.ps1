<#
文件：Powershell/Env.ps1
用途：
创建：
修改：
#>

# ----------------------------------------------------------------
# 环境变量
# ----------------------------------------------------------------

# 创建新的环境变量
$env:TestVar1="This is my environment variable"
$env:TestVar2="Hollow, environment variable"
ls env:Test*
# Name                           Value
# ----                           -----
# TestVar1                       This is my environment variable
# TestVar2                       Hollow, environment variable


# 删除和更新环境变量
del env:windir
$env:windir


# 可以更新环境变量
# $env:OS 为linux redhat。
$env:OS
# Windows_NT
$env:OS="Redhat Linux"
$env:OS
# Redhat Linux


# 显示 path 变量
$Env:Path -split ';'


# PowerShell的环境变量
# http://blog.sina.com.cn/s/blog_bfc35a260102vv88.html

# Environment.SetEnvironmentVariable 方法 
# (String, String)
# https://msdn.microsoft.com/zh-cn/library/z46c489x(v=vs.110).aspx

# Environment.SetEnvironmentVariable 方法 
# (String, String, EnvironmentVariableTarget)
# https://msdn.microsoft.com/zh-cn/library/96xafkes(v=vs.110).aspx

[Environment]::SetEnvironmentVariable `
    ("Home","D:\Program Files\emacs",[System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable `
    ("Home",$null,[System.EnvironmentVariableTarget]::Machine)


# 若要了解计算机上的现用执行策略
Get-Executionpolicy

# 若要在本地计算机上运行您编写的未签名脚本和来自其他用户的签名脚本，
# 请使用以下命令将计算机上的 
# 执行策略更改为 RemoteSigned：
Set-ExecutionPolicy RemoteSigned
# Set-ExecutionPolicy AllSigned





