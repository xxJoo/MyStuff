


# profile
#############################################################
# 所有用户共有的profile
Get-Content $pshome\profile.ps1
# 所有用户（私有）
# powershell.exe 中验证
Get-Content $pshome\Microsoft.PowerShell_profile.ps1
# 当前用户
# 当前用户的profile
Get-Content $((Split-Path $profile -Parent)+ “\profile.ps1”)
# 当前用户（私有）
# 当前用户的profile；只在Powershell.exe中验证
Get-Content $profile


# 在powershell中使用.net技术
#############################################################
# PowerShell中调用静态方法可以以这种形式执行
[Class]::Method()
# ...>
[system.io.path]::HasExtension("c:\")
False
# PS ...>
[system.io.path]::HasExtension("c:\a.txt")
True
# TODO 这句什么意思

















