Sub 插入批注图片()
'
' 插入批注图片 宏
'
' 一些注释

    Dim Pict
    Pict = Application.GetOpenFilename("图片文件(*.jpg;*.bmp),*.jpg;*.jpg;*.bmp")
    If Pict = "false" Then End

    With ActiveCell.Comment
        .Visible = False
        .Shape.Fill.UserPicture Pict
    End With
    
End Sub














