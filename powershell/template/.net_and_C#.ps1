# 在powershell中使用.net技术
<# 
PowerShell中调用静态方法可以以这种形式执行
[Class]::Method()

文件名有后缀吗
PS ...> [system.io.path]::HasExtension("c:\")
False
PS ...> [system.io.path]::HasExtension("c:\a.txt")
True
#>

Write-Host [System.Math]::PI
# [System.Math]::PI
Write-Host ([System.Math]::PI)
# 3.14159265358979
$a = $null
[System.Math]::DivRem(7, 3, [ref]$a)
# $a = 1
$s = 'sdfksd/\sdf$a'
# sdfksd/\sdf$a
$s = "sdfksd/\sdf$a"
# sdfksd/\sdf1
[Microsoft.JScript.MathObject]::E
# 找不到类型 [Microsoft.JScript.MathObject]。


# 在PowerShell中使用C#
<# 
$newType = @'
using System;
using System.Text;
using System.Runtime.InteropServices;
 
namespace WindowsAPILib
{
    public class Helper
    {
        [DllImport("shlwapi.dll", CharSet = CharSet.Auto, SetLastError = true)]
        internal static extern bool PathCompactPathEx(System.Text.StringBuilder pszOut, string pszSrc, Int32 cchMax, Int32 dwFlags);
 
        public static string CompactPath(string Path, int DesiredLength)
        {
            StringBuilder sb = new StringBuilder(260);
            if (PathCompactPathEx(sb, Path, DesiredLength + 1, 0))
            { return sb.ToString(); }
            else
            { return Path; }
        }
    }
}
'@
Add-Type -TypeDefinition $newType
#>

# TODO 这句什么意思



