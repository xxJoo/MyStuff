

# PS C:\Windows\system32> Install-Module -name importExcel

# 需要使用 NuGet 提供程序来继续操作
# PowerShellGet 需要使用 NuGet 提供程序“2.8.5.201”或更高版本来与基于 NuGet
# 的存储库交互。必须在“C:\Program
# Files\PackageManagement\ProviderAssemblies”或
# “C:\Users\MyMor\AppData\Local\PackageManagement\Prov
# iderAssemblies”中提供 NuGet 提供程序。
# 也可以通过运行 'Install-PackageProvider -Name NuGet
# -MinimumVersion 2.8.5.201 -Force' 安装 NuGet 提供程序。
# 是否要让 PowerShellGet 立即安装并导入 NuGet
# 提供程序?
# [Y] 是(Y)  [N] 否(N)  [S] 暂停(S)  [?] 帮助 (默认值为“Y”): y

# 不受信任的存储库
# 你正在从不受信任的存储库安装模块。如果你信任该存储库，
# 请通过运行 Set-PSRepository cmdlet 更改其
# InstallationPolicy 值。是否确实要从“PSGallery”安装模块?
# [Y] 是(Y)  [A] 全是(A)  [N] 否(N)  [L] 全否(L)  [S] 暂停(S)  [?] 帮助 (默认值为“N”): y

# PS C:\Windows\system32> Get-Module -list

#     目录: C:\Program Files\WindowsPowerShell\Modules

# ModuleType Version    Name                                ExportedCommands
# ---------- -------    ----                                ----------------
# Script     7.0.0      ImportExcel                         {Add-ConditionalFormatting, Add-ExcelC...
# Script     1.0.1      Microsoft.PowerShell.Operation.V... {Get-OperationValidation, Invoke-Opera...
# Binary     1.0.0.1    PackageManagement                   {Find-Package, Get-Package, Get-Packag...
# Script     3.4.0      Pester                              {Describe, Context, It, Should...}
# Script     1.0.0.1    PowerShellGet                       {Install-Module, Find-Module, Save-Mod...
# Script     2.0.0      PSReadline                          {Get-PSReadLineKeyHandler, Set-PSReadL...
# Script     1.0        WindowsVersion                      {Get-WindowsVersion, Format-WindowsVer...

#     目录: C:\Windows\system32\WindowsPowerShell\v1.0\Modules

# ModuleType Version    Name                                ExportedCommands
# ---------- -------    ----                                ----------------
# Manifest   1.0.0.0    AppBackgroundTask                   {Disable-AppBackgroundTaskDiagnosticLo...
# Manifest   2.0.0.0    AppLocker                           {Get-AppLockerFileInformation, Get-App...
# Manifest   1.0.0.0    AppvClient                          {Add-AppvClientConnectionGroup, Add-Ap...
# Manifest   2.0.1.0    Appx                                {Add-AppxPackage, Get-AppxPackage, Get...
# Script     1.0.0.0    AssignedAccess                      {Clear-AssignedAccess, Get-AssignedAcc...
# Manifest   1.0.0.0    BitLocker                           {Unlock-BitLocker, Suspend-BitLocker, ...
# Manifest   2.0.0.0    BitsTransfer

# Import-Excel `
#     -Path 'D:\MyDoc\GitHub\MyStuff\Excel\src\PKPM2010地震波数据（by Kircheis） .xls' `
#     -WorkSheetname Movies -NoHeader -DataOnly

# Import-Excel does not support reading this extension type .xls
# 所在位置 C:\Program Files\WindowsPowerShell\Modules\ImportExcel\7.0.0\Public\Import-Excel.ps1:97 字符: 17
# + ...             throw "Import-Excel does not support reading this extensi ...
# +                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : OperationStopped: (Import-Excel do...nsion type .xls:String) [], RuntimeExce 
#    ption
#     + FullyQualifiedErrorId : Import-Excel does not support reading this extension type .xls
 


$xl = New-Object -ComObject excel.application
# $xl.visible = $true
$wb = $xl.workbooks.open([String](Join-Path (Get-Location) "PKPM2010.xls"))
# $wb = $xl.workbooks.open("D:\MyDoc\GitHub\MyStuff\Excel\src\PKPM2010地震波.xls")
# 路径不能有中文
$sheet = $wb.sheets.item(1)


Write-Host $sheet.range("A1").text
Write-Host $sheet.cells.item(1,1).text
#A列对应每行的值 A column correspond to per row value

$xl.displayAlerts = $False
$wb.Close()
$xl.Application.Quit()