
; 直线
(entmake (list
  '(0 . "LINE")
  (cons 10 pt1)
  (cons 11 pt2)
))

; 两顶点多段线
; 多顶点类似
(entmake (list
  '(0 . "LWPOLYLINE")
  '(100 . "AcDbEntity")
  '(100 . "AcDbPolyline")
  (cons 90 2)
  (cons 10 pt1)
  (cons 10 pt2)
))
  
; 点表生成多段线
(entmake (append
  (list
    '(0 . "LWPOLYLINE")
    '(100 . "AcDbEntity")
    '(100 . "AcDbPolyline")
    (cons 90 (length lst))
  )
  (mapcar '(lambda (pt)(cons 10 pt)) lst)
))

; 圆
(entmake (list
  '(0 . "CIRCLE")
  (cons 10 pt)
  (cons 40 r)
))
; 圆弧
(entmake (list
  '(0 . "ARC")
  (cons 10 pt)
  (cons 40 r)
  (cons 50 ang1)
  (cons 51 ang2)
))
; 单行文本
(entmake (list
  '(0 . "TEXT")
  (cons 1 str)
  (cons 10 pt)
  (cons 40 5)
))
; 多行文本
(entmake (list
  '(0 . "MTEXT")
  '(100 . "AcDbEntity")
  '(100 . "AcDbMText")
  '(7 . "Standard")
  (cons 1 str)
  (cons 10 pt)
))
; 半径标注

(entmake (list
  '(0 . "DIMENSION")
  '(100 . "AcDbEntity")
  '(100 . "AcDbDimension")
  (cons 10 pt)
  '(70 . 36)
  '(100 . "AcDbRadialDimension")
  (cons 15 pt1)
))

; 直径标注
(entmake (list
  '(0 . "DIMENSION")
  '(100 . "AcDbEntity")
  '(100 . "AcDbDimension")
  (cons 10 pt1)
  (cons 11 pt2)
  '(70 . 163)
  '(100 . "AcDbDiametricDimension")
  (cons 15 pt3)
))

; 水平标注
(entmake (list
  '(0 . "DIMENSION")
  '(100 . "AcDbEntity")
  '(100 . "AcDbDimension")
  (cons 10 pt)
  '(70 . 32)
  '(1 . "")
  '(100 . "AcDbAlignedDimension")
  (cons 13 pt1)
  (cons 14 pt2)
  '(100 . "AcDbRotatedDimension")
))

; 垂直标注
(entmake (list
  '(0 . "DIMENSION")
  '(100 . "AcDbEntity")
  '(100 . "AcDbDimension")
  (cons 10 pt)
  '(70 . 32)
  '(1 . "")
  '(100 . "AcDbAlignedDimension")
  (cons 13 pt1)
  (cons 14 pt2)
  '(50 . 1.5708)
  '(100 . "AcDbRotatedDimension")
))

; 倾斜标注  
(entmake (list
  '(0 . "DIMENSION")
  '(100 . "AcDbEntity")
  '(100 . "AcDbDimension")
  (cons 10 pt1)
  '(70 . 33)
  '(1 . "")
  '(100 . "AcDbAlignedDimension")
  (cons 13 pt2)
  (cons 14 pt3)
))

; entmake生成普通块
(defun emkblk (ss pt name / i)
  (entmake (list '(0 . "block") (cons 2 name) '(70 . 0) (cons 10 pt)))
  (repeat (setq i (sslength ss))
    (entmake (cdr (entget (ssname ss (setq i (1- i))))))
  )
  (entmake '((0 . "ENDBLK")))
  (command "_.erase" ss "")
  (entmake (list '(0 . "INSERT") (cons 2 name) (cons 10 pt)))
)

; entmake插入普通块
(entmake (list '(0 . "INSERT") (cons 2 name) (cons 10 pt)))

; entmake生成无名块
(defun emkunameblk (ss pt / i name)
  (entmake (list '(0 . "block") '(2 . "*U") '(70 . 1) (cons 10 pt)))
  (repeat (setq i (sslength ss))
    (entmake (cdr (entget (ssname ss (setq i (1- i))))))
  )
  (setq name (entmake '((0 . "ENDBLK"))))
  (command "_.erase" ss "")
  (entmake (list '(0 . "INSERT") (cons 2 name) (cons 10 pt)))
  name
)

; 将选择集做成属性块(选择集中单行文本作为属性)
(defun emkattblk (ss pt name / ent i)
  (entmake (list '(0 . "block") (cons 2 name) '(70 . 2) (cons 10 pt)))
  (repeat (setq i (sslength ss))
    (setq ent (entget (ssname ss (setq i (1- i)))))
    (if (= (cdr (assoc 0 ent)) "TEXT")
      (entmake (list
        '(0 . "ATTDEF")
        (assoc 10 ent)
        (assoc 40 ent)
        (assoc 1 ent)
        (cons 3 (cdr (assoc 1 ent)))
        (cons 2 (cdr (assoc 1 ent)))
        '(70 . 0)
      ))
      (entmake (cdr ent))
    )
  )
  (entmake '((0 . "ENDBLK")))
)
  
; 生成图层
(entmake (list
  '(0 . "LAYER")
  '(100 . "AcDbSymbolTableRecord")
  '(100 . "AcDbLayerTableRecord")
  '(70 . 0)
  '(6 . "Continuous")
  (cons 2 name)
))

  
; 创建新线型
(entmake (list
  '(0 . "LTYPE")
  '(100 . "AcDbSymbolTableRecord")
  '(100 . "AcDbLinetypeTableRecord")
  (cons 2 "BERDIG 5-545")
  '(3 . "Border ____   ____   ____   ____   ____")
  '(70 . 0)
  '(73 . 2)
  '(40 . 15.0)
  '(49 . 10.0)
  '(74 . 0)
  '(49 . -5.0)
  '(74 . 0)
))

  
; 引线
(entmake (list
  '(0 . "LEADER")
  '(100 . "AcDbEntity")
  '(100 . "AcDbLeader")
  (cons 10 pt)
  (cons 10 pt1)
  (cons 10 pt2)
))

; 构造线
(entmake (list
  '(0 . "XLINE")
  '(100 . "AcDbEntity")
  '(100 . "AcDbXline")
  (cons 10 pt)
  (cons 11 pt1)
))

; 椭圆
(entmake (list
  (0 . "ELLIPSE")
  (100 . "AcDbEntity")
  (100 . "AcDbEllipse")
  (10 3969.6 4289.14 0.0)
  (11 -1828.47 0.0 0.0)
  (40 . 0.416093)
  (42 . 6.28319)
))

; 点
(entmake (list
  '(0 . "POINT")
  (cons 10 '(1, 1, 1))
))

(entmake (list
  '(0 . "POINT")
  (cons 10 pt)
))

; entmake文字样式
(entmake (list
  '(0 . "STYLE")
  '(100 . "AcDbSymbolTableRecord")
  '(100 . "AcDbTextStyleTableRecord")
  (cons 2 name)
  '(70 . 0)
  (cons 40 h)
  (cons 41 w)
  '(3 . "romans.shx")
  '(4 . "Hztxts.shx")
))


; 建立第一级标注样式（来源于论坛）
(entmake (list
  '(0 . "DIMSTYLE")
  '(100 . "AcDbSymbolTableRecord")
  '(100 . "AcDbDimStyleTableRecord")
  '(70 . 0)
  (cons 340 (tblobjname "style" "Standard")) ; 文字样式名
  (cons 2 "MyDimStyle")                      ; 标注样式名
  '(3 . "M<>")                               ; 标注前缀
  '(40 . 0.0)                                ; 标注特征比例，缩放到布局
  '(41 . 2.5)                                ; 箭头尺寸
  '(42 . 1.5)                                ; 起点偏移量
  '(43 . 5.5)                                ; 基线间距
  '(44 . 1.5)                                ; 超出尺寸线
  '(47 . 0.000)                              ; 上偏差
  '(48 . 0.000)                              ; 下偏差
  '(71 . 0)                                  ; 公差无
  '(77 . 1)                                  ; 文字在尺寸线上方
  '(74 . 1)                                  ;
  '(140 . 3.0)                               ; 文字高度
  '(141 . -2.5)                              ; 圆心标记
  '(144 . 1.0)                               ; 测量比例单位
  '(146 . 0.7)                               ; 公差高度比例
  '(147 . 1.0)                               ; 文字从尺寸线偏移
  '(172 . 2)                                 ; 尺寸界线间连线
  '(176 . 256)                               ; 随层
  '(177 . 256)                               ; 随层
  '(178 . 256)                               ; 随层
  '(271 . 3)                                 ; 尺寸标注精度
  '(272 . 3)                                 ; 公差标注精度
  '(275 . 0)                                 ; 角度标注制式，十进制。
  '(288 . 1)                                 ; 手动放置尺寸
))


; 点表生成样条曲线（感谢院长提供）
(entmake (append
  (list
    '(0 . "SPLINE")
    '(100 . "AcDbEntity")
    '(100 . "AcDbSpline")
    '(71 . 3)
  )
  (mapcar '(lambda (pt) (cons 11 pt))  ptlst)
))

; 生成SOLID 
; pt1234四点围成图形，如三点则最后两点相同
(entmake (list
  '(0 . "SOLID")
  (cons 10 pt1)
  (cons 11 pt2)
  (cons 12 pt4)
  (cons 13 pt3)
))

;[功能] X轴(Y轴)构造线
;;Flag T时,在X轴线上产生射线
;;示例 (EntmakeXline (getpoint) "X")产生平行X轴的射线
(defun EntmakeXline (pt Flag / P1)
  (if Flag
    (setq p1 '(1 0 0))
    (setq p1 '(0 1 0))
  )
  (entmakeX (list
    '(0 . "XLINE")
    '(100 . "AcDbEntity")
    '(100 . "AcDbXline")
    (cons 10 pt)
    (cons 11 p1)
  ))
)
