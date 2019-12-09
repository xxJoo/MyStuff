;;; <LISPDOC>
;;; <SUBR>(Calculation)</SUBR>
;;; <DESC>Calculate the text string result</DESC>
;;; <RET>flout</RET>
;;; </LISPDOC>

(prompt "\nC_Calculation.lsp\n")
(prompt "计算单行文本计算式\n")

(defun c:cf (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\n***计算单行文本计算式***\n")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        
        ; 取消命令回应
        (setq old_cmdecho (getvar "cmdecho"))
        (setvar "cmdecho" 0)
        
        ; 选择计算式子的单行文本:图元名 鼠标点击坐标
        (setq en (entsel "选择计算式子的单行文本图元:\n"))

        ; 通过图元名 得到图元串行(列表)
        (setq enData (entget(car en)))

        ; 1 号点对 (1 . "1+3*9")
        ; 获得 文本
        (setq expression (cdr (assoc 1 enData)))

        ; 计算文本内容 赋值给 result
        
        (arxload "geomcal")
        (setq result (cal expression)) 
        ; (command "cal" (strcat "result=" expression))

        ; 把结果打印到控制台
        (princ "result:")
        (princ result)
        
        ; 把 en 图元转化为 vla-object
        (setq en_vlaObject (vlax-ename->vla-object (car en)))
        
        ; 拷贝当前 en_vlaObject 图元
        (setq en_copy_vlaObject (vla-Copy en_vlaObject))

        ; en_vlaObject 平移 x 距离
        (setq L (getdist "\n输入结果平移距离"))
        (setq 
            point1 (vlax-3d-point 0 0 0)
            point2 (vlax-3d-point L 0 0)
            ; point1 (getpoint "输入第一点")
            ; point2 (getpoint "输入第二点")
        )
        (vla-Move en_copy_vlaObject point1 point2)

        ; 将拷贝出来的图元 en_copy_vlaObject 文本改为 result
        (setq en_copy (entget (vlax-vla-object->ename en_copy_vlaObject)))
        (setq resultString (vl-princ-to-string result))
        (setq en_copy (subst (cons 1 resultString) (assoc 1 en_copy) en_copy))

        ; 再图纸中(drawing)跟新en_copy_vlaObject
        (entmod en_copy)


        ; 恢复当前图形文件的命令响应设置
        (setvar "cmdecho" old_cmdecho)

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




;**********************一些可能用到的语句**********************
;(car en1);传回串行"en1"中的第一个元素
;(cadr en1);传回串行"en1"中的第二个元素
;(setq en1 (entsel));"entsel"请求选取一个图元，返回包含图元名称及选点坐标的串行
;(setq en1_data (entget(car en1)))
;(setq en2 (entsel))
;(setq en2_data (entget(car en2)))
;(setq en3 (entsel))
;(setq en3_data (entget(car en1)))
;
;(setq expression (assoc 40 en1_data))
;(setq newr (cons 40 400))
;(setq en1_data (subst newr expression en1_data))
;(entmod en1_data);更新"en1_data"图元
;**********************一些可能用到的语句**********************



