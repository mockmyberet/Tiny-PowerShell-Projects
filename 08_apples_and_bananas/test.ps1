Describe "Test for 08_apples" {
    BeforeAll {
        $Script:prg = ".\apples.ps1"
    }

    It "Should exist" {
        Test-Path $Script:prg | Should -Be $true
    }

    It "Test command line" {
        &$Script:prg foo | Should -BeExactly 'faa'
    }

    It "Test command line with vowel" {
        &$Script:prg -v i foo | Should -BeExactly 'fii'
    }

    It "Test command line with vowel preserve case"  {
        $actual = &$Script:prg -vowel i "APPLES AND BANANAS" 
        
        $actual | Should -BeExactly 'IPPLIS IND BININIS'
    }

    It "Test file with vowel" {
        (&$Script:prg -vowel o ..\inputFiles\fox.txt).Trim() | Should -BeExactly 'Tho qoock brown fox jomps ovor tho lozy dog.'
    }

    It "Test file" {
        (&$Script:prg ..\inputFiles\fox.txt).Trim() | Should -BeExactly 'Tha qaack brawn fax jamps avar tha lazy dag.'
    }
}