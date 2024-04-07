# ConvertTo-AsciiArt

## Overview
The `ConvertTo-AsciiArt` PowerShell function transforms input text into ASCII art, supporting uppercase letters, numbers, and a variety of special characters. This utility is excellent for embellishing console outputs, creating text-based art, or simply for entertainment and educational purposes.

## Features
- **Broad Character Support:** Handles letters (A-Z), digits (0-9), and common special characters, offering a wide range of artistic expression.
- **Pipeline Compatibility:** Accepts input via pipeline, enabling seamless integration with other PowerShell commands and scripts.
- **Customizable Art Maps:** Easily extendable character mappings allow for customization and addition of new ASCII art representations.

## Prerequisites
- PowerShell 5.1 or higher is required to ensure compatibility and full functionality.

## Installation
No specific installation process is needed. You can integrate the `ConvertTo-AsciiArt` function into your scripts or PowerShell session by simply copying the function definition.

## Usage

### Converting Text to ASCII Art
To convert a simple text string to ASCII art:
```powershell
ConvertTo-AsciiArt -InputObject "Hello"
```
Output will be the ASCII art representation of "Hello":

```
H   H EEEE  L     L      OOO
H   H E     L     L     O   O
HHHHH EEE   L     L     O   O
H   H E     L     L     O   O
H   H EEEE  LLLL  LLLL   OOO
```

### Using Pipeline for Conversion
You can also pipe a string directly into the function:
```powershell
"PowerShell" | ConvertTo-AsciiArt
```
This will output the ASCII art representation of "PowerShell":
```
PPP    OOO  W   W EEEE  RRR    SSS  H   H EEEE  L     L
P  P  O   O W   W E     R  R  S     H   H E     L     L
PPP   O   O W W W EEE   RRR    SSS  HHHHH EEE   L     L
P     O   O WW WW E     R R       S H   H E     L     L
P      OOO  W   W EEEE  R  R  SSSS  H   H EEEE  LLLL  LLLL
```

### Extended Character Support
Demonstrates converting a string with mixed characters:
```powershell
"13375P34K!?" | ConvertTo-AsciiArt
```
Displays ASCII art for each character, including spaces and exclamation marks:

```
  1   3333  3333  77777 55555 PPP   3333  4  4  K  K   !!!   ???
 11       3     3    7  5     P  P      3 4  4  K K    !!!  ?   ?
  1    333   333    7   5555  PPP    333  44444 KK     !!!     ?
  1       3     3  7        5 P         3    4  K K
11111 3333  3333  7     5555  P     3333     4  K  K   !!!    ?
```

## Full special characters list

- `!` Exclamation mark
- `@` At symbol
- `#` Hash (Pound) symbol
- `$` Dollar sign
- `%` Percent sign
- `^` Caret (Circumflex accent)
- `&` Ampersand
- `*` Asterisk
- `(` Open parenthesis
- `)` Close parenthesis
- `-` Hyphen-minus
- `+` Plus sign
- `=` Equal sign
- `[` Open square bracket
- `]` Close square bracket
- `{` Open curly bracket
- `}` Close curly bracket
- `|` Vertical bar
- `;` Semicolon
- `:` Colon
- `"` Double quotation mark
- `'` Single quotation mark (Apostrophe)
- `,` Comma
- `.` Period (Full stop)
- `/` Slash (Forward slash)
- `\` Backslash
- `?` Question mark
- `<` Less-than sign
- `>` Greater-than sign
- `_` Underscore
- `` ` `` Grave accent (Backtick)
- `~` Tilde

## Contributing
Your contributions to enhance functionality, extend character support, or improve documentation are highly appreciated. Feel free to fork the project, implement your changes, and submit a pull request for review.

## License
This project is licensed under the GNU General Public License v3.0 - see the COPYING file for more details.
