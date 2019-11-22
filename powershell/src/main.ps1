








function testFunc {
    param (
        [Parameter(ValueFromPipeline=$true)]
        [string]$myname = "defaultName"
    )
    begin{
        "the function is begin."
    }
    process{
        Write-Host "Hello, $myname, parameter form pipe: [$_]!"
    }
    end{
        "this is the end of function."
    }
}



# testFunc -myname "will"
# testFunc "will"
# "a", "b", "c" | testFunc -myname "cake"
"a", "b", "c" | testFunc
testFunc -myname "helloy~"
testFunc







