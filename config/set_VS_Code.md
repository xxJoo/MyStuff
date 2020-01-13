My settings for vs code

# Plugins 插件安装
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

# json snippets files 代码片段
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

# settings in json 设置


setting file path:
`C:\xxx\dell\AppData\Roaming\Code\User\settings.json`
***
setting content



```json
{
    "workbench.startupEditor": "welcomePage",
    "workbench.colorTheme": "One Dark Pro Vivid",
    "workbench.iconTheme": "vscode-icons",
    "workbench.sideBar.location": "left",
    "workbench.activityBar.visible": true,

    "window.zoomLevel": 0,

    "editor.detectIndentation": false,
    "editor.minimap.enabled": false,
    "editor.renderWhitespace": "all",
    // 字体设定
    // "editor.fontFamily": "Courier New, Microsoft Yahei Mono",
    // "editor.fontFamily": "Consolas, 'Courier New', monospace"
    // https://github.com/be5invis/Sarasa-Gothic/releases
    "editor.fontFamily": "Sarasa Mono SC",

    "explorer.autoReveal": false,
    "explorer.confirmDelete": false,
    "explorer.confirmDragAndDrop": false,

    "files.autoGuessEncoding": false,
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
        "*.m": "matlab"
    },

    "git.autofetch": true,
    "git.confirmSync": false,
    "git.enableSmartCommit": true,
    // "git.path": xxx,



    "python.pythonPath": "D:/Python36/python.exe",
    "python.linting.pylintPath": "D:/Python36/pylint.exe",
    // 这个路径下的 python
    // C:/Users/xxxx/AppData/Local/Programs/Python/Python37-32/python.exe

    "[autolisp]": {
        "editor.acceptSuggestionOnEnter": "off",
        "editor.autoClosingBrackets": "always",
        // "editor.autoClosingBrackets": true,
        "editor.insertSpaces": false,
        "editor.quickSuggestions": true,
        "editor.tabSize": 2,
        "editor.wordBasedSuggestions": false,
        "editor.wordWrap": "on",
        "files.encoding": "utf8"
    },
    "[tex]": {
        "editor.tabSize": 2,
    },
    "[latex]": {
        "editor.tabSize": 2,
    },
    // ----------------------------------------------------------------------
    // matlab setting
    // ----------------------------------------------------------------------
    // "matlab.mlintpath": "E:/Program Files/MATLAB/R2016a/bin/win64/mlint.exe",
    // "matlab.matlabpath": "E:/Program Files/MATLAB/R2016a/bin/win64/MATLAB.exe",
    // "matlab.linterEncoding": "GB 2312",
    // "matlab.linterEncoding" : "utf8",
    "[matlab]":  {
        "files.encoding": "gbk"
    },
    // "terminal.integrated.shell.windows": xxx,
    // ----------------------------------------------------------------------
}
```




# for autolisp comment Lisp语言支持
C:\Users\xxx\.vscode\extensions\jpnacaduser.autolisp-language-1.2.1
```json
{
    // Symbols used as comments.
    "comments": {
        "lineComment": ";",
        "blockComment": [";|", "|;"]
    },
    // Symbols that trigger highlighting of matching pair.
    "brackets": [
        ["(", ")"]
    ],
    // Symbols that are auto closed when typing.
    "autoClosingPairs": [
        { "open": "(", "close": ")"},
        { "open": "\"", "close": "\"", "notIn": ["string"]},
        { "open": "`", "close": "`"}  // `code span` for markdown-flavored comments :)
    ],
    // Symbols that can be used to surround a selection/
    "surroundingPairs": [
        ["(", ")"],
        ["\"", "\""],
        ["`", "`"]
    ]
}

```

# for c++ compile 配置调试

## 配置调试环境
1. 文件-->打开文件夹，设置项目路径

2. 新建一个`.vscode`文件夹

3. 创建一个`launch.json`启动配置文件
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "C++ Launch (GDB)",                
            "type": "cppdbg",                         
            "request": "launch",                        
            "targetArchitecture": "x86",                
            "program": "${workspaceRoot}/${fileBasename}.exe",                 
            "miDebuggerPath":"C:/MinGW/bin/gdb.exe", 
            "args": [],     
            "stopAtEntry": false,                  
            "cwd": "${workspaceRoot}",                  
            "externalConsole": true,                  
            "preLaunchTask": "g++"　　                  
         }
    ]
}
```
4. 创建一个`tasks.json`的配置文件
```json
{
    "version": "2.0.0",
    "command": "g++",
    "args": ["-g","-std=c++11","${file}","-o","${workspaceRoot}\\${fileBasename}.exe"],
    "problemMatcher": {
        "owner": "cpp",
        "fileLocation": ["relative", "${workspaceRoot}"],
        "pattern": {
            "regexp": "^(.*):(\\d+):(\\d+):\\s+(warning|error):\\s+(.*)$",
            "file": 1,
            "line": 2,
            "column": 3,
            "severity": 4,
            "message": 5
        }
    }
}
```
5. 创建一个`c_cpp_properties.json`文件，注意不同的版本的MINGW路径可能有些许不同
```json
{
    "configurations": [
        {
            "name": "Win32",
            "includePath": [
                "${workspaceRoot}",
                "C:/MinGW/lib/gcc/mingw32/8.2.0/include",
                "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++",
                "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++/mingw32",
                "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++/backward",
                "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++/tr1",
                "C:/MinGW/include"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "__GNUC__=6",
                "__cdecl=__attribute__((__cdecl__))"
            ],
            "intelliSenseMode": "msvc-x64",
            "browse": {
                "path": [
                    "${workspaceRoot}",
                    "C:/MinGW/lib/gcc/mingw32/8.2.0/include",
                    "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++",
                    "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++/mingw32",
                    "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++/backward",
                    "C:/MinGW/lib/gcc/mingw32/8.2.0/include/c++/tr1",
                    "C:/MinGW/include"
                ]
            },
            "limitSymbolsToIncludedHeaders": true,
            "databaseFilename": "",
            "cStandard": "c11",
            "cppStandard": "c++17"
        }
    ],
    "version": 4
}
```
6. 新建一个`test.cpp`文件，并点击左侧的调试按钮

```c++
#include <iostream>
using namespace std;

int main()
{
    cout<<"Hello World!"<<endl;
    return 0;
}
```


# 快捷键 keybinding.json

直接用 vim 插件了 












