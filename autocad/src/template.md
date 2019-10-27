# PreferencesDisplay Object (ActiveX)
This object contains the options from the Display tab on the Options dialog box.

**Supported Platforms:** Windows only

## Class Information
- Class Name
  - AcadPreferencesDisplay
## Members
These members are part of this object:
***
    Events
        None
    Methods
        None
    Properties
        Application
        AutoTrackingVecColor
        CursorSize
        DisplayLayoutTabs
        DisplayScreenMenu
        DisplayScrollBars
        DockedVisibleLines
        GraphicsWinLayoutBackgrndColor
        GraphicsWinModelBackgrndColor
        HistoryLines
        ImageFrameHighlight
        LayoutCreateViewport
        LayoutCrosshairColor
        LayoutDisplayMargins
        LayoutDisplayPaper
        LayoutDisplayPaperShadow
        LayoutShowPlotSetup
        MaxAutoCADWindow
        ModelCrosshairColor
        ShowRasterImage
        TextFont
        TextFontSize
        TextFontStyle
        TextWinBackgrndColor
        TextWinTextColor
        TrueColorImages
        XRefFadeIntensity
***

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
