# 当不能在 powershell 运行脚本时
# 在 powerhsell 上执行以下语句
# Get-ExecutionPolicy -List
# Set-ExecutionPolicy RemoteSigned 
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser




Function Show-MessageBoxDialog([string] $myString = $find){
    # Show message in a box
    # message $myString
    # example:
    # Show-MessageBoxDialog($myString = "找到CAD安装路径")

    # Write-Host "Show-MessageBoxDialog"
    $PopUpWin = new-object -comobject wscript.shell
    [void]$PopUpWin.popup($myString)
}

# -------------------------------------------------------------------
# via regitry
# find the installed program path
# then find the pgp file
# -------------------------------------------------------------------


Function Find-File([bool]$key = $false){
    # 查找 CAD 安装文件夹
    Write-Host "Find-File"
    $find = Get-ChildItem`
        -Path C:\ -Depth 2`
        -Filter 'AutoCAD 2016' 
        -ErrorAction SilentlyContinue`
        -ErrorVariable $abcd
    if ($null -ne $find){
        Show-MessageBoxDialog($myString = "找到CAD安装路径")
        return $find
    }
}
$find = Get-ChildItem -Path C:\ -Depth 2 -Filter 'AutoCAD 2016'

# $CAD_Path = Find-File


# 查找 PGP 文件
Function Find-PGP_File($CAD2016_Path){
    # Write-Host "Find-PGP_File"
    $CAD2016_Path = Get-ChildItem `
        -Path 'C:\Users\*\AppData\Roaming\Autodesk\AutoCAD*\' `
        -Filter 'acad.pgp' -Recurse
    if ($null -eq $CAD2016_Path){
        Show-MessageBoxDialog($myString = "未找到CAD2016安装路径")
        return
    }
    else{
        Show-MessageBoxDialog($myString = "找到CAD2016安装路径")
        $CAD2016_Path
    }
}
# $MyPGP = Find-PGP_File
# 查找结果

# -------------------------------------------------------------------
# import shortcuts form current path
# file: AutoCAD_ShortCuts.txt
# -------------------------------------------------------------------






# 程序入口
# Main

Write-Host "Function Main"

# 在cad安装文件夹中查找acad.pgp文件
$MyPGP = Find-PGP_File
if ($null -eq $MyPGP){
    return
}


# 判断每个 acad.pgp 文件中内容
foreach ($pgp in $MyPGP)
{
    # 如果已经添加则跳过
    $key = Get-Content $pgp.FullName -Tail 2
    if (([string]$key) -match "\s; ShortCutAdded"){
        Show-MessageBoxDialog($myString = $pgp.FullName + "`n" +"已经用 PowerShell 添加快捷键")
        Write-Host "ShortCutAdded"
        continue
    }
    # 在 acad.pgp 文件中添加内容
    $myShortCuts = ShortCuts
    Add-Content $pgp.FullName $myShortCuts
}

# 打开 acad.pgp 文件查看内容
# Invoke-Item $MyPGP.FullName

Write-Host "End of This Scipt"

