<# download windock with this script
download url: https://www.ivanyu.ca/s/WinDock_Setup_1_1_2.exe
downloaded file path: $env:temp\WinDock_Setup_1_1_2.exe
#>


$des_url = 'https://www.ivanyu.ca/s/WinDock_Setup_1_1_2.exe'
$downLoaded_file = "$env:temp\WinDock_Setup_1_1_2.exe"
# Invoke-WebRequest : 请求被中止: 未能创建 SSL/TLS 安全通道。
[System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri $des_url -OutFile $downLoaded_file

# I did not run this line below, the downloaded file can also be started
# Unblock-File $downLoadedPython
Start-Process $downLoaded_file




