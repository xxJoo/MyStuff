# AutoCAD templates
- 01_activeX_object.lsp
- 02_activeX_methd.lsp
- 03_added_data.lsp
- 04_activeX_set.lsp

# AutoLisp

```lisp
(vl-load-com)
(setq myacad(vlax-get-acad-object))
```

# VB

```vb
Sub AutoCAD_Settings()
' 对cad的初始环境进行设置

    Dim dwgName As String
    dwgName = "c:\campus.dwg"
    If Dir(dwgName) <> "" Then
        ThisDrawing.Application.Documents.Open dwgName
    否则
        MsgBox "File " & dwgName & " does not exist."
    End If

    Dim docObj As AcadDocument
    Set docObj = ThisDrawing.Application.Documents.Add

End Sub
```