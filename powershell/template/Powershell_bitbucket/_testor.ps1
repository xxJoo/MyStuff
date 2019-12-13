# 中文
# 中文中文
Get-Help about_Automatic_variables


# 3D3S 提取计算书



# Python
# C:\Python27\
# 设置pip和python的环境变量
[Environment]::SetEnvironmentvariable("Path", ";c:\powershellscript", "User")
[Environment]::GetEnvironmentVariable("Path", "User")
[Environment]::SetEnvironmentVariable("Path", $null, "User")
[Environment]::GetEnvironmentVariable("Path", "User")





# 处理日志

$StartTime = (get-date).Date + (new-timespan -Hours 6 -Minutes 35)
$EndTime = (get-date).Date + (new-timespan -Hours 6 -Minutes 36)
$global:TaskStart
$Global:TaskComplete
$Global:events
$Global:event
$Global:TimeSpent
$Global:events = get-winevent -FilterHashtable @{logname = "Microsoft-Windows-TaskScheduler/Operational"; ID=107;StartTime=$StartTime;EndTime=$EndTime}
Foreach($Global:event in $Global:events)
{
    cls
    $StartLogs=get-winevent -FilterHashtable @{logname = "Microsoft-Windows-TaskScheduler/Operational";ID=100;StartTime=$StartTime}
    $CompleteLogs=get-winevent -FilterHashtable @{logname = "Microsoft-Windows-TaskScheduler/Operational";id=102;StartTime=$StartTime}
    $global:TaskStart=$StartLogs | where {$_.ActivityId -eq $Global:event.ActivityId}
    $Global:TaskComplete=$CompleteLogs | where {$_.ActivityId -eq $Global:event.ActivityId}
    $global:TimeSpent=($global:TaskComplete.timeCreated-$global:TaskStart.timeCreated).TotaLMinutes
    if(($global:TaskStart -ne $NULL) -and ($Global:TaskComplete -ne $null) -and ($Global:TimeSpent -gt 1)){
           
        $Messagebody="Sync task started at:  "+$global:TaskStart.TimeCreated.DateTime+"`r`n"
        $Messagebody=$Messagebody+"`r`nSync task completed at:  "+$global:TaskComplete.timeCreated.DateTime+"`r`n"
        $Messagebody=$Messagebody+"`r`nTask lasted for "+("{0:N2}" -f ($Global:TimeSpent) )+" minutes"
           
        Send-MailMessage -From "CustomerLog@avepoint.com" -To "Zhijie.bai@avepoint.com","Infrastructure_cn@avepoint.com" -Subject "Customer Logs Sync Report:Success" -Body $Messagebody -SmtpServer "10.100.100.153" -Encoding UTF8
    }
    else{
        $Messagebody="########################################################################`r`n"
        $Messagebody=$Messagebody+"`r`nCustom logs Sync failed, please login 10.2.0.125 to check and sync again`r`n"
        $Messagebody=$Messagebody+"`r`n########################################################################`r`n"
        Send-MailMessage -From "CustomerLog@avepoint.com" -To "Zhijie.bai@avepoint.com","Infrastructure_cn@avepoint.com" -Subject "Customer Logs Sync Report:Failed" -Body $Messagebody -SmtpServer "10.100.100.153" -Encoding UTF8 -Priority High
    }
}














