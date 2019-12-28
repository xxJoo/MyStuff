
# --------------------------------------------------------------------

$var = 42
if ($var -gt 25) {
    Write-Host "$var is greater than 25"
} else {
    Write-Host "$var is NOT greater than 25"
}

# --------------------------------------------------------------------

$x = 7 
switch ($x) {
    7 { Write-Host "Value is 7" }
    42 { Write-Host "Value is 42" ; break }
    {$_ -gt 25} { Write-Host "Value is greater than 25" }
    Default { Write-Host "Value is anything else"}
}

# --------------------------------------------------------------------

for ($i = 1; $i -le 5; $i++) {
    $i
}

# --------------------------------------------------------------------

$numbers = @('one', 'two', 'three', 'four', 'five')
foreach ($item in $numbers) {
    $item
}

# --------------------------------------------------------------------


$x = 0
Write-Verbose "befor while, x = $x"
while ($x -lt 3) {
    $x++
    Write-Host "Hello world, $x"
}
Write-Verbose "after while, x = $x"


# --------------------------------------------------------------------

$num = 0
while ($num -le 10) {
    $num
    $num += 1
}
# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

$num = 0
do {
    $num
    $num += 1
} while ($num -le 10)
# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

$num = 0
do {
    $num
    $num += 1
} until ($num -gt 10)
# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

# --------------------------------------------------------------------
