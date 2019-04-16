<# download Node with this script
download url: https://nodejs.org/dist/v10.15.3/node-v10.15.3-x64.msi
downloaded file path: $env:temp\node-v10.15.3-x64.msi
#>


$des_url = 'https://nodejs.org/dist/v10.15.3/node-v10.15.3-x64.msi'
$downLoaded_file = "$env:temp\node-v10.15.3-x64.msi"
# Invoke-WebRequest : 请求被中止: 未能创建 SSL/TLS 安全通道。
[System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri $des_url -OutFile $downLoaded_file

# I did not run this line below, the downloaded file can also be started
# Unblock-File $downLoaded_file
Start-Process $downLoaded_file









