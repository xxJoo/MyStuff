# PowerShell Time

## Get-Date

### 获取相对日期

在PowerShell中，可以通过Get-Date获取当前日期。
日期的类型是.NET中的DateTime类。
获取相对日期自然也可以通过.NET中的日期类库了。

例如：


```powershell
$today=Get-Date
"今天是：$today"
#昨天
"昨天是:$($today.AddDays(-1))"
#明天
"明天是:$($today.AddDays(1))"
#一周前
"一周前是: $($today.AddDays(-7))"
 
#五个月前
"五个月前:$($today.AddMonths(-5))"
 
#十年之前
"十年之前:$($today.AddYears(-10).Year)年,我们是朋友."
 
#日期格式化
"格式化日期：" + $today.ToString('yyyy-MM-dd')
```


输出结果：

今天是：09/05/2012 18:37:55
昨天是:09/04/2012 18:37:55
明天是:09/06/2012 18:37:55
一周前是: 08/29/2012 18:37:55
五个月前:04/05/2012 18:37:55
十年之前:2002年,我们是朋友.
格式化日期：2012-09-05


### 字符串中输出


注意：在Write-Host里面使用Get-Date，
我们只能得到一个内容为“Get-Date”的字符串，
效果如下：

```powershell
PS C:\Users\zhanghong> Write-Host "Get-Date, helllo!"
Get-Date, helllo!
```

如果想要在Write-Host里面输出当前时间，
可以把Get-Date当作一个变量，使用“$()”把它引起来。
使用如下方法：

```powershell
PS C:\Users\zhanghong> Write-Host "$(Get-Date), hello!"
09/09/2013 22:29:41, hello!
```
### 格式化输出

下面看看如何使用-Format参数来获取Get-Date中的
年、月、日、时、分、秒。
先记住如下一个对应关系：


```
yyyy    年
M    月
d    日
h    小时（12小时制）
H    小时（24小时制）
m    分钟
s    秒
```

然后看看例子就懂了：

```powershell
 Get-Date -Format 'yyyy'
 2013
```
## New-TimeSpan

### 获取一段时间


Example 1: Create a TimeSpan object for a specified duration

```powershell
PS D:\>$TimeSpan = New-TimeSpan -Hour 1 -Minute 25
PS D:\>$TimeSpan

Days               : 0
Hours              : 1
Minutes            : 25
Seconds            : 0
Milliseconds       : 0
Ticks              : 51000000000
TotalDays          : 0.0590277777777778
TotalHours         : 1.41666666666667
TotalMinutes       : 85
TotalSeconds       : 5100
TotalMilliseconds  : 5100000
```
Example 2: Create a TimeSpan object for a time interval

```powershell
PS D:\> new-timespan -end (get-date -year 2010 -month 1 -day 1)

Days              : -3393
Hours             : 0
Minutes           : 0
Seconds           : 0
Milliseconds      : -4
Ticks             : -2931552000049571
TotalDays         : -3393.00000005737
TotalHours        : -81432.000001377
TotalMinutes      : -4885920.00008262
TotalSeconds      : -293155200.004957
TotalMilliseconds : -293155200004.957
```
Example 3: Get the date 90 days from the current date

```powershell
PS C:\>$90days = New-TimeSpan -Days 90
PS C:\>(Get-Date) + $90days

2019年7月16日 22:59:13
```


Example 4: Discover the TimeSpan since a file was updated
```powershell
PS C:\>dir $pshome\en-us\about_remote.help.txt | New-TimeSpan
Days              : 321
Hours             : 21
Minutes           : 59
Seconds           : 22
Milliseconds      : 312
Ticks             : 278135623127728
TotalDays         : 321.916230471907
TotalHours        : 7725.98953132578
TotalMinutes      : 463559.371879547
TotalSeconds      : 27813562.3127728
TotalMilliseconds : 27813562312.7728 PS C:\># Equivalent to:

PS C:\>New-TimeSpan -Start (dir $pshome\en-us\about_remote.help.txt).lastwritetime
```
This command tells you how long it has been since the about_remote.help.txt file was last updated.
You can use this command format on any file, and on any other object that has a LastWriteTime property.

This command works because the Start parameter of 
New-TimeSpan has an alias of LastWriteTime.
When you pipe an object that has a LastWriteTime property to
New-TimeSpan , Windows PowerShell uses the value
of the LastWriteTime property as the value of the Start parameter.
```powershell
PS D:\> New-TimeSpan -Start (dir $pshome\en-us\about_remote.help.txt).lastwritetime


Days              : 1347
Hours             : 13
Minutes           : 30
Seconds           : 32
Milliseconds      : 710
Ticks             : 1164294327104202
TotalDays         : 1347.56287859283
TotalHours        : 32341.5090862278
TotalMinutes      : 1940490.54517367
TotalSeconds      : 116429432.71042
TotalMilliseconds : 116429432710.42
```
### 计算时间差


## 系统运行时间
