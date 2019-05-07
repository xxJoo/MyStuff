;;; <LISPDOC>
;;; <SUBR>(Length)</SUBR>
;;; <DESC>Calculate the Length a each curve and the sum</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>

(defun c:Length (/ *error* main doc)
	(vl-load-com)
	(defun main()
		(princ "\nLength statistics")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

		(setq LengthSum 0) 
		(setq MySet (ssget '((0 . "CIRCLE,ELLIPSE,LINE,*POLYLINE,SPLINE,ARC")))) 
		(setq i 0)

		(repeat (sslength MySet) 
			(setq curve_i (vlax-ename->vla-object (ssname MySet i))) 
			(setq length_i (vlax-curve-getdistatparam curve_i (vlax-curve-getendparam curve_i))) 
			(setq LengthSum (+ LengthSum length_i))
			(princ (strcat
				"\nCurve Number: " (itoa i) "    "
				"Length: "(rtos length_i 2 3))
			)
			(setq i (1+ i))
		)
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












