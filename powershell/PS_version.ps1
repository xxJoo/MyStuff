
# 操作环境：
# Windows 7 旗舰版 Service Pack 1 x64

# PowerShell 2.0 –> PowerShell 4.0

# 下载Windows6.1-KB2819745-x64-MultiPkg.msu 
# https://www.microsoft.com/zh-CN/download/details.aspx?id=40855

# 下载.net4环境，如已安装请忽略
# https://www.microsoft.com/en-us/download/details.aspx?id=17851



# PS C:\Repositories>$Host

# Name             : ConsoleHost
# Version          : 2.0
# InstanceId       : 420f87c9-cc28-435f-8ef6-c7f0af3f469b
# UI               : System.Management.Automation.Internal.Host.InternalHostUserInterface
# CurrentCulture   : zh-CN
# CurrentUICulture : zh-CN
# PrivateData      : Microsoft.PowerShell.ConsoleHost+ConsoleColorProxy
# IsRunspacePushed : False
# Runspace         : System.Management.Automation.Runspaces.LocalRunspace




# PS C:\Repositories> $PSVersionTable

# Name                           Value
# ----                           -----
# CLRVersion                     2.0.50727.8800
# BuildVersion                   6.1.7601.17514
# PSVersion                      2.0
# WSManStackVersion              2.0
# PSCompatibleVersions           {1.0, 2.0}
# SerializationVersion           1.1.0.1
# PSRemotingProtocolVersion      2.1


# 查看当前PowerShell的.Net运行版本

# $PSVersionTable.CLRVersion
# $PSVersionTable.CLRVersion.Major

# 查看所有安装的.Net 版本
# Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' |
#     sort-object name -Descending | 
#     select-object -ExpandProperty PSChildName

# 修改字体(以管理员身份运行) 点阵字体

