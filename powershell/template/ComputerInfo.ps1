













# BIOS
Get-WmiObject -Class Win32_BIOS
# SMBIOSBIOSVersion : 1.30
# Manufacturer      : American Megatrends Inc.
# Name              : 1.30
# SerialNumber      : Default string
# Version           : ALASKA - 1072009

# 内存
Get-WmiObject -Class Win32_PhysicalMemory
# BankLabel                 BANK 1
# Capacity                  17179869184
# ConfiguredClockSpeed      2400
# DataWidth                 1200
# Manufacturer              Kingston
# PartNumber                KHX2400C15/16G
# SerialNumber              F93AA654
# Speed                     2400
# Tag                       Physical Memory 1
# TotalWidth                64
# TypeDetail                128


# 处理器
Get-WmiObject -Class Win32_Processor
# Caption           : Intel64 Family 6 Model 158 Stepping 10
# DeviceID          : CPU0
# Manufacturer      : GenuineIntel
# MaxClockSpeed     : 2808
# Name              : Intel(R) Core(TM) i5-8400 CPU @ 2.80GHz
# SocketDesignation : U3E1

# 显卡
Get-WmiObject -Class Win32_VideoController
# AdapterCompatibility         : NVIDIA
# AdapterRAM                   : 4293918720
# Availability                 : 3
# Caption                      : NVIDIA GeForce GTX 1060 6GB
# CurrentBitsPerPixel          : 32
# CurrentHorizontalResolution  : 1920
# CurrentNumberOfColors        : 4294967296
# CurrentVerticalResolution    : 1080
# VideoModeDescription         : 1920 x 1080 x 4294967296 种颜色

# 硬盘
Get-WmiObject -Class Win32_DiskDrive
# Partitions : 3
# DeviceID   : \\.\PHYSICALDRIVE2
# Model      : Samsung SSD 970 EVO Plus 500GB
# Size       : 500105249280
# Caption    : Samsung SSD 970 EVO Plus 500GB

# Partitions : 1
# DeviceID   : \\.\PHYSICALDRIVE3
# Model      : Seagate BUP Slim WH SCSI Disk Device
# Size       : 2000396321280
# Caption    : Seagate BUP Slim WH SCSI Disk Device

# Partitions : 1
# DeviceID   : \\.\PHYSICALDRIVE0
# Model      : ST2000DM008-2FR102
# Size       : 2000396321280
# Caption    : ST2000DM008-2FR102

# Partitions : 1
# DeviceID   : \\.\PHYSICALDRIVE1
# Model      : ST2000DM008-2FR102
# Size       : 2000396321280
# Caption    : ST2000DM008-2FR102


# get-ciminstance 帮助
# https://docs.microsoft.com/en-us/powershell/module/cimcmdlets/get-ciminstance?view=powershell-6&viewFallbackFrom=winserver2012r2-ps

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
