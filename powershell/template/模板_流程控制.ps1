
# if else 流程控制
    $var = 42
    if ($var -gt 25) {
        Write-Host "$var is greater than 25"
    } else {
        Write-Host "$var is NOT greater than 25"
    }
    # 42 is greater than 25
# switch 流程控制
    $x = 7 
    switch ($x) {
        7 { Write-Host "Value is 7" }
        42 { Write-Host "Value is 42" ; break }
        {$_ -gt 25} { Write-Host "Value is greater than 25" }
        Default { Write-Host "Value is anything else"}
    }
    # Value is 7
# for 流程控制
    for ($i = 1; $i -le 5; $i++) {
        $i
    }
    # 1
    # 2
    # 3
    # 4
    # 5
# foreach 流程控制
    $numbers = @('one', 'two', 'three', 'four', 'five')
    foreach ($item in $numbers) {
        $item
    }
    # one
    # two
    # three
    # four
    # five
# while 流程控制
$x = 0
Write-Verbose "befor while, x = $x"
while ($x -lt 3) {
    $x++
    Write-Host "Hello world, $x"
}
Write-Verbose "after while, x = $x"
    # Hello world, 1
    # Hello world, 2
    # Hello world, 3
# 
# while 流程控制
    $num = 0
    while ($num -lt 0) {
        Write-Host 'while 流程控制'
        $num
        $num += 1
    }
    # 
# do while 流程控制
    $num = 0
    do {
        Write-Host 'do while 流程控制'
        $num
        $num += 1
    } while ($num -lt 0)
    # do while 流程控制
    # 0
# do until 流程控制
    $num = 0
    do {
        Write-Host 'do until 流程控制'
        $num
        $num += 1
    } until ($num -gt 0)
    # do until 流程控制
    # 0

