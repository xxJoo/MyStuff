;;; <LISPDOC>
;;; <SUBR>(GL)</SUBR>
;;; <DESC>Mark a Steel Beam with two point</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>

(prompt "\nC_GL.lsp\n")
(prompt "画主次梁\n")

(defun c:zq (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nGL-主梁")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        (setq old_cmdecho (getvar "cmdecho"))
        (setq old_os (getvar "osmode"))
        (setvar "cmdecho" 0)
        

        ; set the Beam Width
        (if (null BeamWidthDefault) (setq BeamWidthDefault 150))
        (setq BeamWidth 
            (getreal (strcat "\nBeam Width<" (rtos BeamWidthDefault 2 2) ">:"))
        )
        (if (null BeamWidth) (setq BeamWidth BeamWidthDefault))
        (setq BeamWidthDefault BeamWidth)

        ; set the basic data
        (setq 
            pointStart (getpoint "\nSelect the start point:")
            pointEnd (getpoint "\nSelect the end point:")
            lineAngle (angle pointStart pointEnd)
            lineAngleRe (angle pointEnd pointStart)
            lineDistance (distance pointStart pointEnd)
        )

        (setvar "osmode" 0)

        ; set the derived data

        (setq point01 (polar pointStart lineAngle 100))
        (setq point02 (polar point01 (+ lineAngle (/ pi 2)) 150))
        (setq point03 (polar point02 (- lineAngle (/ pi 6)) 300))
        (setq point04 (polar point03 (- lineAngle (* 5 (/ pi 6))) 300))

        (setq point05 (polar pointEnd lineAngleRe 100))
        (setq point06 (polar point05 (- lineAngleRe (/ pi 2)) 150))
        (setq point07 (polar point06 (+ lineAngleRe (/ pi 6)) 300))
        (setq point08 (polar point07 (+ lineAngleRe (* 5 (/ pi 6))) 300))

        (setq point09 (inters point02 point04 pointStart pointEnd))
        (setq point10 (inters point06 point08 pointStart pointEnd))
    
        ; (command "text" point01 "100" "" "point01")
        ; (command "text" point02 "100" "" "point02")
        ; (command "text" point03 "100" "" "point03")
        ; (command "text" point04 "100" "" "point04")
        ; (command "text" point05 "100" "" "point05")
        ; (command "text" point06 "100" "" "point06")
        ; (command "text" point07 "100" "" "point07")
        ; (command "text" point08 "100" "" "point08")
        ; (command "text" point09 "100" "" "point09")
        ; (command "text" point10 "100" "" "point10")
        
        (command "line" pointStart pointEnd "")

        (command "pline" 
            point02
            point03
            point04
            point02
            ""
        )

        (command "bhatch"
            "p" "s"
            "s" (entlast) ""
            ""
        )

        (command "pline" 
            point06
            point07
            point08
            point06
            ""
        )
        
        (command "bhatch"
            "p" "s"
            "s" (entlast) ""
            ""
        )
        
        (command "mline" 
            "J" "Z" 
            "S" BeamWidth
            point01 point05
            ""
        )

        (setvar "cmdecho" old_cmdecho)
        (setvar "osmode" old_os)

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
        (princ "\nGL-次梁")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        (setq old_cmdecho (getvar "cmdecho"))
        (setq old_os (getvar "osmode"))
        (setvar "cmdecho" 0)

        ; set the Beam Width
        (if (null BeamWidthDefault) (setq BeamWidthDefault 150))
        (setq BeamWidth 
            (getreal (strcat "\nBeam Width<" (rtos BeamWidthDefault 2 2) ">:"))
        )
        (if (null BeamWidth) (setq BeamWidth BeamWidthDefault))
        (setq BeamWidthDefault BeamWidth)
        ; set the basic data

        (setq pointStart (getpoint "\nSelect the start point:"))
        (setq pointEnd (getpoint "\nSelect the end point:"))
        (setq lineAngle (angle pointStart pointEnd))
        (setq lineAngleRe (+ lineAngle pi))
        (setq lineDistance (distance pointStart pointEnd))

        (setvar "osmode" 0)

        ; set the derived data

        (setq point01 (polar pointStart lineAngle 100))
        (setq point02 (polar point01 (+ lineAngle (/ pi 6)) 300))
        (setq point03 (polar point02 (- lineAngle (/ pi 2)) 300))

        (setq point04 (polar pointStart lineAngle (- lineDistance 100)))
        (setq point05 (polar point04 (- lineAngleRe (/ pi 6)) 300))
        (setq point06 (polar point05 (+ lineAngleRe (/ pi 2)) 300))

        (setq point07 (inters point02 point03 pointStart pointEnd))
        (setq point08 (inters point05 point06 pointStart pointEnd))


        ; (command "text" pointStart "10" "" "pointStart")
        ; (command "text" pointEnd "10" "" "pointEnd")
        ; (command "text" point01 "10" "" "point01")
        ; (command "text" point02 "10" "" "point02")
        ; (command "text" point03 "10" "" "point03")
        ; (command "text" point04 "10" "" "point04")
        ; (command "text" point05 "10" "" "point05")
        ; (command "text" point06 "10" "" "point06")
        ; (command "text" point07 "10" "" "point07")
        ; (command "text" point08 "10" "" "point08")
        
        (command "line" pointStart pointEnd "")

        (command "pline" 
            point01
            point02
            point03
            point01
            ""
        )

        (command "pline" 
            point04
            point05
            point06
            point04
            ""
        )
        
        (command "mline" 
            "J" "Z" 
            "S" BeamWidth
            point07 point08
            ""
        )

        (setvar "cmdecho" old_cmdecho)
        (setvar "osmode" old_os)

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


