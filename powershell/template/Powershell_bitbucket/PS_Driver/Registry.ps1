cd HKCU:
dir

#     Hive: HKEY_CURRENT_USER


# Name                           Property
# ----                           --------
# AppEventse
# Console                        ColorTable00           : 0
#                                ColorTable01           : 8388608
#                                ColorTable02           : 32768
#                                ColorTable03           : 8421376
#                                ColorTable04           : 128
#                                ColorTable05           : 8388736
#                                ColorTable06           : 32896
#                                ColorTable07           : 12632256
#                                ColorTable08           : 8421504
#                                ColorTable09           : 16711680
#                                ColorTable10           : 65280
#                                ColorTable11           : 16776960
#                                ColorTable12           : 255
#                                ColorTable13           : 16711935
#                                ColorTable14           : 65535
#                                ColorTable15           : 16777215
#                                CursorSize             : 25
#                                EnableColorSelection   : 0
#                                ExtendedEditKey        : 0
#                                ExtendedEditKeyCustom  : 0
#                                FontFamily             : 0
#                                FontSize               : 0
#                                FontWeight             : 0
#                                FullScreen             : 0
#                                HistoryBufferSize      : 50
#                                HistoryNoDup           : 0
#                                InsertMode             : 1
#                                LoadConIme             : 1
#                                NumberOfHistoryBuffers : 4
#                                PopupColors            : 245
#                                QuickEdit              : 0
#                                ScreenBufferSize       : 19660880
#                                ScreenColors           : 7
#                                TrimLeadingZeros       : 0
#                                WindowSize             : 1638480
#                                WordDelimiters         : 0
#                                CurrentPage            : 2
# Control Panel
# Environment                    AWP_LOCALE150 : en-us
#                                Path          : C:\texlive\2015\bin\win32;C:\Users\dell\AppData\Local\atom\bin;C:\Users\dell\AppData\Local\GitHubDeskt
#                                op\bin;C:\Program Files\Microso
#                                                ft VS Code\bin
#                                TEMP          : C:\Users\dell\AppData\Local\Temp
#                                TMP           : C:\Users\dell\AppData\Local\Temp
# EUDC
# Files
# Identities                     Identity Ordinal : 2
#                                Migrated7        : 1
#                                Last Username    : 主标识
#                                Last User ID     : {F562013D-F7CE-4C02-80F3-BC222C8209BC}
#                                Identity Login   : 622675
#                                Default User ID  : {F562013D-F7CE-4C02-80F3-BC222C8209BC}
# Keyboard Layout
# Network
# pdmsviewtype                   viewtype : 设计视图
# Printers
# Software                       (default) :
# System
# Uninstall
# Volatile Environment           LOGONSERVER  : \\DELL-PC
#                                USERDOMAIN   : dell-PC
#                                USERNAME     : dell
#                                USERPROFILE  : C:\Users\dell
#                                HOMEPATH     : \Users\dell
#                                HOMEDRIVE    : C:
#                                APPDATA      : C:\Users\dell\AppData\Roaming
#                                LOCALAPPDATA : C:\Users\dell\AppData\Local


命令                     描述
Dir, Get-ChildItem       列出键的内容
Cd, Set-Location         更改当前（键）目录
HKCU:, HKLM:             预定义的两个重要注册表根目录虚拟驱动器
Get-ItemProperty         读取键的值
Set-ItemProperty         设置键的值
New-ItemProperty         给键创建一个新值
Clear-ItemProperty       删除键的值内容
Remove-ItemProperty      删除键的值
New-Item, md             创建一个新键
Remove-Item, Del         删除一个键
Test-Path                验证键是否存在




















