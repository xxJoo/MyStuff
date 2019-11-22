; 使用集合对象

; (vlax-map-Collection collection-object function)
; (vlax-for)
(vl-load-com)
(setq myacad(vlax-get-acad-object))
(setq mydoc(vla-get-ActiveDocument myacad))
(setq myms(vla-get-ModelSpace mydoc))
; 将某一个函数应用到集合中的每一个对象
(vlax-map-Collection myms 'vlax-dump-Object)
; 将一系列函数应用到集合中的每一个对象
(vlax-for obj myms
    (setq objectColor (vla-get-Color obj))
    (princ "Color")
    (princ objectColor)
    (princ "\n")
)

; 获取集合中的成员对象

; item 方法
; (vla-Item myms index)
(vla-Item myms 0)
; count 属性
(vla-get-Count myms)

; 释放VLA对象和释放内存

; 可调用函数vlax-release-object释放VLA对象
; (vlax-release-object VLA对象)
(vlax-release-object mycircle)
; 如果要测试是否释放了某对象
(vlax-object-released-p mycircle)
; 如果已释放了该VLA对象，函数返回T，否则返回nil

; 处理ActiveX方法返回的错误

; 函数vl-catch-all-apply可以截取ActiveX方法返回的错误
; (vl-catch-all-apply 'function list)

; 获取图元包容方框的角点
(defun box1(/ mydoc myhndl myobj llpoint urpoint)
    (vl-load-com)
    (setq mydoc(vla-get-activedocument (vlax-get-acad-object)))
    (setq myhndl(cdr (assoc 5(entget (car (entsel "\n选择一个图元："))))))
    (setq myobj(vla-handletoobject mydoc myhndl))
    (vla-getboundingbox myobj 'llpoint 'urpoint)
    (princ "\n包容方框的角点")
    (princ (vlax-safearray->list llpoint))
    (princ " ")
    (princ (vlax-safearray->list urpoint))
    (princ)
)

; 获取图元包容方框的角点
(defun box2(/ mydoc myhndl myobj llpoint urpoint)
    (vl-load-com)
    (setq mydoc(vla-get-activedocument (vlax-get-acad-object)))
    (setq myhndl(cdr (assoc 5(entget (car (entsel "\n选择一个图元："))))))
    (setq myobj(vla-handletoobject mydoc myhndl))
    (setq err(vl-catch-all-apply 'vla-getboundingbox (list myobj 'llpoint 'urpoint)))
    (if (vl-catch-all-error-p err)
        (princ "\n所选图元不能建立包容方框，程序将退出 !")
        (progn
            (princ "\n包容方框的角点")
            (princ (vlax-safearray->list llpoint))(princ " ")
            (princ (vlax-safearray->list urpoint))
        )
    )
    (princ)
)

; 用ActiveX方法定义在模型控件绘制一条直线的命令
(defun c:actvline(/ myacad mydoc myms p1 p2 myline)
    (vl-load-com)
    (setq myacad (vlax-get-acad-object));获取AutoCAD应用程序本身
    (setq mydoc(vla-get-ActiveDocument myacad));获取活动文档
    (setq myms(vla-get-ModelSpace mydoc));获取模型空间
    (setq p1(getpoint "\n输入直线的起点:"))
    (setq p2(getpoint p1 "\n输入直线的终点:"))
    ;将普通的三维点转换为ActiveX的变体，再调用填加直线的方法
    (setq myline(vla-addline myms (vlax-3d-point p1) (vlax-3d-point p2)))
    (princ)
)
; 用ActiveX方法定义将选到的圆改变为指定面积的命令
(defun c:chcircarea(/ ec area v_c)
    (vl-load-com)
    (setq ec(car (entsel "\n选择一个圆:")));获取圆的图元名
    (setq area(getreal "\n输入圆的新的面积:"));
    (while (<= area 0)
        (alert "面积必须大于0，请重新输入！")
        (setq area(getreal "\n输入圆的新的面积:"));
    )	   
    (setq v_c(vlax-ename->vla-object ec));将圆的图元名转换为VLA对象
    (vla-put-area v_c area);更新圆的面积
    (princ)
)





