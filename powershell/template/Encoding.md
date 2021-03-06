# 转换文本文件编码

outfile -Encoding <String>
指定文件中使用的字符编码类型，有效值包括：
- Unicode
- UTF7
- UTF8
- UTF32
- ASCII
- BigEndianUnicode
- Default
- OEM
- Unicode (默认值)

```powershell
# 转换文本文件为ASCII编码
# Convert any text file to ASCII
param( [string] $infile = $(throw "Please specify a filename.") )
$outfile = "$infile.ascii"
get-content -path $infile | out-file $outfile -encoding ascii

# 转换文本文件为Unicode编码
# Convert any text file to Unicode
param([string] $infile = (Read-Host "Please specify a filename."))
$outfile = "$infile.unicode"
get-content -Path $infile | out-file $outfile -encoding unicode

# 转换文本文件为UTF-8编码
# Convert any text file to UTF-8
param([string] $infile = (Read-Host "Please specify a filename."))
$outfile = "$infile.utf8"
get-content -Path $infile | out-file $outfile -encoding utf8

# 转换文本文件为GBK编码
# Convert any text file to GBK
# param([string] $infile = (Read-Host "Please specify a filename."))
param([string] $infile = ".\powershell\test.txt")
$outfile = "$infile.utf8"
get-content -Path $infile | out-file $outfile -encoding utf8
```