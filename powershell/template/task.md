





```powershell
# 在电脑上定时运行powershell脚本
# 打开powershell权限

Get-ExecutionPolicy -List
# Set-ExecutionPolicy Unrestricted
Set-ExecutionPolicy RemoteSigned

# 设定脚本路径
$ taskPath = 'C:\Users\kid\Desktop\MyTestorAssignment.ps1'
# 脚本内容
# $PopUpWin = new-object -comobject wscript.shell
# $PopUpWin.popup("请注意在一天工作开始之前更新工作文档,谢谢!")

# 添加定时任务
# 任务名称 myTask001
# 任务脚本 PowerShell 隐藏窗口 脚本路径
# 触发条件 登陆时
# 延迟时间 1 分钟
schtasks /create /tn myTask001 /tr "PowerShell -WindowStyle Hidden -file '$taskPath'" /sc onlogon /delay 0000:59

# 起始于不知道怎么设置
# $startPath = 'C:\Users\kid\Desktop'
```

察看定时任务`compmgmt.msc`

***
```powershell
schtasks /create /tn myTask001 `
    /tr "PowerShell -WindowStyle Hidden -file '$taskPath'" `
    /sc onlogon /delay 0000:59
```
