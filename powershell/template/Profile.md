





```powershell
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


```