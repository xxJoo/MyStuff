;;; <LISPDOC>
;;; <SUBR>(GL)</SUBR>
;;; <DESC>Mark a Steel Beam with two point</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>

(defun c:gq (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nGL")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        ; set the Beam Width
		(if (null BeamWidthDefault) (setq BeamWidthDefault 150))
        (setq BeamWidth 
            (getreal (strcat "\nBeam Width<" (rtos BeamWidthDefault 2 2) ">:"))
        )
        (if (null BeamWidth) (setq BeamWidth BeamWidthDefault))

        ; set the basic data
		(setq 
			pointStart (getpoint "\nSelect the start point:")
			pointEnd (getpoint "\nSelect the end point:")
			lineAngle (angle pointStart pointEnd)
			lineAngleRe (angle pointEnd pointStart)
			lineDistance (distance pointStart pointEnd)
		)

        ; set the derived data
		(setq
			point01 (polar pointStart lineAngle 100)
			point02 (polar point01 (+ lineAngle (/ pi 2)) 150)
			point03 (polar point02 (- lineAngle (/ pi 6)) 300)
			point04 (polar point03 (- lineAngle (* 5 (/ pi 6))) 300)

			point05 (polar pointEnd lineAngleRe 100)
			point06 (polar point05 (- lineAngleRe (/ pi 2)) 150)
			point07 (polar point06 (+ lineAngleRe (/ pi 6)) 300)
			point08 (polar point07 (+ lineAngleRe (* 5 (/ pi 6))) 300)

			point09 (inters point02 point04 pointStart pointEnd)
			point10 (inters point06 point08 pointStart pointEnd)
		)

		
		(command "pline" 
			pointStart
			point01
			point02
			point03
			point04
			point01
			point05
			point06
			point07
			point08
			point05
			pointEnd
			""
		)
		
		(command "mline" 
			"J" "Z" 
			"S" BeamWidth
			point01 point05
			""
		)

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



(defun c:cq (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nGL-CL")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        ; set the Beam Width
		(if (null BeamWidthDefault) (setq BeamWidthDefault 150))
        (setq BeamWidth 
            (getreal (strcat "\nBeam Width<" (rtos BeamWidthDefault 2 2) ">:"))
        )
        (if (null BeamWidth) (setq BeamWidth BeamWidthDefault))

        ; set the basic data
		(setq 
			pointStart (getpoint "\nSelect the start point:")
			pointEnd (getpoint "\nSelect the end point:")
			lineAngle (angle pointStart pointEnd)
			lineAngleRe (angle pointEnd pointStart)
			lineDistance (distance pointStart pointEnd)
		)

        ; set the derived data
		(setq
			point01 (polar pointStart lineAngle 100)
			point02 (polar point01 (+ lineAngle (/ pi 6)) 300)
			point03 (polar point02 (- lineAngle (/ pi 2)) 300)

			point04 (polar pointEnd lineAngleRe 100)
			point05 (polar point04 (- lineAngleRe (/ pi 6)) 300)
			point06 (polar point05 (+ lineAngleRe (/ pi 2)) 300)

			point07 (inters point02 point03 pointStart pointEnd)
			point08 (inters point05 point06 pointStart pointEnd)
		)

		
		(command "pline" 
			pointStart
			point01
			point02
			point03
			point01
			point04
			point05
			point06
			point04
			pointEnd
			""
		)
		
		(command "mline" 
			"J" "Z" 
			"S" BeamWidth
			point07 point08
			""
		)
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


