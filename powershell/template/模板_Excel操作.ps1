
<# 
# 在内存生成一个 excel 程序
    $xl = New-Object -ComObject excel.application
    $xl|Get-Member
    # 不用看见程序
    $xl.visible = $false
# 工作簿的访问方式
    # 在 excel 程序中打开当前目录下的 excel 文件（工作簿）
    $wb = $xl.workbooks.open([String](Join-Path (Get-Location) "PKPM2010.xls"))
    # 路径不能有中文 以下路径会打开失败
    # $wb = $xl.workbooks.open("D:\xxx\PKPM2010地震波.xls")
    # 添加工作表
    $wb = $xl.Workbooks.Add()
    $wb|Get-Member
# 工作表的访问方式
    # 工作表集合的属性
    $wb.Sheets|Get-Member
    # 工作表访问形式一
    # 在已经打开的文件（工作簿）中，载入第一个工作表
    $sheet = $wb.sheets.item(1)
    # 工作表访问形式二
    # 在已经打开的文件（工作簿）中，载入 "testor" 工作表
    $sheet = $wb.Sheets.Item("testor")
    # 操作工作表的属性
    $wb.sheet|Get-Member
    # 例如名称属性
    $wb.Sheets.Item("testor").name = "testor1"
# 单元格的访问方式
    # 方式一 通过 range 方法 以名称访问
    $sheet.range("B1")|Get-Member
    # 方式二 通过 cells 类的 item 方法 以索引号访问
    $sheet.cells.item(1,2)|Get-Member
 #>


# example
$xl = New-Object -ComObject excel.application
$wb = $xl.workbooks.open([String](Join-Path (Get-Location) "PKPM2010.xls"))
$sheet = $wb.sheets.item(1)
# 建立一个空哈希表 $data
$data = @{}
for ($i = 1; $i -le 6; $i++) {
    # 写入对应单元格的 键(key) 和 值(value)
    $data[$sheet.cells.item($i,1).text] = $sheet.cells.item($i,2).text
}
$data[$sheet.cells.item(1,4)] = $sheet.cells.
# Write-Host $data
$data | ConvertTo-Json
#A列对应每行的值 A column correspond to per row value

# 不出现提示
$xl.displayAlerts = $False
# 关闭工作簿
$wb.Close()
# 退出 excel 程序
$xl.Application.Quit()
# 清理 $xl 变量
$xl = $null
# 回收内存 ?
[GC]::Collect()











$sheet.cells.item(1,1) = "Test"
$a = $sheet.cells.item(1,2).value2

$sheet.cells.item(1,2).AddComment("abc")
$sheet.cells.item(1,2).Comment.Delete()




$found = $sheet.cells.find('看是')
$Found.Address(0,0,1,1)





$book.Sheets.Count     # 
$book.Sheets(1).Name   # 无法执行
$book.ActiveSheet.Name # 无法执行
$book.Sheets(1).Name = "hoge" # 无法执行



$xlWBATWorksheet = -4167
$book = $excel.workbooks.add($xlWBATWorksheet)


