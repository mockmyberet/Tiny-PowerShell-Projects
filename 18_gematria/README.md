# Gematria

Write a program that will encode each word of a given text by summing the ASCII values of the characters.

Source the powershell file

```
. .\gematria.ps1
```

The text may come from the command line

```
C:\> Invoke-Gematria 'The quick brown fox jumps over the lazy dog.'
289 541 552 333 559 444 321 448 314
```

Or from an input file

```
C:\> Invoke-Gematria ../inputFiles/fox.txt
289 541 552 333 559 444 321 448 314
```