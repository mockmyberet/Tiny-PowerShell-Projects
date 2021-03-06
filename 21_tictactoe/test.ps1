Describe "Test for 21_tictactoe" {
    BeforeAll {
        $Script:prg = ".\tictactoe.ps1"
    }

    It "Should exist" {
        { Test-Path $Script:prg } | Should -Be $true
    }

    It "Test No Input" {
        $actual = &$Script:prg

        $actual.Count | Should -Be 2

        $parts = $actual[0].split("`n")
        $parts[0] | Should -BeExactly '-------------'
        $parts[1] | Should -BeExactly '| 1 | 2 | 3 |'
        $parts[2] | Should -BeExactly '-------------'
        $parts[3] | Should -BeExactly '| 4 | 5 | 6 |'
        $parts[4] | Should -BeExactly '-------------'
        $parts[5] | Should -BeExactly '| 7 | 8 | 9 |'
        $parts[6] | Should -BeExactly '-------------'
 
        $actual[1] | Should -BeExactly 'No winner.'
    }
    
    It 'Test good board 01' {

        $actual = &$Script:prg -b .........

        $actual.Count | Should -Be 2

        $parts = $actual[0].split("`n")
        $parts[0] | Should -BeExactly '-------------'
        $parts[1] | Should -BeExactly '| 1 | 2 | 3 |'
        $parts[2] | Should -BeExactly '-------------'
        $parts[3] | Should -BeExactly '| 4 | 5 | 6 |'
        $parts[4] | Should -BeExactly '-------------'
        $parts[5] | Should -BeExactly '| 7 | 8 | 9 |'
        $parts[6] | Should -BeExactly '-------------'
 
        $actual[1] | Should -BeExactly 'No winner.'
    }

    It 'Test good board 01' {

        $actual = &$Script:prg -b ...OXX...

        $actual.Count | Should -Be 2

        $parts = $actual[0].split("`n")
        $parts[0] | Should -BeExactly '-------------'
        $parts[1] | Should -BeExactly '| 1 | 2 | 3 |'
        $parts[2] | Should -BeExactly '-------------'
        $parts[3] | Should -BeExactly '| O | X | X |'
        $parts[4] | Should -BeExactly '-------------'
        $parts[5] | Should -BeExactly '| 7 | 8 | 9 |'
        $parts[6] | Should -BeExactly '-------------'
 
        $actual[1] | Should -BeExactly 'No winner.'
    }

    It 'Test mutate board 01' {
        $actual = &$Script:prg -b ...OXX... -player X -c 1

        $actual.Count | Should -Be 2

        $parts = $actual[0].split("`n")
        $parts[0] | Should -BeExactly '-------------'
        $parts[1] | Should -BeExactly '| X | 2 | 3 |'
        $parts[2] | Should -BeExactly '-------------'
        $parts[3] | Should -BeExactly '| O | X | X |'
        $parts[4] | Should -BeExactly '-------------'
        $parts[5] | Should -BeExactly '| 7 | 8 | 9 |'
        $parts[6] | Should -BeExactly '-------------'
 
        $actual[1] | Should -BeExactly 'No winner.'
    }

    It 'Test mutate board 02' {
        $actual = &$Script:prg -board XXO...OOX -p O -c 5

        $actual.Count | Should -Be 2

        $parts = $actual[0].split("`n")
        $parts[0] | Should -BeExactly '-------------'
        $parts[1] | Should -BeExactly '| X | X | O |'
        $parts[2] | Should -BeExactly '-------------'
        $parts[3] | Should -BeExactly '| 4 | O | 6 |'
        $parts[4] | Should -BeExactly '-------------'
        $parts[5] | Should -BeExactly '| O | O | X |'
        $parts[6] | Should -BeExactly '-------------'
 
        $actual[1] | Should -BeExactly 'O has won!'
    }
}