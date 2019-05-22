;;; <LISPDOC>
;;; <SUBR>(MarkTube)</SUBR>
;;; <DESC>Mark a line with length and color number</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>
(defun c:MarkTube (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nMark Tube")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        (setq old_cmdecho (getvar "cmdecho"))
        (setq old_os (getvar "osmode"))
        (setvar "cmdecho" 0)
        (setvar "osmode" 0)
        ; select a set of lines
        (setq set_Lines (ssget '((0 . "line"))))
        (setq n (sslength set_Lines))
        ; set the text height
        (setq textHeight (getvar "TEXTSIZE"))
        (setq textHeight_User 
            (getreal (strcat "\ntext height<" (rtos textHeight 2 2) ">:"))
        )
        (if (null textHeight_User)
            (setq textHeight_User textHeight)
        )
        ; mark the lines in the set
        (if (/= n nil)
            (progn
                (setq i 0)
                (while (< i n)
                    ; get entity list of line i from the set
                    (setq line_entlist (entget (ssname set_Lines i)))
                    ; get the start and end point of line i
                    (setq point_start (cdr (assoc 10 line_entlist)))
                    (setq point_end (cdr (assoc 11 line_entlist)))
                    ; get the color of line i
                    (setq colour (cdr (assoc 62 line_entlist)))
                    ; (if (null colour) ((setq colour "bylayer")))
                    ; 0 byblock nil bylayer

                    ; calculate the length, angle and mid-point of line i
                    (setq line_distance (distance point_start point_end))
                    (setq line_angle (angle point_start point_end))
                    (setq point_mid  (mapcar '* '(0.5 0.5 0.5) (mapcar '+ point_start point_end)))

                    ; calculate the text angle
                    ; line angle in quadrant one
                    ; text angle = line angle
                    (if (and (>= line_angle 0) (<= line_angle (* pi 0.5)))
                        (setq word_line_angle (+ line_angle 0)))
                    ; line angle in quadrant two
                    ; text angle = line angle + 180 degree
                    (if (and (> line_angle (* pi 0.5)) (<= line_angle pi))
                        (setq word_line_angle (+ pi line_angle)))
                    ; line angle in quadrant three
                    ; text angle = line angle - 180 degree
                    (if (and (> line_angle pi) (<= line_angle (* pi 1.5)))
                        (setq word_line_angle (- line_angle pi)))
                    ; line angle in quadrant four
                    ; text angle = line angle
                    (if (and (> line_angle (* pi 1.5)) (< line_angle (* pi 2)))
                        (setq word_line_angle (+ line_angle 0)))

                    ; ; set the word location
                    ; ; if the line distance is too short (< 10)
                    ; ; the location will be offset 1.4 * WordHeight
                    ; (if (and(> line_distance 0) (< line_distance 10))
                    ;   (setq word_location ( * textHeight_User -1.4 )))
                    ; ; if the line distance is normal (> 10)
                    ; ; the location will be offset 1.8 * WordHeight
                    ; (if (>= line_distance 10) 
                    ;   (setq word_location (* textHeight_User -1.8)))
                    ; ; off set from mid-point ?
                    ; (setq word_location 
                    ;   (polar point_mid word_line_angle word_location ))
                    ; ; off set from mid-point
                    ; (setq word_location 
                    ;   (polar word_location (+ word_line_angle (* 0.5 pi)) (* textHeight_User 0.5)))
                    
                    (setq word_line_angle_degree (* word_line_angle (/ 180  pi )))
                    
                    ; fix the distance to integer
                    ; (command "text" "J" "C" point_mid textHeight_User word_line_angle_degree "GL1")
                    (command "text" "J" "C" point_mid textHeight_User word_line_angle_degree (fix line_distance))
                    (command "text" "J" "TC" point_mid textHeight_User word_line_angle_degree colour)
                    
                    ; rise the counter i
                    (setq i (+ i 1))
                ); end while
            ); end progn
        ); end if
        
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
    (main)
)
