;;; <LISPDOC>
;;; <SUBR>(Bolt)</SUBR>
;;; <DESC>Mark a Bolt</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>
(defun c:Bolt (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nBolt")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        (setq old_cmdecho (getvar "cmdecho"))
        (setq old_os (getvar "osmode"))
        (setvar "cmdecho" 0)
        (setvar "osmode" 0)

        ; select a set of lines
        (setq set_Bolts (ssget '((0 . "CIRCLE"))))
        (setq n (sslength set_Bolts))

        ; set the text height
        (setq textHeight (getvar "TEXTSIZE"))
        (setq textHeight_User 
            (getreal (strcat "\ntext height<" (rtos textHeight 2 2) ">:"))
        )
        (if (null textHeight_User)
            (setq textHeight_User textHeight)
        )


		(setq points_mid nil)
		(setq points_r nil)

        (if (/= n nil)
            (progn
                (setq i 0)
                (while (< i n)
                    ; get entity list of line i from the set
                    (setq BoltEntlist (entget (ssname set_Bolts i)))

                    ; get the start and end point of line i
                    (setq point_r (cdr (assoc 40 BoltEntlist)))
                    (setq point_r (list point_r))
					(setq points_r (append points_r point_r))

                    (setq point_center (cdr (assoc 10 BoltEntlist)))
                    (setq point_center (list point_center))
					(setq points_mid (append points_mid point_center))


                    

                    (setq i (+ i 1))
                ); end while
            ); end progn
        ); end if


        (setq shapeCenter 
			(mapcar '(lambda (x) 
				(/ (apply '+ x) (length points_mid))
				) 
				(apply 'mapcar (cons 'list points_mid))
			)
		)



        (setq List_I
            (mapcar '(lambda(mids r)
                (setq A (* r r pi))
                (setq rx (- (car mids) (car shapeCenter)))
                (setq ry (- (cadr mids) (cadr shapeCenter)))
                (setq Sx (* rx rx A))
                (setq Sy (* ry ry A))
                (list Sx Sy)
                )
                points_mid
                points_r
            )
        )
        
        (setq I (sum List_I))
        (setq lst (vl-princ-to-string I))

        (command "text" "J" "C" shapeCenter textHeight_User "0" lst)

        (setvar "cmdecho" old_cmdecho)
        (setvar "osmode" old_os)

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
    (defun sum(list_x)
        (setq sum_list_x 
			(mapcar '(lambda (x) 
				(apply '+ x)
				) 
				(apply 'mapcar (cons 'list list_x))
			)
		)
    )
    (main)
)
