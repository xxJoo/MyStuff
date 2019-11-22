<#
-Verbose Write-Verbose
-Debug Write-Debug
-ErrorAction
    -Continue
    -SilentlyContinue
    -Inquire
    -...

-WhatIf
-Confirm
    [CmdletBinding(SupportsShouldProcess)]
    if ($PSCmdlet.ShouldProcess(<目标>, <操作>)) 
    {
        <关键语句>
    }

[Parameter()]
[<Type>]
$Name

[Parameter(Mandatory = <$false|$true>)]
[Parameter(Position = <Int>)]
-从 0 开始

[ValidateSet(<元素>, <元素>, ...)]
[ValidateLenghth(<最小值>, <最大值>)]
[ValidateRange(<最小值>, <最大值>)]
[ValidateScript({<表达式>})]
[ValidatePattern(<正则表达式>)]

#>
[CmdletBinding(SupportsShouldProcess)]

param
(
    [ValidatePattern('^(\d+\.){3}\d+$')]
    # Parameter help description
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [string]
    $VersionString,

    [switch]
    $ShowBuild
)

Begin
{
    Write-Host "Begin: eg_Advance.ps1"
}

Process
{
    # Write-Verbose 'Process Version String $_'
    Write-Verbose "Process Version String $_"

    if ($PSCmdlet.ShouldProcess($_, "Convert")) 
    {
        Write-Verbose "Converting to System.Version Object"
        $version = [version] $_
    }

    if ($PSCmdlet.ShouldProcess($_, "Derivate OS")) 
    {
        Write-Verbose "Derivating actual OS from Object"
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

        if ($Showbuild) 
        {
            $os + " Build " + $version.Build    
        }
        else 
        {
            $os
        }
    }

}

End
{
    Write-Host "End:Begin: eg_Advance.ps1"
}



# PS D:\MyDoc\GitHub\PowerShell> Get-WmiObject win32_operatingsystem |
#     Select-Object -ExpandProperty Version |
#     .\eg_Cmdlets_Pipeline.ps1
# Begin: eg_Cmdlets_Pipeline.ps1
# Windows 10/Windows Server 2016
# End:Begin: eg_Cmdlets_Pipeline.ps1
# PS D:\MyDoc\GitHub\PowerShell>