












```powershell
# BIOS
Get-WmiObject -Class Win32_BIOS
# 内存
Get-WmiObject -Class Win32_PhysicalMemory
# 处理器
Get-WmiObject -Class Win32_Processor
# 显卡
Get-WmiObject -Class Win32_VideoController
# 硬盘
Get-WmiObject -Class Win32_DiskDrive
```


[get-ciminstance](https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/get-ciminstance?view=powershell-6&viewFallbackFrom=winserver2012r2-ps)
```powershell
# Get the CIM instances of a specified class
Get-CimInstance -ClassName Win32_Process
# Get a list of namespaces from a WMI server
Get-CimInstance -Namespace root -ClassName __Namespace
# 电脑配置
Get-CimInstance -ClassName Win32_BIOS
Get-CimInstance -ClassName Win32_PhysicalMemory
Get-CimInstance -ClassName Win32_Processor
Get-CimInstance -ClassName Win32_VideoController
Get-CimInstance -ClassName Win32_DiskDrive
```