












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