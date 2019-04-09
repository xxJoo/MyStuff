# �������� powershell ���нű�ʱ
# �� powerhsell ��ִ���������
# Get-ExecutionPolicy -List
# Set-ExecutionPolicy RemoteSigned 
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


# ������ʾ��
Function Show-MessageBoxDialog([string]$myString = $find){
    # Write-Host "Show-MessageBoxDialog"
    $PopUpWin = new-object -comobject wscript.shell
    [void]$PopUpWin.popup($myString)
}
# Show-MessageBoxDialog($myString = "�ҵ�CAD��װ·��")

# ���� CAD ��װ�ļ���
Function Find-File([bool]$key = $false){
    Write-Host "Find-File"
    $find = Get-ChildItem -Path C:\ -Depth 2 -Filter 'AutoCAD 2016' `
        -ErrorAction SilentlyContinue -ErrorVariable $abcd
    if ($null -ne $find){
        Show-MessageBoxDialog($myString = "�ҵ�CAD��װ·��")
        return $find
    }
}
# $CAD_Path = Find-File

# ���� PGP �ļ�
Function Find-PGP_File($CAD2016_Path){
    # Write-Host "Find-PGP_File"
    $CAD2016_Path = Get-ChildItem `
        -Path 'C:\Users\*\AppData\Roaming\Autodesk\AutoCAD*\' `
        -Filter 'acad.pgp' -Recurse
    if ($null -eq $CAD2016_Path){
        Show-MessageBoxDialog($myString = "δ�ҵ�CAD2016��װ·��")
        return
    }
    else{
        Show-MessageBoxDialog($myString = "�ҵ�CAD2016��װ·��")
        $CAD2016_Path
    }
}
# $MyPGP = Find-PGP_File
# ���ҽ��


# CAD ��ݼ�
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
    # ���ȥ�����׵� tab
    # How To Remove the tab
    # in front of every line of $myShortCuts
    return $myShortCuts
}





# �������
# Main

Write-Host "Function Main"

# ��cad��װ�ļ����в���acad.pgp�ļ�
$MyPGP = Find-PGP_File
if ($null -eq $MyPGP){
    return
}


# �ж�ÿ�� acad.pgp �ļ�������
foreach ($pgp in $MyPGP)
{
    # ����Ѿ����������
    $key = Get-Content $pgp.FullName -Tail 2
    if (([string]$key) -match "\s; ShortCutAdded"){
        Show-MessageBoxDialog($myString = $pgp.FullName + "`n" +"�Ѿ��� PowerShell ��ӿ�ݼ�")
        Write-Host "ShortCutAdded"
        continue
    }
    # �� acad.pgp �ļ����������
    $myShortCuts = ShortCuts
    Add-Content $pgp.FullName $myShortCuts
}

# �� acad.pgp �ļ��鿴����
# Invoke-Item $MyPGP.FullName

Write-Host "End of This Scipt"

