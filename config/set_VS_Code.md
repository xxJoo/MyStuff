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
        "editor.autoClosingBrackets": "always",
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