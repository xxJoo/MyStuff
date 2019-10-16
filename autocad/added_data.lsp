; VLISP 扩充的数据类型
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 变体 variant
;    要想使用ActiveX方法
;    就必须遵守它的数据声明的规则
;    对于数量、高度、半径这些数据
;    ActiveX 允许 AutoLISP 使用整型或实型的数据
;    它可以自动将其转换为长整数或双精度的数据类型
;    见表10-1
;    对于起点、终点、圆心这些数据
;    必须经过必要的转换
;    才能为ActiveX所用
;    
;    变体实质上是自定义的数据结构
;    它可以包括不同类型的数据
;    例如字符串
;    整数和数组都可以表示为变体
;    变体的主要特点是数据的类型和值存放在一起
;    这种自定义的特点
;    在向ActiveX服务器传递参数时非常有用
;    因为它使得基于任何语言的服务器都能理解这样的数据。

; 创建变体
;      (vlax-make-variant [值] [类型])
;   表10-2 预定义的变体类型及其含义
;   类型                     值                含义
;   vlax-vbEmpty        预定义的变体 0   未初始化（默认值）
;   vlax-vbNull               1             空数据
;   vlax-vbInteger            2             整数型
;   vlax-vbLong               3            长整数型
;   vlax-vbSingle             4           单精度浮点数
;   vlax-vbDouble             5           双精度浮点数
;   vlax-vbString             8              字符串
;   vlax-vbObject             9              对象
;   vlax-vbBoolean            11             布尔值
;   vlax-vbArray             8192            数组
;   OLE_COLOR                19              OLE_COLOR
; Variant type 19 is a an OLE_COLOR, which can't be represented
; by a 16 bit signed integer (vlax-vbInteger)
; (vlax-variant-change-type OLE_COLOR vlax-vbLong)

;   表10-3 LISP数据类型与默认的ActiveX数据类型对照表 
;   LISP数据值的类型            默认的数据类型
;   Nil                         vlax-vbEmpty
;   vlax-null                   vlax-vbNull
;   Integer                     vlax-vbLong
;   Real                        vlax-vbDouble
;   String                      vlax-vbString
;   VLA-object                  vlax-vbObject
;   vlax-true、vlax-false       vlax-vbBoolean
;   Variant                     与初始值的类型相同
;   vlax-make-safearray         vlax-vbArray
(setq varnil (vlax-make-variant))
(setq varint (vlax-make-variant 50 vlax-vbInteger))
(setq varlng (vlax-make-variant 5))
(setq varstr (vlax-make-variant "my string"))

; 了解变体的数据类型
;   了解变体的数据类型用vlax-variant-type函数
;   返回变体的数据类型见表10-2
;   调用的格式如下：
;   (vlax-variant-type varnil 变体类型的数据 )
;   例如
(vlax-variant-type varnil) ; 返回 0
(vlax-variant-type varint) ; 返回 2 即 vlax-vbInteger
(vlax-variant-type varstr) ; 返回 8 即 vlax-vbString

; 了解变体的值
;   了解变体的值用vlax-variant-value函数
;   调用的格式如下：
;   (vlax-variant-value 变体类型的数据)
;   例如
(vlax-variant-value varnil) ; 返回 nil
(vlax-variant-value varint) ; 返回 50
(vlax-variant-value varstr) ; 返回 "my string"

; 改变变体的数据类型
;   (vlax-variant-change-type 变体类型的数据 新类型)
(setq varint (vlax-make-variant 5))
(setq varintStr (vlax-variant-change-type varint vlax-vbString))
(vlax-variant-value varintStr)

; 安全数组
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 创建安全数组

;   (vlax-make-safearray 类型 '(下限 . 上限) [ '(下限 . 上限)...])
; 表10-4 可作为安全数组的预定义的数据类型
; 预定义的变体类型       值        含  义
; vlax-vbInteger         2          整数
; vlax-vbLong            3         长整数
; vlax-vbSingle          4         单精度浮点数
; vlax-vbDouble          5         双精度浮点数
; vlax-vbString          8         字符串
; vlax-vbObject          9          对象
; vlax-vbBoolean        11          布尔类型
; vlax-vbVariant        12          变体

(setq p1 (vlax-make-safearray vlax-vbDouble '(0 . 2))) 
; 该例创建一个名字为p1的一维数组
; 下限标为0，上限为2
; 所以该数组可以存储三个数据为双精度的实数
(setq mt2 (vlax-make-safearray vlax-vbString '(0 . 1) '(1 . 3)))
; 创建一个名字为mt2的二维字符串数组
; 第一维下限为0，上限为1，包括两个元素
; 第二维下限为1，上限为3包括三个元素
; 表10-5 新创建的数组中的元素初始化方式
; 数据类型               初始值
; 数值                   0
; 字符串                 零长度字符串。
; 布尔值                 vlax-false 
; 对象                   nil 
; 变体                  未初始化 (vlax-vbEmpty)

; 为整个安全数组赋值

; (vlax-safearray-fill 变量  '数值表)
(vlax-safearray-fill p1 '(1 2 3))
(vlax-safearray-fill p1 '(1 2 3 4))
; 返回 error: vlax-safearray-fill failed. Invalid initialization list.
; 错误：函数失败，无效的设置初值的表。
(vlax-safearray-fill mt2 '(("a" "b" "c") ("d" "e" "f"))) 

; 列出安全数组的内容

; (vlax-safearray->list 安全数组)
; 例如
(vlax-safearray->list p1)
;返回(1.0 2.0 3.0)
(vlax-safearray->list mt2)
;返回(("a" "b" "c") ("d" "e" "f"))

; 为安全数组内指定的元素赋值

; (vlax-safearray-put-element 变量 索引 ...)
(vlax-safearray-put-element p1 0 10) ; 返回 10
(vlax-safearray-put-element mt2 0 1 "a1") ; 返回 "a1"
(vlax-safearray-put-element mt2 0 2 "b2") ; 返回 "b2"

; 在变体中使用安全数组

; 给数组分配空间
(setq a5 (vlax-make-safearray vlax-vbDouble '(0 . 4))) 
; 给数组赋值
(vlax-safearray-fill a5 '(1.1 2.2 3.3 4.4 5.5)) 
; 将数组存储到变体
(setq vara5 (vlax-make-variant a5))
; #<variant 8197 ...>

; 用函数vlax-3d-point来创建ActiveX要求的三维点
(setq CircleCenter (vlax-3d-point 12.5 10))
; CircleCenter #<variant 8197 ...>
(vlax-safearray->list (vlax-variant-value CircleCenter))
; (vlax-variant-value CircleCenter) #<safearray...>


; AutoCAD实体名和VLA对象之间的转换
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 将 AutoCAD 实体名转换为 VLA 对象

; (vlax-ename->vla-object AutoCAD实体名)
(setq e1 (entnext)) 
; <Entity name: 7ef4fe88>
(setq vla-object (vlax-ename->vla-object e1))
; #<VLA-OBJECT IAcadCircle 03743414>

; 将VLA图形对象转换为AutoCAD实体名

; (vlax-vla-object->ename VLA图形对象)
(setq new-ename (vlax-vla-object->ename vla-object))
; <Entity name: 7ef4fe88>

; 获得图形对象的属性

; 用带有vla-get前缀的函数
; 这类函数的调用语法如下
; (vla-get-property VLA图形对象)
(setq rad (vla-get-radius circ))
; 50.0
(setq area (vla-get-area  circ))
; 7853.98
(setq area (vla-get-color  circ))
; 256(bylayer)
(setq cntr (vla-get-center circ))
; #<variant 8197 ...>
(vlax-safearray->list (vlax-variant-value cntr))
; (100.0 80.0 0.0)
; 用函数 vlax-get-property 获取任意 ActiveX 对象的任意属性
; 函数 vlax-get-property 的调用格式如下
; (vlax-get-property VLA图形对象 property)
(setq rad (vlax-get-property circ 'radius))
; 50.0
(setq area (vlax-get-property circ 'area))
; 7853.98
(setq cntr (vlax-get-property circ 'center))
; #<variant 8197 ...>
(vlax-get-property circ 'Color)
; 256

; 修改图形对象的属性

; 用带有vla-put-前缀的函数，这类函数的调用语法如下
; (vla-put-property VLA图形对象 新的属性值)
(vla-put-Radius circ 20)
; nil
; 该圆的位置不变，半径改变为20。
(vla-put-Area  circ 1000)
; nil
; 该圆的位置不变，面积改变为1000。
(vla-put-Center circ (vlax-3d-point '(150 50 0)))
; nil
; 该圆的位置改变为(150 50 0)
; 有可能属性的修改并不立即反映到AutoCAD图形
; 这是因为AutoCAD对属性修改做了延迟
; 其目的是为了让用户可以一次修改多个属性
; 如果需要显式地更新图形窗口
; 可调用函数vla-update
; 其调用格式如下：
; (vla-Update VLA图形对象)
(vla-Update circ)
; 用函数 vlax-put-property 修改任意 ActiveX 对象的任意属性
; 函数vlax-put-property的调用格式如下
; (vlax-put-property VLA图形对象 property 新的属性值)
; 参数property为符号或字符串，标识要修改的属性。
; 例如，修改该圆的半径：
(vlax-put-property circ 'radius 80)
; nil
; 该圆的位置不变，半径改变为20。
(vlax-put-property circ 'area 2004)
; nil
; 该圆的位置不变，面积改变为2004。
(vlax-put-property circ 'center (vlax-3d-point '(180 20 0)))
; nil
; 该圆的位置改变为(180 20 0)
(vlax-put-property circ 'Color acRed)
(vlax-put-property circ 'Color 1)

; 确定是否可以修改对象

; vlax-read-enabled-p
; 测试是否可读该对象。
; vlax-write-enabled-p
; 测试是否可修改该对象的属性。
; vlax-erased-p
; 测试该对象是否已被删除
(vlax-read-enabled-p myline)
; T
; 说明可读
(vlax-write-enabled-p myline)
; T
;说明可被修改
(vlax-erased-p myline)
; nil
; 说明未被删除
(vla-Delete myline)
; myline,返回nil

; 使用用参数带回返回值的 ActiveX 方法

; GetBoundingBox
; 获取该圆的实体名
(setq ec(entlast))
; <Entity name: 7ef67e98>
; 将该圆转换为VLA对象
(setq mycircle(vlax-ename->vla-object ec))
; #<VLA-OBJECT IAcadLine 011bf2d4>




