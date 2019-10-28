
# 服务 **(Service)**


属性
- Name
- DisplayName (显示在任务管理器)

停止驱动人生的流氓程序
```powershell

PS C:\Windows\system32> Get-Service -DisplayName *andrea*|Stop-Service -WhatIf

WhatIf: 正在目标“Andrea RT Filters Service (AERTFilters)”上执行操作“Stop-Service”。

PS C:\Windows\system32> Get-Service -DisplayName *andrea*|Stop-Service

```

用代码检查打印机服务有没有启动：`Get-Service spooler`
