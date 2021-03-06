<# 
To Do:
Specifies a path to one or more locations.
'D:\MyDoc\Visual Studio 2017\Source\Repos\MyStuff\InstallOnline'
#>
function Set-SecurityProtocolType {
    [System.Net.ServicePointManager]::SecurityProtocol = `
        [System.Net.SecurityProtocolType]::Tls12
}
function Install-SoftWareOnline {
    [CmdletBinding()]
    param (
        $url,
        $path
    )  
    process {
        $des_url = $url
        $downLoaded_file = "$path"
        Invoke-WebRequest -uri $des_url -OutFile $downLoaded_file
    }
}
function Install-Node {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://nodejs.org/dist/v10.15.3/node-v10.15.3-x64.msi' `
            -path "$env:temp\node-v10.15.3-x64.msi"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-Python {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://www.python.org/ftp/python/3.7.3/python-3.7.3-amd64.exe' `
            -path "$env:temp\python-3.7.3-amd64.exe"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-VisualStudioCode {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://go.microsoft.com/fwlink/?Linkid=852157' `
            -path "$env:temp\VSCodeSetup-x64-1.33.1.exe"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-WinDock {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://www.ivanyu.ca/s/WinDock_Setup_1_1_2.exe' `
            -path "$env:temp\WinDock_Setup_1_1_2.exe"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-SublimeText {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://download.sublimetext.com/Sublime%20Text%20Build%203207%20x64%20Setup.exe'`
            -path "$env:temp\Sublime Text Build 3207 x64 Setup.exe"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-Vim {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://github.com/vim/vim-win32-installer/releases/download/v8.1.1200/gvim_8.1.1200_x64.exe' `
            -path "$env:temp\gvim_8.1.1200_x64.exe"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-TeXLive {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/texlive.iso' `
            -path "$env:temp\texlive.iso"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}
function Install-Pandoc {
    param (
        [switch]
        $Install
    )
    begin { Set-SecurityProtocolType }
    process {
        Install-SoftWareOnline `
            -url 'https://github.com/jgm/pandoc/releases/download/2.9.1/pandoc-2.9.1-windows-i386.msi' `
            -path "$env:temp\pandoc-2.9.1-windows-i386.msi"
        if ($Install) {
            Start-Process $downLoaded_file
        }
    }
    end { Invoke-Item $env:temp }
}