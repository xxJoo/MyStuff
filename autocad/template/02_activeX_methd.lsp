;;; 在Visual LISP函数中使用ActiveX方法

; 通过 Help 功能详细了解 AutoCAD 图形对象的方法
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Help 文件提供的方法是 vba 语言
; 要转化为 lisp 语言
; 将Visual Basic环境下的语句改写为AutoLISP表达式
; 先分析Visual Basic环境下的语句：
; RetVal = object.AddLine(StartPoint,EndPoint)
; valx-3d-point是VLISP ActiveX的函数
; 其功能是将AutoLISP的3维点转换为ActiveX要求的变体类型的数据
(setq pt1 (vlax-3d-point '(10 20)))
(setq pt2 (vlax-3d-point '(80 30)))
(setq myline (vla-AddLine myms pt1 pt2)) 

; ActiveX 能够自动进行转换的 AutoLISP 的一些数据类型 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 表 10-1
;             整数    实数  字符串  VLA对象  变体 安全数组  :vlax_true:vlax_false
; 单字节字符    +      
; 布尔类型                                                            +
; 整数          +
; 长整数        +
; 单精度实数    +       +
; 双精度实数    +       +
; 对象                                +
; 字符串                      + 
; 变体                                       + 
; 数组                                              +

; 如果表格的交叉处有加号(+)
; 表示这样的ActiveX数据类型时
; 可以直接使用相应的AutoLISP数据类型
