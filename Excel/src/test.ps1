# 模块说明


# 在内存生成一个 excel 程序
$xl = New-Object -ComObject excel.application
# 不用看见程序
# $xl.visible = $false
# 在 excel 程序中打开当前目录下的 excel 文件（工作簿）
$wb = $xl.workbooks.open([String](Join-Path (Get-Location) "PKPM2010.xls"))
# 路径不能有中文 以下路径会打开失败
# $wb = $xl.workbooks.open("D:\xxx\PKPM2010地震波.xls")

# 在已经打开的文件（工作簿）中，载入第一个工作表
$sheet = $wb.sheets.item(1)

# 单元格的访问方式
# 方式一 通过 range 方法 以名称访问
# Write-Host $sheet.range("B1").text
# 方式二 通过 cells 类的 item 方法 以索引号访问
$data = @{}
for ($i = 1; $i -le 6; $i++) {
    $data[$sheet.cells.item($i,1).text] = $sheet.cells.item($i,2).text
}
$data[$sheet.cells.item(1,4)] = $sheet.cells.
# Write-Host $data
$data | ConvertTo-Json
#A列对应每行的值 A column correspond to per row value

$xl.displayAlerts = $False
$wb.Close()
$xl.Application.Quit()

$xl = $null
[GC]::Collect()
