;;; <LISPDOC>
;;; <SUBR>(MarkPoint)</SUBR>
;;; <DESC>Mark a point with x, y, z, in a text</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>
(defun c:MarkPoint (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nMark Point")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        ; set the text height
        (setq textHeight (getvar "TEXTSIZE"))
        (setq textHeight_User 
            (getreal (strcat "\ntext height<" (rtos textHeight 2 2) ">:"))
        )
        (if (null textHeight_User)
            (setq textHeight_User textHeight)
        )
        ; while
        (while T
            ; get the point
            (setq pointToMark (getpoint "\nSelect the point to mark:"))
            (setq
                pointX (car pointToMark)
                pointY (cadr pointToMark)
                pointZ (caddr pointToMark)
            )
            ; make the text
            (setq str
                (strcat
                    "X:" (rtos pointX 2 2)
                    "Y:" (rtos pointY 2 2)
                    "Z:" (rtos pointZ 2 2)
                )
            )
            (entmake
                (list '(0 . "TEXT")
                    (cons 1 str)
                    (cons 10 pointToMark)
                    (cons 40 textHeight_User)
                )
            )
        )
        ; end while
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



