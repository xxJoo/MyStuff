;;; <LISPDOC>
;;; <SUBR>(LineSetDivide)</SUBR>
;;; <DESC>Divide a set of lines into n segment</DESC>
;;; <RET>divide points</RET>
;;; </LISPDOC>
; TODO 等分线段并连接

(prompt "\nC_LineSetDivide.lsp\n")
(prompt "批量定数等分\n")

(defun c:LineSetDivide (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nLine Set Divide")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        ; select a set of lines
        ; 选取圆弧和直线的集合
        (setq set_Lines (ssget '((0 . "arc,line"))))
        ; 统计集合元素个数
        (setq set_Lenghth (sslength set_Lines))

        ; divide every line into n segments
        ; 读取等分数
        (setq n (getint "divide into ? segments:"))
        ; 如果集合非空
        (if (/= set_Lenghth nil)
            (progn
                ; 初始化计数器 i
                (setq i 0)
                ; 当计数器 i 为达到集合长度时
                (while (< i set_Lenghth)
                    ; 读取第 i 个元素的图元名 存入 name_i
                    (setq name_i (ssname set_Lines i))
                    ; 对元素 i 进行定数等分
                    (command "divide" name_i n)
                    ; 计数器增加 1
                    (setq i (+ i 1))
                ); end while
            ); end progn
        ); end if
        
        ; -----------------------------------------------------------------------------
        ; end of main
        ; -----------------------------------------------------------------------------
        (vla-EndUndoMark doc/)
        (princ)
    )
    (defun *error*(s)
        (princ s)
        (vla-EndUndoMark doc)
        (princ)
    )
    (main)
)



