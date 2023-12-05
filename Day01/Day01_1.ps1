$in = Get-Content .\input.txt
$NoLetters = $in -replace "[^0-9]" , ''
$Sum = 0
foreach ($entry in $NoLetters) {
    $Sum += [int](($entry[0]).ToString() + ($entry[-1]).ToString() )
}