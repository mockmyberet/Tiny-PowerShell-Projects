# Gashlycrumb

Write a program that prints the line from a file starting with a given letter

```
C:\> .\gashlycrumb.ps1 a
A is for Amy who fell down the stairs.
```

By default, the `-f` or `--file` should use the included `gashlycrumb.txt` file, but can be overridden

```
C:\> .\gashlycrumb.ps1 a -f .\alternate.txt
A is for Alfred, poisoned to death.
```

The program should accept one or more letters as positional arguments, printing each line or a message that the given argument is not present in the file

```
C:\> .\gashlycrumb.ps1 x,4,z -f alternate.txt
X is for Xavier, stuck through with a prong.
I do not know "4".
Z is for Zora, smothered by a fleece.
```
