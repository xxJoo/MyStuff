
$reForce = Get-Content .\3D3S_Reaction.txt

# --------------------------------------------------------------------------
# String
$myText1 = @'
    节点1870

单位-----  力：[千牛],力矩：[千牛.米]
注------   X,Y,Z方向同节点局部坐标系

最大支座反力：
            Nx最大    Ny最大   Nz最大    Mx最大    My最大    Mz最大  合力最大
    组合:        56        29       53        58        48        22       53
    序号:         1         1        1         1         1         1        1
    Nx  :   341.796  -483.390 -484.202   319.259   257.794    68.878 -484.202
    Ny  :  -355.088    35.161   35.156  -567.501  -221.088  -132.905   35.156
    Nz  :  -238.845  1131.722 1152.802  -514.166  -461.992  1058.118 1152.802
    Mx  :   237.683  -154.259 -154.514   363.887   140.654   106.686 -154.514
    My  :   104.330  -113.323 -113.266    78.544   107.856   -50.253 -113.266
    Mz  :    -3.425     5.083    4.861    -6.355    -4.409     8.369    4.861
            Nx最小    Ny最小   Nz最小    Mx最小    My最小    Mz最小
    组合:        53        58       26        59        29        15
    序号:         1         1        1         1         1         1
    Nx  :  -484.202   319.259  236.567  -440.054  -483.390    44.414
    Ny  :    35.156  -567.501 -546.469    33.586    35.161  -305.811
    Nz  :  1152.802  -514.166 -1007.073  1128.377  1131.722  -857.729
    Mx  :  -154.514   363.887  334.683  -164.091  -154.259   174.833
    My  :  -113.266    78.544   75.262   -63.796  -113.323    29.082
    Mz  :     4.861    -6.355   -8.671    -1.717     5.083    -9.527
'@






# $a = $myText1 -split '(Nx最小)'
# PS C:\Users\dell> $a.Length
# 3
# PS C:\Users\dell> $myText1.GetType()

# IsPublic IsSerial Name                                     BaseType
# -------- -------- ----                                     --------
# True     True     String                                   System.Object

# --------------------------------------------------------------------------

# --------------------------------------------------------------------------
# ScriptBlock
$myText2 = {
    节点1870

单位-----  力：[千牛],力矩：[千牛.米]
注------   X,Y,Z方向同节点局部坐标系

最大支座反力：
            Nx最大    Ny最大   Nz最大    Mx最大    My最大    Mz最大  合力最大
    组合:        56        29       53        58        48        22       53
    序号:         1         1        1         1         1         1        1
    Nx  :   341.796  -483.390 -484.202   319.259   257.794    68.878 -484.202
    Ny  :  -355.088    35.161   35.156  -567.501  -221.088  -132.905   35.156
    Nz  :  -238.845  1131.722 1152.802  -514.166  -461.992  1058.118 1152.802
    Mx  :   237.683  -154.259 -154.514   363.887   140.654   106.686 -154.514
    My  :   104.330  -113.323 -113.266    78.544   107.856   -50.253 -113.266
    Mz  :    -3.425     5.083    4.861    -6.355    -4.409     8.369    4.861
            Nx最小    Ny最小   Nz最小    Mx最小    My最小    Mz最小
    组合:        53        58       26        59        29        15
    序号:         1         1        1         1         1         1
    Nx  :  -484.202   319.259  236.567  -440.054  -483.390    44.414
    Ny  :    35.156  -567.501 -546.469    33.586    35.161  -305.811
    Nz  :  1152.802  -514.166 -1007.073  1128.377  1131.722  -857.729
    Mx  :  -154.514   363.887  334.683  -164.091  -154.259   174.833
    My  :  -113.266    78.544   75.262   -63.796  -113.323    29.082
    Mz  :     4.861    -6.355   -8.671    -1.717     5.083    -9.527
}

# PS C:\Users\dell> $myText.GetType()

# IsPublic IsSerial Name                                     BaseType
# -------- -------- ----                                     --------
# True     True     ScriptBlock                              System.Object

# --------------------------------------------------------------------------

# $myText.Length - $myText.Replace("`n",'').Length + 1
# $myText.ToString() | Out-GridView