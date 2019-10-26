' https://github.com/willclark314/MyStuff/tree/master/autocad/map/AutoCAD_Settings.vba
Sub AutoCAD_Settings()
' 对cad的初始环境进行设置
' 

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















