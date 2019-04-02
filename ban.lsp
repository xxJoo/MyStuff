

; 使用 ActiveX
; (vl-load-com)


; 如何批量
; 形成封闭单元
; boundary 命令

; 形成多段线 图元名 和 选择点
(setq ent-name (car (entsel)))

; 获得 此多段线 的变体数据
(setq vla-data (vlax-ename->vla-object ent-name))
; (vlax-dump-Object vla-data)
;	----------------------------------------------------------------------
; 	IAcadLWPolyline: AutoCAD Lightweight Polyline 接口
;	特性值:
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff74f3c3f10>
;   Area (RO) = 6.7975e+006
;   Closed = -1
;   ConstantWidth = 0.0
;   Coordinate = ...不显示带索引的内容...
;   Coordinates = (49814.3 15110.4 49364.3 15110.4 49364.3 15560.4 ... )
;   Document (RO) = #<VLA-OBJECT IAcadDocument 0000023e10c05368>
;   Elevation = 0.0
;   EntityTransparency = "ByLayer"
;   Handle (RO) = "1E2E"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 0000023e117a9b88>
;   Layer = "BEAM"
;   Length (RO) = 11000.0
;   Linetype = "ByLayer"
;   LinetypeGeneration = 0
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = "ByLayer"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 42
;   ObjectName (RO) = "AcDbPolyline"
;   OwnerID (RO) = 43
;   PlotStyleName = "ByLayer"
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 0000023e117a8c20>
;   Visible = -1
;	----------------------------------------------------------------------



(setq points-safearray )
; 有用的属性
; Area
; Closed
; ConstantWidth
; Coordinate
; Coordinates
; Handle
; Lineweight
; Material
; Thickness

; 得到变体的某一个属性
; 返回变体类型
(vlax-get-property vla-data 'Coordinates)

; 得到变体类型的属性的值
(vlax-variant-value )

; 将变体类型的属性的值(也是变体)转化为一般类型
(vlax-safearray->list )

; 判断多段线是否闭合
(vlax-curve-isClosed )



; 操作多段线的边
; 判断面对象的相互位置关系





; 多段线的链表
(entget (car(entsel)))
; 选择对象: 
; (
; 	(-1 . <图元名: 7ff443b46b60>) 
; 	(0 . "LWPOLYLINE") 
; 	(330 . <图元名: 7ff443b039f0>) 
; 	(5 . "1E8E") 
; 	(100 . "AcDbEntity") 
; 	(67 . 0) 
; 	(410 . "Model") 
; 	(8 . "BEAM") 
; 	(100 . "AcDbPolyline") 
; 	(90 . 4) 
; 	(70 . 1) 
; 	(43 . 0.0) 
; 	(38 . 0.0) 
; 	(39 . 0.0) 
; 	(10 0.0 0.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(10 5000.0 0.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(10 5000.0 2000.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(10 0.0 2000.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(210 0.0 0.0 1.0))
; 命令: *取消*





