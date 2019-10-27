# PowerShell

## 数学计算

```powershell
PS> (39+79-51)*497/28
1189.25
```

## 日期

距离下一个情人节还有多少分钟？
我知道距离多少天好算，如果变成分钟呢？

```powershell
$now=Get-Date
$day=[datetime]'2-14'
if($now -lt $day ){
    $day.Subtract($now).TotalMinutes
}
else{
    $day.AddYears(1).Subtract($now).TotalMinutes
}
```

## 容量


3GB > 3145726KB吗  ?
```powershell
PS> 3gb -gt 3145726kb
True
```




## 文件

Windows目录下所有可执行文件exe的大小是多少？
```powershell
dir $env:windir -Filter *.exe | measure -Sum Length
```

## 注册表


注册表路径
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework
下‘Enable64Bit’的值是多少？

```powershell
(Get-ItemProperty -Path hklm:SOFTWARE\Microsoft\.NETFramework ).Enable64Bit
```

## 证书


指纹为[28DE15612AFF1CD69596AB17AF06AE86CB9C003B]的证书在证书存储区吗？
```powershell
ls Cert:\LocalMachine\My\ |
 where { $_.Thumbprint -eq '28DE15612AFF1CD69596AB17AF06AE86CB9C003B' }

```


## 服务

打印机服务有没有启动呢？
```powershell
Get-Service spooler
```


## 进程

当前运行了多少个IE进程？

```powershell
(Get-Process iexplore ).count
```

## 报表
将所有运行的进程信息导出为HTML报表？

```powershell
Get-Process | ConvertTo-Html | Out-File a.html
```


