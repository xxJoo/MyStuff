# 当不能在 powershell 运行脚本时
# 在 powerhsell 上执行以下语句
# Get-ExecutionPolicy -List
# Set-ExecutionPolicy RemoteSigned 
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


# 返回提示框
Function Show-MessageBoxDialog([string]$myString = $find){
    # Write-Host "Show-MessageBoxDialog"
    $PopUpWin = new-object -comobject wscript.shell
    [void]$PopUpWin.popup($myString)
}
# Show-MessageBoxDialog($myString = "找到CAD安装路径")

# 查找 CAD 安装文件夹
Function Find-File([bool]$key = $false){
    Write-Host "Find-File"
    $find = Get-ChildItem -Path C:\ -Depth 2 -Filter 'AutoCAD 2016' `
        -ErrorAction SilentlyContinue -ErrorVariable $abcd
    if ($null -ne $find){
        Show-MessageBoxDialog($myString = "找到CAD安装路径")
        return $find
    }
}
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


# CAD 快捷键
Function ShortCuts(){
    Write-Host "ShortCuts"
    $myShortCuts = '
    ; ShortCutAdded By PowerShell
    ;  -- CW Defined Command Aliases --
    ;  Make any changes or additions to the default AutoCAD command aliases in 
    ;  this section to ensure successful migration of these settings when you
    ;  upgrade to the next version of AutoCAD.  If a command alias appears more
    ;  than once in this file, items in the User Defined Command Alias take
    ;  precedence over duplicates that appear earlier in the file.
    ;  **********------------**********
    ;  No xlate 
    ;  DO NOT REMOVE

    AE,       *MEASURE
    AF,       *MATCHPROP
    AV,       *DIVIDE
    C,        *COPY
    CA,       *CAL
    CB,       *GJCHXB
    CC,       *REFEDIT
    CR,       *CIRCLE
    D,        *DIMLINEAR
    DA,       *ID
    DC,       *DIMCONTINUE
    DD,       *DIST
    DDE,      *DDEDIT
    DE,       *DIMANGULAR
    DF,       *LENGTHEN
    DG,       *DIMALIGNED
    DR,       *LAYMCUR
    DW,       *DIMRADIUS
    DWW,      *DIMDIAMETER
    EE,       *REFCLOSE
    FD,       *ALIGN
    FF,       *OFFSET
    GG,       *JOIN
    M,        *WBLOCK
    Q,        *LINE
    QA,       *POINT
    QQ,       *PLINE
    QS,       *QSELECT
    R,        *ROTATE
    RD,       *EXTERNALREFERENCES
    RE,       *REGEN
    SA,       *UCS
    SS,       *BHATCH
    T,        *TRIM
    VA,       *DRAWORDER
    VB,       *LAYON
    VC,       *LAYOFF
    VF,       *LAYISO
    VG,       *LAYUNISO
    VV,       *VPORTS
    VW,       *LAYTHW
    VZ,       *LAYFRZ
    W,        *MOVE
    WE,       *MIRROR
    WQ,       *MLINE
    WW,       *REVCLOUD
    XX,       *XLINE

    ; ShortCutAdded
    '
    # 如何去掉行首的 tab
    # How To Remove the tab
    # in front of every line of $myShortCuts
    return $myShortCuts
}





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

