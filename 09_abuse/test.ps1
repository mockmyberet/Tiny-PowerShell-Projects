Describe "Test for 09_abuse" {
    BeforeAll {
        $Script:prg = ".\abuse.ps1"
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test 01" {
        &$Script:prg -s 1 -n 1 | Should -BeExactly 'You lecherous, scurilous maw!'        
    }

    It "Test 02" {
        $actual = &$Script:prg -seed 2 
        
        $actual[0] | Should -BeExactly 'You toad-spotted, indistinguishable cur!'
        $actual[1] | Should -BeExactly 'You bankrupt, rotten butt!'
        $actual[2] | Should -BeExactly 'You base, loathsome villain!'
    }

    It "Test 03" {
        $actual = &$Script:prg -s 3 -n 5 -a 1

        $actual[0] | Should -BeExactly 'You sodden-witted traitor!'
        $actual[1] | Should -BeExactly 'You scurvy Judas!'
        $actual[2] | Should -BeExactly 'You old rogue!'
        $actual[3] | Should -BeExactly 'You thin-faced worm!'
        $actual[4] | Should -BeExactly 'You base barbermonger!'
    }

    It "Test 04" {
        $actual = &$Script:prg -seed 4 -number 2 -adjectives 4

        $actual[0] | Should -BeExactly 'You toad-spotted, old, cullionly, detestable maw!'
        $actual[1] | Should -BeExactly 'You insatiate, infected, foolish, sodden-witted scold!'        
    }
}