<# 模板_变量数组哈希表

#>
# 整数
    $length = 32
    $length
    # 32
    $length.GetType()
    # IsPublic IsSerial Name                                     BaseType
    # -------- -------- ----                                     --------
    # True     True     Int32                                    System.ValueType
# 字符串
    $surname = 'John'
    $surname
    # John
    $doubleQuotes = "字符中有 $length"
    $doubleQuotes
    # 瀛楃涓湁 32
    # FIXME 字符中有 32
    $surname.GetType()
    # IsPublic IsSerial Name                                     BaseType
    # -------- -------- ----                                     --------
    # True     True     String                                   System.Object
# 空值和布尔值
    $null
    $uninitialized
    $uninitialized -eq $null
    # True
    $true
    # True
    $false
    # False
# 数组
    $arr = @(1, 3, 5)
    $arr[0]
    # 1
    $arr[1]
    # 3
    $arr[2]
    # 5
    $arr[3]
    # 无返回值
    $arr[3] -eq $null
    # True
    # $arr[3] =4          # error!!!!!!!!!!!!!
    # 索引超出了数组界限。
    # 所在位置 行:1 字符: 1
    # + $arr[3] =4
    # + ~~~~~~~~~~
    #     + CategoryInfo          : OperationStopped: (:) [], IndexOutOfRangeException
    #     + FullyQualifiedErrorId : System.IndexOutOfRangeException


# 哈希表
    $haxi = @{ 'a' = 3; "name" = "will"}
    $haxi
    # Name                           Value
    # ----                           -----
    # name                           will
    # a                              3
    $haxi['a']
    # 3

    # $haxi[a]          # error!!!!!!!!!!!!!
    # 所在位置 行:1 字符: 7
    # + $haxi[a]
    # +       ~
    # 数组索引表达式丢失或无效。
    # 所在位置 行:1 字符: 7
    # + $haxi[a]
    # +       ~~
    # 表达式或语句中包含意外的标记“a]”。
    #     + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException
    #     + FullyQualifiedErrorId : MissingArrayIndexExpression
    $haxi['name']
    # will
    $haxi.Name
    # will
    $haxi.Name = 'jason'
    $haxi
    # Name                           Value
    # ----                           -----
    # name                           jason
    # a                              3

# $_
# 包含管道对象中的当前对象。
# 在对管道中的每个对象或所选对象执行操作的命令中，
# 可以使用此变量。
    1,2,3 | ForEach-Object { write-host (2*$_) }
    # 2
    # 4
    # 6
    1,2,3 | %{ write-host ($PSItem + 2) }
    # 3
    # 4
    # 5
    1,2,3,4 | Where-Object {($_%2) -eq 1}
    # 1
    # 3
    1,2,3,4 | ?{($_%2) -eq 0}
    # 2
    # 4

# 换行的用法
    Get-CimInstance -ClassName Win32_PhysicalMemory | `
        Select-Object Capacity |
        ForEach-Object { write-host $_ }


