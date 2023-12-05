function Replace-FirstAndLast {
    param (
        [string]$NumberToConvert,
        [string]$Linetext
    )

    switch ($NumberToConvert) {
        "one" {
            $Linetext = $Linetext -replace "one", 1  
        }
        "two" {
            $Linetext = $Linetext -replace "two", 2  
        }
        "three" {
            $Linetext = $Linetext -replace "three", 3  
        }
        "four" {
            $Linetext = $Linetext -replace "four", 4   
        }
        "five" {
            $Linetext = $Linetext -replace "five", 5   
        }
        "six" {
            $Linetext = $Linetext -replace "six", 6  
        }
        "seven" {
            $Linetext = $Linetext -replace "seven", 7   
        }
        "eight" {
            $Linetext = $Linetext -replace "eight", 8  
        }
        "nine" {
            $Linetext = $Linetext -replace "nine", 9  
        }
        Default {
        }
    }

    return $Linetext
}

$in = Get-Content .\input.txt
$ToReplace = @(("one", 1), ("two", 2), ("three", 3), ("four", 4), ("five", 5), ("six", 6), ("seven", 7), ("eight", 8), ("nine", 9))

$outarray = @()
foreach ($line in $in) {
    "-----$line"
    $first = $null
    $last = $null
    foreach ($Set in $ToReplace) {
    
        $found = $line.indexof($set[0])

        if ($found -ge 0 -AND $null -eq $first) {
            $first = ($Set[0], $found)
            $last = ($Set[0], $found)         
        }
        elseif ($found -ge 0 -AND $found -lt $first[1]) {
            $first = ($Set[0], $found)  
        }
        elseif ($found -ge 0 -AND $found -gt $last[1]) {
            $last = ($Set[0], $found)   
        }
    }
    if ($null -ne $first) {
        $line = Replace-FirstAndLast -NumberToConvert $first[0] -Linetext $line
        $line = Replace-FirstAndLast -NumberToConvert $last[0] -Linetext $line
    }
    $outarray += $line
} 


$NoLetters = $outarray -replace "[^0-9]" , ''
$Sum = 0
foreach ($entry in $NoLetters) {
    [int](($entry[0]).ToString() + ($entry[-1]).ToString() )
    $Sum += [int](($entry[0]).ToString() + ($entry[-1]).ToString() )
}

$Sum