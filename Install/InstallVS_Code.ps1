<# download VS_Code with this script
download url: https://go.microsoft.com/fwlink/?Linkid=852157
downloaded file path: $env:temp\VSCodeSetup-x64-1.33.1.exe
#>


$des_url = 'https://go.microsoft.com/fwlink/?Linkid=852157'
$downLoaded_file = "$env:temp\VSCodeSetup-x64-1.33.1.exe"
# Invoke-WebRequest : 请求被中止: 未能创建 SSL/TLS 安全通道。
[System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri $des_url -OutFile $downLoaded_file

# I did not run this line below, the downloaded file can also be started
# Unblock-File $downLoaded_file
Start-Process $downLoaded_file
