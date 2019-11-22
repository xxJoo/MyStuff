My settings for vs code

# plugins
ENABLED
- Ansys APDL
- autolisp language support
- Excel Viewer
- GBKtoUTF8
- LaTeX Workshop
- Markdown All in One
- Matlab
- Matlab Extension Pack
- matlab-formatter
- One Dark Pro
- PowerShell
- Prettify JSON
- Python
- Todo Tree
- VSCode VBA
- vscode-icons
***
DISABLED
- Markdown Preview Enhanced
- Vim

# json snippets files
snippets define file path:
`C:\Users\$username$\AppData\Roaming\Code\User\snippets`
***
my snippets
- example
```json
{
    // Place your snippets for autolisp here.
    // Each snippet is defined under a snippet name and has a prefix, body and description.
    // The prefix is what is used to trigger the snippet
    // and the body will be expanded and inserted.
    // Possible variables are:
    // $1, $2 for tab stops,
    // $0 for the final cursor position, and
    // ${1:label}, ${2:another} for placeholders.
    // Placeholders with the same ids are connected.
    // Example:
    // "Print to console": {
    // 	"prefix": "log",
    // 	"body": [
    // 		"console.log('$1');",
    // 		"$2"
    // 	],
    // 	"description": "Log output to console"
    // }
    "Print to console": {
        "prefix": "log",
        "body": [
            "console.log('$1');",
            "$2"
        ],
        "description": "Log output to console"
    }
}
```
- 

# settings in json
setting file path:
`C:\xxx\dell\AppData\Roaming\Code\User\settings.json`
***
setting content
```json
{
    "workbench.colorTheme": "One Dark Pro Vivid",
    "workbench.iconTheme": "vscode-icons",
    "workbench.sideBar.location": "left",
    "workbench.activityBar.visible": true,

    "window.zoomLevel": 0,

    "editor.detectIndentation": false,
    // "editor.fontFamily": "Courier New, Microsoft Yahei Mono",
    "editor.minimap.enabled": false,
    "editor.renderWhitespace": "all",

    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,
    "explorer.autoReveal": false,

    "files.autoGuessEncoding": true,
    "files.associations": {
        "*.lsp": "autolisp",
        "*.vbs": "vb",
        "*.vba": "vb",
        "*.bas": "vb",
        "*.vbe": "vb",
        "*.wsf": "vb",
        "*.wsc": "vb",
        "*.acm": "vb",
        "*.acr": "vb",
        "*.acf": "vb",
    },

    "git.autofetch": true,
    "git.confirmSync": false,
    "git.enableSmartCommit": true,
    // "git.path": xxx,

    "[autolisp]":  {
        "editor.acceptSuggestionOnEnter": "off",
        // "editor.autoClosingBrackets": "always",
        "editor.autoClosingBrackets": true,
        "editor.insertSpaces": false,
        "editor.quickSuggestions": true,
        "editor.tabSize": 2,
        "editor.wordBasedSuggestions": false,
        "editor.wordWrap": "on",
        "files.encoding": "utf8"
    },

    "[matlab]":  {
        "files.encoding": "gbk"
    },
    // "terminal.integrated.shell.windows": xxx,
    // "matlab.linterEncoding": "GB 2312",
}
```