# 转换文本文件编码
#############################################################
# 转换文本文件为ASCII编码
# Convert any text file to ASCII
param( [string] $infile = $(throw "Please specify a filename.") )
$outfile = "$infile.ascii"
get-content -path $infile | out-file $outfile -encoding ascii

# 转换文本文件为Unicode编码
Convert any text file to Unicode
param([string] $infile = (Read-Host "Please specify a filename."))
$outfile = "$infile.unicode"
get-content -Path $infile | out-file $outfile -encoding unicode

# 转换文本文件为UTF-8编码
Convert any text file to UTF-8
param([string] $infile = (Read-Host "Please specify a filename."))
$outfile = "$infile.utf8"
get-content -Path $infile | out-file $outfile -encoding utf8

# 转换文本文件为GBK编码
# Convert any text file to GBK
param([string] $infile = (Read-Host "Please specify a filename."))
$outfile = "$infile.utf8"
get-content -Path $infile | out-file $outfile -encoding utf8
