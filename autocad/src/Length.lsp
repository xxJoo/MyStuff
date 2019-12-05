;;; <LISPDOC>
;;; <SUBR>(Length)</SUBR>
;;; <DESC>Calculate the Length a each curve and the sum</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>

(prompt "\nC_Length.lsp\n")
(prompt "计算曲线数目和总长度\n")


(defun c:Length (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nLength statistics")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        
        ; 线段总和为 0
        (setq LengthSum 0)
        ; 选取一个集合 包含:圆,椭圆,直线,多段线,Splint,圆弧
        (setq MySet (ssget '((0 . "CIRCLE,ELLIPSE,LINE,*POLYLINE,SPLINE,ARC")))) 

        ; 集合计数器置为 0
        (setq i 0)
        ; 循环集合个数次
        (repeat (sslength MySet) 
            ; 通过集合第 i 个元素的名字 将其转化为 vla对象 赋值给 curve_i
            (setq curve_i (vlax-ename->vla-object (ssname MySet i)))


            ; vlax-curve-getDistAtParam 计算从曲线开始到指定参数的长度
            ; vlax-curve-getDistAtPoint 计算从曲线开始到指定点的长度
            ; vlax-curve-getEndParam 返回曲线最后节点数
            ; vlax-curve-getEndPoint 返回曲线最后节点值（WCS中）
            ; vlax-curve-getParamAtDist 根据指定从曲线端点距离返回曲线上节点参数

            ; 算从曲线开始到指定参数的长度 length_i
            ; 指定参数为: 返回曲线最后节点数
            (setq length_i (vlax-curve-getDistAtParam curve_i (vlax-curve-getEndParam curve_i))) 

            ; 将 length_i 添加到总长度 LengthSum
            (setq LengthSum (+ LengthSum length_i))

            ; 输出 length_i 的: 序号 长度
            (princ (strcat
                "\nCurve Number: " (itoa i) "    "
                "Length: "(rtos length_i 2 3))
            )

            ; 计数器增加
            (setq i (1+ i))
        )

        ; 输出总曲线数目
        ; 输出总长度
        (princ (strcat
            "\nNumber of curves: " (itoa (sslength MySet))
            "\nLengthSum: "(rtos LengthSum 2 3))
        )

        ; -----------------------------------------------------------------------------
        ; end of main
        ; -----------------------------------------------------------------------------

        (vla-EndUndoMark doc)
        (princ)
    )
    (defun *error*(s)
        (princ s)
        (vla-EndUndoMark doc)
        (princ)
    )
    (main)
)












