Describe "Test for 19_wod" {
    BeforeAll {
        $Script:prg = ".\wod.ps1"
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test seed 1" {

        $results = &$Script:prg -s 1

        $results.Count | Should -Be 4

        $tests = @(
            , ('Situps', 73)
            , ('Lunges', 25)
            , ('Burpees', 28)
            , ('Hand-stand pushups', 14)
        )

        foreach ($test in $tests) {
            $exercise, $reps = $test    
    
            $actual = $results | Where-Object { $_.Exercise -ceq $exercise }
            $actual.Exercise | Should -BeExactly $exercise
            $actual.Reps | Should -BeExactly $reps
        }        
    }
    
    It  "Test seed 1 easy" {

        $null = Get-Random -SetSeed ([Environment]::TickCount)

        $seedFlag = if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) { '-seed' } else { '-s' }
        $easyFlag = if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) { '-easy' } else { '-e' }

        $c = "&{0} {1} {2} 1" -f $Script:prg, $easyFlag, $seedFlag       
        $results = Invoke-Expression $c

        $results.Count | Should -Be 4
        
        $tests = @(
            , ('Situps', 36)
            , ('Lunges', 12)
            , ('Burpees', 14)
            , ('Hand-stand pushups', 7)
        )

        foreach ($test in $tests) {
            $exercise, $reps = $test    
    
            $actual = $results | Where-Object { $_.Exercise -ceq $exercise }
            $actual.Exercise | Should -BeExactly $exercise
            $actual.Reps | Should -Be $reps
        }
    } 

    It  "Test seed 2 num 8" {

        $null = Get-Random -SetSeed ([Environment]::TickCount)

        $seedFlag = if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) { '-seed' } else { '-s' }
        $numFlag = if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) { '-num' } else { '-n' }

        $c = "&{0} {1} 8 {2} 2" -f $Script:prg, $numFlag, $seedFlag       
        $results = Invoke-Expression $c

        $results.Count | Should -Be 8

        $tests = @(
            , ('Situps', 66)
            , ('Crunches', 30)
            , ('Plank', 43)
            , ('Lunges', 28)
            , ('Hand-stand pushups', 7)
            , ('Burpees', 47)
            , ('Squats', 31)
            , ('Pullups', 21)
        )

        foreach ($test in $tests) {
            $exercise, $reps = $test    
    
            $actual = $results | Where-Object { $_.Exercise -ceq $exercise }
            $actual.Exercise | Should -BeExactly $exercise
            $actual.Reps | Should -Be $reps
        }
    } 

    It  "Test seed 4 num 3 other file" {
        $null = Get-Random -SetSeed ([Environment]::TickCount)

        $seedFlag = if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) { '-seed' } else { '-s' }
        $numFlag = if ((Get-Random -Minimum 0 -Maximum 2) -eq 1) { '-num' } else { '-n' }

        $c = "&{0} {1} 3 {2} 4 -f .\inputs\silly-exercises.csv" -f $Script:prg, $numFlag, $seedFlag       
        $results = Invoke-Expression $c

        $results.Count | Should -Be 3

        $tests = @(
            , ('Rock Squats', 27)
            , ('Red Barchettas', 48)
            , ('Erstwhile Lunges', 9)
        )

        foreach ($test in $tests) {
            $exercise, $reps = $test    

            $actual = $results | Where-Object { $_.Exercise -ceq $exercise }
            $actual.Exercise | Should -BeExactly $exercise
            $actual.Reps | Should -Be $reps
        }
    }
}