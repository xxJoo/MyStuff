







在电脑上定时运行powershell脚本，需要打开powershell权限。
```powershell
Get-ExecutionPolicy -List
# Set-ExecutionPolicy Unrestricted
Set-ExecutionPolicy RemoteSigned
```

定时任务脚本内容
```powershell
# 脚本名称 MyTestorAssignment.ps1
$PopUpWin = new-object -comobject wscript.shell
$PopUpWin.popup("请注意在一天工作开始之前更新工作文档,谢谢!")
```


添加定时任务

```powershell
# schtasks命令
# 创建任务 create
# 任务名称 tn(task name) myTask001
# 运行的程序的路径 tr(taskrun) PowerShell
# 隐藏窗口 -WindowStyle Hidden
# 脚本路径 -file
$taskPath = 'C:\Users\kid\Desktop\MyTestorAssignment.ps1'
# 触发条件 schedule 登陆时 onlogon
# 延迟时间 delay 1 分钟
# TODO 时间格式
schtasks /create `
    /tn myTask001 `
    /tr "PowerShell -WindowStyle Hidden -file '$taskPath'" `
    /sc onlogon `
    /delay 0000:59

# TODO 起始于不知道怎么设置
# $startPath = 'C:\Users\kid\Desktop'
```

创建任务后，察看定时任务命令：`compmgmt.msc`


