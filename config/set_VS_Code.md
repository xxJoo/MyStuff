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
    "workbench.colorTheme": "One Dark Pro",
    "workbench.iconTheme": "vscode-icons",
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,
    "files.autoGuessEncoding": true,
    "files.associations": {
        "*.lsp": "autolisp",
        "*.vba": "vba"
    },
// paths
    // "terminal.integrated.shell.windows": xxx,
    // "git.path": xxx,
// matlab
    // "matlab.linterEncoding": "GB 2312",
}
```