<#
-Begin, -Process, -End
ForEach, For, %

'You', 'Me' | ForEach-Object {"Say $_"}
Say You
Say Me

Where, ?
'You', 'Me' | Where-Object {$_ -match 'u'}
You

Select-Object
-First, -Last, -Skip, -SkipLast, -Property, Unique, -ExpandProperty
Select
Get-ComputerInfo | Select-Object -ExpandProperty OsName

'i like tea' -replace 'tea', 'coffee'
=>i like tea
'i like tea' -replace '\s', '_'
=>i_like_tea

-join ('a', 'b', 'c')
=>abc
'127', '0', '0', '1' -join '.'
=>127.0.0.1

#>

param
(
    $ShowBuild
)

Begin
{
    Write-Host "Begin: eg_Cmdlets_Pipeline.ps1"
}

Process
{
    $version = [version] $_
    $os = switch ($version.Major, $version.Minor -join '.') 
    {
        '10.0' { "Windows 10/Windows Server 2016" }
        '6.3'  { "Windows 8.1/Windows Server 2012R2" }
        '6.2'  { "Windows 8/Windows Server 2012" }
        '6.1'  { "Windows 7/Windows Server 2008R2" }
        '6.0'  { "Windows Vista/Windows Server 2008" }
        '5.2'  { "Windows XP Professional/Windows Server 2003R2" }
        Default { "Windows XP/Windows Server 2003 or older" }
    }

    if ($Showbuild) {
        $os + " Build " + $version.Build    
    } else {
        $os
    }
}

End
{
    Write-Host "End:Begin: eg_Cmdlets_Pipeline.ps1"
}



# PS D:\MyDoc\GitHub\PowerShell> Get-WmiObject win32_operatingsystem |
#     Select-Object -ExpandProperty Version |
#     .\eg_Cmdlets_Pipeline.ps1
# Begin: eg_Cmdlets_Pipeline.ps1
# Windows 10/Windows Server 2016
# End:Begin: eg_Cmdlets_Pipeline.ps1
# PS D:\MyDoc\GitHub\PowerShell>