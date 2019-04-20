;;; <LISPDOC>
;;; <SUBR>(LineSetDivide)</SUBR>
;;; <DESC>Divide a set of lines into n segment</DESC>
;;; <RET>divide points</RET>
;;; </LISPDOC>
(defun c:LineSetDivide (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nLine Set Divide")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        ; select a set of lines
        (setq set_Lines (ssget '((0 . "arc,line"))))
        (setq set_Lenghth (sslength set_Lines))
        ; divide every line into n segments
        (setq n (getint "divide into ? segments:"))
        (if (/= set_Lenghth nil)
            (progn
                (setq i 0)
                (while (< i set_Lenghth)
                    (setq name_i (ssname set_Lines i))
                    (command "divide" name_i n)
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



