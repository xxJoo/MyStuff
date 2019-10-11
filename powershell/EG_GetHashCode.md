



GetHashCode
```powershell
PS E:\CW>$location = Get-Location
PS E:\CW>$location.GetHashCode()
49832095
PS E:\CW>$locations = Get-Location
PS E:\CW>$locations.GetHashCode()
62639710
PS E:\CW>Set-Location ..
PS E:\>$location = Get-Location
PS E:\>$location.GetHashCode()
43233492
PS E:\>$location

Path
----
E:\     
```