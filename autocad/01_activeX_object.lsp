;;; 在AutoLISP中使用ActiveX对象

(vl-load-com)
; 来初始化ActiveX

; 获取AutoCAD应用程序
(setq myacad(vlax-get-acad-object))
; 该函数没有参数
; 返回指向AutoCAD应用程序的指针 #<VLA-OBJECT IAcadApplication 00b5e51c>
; 返回值的数据类型为VLA，即VLISP ActiveX对象
; 该表达式将指向AutoCAD应用程序的指针赋给了变量myacad

; AutoCAD 应用程序 属性和方法
(vlax-dump-Object myacad t)
; 该函数的功能是列出指定 VLA 对象(myacad)的属性和方法
; 参数为VLA对象(myacad)
; 如果未设置T，只列出指定VLA对象的属性
; 
; IAcadApplication: An instance of the AutoCAD application
; Property values:
; ActiveDocument = #<VLA-OBJECT IAcadDocument 01165340>
; Application (RO) = #<VLA-OBJECT IAcadApplication 00b5e51c>
; Caption (RO) = "AutoCAD 2006 – [Drawing1.dwg]"
; Documents (RO) = #<VLA-OBJECT IAcadDocuments 011b9ba0>
; FullName (RO) = "C:\\Program Files\\AutoCAD 2006\\acad.exe"
; Height = 730
; HWND (RO) = 66224
; LocaleId (RO) = 1033
; MenuBar (RO) = #<VLA-OBJECT IAcadMenuBar 011bdf94>
; MenuGroups (RO) = #<VLA-OBJECT IAcadMenuGroups 003d3aa0>
; Name (RO) = "AutoCAD"
; Path (RO) = "C:\\Program Files\\AutoCAD 2006"
; Preferences (RO) = #<VLA-OBJECT IAcadPreferences 011bdf6c>
; StatusId (RO) = ...Indexed contents not shown...
; VBE (RO) = AutoCAD: Problem in loading VBA
; Version (RO) = "16.2s (LMS Tech)"
; Visible = -1
; Width = 1020
; WindowLeft = 2
; WindowState = 1
; WindowTop = 2
; Methods supported:
; Eval (1)
; GetAcadState ()
; GetInterfaceObject (1)
; ListArx ()
; LoadArx (1)
; LoadDVB (1)
; Quit ()
; RunMacro (1)
; UnloadArx (1)
; UnloadDVB (1)
; Update ()
; ZoomAll ()
; ZoomCenter (2)
; ZoomExtents ()
; ZoomPickWindow ()
; ZoomPrevious ()
; ZoomScaled (2)
; ZoomWindow (2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 在Property values（属性）部份列出了AutoCAD应用程序具有
;     ActiveDocument （活动的文档）
;     Application （应用程序的指针）
;     Caption （标题）
;     FullName （可执行文件名）等属性。
; 其中标记为#<VLA-OBJECT … >的属性是VLA对象，例如
;     ActiveDocument（活动的文档）
;     Documents （一般文档）
;     MenuBar (菜单条)
;     MenuGroups (菜单组)
;     Preferences (设置)
; 这些对象属于VLA对象
; 它们可以被继续访问，引出下一级ActiveX对象，了解它们的属性和方法。

; 带有标记(RO)的属性是只读的，不能被修改，例如属性
; Caption (RO) = "AutoCAD 2006 – [Drawing1.dwg]"
; 表示AutoCAD应用程序的标题是"AutoCAD 2006 – [Drawing1.dwg]"
; 它是只读的，不能被修改。

; 在Methods supported (支持的方法)部份
; 列出了可以对过AutoCAD应用程序施加
;     Eval
;     GetAcadState
;     GetInterface Object
; 等操作。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 获取活动文档程序对象
(setq mydoc (vla-get-ActiveDocument myacad))
(vlax-dump-Object mydoc t)
; IAcadDocument: An AutoCAD drawing
;特性值:
;   Active (RO) = -1
;   ActiveDimStyle = #<VLA-OBJECT IAcadDimStyle 00000000425a2058>
;   ActiveLayer = #<VLA-OBJECT IAcadLayer 00000000425aef58>
;   ActiveLayout = #<VLA-OBJECT IAcadLayout 000000003fbbaef8>
;   ActiveLinetype = #<VLA-OBJECT IAcadLineType 00000000425adc38>
;   ActiveMaterial = #<VLA-OBJECT IAcadMaterial 00000000425a1e18>
;   ActivePViewport = AutoCAD: 图纸空间中无活动视口
;   ActiveSelectionSet (RO) = #<VLA-OBJECT IAcadSelectionSet 0000000043c90078>
;   ActiveSpace = 1
;   ActiveTextStyle = #<VLA-OBJECT IAcadTextStyle 00000000425a1488>
;   ActiveUCS = AutoCAD: 空对象 ID
;   ActiveViewport = #<VLA-OBJECT IAcadViewport 000000003fbb9908>
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00000001404c3f10>
;   Blocks (RO) = #<VLA-OBJECT IAcadBlocks 000000003fbb97e8>
;   Database (RO) = #<VLA-OBJECT IAcadDatabase 0000000044542708>
;   Dictionaries (RO) = #<VLA-OBJECT IAcadDictionaries 000000003fbb9758>
;   DimStyles (RO) = #<VLA-OBJECT IAcadDimStyles 000000003fbb9518>
;   ElevationModelSpace = 0.0
;   ElevationPaperSpace = 0.0
;   FileDependencies (RO) = #<VLA-OBJECT IAcadFileDependencies 0000000042fdfd68>
;   FullName (RO) = ""
;   Groups (RO) = #<VLA-OBJECT IAcadGroups 000000003fbb9368>
;   Height = 338
;   HWND (RO) = 200176
;   Layers (RO) = #<VLA-OBJECT IAcadLayers 000000003fbb6c08>
;   Layouts (RO) = #<VLA-OBJECT IAcadLayouts 000000003fbb96c8>
;   Limits = (0.0 0.0 420.0 297.0)
;   Linetypes (RO) = #<VLA-OBJECT IAcadLineTypes 000000003fbb9b48>
;   Materials (RO) = #<VLA-OBJECT IAcadMaterials 000000003fbb9878>
;   ModelSpace (RO) = #<VLA-OBJECT IAcadModelSpace 0000000043a2e868>
;   MSpace = AutoCAD: 模式无效
;   Name (RO) = "Drawing1.dwg"
;   ObjectSnapMode = 0
;   PaperSpace (RO) = #<VLA-OBJECT IAcadPaperSpace 0000000043a34f88>
;   Path (RO) = "E:\\Users\\dell\\Documents"
;   PickfirstSelectionSet (RO) = #<VLA-OBJECT IAcadSelectionSet 0000000043c92ad8>
;   Plot (RO) = #<VLA-OBJECT IAcadPlot 000000004121e418>
;   PlotConfigurations (RO) = #<VLA-OBJECT IAcadPlotConfigurations 000000003fbb3d58>
;   Preferences (RO) = #<VLA-OBJECT IAcadDatabasePreferences 0000000042fe2ae8>
;   ReadOnly (RO) = 0
;   RegisteredApplications (RO) = #<VLA-OBJECT IAcadRegisteredApplications 00000000425ad578>
;   Saved (RO) = 0
;   SectionManager (RO) = 发生意外。
;   SelectionSets (RO) = #<VLA-OBJECT IAcadSelectionSets 000000004125f5d8>
;   SummaryInfo (RO) = #<VLA-OBJECT IAcadSummaryInfo 000000002acb4488>
;   TextStyles (RO) = #<VLA-OBJECT IAcadTextStyles 00000000425a8e08>
;   UserCoordinateSystems (RO) = #<VLA-OBJECT IAcadUCSs 00000000425ae6e8>
;   Utility (RO) = #<VLA-OBJECT IAcadUtility 000000004121d7c8>
;   Viewports (RO) = #<VLA-OBJECT IAcadViewports 00000000425ae778>
;   Views (RO) = #<VLA-OBJECT IAcadViews 000000003fbb9cf8>
;   Width = 968
;   WindowState = 3
;   WindowTitle (RO) = "Drawing1.dwg"
;支持的方法:
;   Activate ()
;   AuditInfo (1)
;   Close (2)
;   CopyObjects (3)
;   EndUndoMark ()
;   Export (3)
;   GetVariable (1)
;   HandleToObject (1)
;   Import (3)
;   LoadShapeFile (1)
;   New (1)
;   ObjectIdToObject (1)
;   Open (2)
;   PostCommand (1)
;   PurgeAll ()
;   Regen (1)
;   Save ()
;   SaveAs (3)
;   SendCommand (1)
;   SetVariable (2)
;   StartUndoMark ()
;   Wblock (2)

; 模型空间
(setq myms (vla-get-ModelSpace mydoc))
(vlax-dump-Object myms t)
; IAcadModelSpace: 包含模型空间中所有图元的特殊 Block 对象
;特性值:
;   Application (RO) = #<VLA-OBJECT IAcadApplication 000000013f9e3f10>
;   BlockScaling = 0
;   Comments = ""
;   Count (RO) = 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Document (RO) = #<VLA-OBJECT IAcadDocument 0000000023a03528>
;   Explodable = -1
;   Handle (RO) = "70"
;   HasExtensionDictionary (RO) = 0
;   IsDynamicBlock (RO) = 0
;   IsLayout (RO) = -1
;   IsXRef (RO) = 0
;   Layout (RO) = #<VLA-OBJECT IAcadLayout 0000000048e87da8>
;   Name = "*Model_Space"
;   ObjectID (RO) = 42
;   ObjectName (RO) = "AcDbBlockTableRecord"
;   Origin = (0.0 0.0 0.0)
;   OwnerID (RO) = 43
;   Path = AutoCAD.Application: 不适用
;   Units = 0
;   XRefDatabase (RO) = AutoCAD.Application: 无数据库
;支持的方法:
;   Add3DFace (4)
;   Add3DMesh (3)
;   Add3DPoly (1)
;   AddArc (4)
;   AddAttribute (6)
;   AddBox (4)
;   AddCircle (2)
;   AddCone (3)
;   AddCustomObject (1)
;   AddCylinder (3)
;   AddDim3PointAngular (4)
;   AddDimAligned (3)
;   AddDimAngular (4)
;   AddDimArc (4)
;   AddDimDiametric (3)
;   AddDimOrdinate (3)
;   AddDimRadial (3)
;   AddDimRadialLarge (5)
;   AddDimRotated (4)
;   AddEllipse (3)
;   AddEllipticalCone (4)
;   AddEllipticalCylinder (4)
;   AddExtrudedSolid (3)
;   AddExtrudedSolidAlongPath (2)
;   AddHatch (4)
;   AddLeader (3)
;   AddLightWeightPolyline (1)
;   AddLine (2)
;   AddMInsertBlock (11)
;   AddMLeader (2)
;   AddMLine (1)
;   AddMText (3)
;   AddPoint (1)
;   AddPolyfaceMesh (2)
;   AddPolyline (1)
;   AddRaster (4)
;   AddRay (2)
;   AddRegion (1)
;   AddRevolvedSolid (4)
;   AddSection (3)
;   AddShape (4)
;   AddSolid (4)
;   AddSphere (2)
;   AddSpline (3)
;   AddTable (5)
;   AddText (3)
;   AddTolerance (3)
;   AddTorus (3)
;   AddTrace (1)
;   AddWedge (4)
;   AddXline (2)
;   AttachExternalReference (9)
;   Bind (1)
;   Delete ()
;   Detach ()
;   GetExtensionDictionary ()
;   GetXData (3)
;   InsertBlock (7)
;   Item (1) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Reload ()
;   SetXData (2)
;   Unload ()
; 其中 Item是根据序号获取图形对象，第一个图形对象的序号为0



; 直线
(setq myline (vla-Item myms 0))
(vlax-dump-Object myline t)
; IAcadLine: AutoCAD Line 接口
;特性值:
;   Angle (RO) = 0.406537
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00000001404c3f10>
;   Delta (RO) = (36.1902 15.5806 0.0)
;   Document (RO) = #<VLA-OBJECT IAcadDocument 0000000023bfe798>
;   EndPoint = (85.4468 35.1856 0.0)
;   EntityTransparency = "ByLayer"
;   Handle (RO) = "261"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 0000000044544748>
;   Layer = "0"
;   Length (RO) = 39.4016
;   Linetype = "ByLayer"
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = "ByLayer"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 45
;   ObjectName (RO) = "AcDbLine"
;   OwnerID (RO) = 42
;   PlotStyleName = "ByLayer"
;   StartPoint = (49.2566 19.6049 0.0)
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 0000000044544980>
;   Visible = -1
;支持的方法:
;   ArrayPolar (3)
;   ArrayRectangular (6)
;   Copy ()
;   Delete ()
;   GetBoundingBox (2)
;   GetExtensionDictionary ()
;   GetXData (3)
;   Highlight (1)
;   IntersectWith (2)
;   Mirror (2)
;   Mirror3D (3)
;   Move (2)
;   Offset (1)
;   Rotate (2)
;   Rotate3D (3)
;   ScaleEntity (2)
;   SetXData (2)
;   TransformBy (1)
;   Update ()

; 圆
(setq mycircle (vla-Item myms 3))
(vlax-dump-Object mycircle t)
; IAcadCircle: AutoCAD Circle 接口
;特性值:
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00000001404c3f10>
;   Area = 308.409
;   Center = (127.25 63.3162 0.0)
;   Circumference = 62.2542
;   Diameter = 19.8161
;   Document (RO) = #<VLA-OBJECT IAcadDocument 0000000023bfe798>
;   EntityTransparency = "ByLayer"
;   Handle (RO) = "27C"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 0000000043c92a78>
;   Layer = "0"
;   Linetype = "ByLayer"
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = "ByLayer"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 46
;   ObjectName (RO) = "AcDbCircle"
;   OwnerID (RO) = 42
;   PlotStyleName = "ByLayer"
;   Radius = 9.90806
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 0000000043c924d0>
;   Visible = -1
;支持的方法:
;   ArrayPolar (3)
;   ArrayRectangular (6)
;   Copy ()
;   Delete ()
;   GetBoundingBox (2)
;   GetExtensionDictionary ()
;   GetXData (3)
;   Highlight (1)
;   IntersectWith (2)
;   Mirror (2)
;   Mirror3D (3)
;   Move (2)
;   Offset (1)
;   Rotate (2)
;   Rotate3D (3)
;   ScaleEntity (2)
;   SetXData (2)
;   TransformBy (1)
;   Update ()

; 获取某一个属性
(vlax-get-property mycircle 'Radius)
; 9.90806

