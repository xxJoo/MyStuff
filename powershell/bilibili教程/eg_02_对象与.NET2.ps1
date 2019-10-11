class MyVersion {
    [Int]$Major
    [Int]$Minor
    [Int]$Build
    [Int]$Rev

    MyVersion()
    {
        $this.Major, $this.Minor, $this.Build, $this.Rev = 0
    }

    MyVersion($Major, $Minor, $Build, $Rev)
    {
        $this.Major = $Major
        $this.Minor = $Minor
        $this.Build = $Build
        $this.Rev = $Rev
    }

    [String]ToString()
    {
        return ($this.Major,$this.Minor,$this.Build,$this.Rev) -join '.'
    }

    [System.Version]Convert()
    {
        return [System.Version]$this.ToString()
    }
}

$myVersionA = New-Object MyVersion
$myVersionB = New-Object MyVersion 1,2,3,4
$myVersionA.Minor
$myVersionB.ToString()


enum VersionType {
    SoftwareVersion = 1
    HardwareVersion = 2
}

[VersionType]::SoftwareVersion


