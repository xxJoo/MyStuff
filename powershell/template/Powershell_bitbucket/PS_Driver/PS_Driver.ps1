

Get-PSProvider
# Name         Capabilities                        Drives       
# ----         ------------                        ------       
# Alias        ShouldProcess                       {Alias}      
# Environment  ShouldProcess                       {Env}        
# FileSystem   Filter, ShouldProcess, Credentials  {C, E, D, F} 
# Function     ShouldProcess                       {Function}   
# Registry     ShouldProcess, Transactions         {HKLM, HKCU} 
# Variable     ShouldProcess                       {Variable}   
# Certificate  ShouldProcess                       {Cert}       
# WSMan        Credentials                         {WSMan}  



# 显示 Powershell 版本
# Variable:
$PSVersionTable

# Start-Process powershell.exe -Credential "TestDomain\Me"
# Start-Process -NoNewWindow 
# Start-Process -ArgumentList "Start-Process powershell.exe -Verb runAs"
# Start-Process



