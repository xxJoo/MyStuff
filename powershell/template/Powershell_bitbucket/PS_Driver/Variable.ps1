<#
文件：E:\CW\Bitbucket\firstrepository\Powershell\Powershell版本.ps1
用途：
创建：
修改：
#>

# 选择变量名
${"I"like $} = "mossfly"

# 赋值和返回值
$item = Get-ChildItem

# 给多个变量同时赋值
$a = $b = $c = 123

# 交换变量的值
$value1 = 10
$value2 = 20
$value1,$value2=$value2,$value1

# 查看正在使用的变量
ls variable:
dir variable:
Get-ChildItem Variable:
# 或者
cd Variable:
ls

# 查找变量
ls variable:value*

# 查看变量
$env:Path -split ";"


# 验证变量是否存在
Test-Path variable:value1
Test-Path variable:valueUnkonw

# 删除变量
del variable:value1

# 使用专用的变量命令
# 为了管理变量，powershell提供了五个专门管理变量的命令
# Clear-Variable
# Get-Variable
# New-Variable
# Remove-Variable
# Set-Variable
# 因为虚拟驱动器variable:的存在，clear，remove，set打头的命令可以被代替。
# 但是Get-Variable，New-Variable。
# 却非常有用
# new-variable可以在定义变量时，
# 指定变量的一些其它属性，比如访问权限。
# 同样Get-Variable也可以获取这些附加信息。


# 变量写保护
New-Variable num -Value 100 -Force -Option readonly
# $num=100
del Variable:num -Force
Test-Path variable:num
# False

new-variable num -Value "strong" -Option constant


# 变量描述
# 在New-Variable 可以通过 -description 添加变量描述，
# 但是变量描述默认不会显示，可以通过 Format-List 查看。
new-variable name -Value "me" -Description "This is my name"
ls Variable:name | fl *
ls Variable:name | Format-List *

