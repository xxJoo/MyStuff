function Format-WindowsVersion 
{
    [CmdletBinding(SupportsShouldProcess)]

    param
    (
        # Parameter help description
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]
        $VersionString,
    
        [switch]
        $ShowBuild
    )
    
    
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
    
}


function Get-WindowsVersion {
    [CmdletBinding()]
    param (
        
    )
    
    


    begin {
    }
    
    process {
        Get-WMIObject -Class Win32_OperatingSystem |
        Select-Object -ExpandProperty Version

        
    }
    
    end {
    }
}