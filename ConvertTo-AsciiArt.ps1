<#
.SYNOPSIS
Converts provided text into a basic ASCII art format, supporting letters, numbers, and common special characters.

.DESCRIPTION
The ConvertTo-AsciiArt function takes a string as input and maps each character to a predefined ASCII art representation.
It handles uppercase letters (A-Z), digits (0-9), and a selection of special characters. The output is a string where each
character from the input is represented by ASCII art, arranged line by line. This function can be used in scripts to add
visual elements to output or to create text-based art and messages.

.PARAMETER InputObject
The input string to be converted into ASCII art. This parameter accepts pipeline input, allowing the function to be used
in a pipeline with other commands. The function converts all characters to uppercase before processing and ignores
characters that are not explicitly mapped in the ASCII art dictionary.

.EXAMPLE
ConvertTo-AsciiArt -InputObject "Hello"
Converts the word "Hello" into its ASCII art representation.

.EXAMPLE
"PowerShell Rocks!" | ConvertTo-AsciiArt
This example demonstrates using the function in a pipeline to convert the phrase "PowerShell Rocks!" into ASCII art.

.EXAMPLE
ConvertTo-AsciiArt -InputObject "Debug" -Verbose
Converts the word "Debug" into ASCII art, with verbose output indicating which characters were processed.

.NOTES
- The function is designed for simple ASCII art representations and has a fixed character width. It may not handle wide
characters or complex symbols well.
- Unmapped characters are represented as spaces in the output.
- Special characters supported include basic punctuation and symbols commonly found on a keyboard.

.COMPONENT
The ASCII art dictionary within the function includes mappings for the English alphabet (A-Z, case-insensitive), digits
(0-9), and special characters such as !, @, #, $, %, ^, &, *, (, ), -, +, =, [, ], {, }, |, ;, :, ", ', ,, ., /, \, ?, <,
>, _, `, and ~.
#>

function ConvertTo-AsciiArt {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [object]$InputObject
    )

    $asciiArtMap = @{
        'A' = @(
            "  A  ",
            " A A ",
            "AAAAA",
            "A   A",
            "A   A"
        )

        'B' = @(
            "BBBB ",
            "B   B",
            "BBBB ",
            "B   B",
            "BBBB "
        )

        'C' = @(
            " CCC ",
            "C   C",
            "C    ",
            "C   C",
            " CCC "
        )

        'D' = @(
            "DDD  ",
            "D  D ",
            "D   D",
            "D  D ",
            "DDD  "
        )

        'E' = @(
            "EEEE ",
            "E    ",
            "EEE  ",
            "E    ",
            "EEEE "
        )

        'F' = @(
            "FFFF ",
            "F    ",
            "FFF  ",
            "F    ",
            "F    "
        )

        'G' = @(
            " GGG ",
            "G    ",
            "G GG ",
            "G  G ",
            " GGG "
        )

        'H' = @(
            "H   H",
            "H   H",
            "HHHHH",
            "H   H",
            "H   H"
        )

        'I' = @(
            " III ",
            "  I  ",
            "  I  ",
            "  I  ",
            " III "
        )

        'J' = @(
            "   JJ",
            "    J",
            "    J",
            "J   J",
            " JJJ "
        )

        'K' = @(
            "K  K ",
            "K K  ",
            "KK   ",
            "K K  ",
            "K  K "
        )

        'L' = @(
            "L    ",
            "L    ",
            "L    ",
            "L    ",
            "LLLL "
        )

        'M' = @(
            "M   M",
            "MM MM",
            "M M M",
            "M   M",
            "M   M"
        )

        'N' = @(
            "N   N",
            "NN  N",
            "N N N",
            "N  NN",
            "N   N"
        )

        'O' = @(
            " OOO ",
            "O   O",
            "O   O",
            "O   O",
            " OOO "
        )

        'P' = @(
            "PPP  ",
            "P  P ",
            "PPP  ",
            "P    ",
            "P    "
        )

        'Q' = @(
            " QQQ ",
            "Q   Q",
            "Q Q Q",
            "Q  QQ",
            " QQQQ"
        )

        'R' = @(
            "RRR  ",
            "R  R ",
            "RRR  ",
            "R R  ",
            "R  R "
        )

        'S' = @(
            " SSS ",
            "S    ",
            " SSS ",
            "    S",
            "SSSS "
        )

        'T' = @(
            "TTTTT",
            "  T  ",
            "  T  ",
            "  T  ",
            "  T  "
        )

        'U' = @(
            "U   U",
            "U   U",
            "U   U",
            "U   U",
            " UUU "
        )

        'V' = @(
            "V   V",
            "V   V",
            "V   V",
            " V V ",
            "  V  "
        )

        'W' = @(
            "W   W",
            "W   W",
            "W W W",
            "WW WW",
            "W   W"
        )

        'X' = @(
            "X   X",
            " X X ",
            "  X  ",
            " X X ",
            "X   X"
        )

        'Y' = @(
            "Y   Y",
            " Y Y ",
            "  Y  ",
            "  Y  ",
            "  Y  "
        )

        'Z' = @(
            "ZZZZZ",
            "   Z ",
            "  Z  ",
            " Z   ",
            "ZZZZZ"
        )

        ' ' = @(
            "     ",
            "     ",
            "     ",
            "     ",
            "     "
        )
        '0' = @(
            " 000 ",
            "0   0",
            "0   0",
            "0   0",
            " 000 "
        )

        '1' = @(
            "  1  ",
            " 11  ",
            "  1  ",
            "  1  ",
            "11111"
        )

        '2' = @(
            " 222 ",
            "2   2",
            "   2 ",
            " 2   ",
            "22222"
        )

        '3' = @(
            "3333 ",
            "    3",
            " 333 ",
            "    3",
            "3333 "
        )

        '4' = @(
            "4  4 ",
            "4  4 ",
            "44444",
            "   4 ",
            "   4 "
        )

        '5' = @(
            "55555",
            "5    ",
            "5555 ",
            "    5",
            "5555 "
        )

        '6' = @(
            " 666 ",
            "6    ",
            "6666 ",
            "6   6",
            " 666 "
        )

        '7' = @(
            "77777",
            "   7 ",
            "  7  ",
            " 7   ",
            "7    "
        )

        '8' = @(
            " 888 ",
            "8   8",
            " 888 ",
            "8   8",
            " 888 "
        )

        '9' = @(
            " 999 ",
            "9   9",
            " 9999",
            "    9",
            " 999 "
        )

        '!' = @(
            " !!! ",
            " !!! ",
            " !!! ",
            "     ",
            " !!! "
        )

        '@' = @(
            " @@@ ",
            "@   @",
            "@ @@@",
            "@    ",
            " @@@@"
        )

        '#' = @(
            " # # ",
            "#####",
            " # # ",
            "#####",
            " # # "
        )

        '$' = @(
            ' $$$ ',
            '$    ',
            ' $$$ ',
            '    $',
            ' $$$ '
        )

        '%' = @(
            "%   %",
            "   % ",
            "  %  ",
            " %   ",
            "%   %"
        )

        '^' = @(
            " ^^^ ",
            "^   ^",
            "     ",
            "     ",
            "     "
        )

        '&' = @(
            " &   ",
            "& &  ",
            " & & ",
            "&  & ",
            " &&& "
        )

        '*' = @(
            "     ",
            "*   *",
            " *** ",
            "*   *",
            "     "
        )

        '(' = @(
            "  (  ",
            " (   ",
            "(    ",
            " (   ",
            "  (  "
        )

        ')' = @(
            "  )  ",
            "   ) ",
            "    )",
            "   ) ",
            "  )  "
        )

        '-' = @(
            "     ",
            "     ",
            "-----",
            "     ",
            "     "
        )

        '+' = @(
            "     ",
            "  +  ",
            "+++++",
            "  +  ",
            "     "
        )

        '=' = @(
            "     ",
            "=====",
            "     ",
            "=====",
            "     "
        )

        '[' = @(
            " [[  ",
            " [   ",
            " [   ",
            " [   ",
            " [[  "
        )

        ']' = @(
            "  ]] ",
            "   ] ",
            "   ] ",
            "   ] ",
            "  ]] "
        )

        '{' = @(
            "  {{ ",
            " {   ",
            "{{   ",
            " {   ",
            "  {{ "
        )

        '}' = @(
            " }}  ",
            "   } ",
            "   }}",
            "   } ",
            " }}  "
        )

        '|' = @(
            "  |  ",
            "  |  ",
            "  |  ",
            "  |  ",
            "  |  "
        )
        ';' = @(
            "     ",
            "  ;  ",
            "     ",
            "  ;  ",
            " ;   "
        )

        ':' = @(
            "     ",
            "  :  ",
            "     ",
            "  :  ",
            "     "
        )

        '"' = @(
            " `"`" ",
            " `"`" ",
            "     ",
            "     ",
            "     "
        )

        "'" = @(
            "  '  ",
            " '   ",
            "     ",
            "     ",
            "     "
        )

        ',' = @(
            "     ",
            "     ",
            "     ",
            "  ,  ",
            " ,   "
        )

        '.' = @(
            "     ",
            "     ",
            "     ",
            "     ",
            "  .  "
        )

        '/' = @(
            "    /",
            "   / ",
            "  /  ",
            " /   ",
            "/    "
        )

        '\\' = @(
            "\\    ",
            " \\   ",
            "  \\  ",
            "   \\ ",
            "    \\"
        )

        '?' = @(
            " ??? ",
            "?   ?",
            "   ? ",
            "     ",
            "  ?  "
        )

        '<' = @(
            "   < ",
            "  <  ",
            " <   ",
            "  <  ",
            "   < "
        )

        '>' = @(
            " >   ",
            "  >  ",
            "   > ",
            "  >  ",
            " >   "
        )

        '_' = @(
            "     ",
            "     ",
            "     ",
            "     ",
            "_____"
        )

        '`' = @(
            " `   ",
            "  `  ",
            "     ",
            "     ",
            "     "
        )

        '~' = @(
            " ~ ~ ",
            "~ ~ ~",
            " ~ ~ ",
            "     ",
            "     "
        )
    }

    $Text = $InputObject.ToUpper()
    $output = @()
    foreach ($line in 0..4) {
        $textLine = ''
        # Ensure $Text is treated as an array of characters
        foreach ($char in $Text.GetEnumerator()) {
            #Ensure we can match the string
            $char = $char.ToString()
            if ($asciiArtMap.ContainsKey($char)) {
                Write-Verbose "contains key: $($char)"
                $asciiLines = $asciiArtMap[$char] -split "`n"
                $textLine += $asciiLines[$line] + " "
            } else {
                Write-Verbose "Does not contain key: $($char)"
                $textLine += "     " # Spaces for characters not in map
            }
        }
        $output += $textLine
    }

    $output -join "`n"
}