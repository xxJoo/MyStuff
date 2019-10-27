



# 模块


```powershell
# 查看已导入模块
Get-Module
# 查看可用模块
Get-Module -ListAvailable
# 在模块文件夹父目录下 导入模块
Import-Module WindowsVersion
# 下载和安装
$currentPath = Get-Location
Import-Module -Name (Join-Path $currentPath "powershell/WindowsVersion")
```