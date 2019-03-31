# �������� powershell ���нű�ʱ
# �� powerhsell ��ִ���������
# Set-ExecutionPolicy RemoteSigned





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
    if ($find -ne $null){
        Show-MessageBoxDialog($myString = "�ҵ�CAD��װ·��")
        return $find
    }
}
# $CAD_Path = Find-File

# ���� PGP �ļ�
Function Find-PGP_File($CAD2016_Path){
    # Write-Host "Find-PGP_File"
    $CAD2016_Path = Get-ChildItem `
        -Path 'C:\Users\MyMor\AppData\Roaming\Autodesk\AutoCAD 2016\' `
        -Filter 'acad.pgp' -Recurse
    if ($CAD2016_Path -eq $null){
        Show-MessageBoxDialog($myString = "δ�ҵ�CAD2016��װ·��")
        return
    }
    else{
        Show-MessageBoxDialog($myString = "�ҵ�CAD2016��װ·��")
        $CAD2016_Path
    }
}
# $MyPGP = Find-PGP_File

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
    W,        *MOVE
    WE,       *MIRROR
    WQ,       *MLINE
    WW,       *REVCLOUD
    XX,       *XLINE

    ShortCutAdded
    '
    return $myShortCuts
}




# �������
# Main

Write-Host "Function Main"

# ��cad��װ�ļ����в���acad.pgp�ļ�
$MyPGP = Find-PGP_File
if ($MyPGP -eq $null){
    return
}

# �ж� acad.pgp �ļ�������
$key = Get-Content $MyPGP.FullName -Tail 2
if ($key -eq '    ShortCutAdded'){
    Show-MessageBoxDialog($myString = "�Ѿ��� PowerShell ��ӿ�ݼ�")
    Write-Host "ShortCutAdded"
    return
}


# �� acad.pgp �ļ����������
$myShortCuts = ShortCuts
Add-Content $MyPGP.FullName $myShortCuts

# �� acad.pgp �ļ��鿴����
# Invoke-Item $MyPGP.FullName

Write-Host "End of This Scipt"















