(defun c:3D3S_Reaction (/ *error* main doc)
	(vl-load-com)
	(defun main()
		(princ "\n3D3S Reaction")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
		
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

		; seletc a mtext entity


		; get the content


		; sovle it


		; out put 


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
