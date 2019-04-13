<# download python with this script
download url: https://www.python.org/ftp/python/3.7.3/python-3.7.3-amd64.exe
downloaded file path: $env:temp\python-3.7.3-amd64.exe
#>


$python_373_url = 'https://www.python.org/ftp/python/3.7.3/python-3.7.3-amd64.exe'
$downLoadedPython = "$env:temp\python-3.7.3-amd64.exe"
# Invoke-WebRequest : 请求被中止: 未能创建 SSL/TLS 安全通道。
[System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri $python_373_url -OutFile $downLoadedPython

# I did not run this line below, the downloaded file can also be started
# Unblock-File $downLoadedPython
Start-Process $downLoadedPython









