;;; <LISPDOC>
;;; <SUBR>(OverlapRate)</SUBR>
;;; <DESC>OverlapRate Calculation</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>



(prompt "\nC_OverlapRate.lsp\n")
(prompt "搭接率计算\n")




(defun c:Overlap (/ *error* main doc)
    (vl-load-com)
    (defun main ()
        (princ "\n搭接率计算")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        ; 读取管径
        (setq D (getreal "input D:"))
        (setq d_1 (getreal "input d1:"))
        (setq d_2 (getreal "input d2:"))

        ; 读取角度
        (setq theta_1 (getreal "input theta_1 in degree:"))
        (setq theta_1 (/ (* theta_1 pi) 180))
        ; (setq theta_1 (getreal "input theta_1 in radian:"))
        (setq theta_2 (getreal "input theta_2 in degree:"))
        (setq theta_2 (/ (* theta_2 pi) 180))
        ; (setq theta_2 (getreal "input theta_2 in radian:"))

        (setq result (cal_eta_ov D d_1 d_2 theta_1 theta_2))

        (princ result)
        
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

    ; 搭接率计算函数
    (defun cal_eta_ov (D d_1 d_2 theta_1 theta_2)

        ; 补角 = 180 - theta_1 - theta_2
        (setq theta_3 (- pi theta_1 theta_2))

        ; 支管半径
        ; r_1 = d_1 / 2
        (setq r_1 (/ d_1 2))
        ; r_2 = d_2 / 2
        (setq r_2 (/ d_2 2))

        ; k_1 = r_1 / sin(theta_1)
        (setq k_1 (/ r_1 (sin theta_1)))
        ; k_2 = r_2 / sin(theta_2)
        (setq k_2 (/ r_2 (sin theta_2)))

        ; a -> theta_1
        ; b -> theta_2
        ; c -> theta_3

        ; c = k_1 + k_2
        (setq c (+ k_1 k_2))
        ; a = [c*sin(theta_1)] / [sin(theta_3)]
        (setq a (/ (* c (sin theta_1)) (sin theta_3)))
        
        ; 求面积
        ; S = (1/2)*a*c*sin(theta_2) 
        (setq S (* 0.5 a c (sin theta_2)))
        ; h_c = 2S/c
        (setq h_c (/ (* 2 S) c))
        ; x = h_c - (D/2)
        (setq x (- h_c (/ D 2)))
        ; (q/c = x/h_c) -> (q = x*c/h_c)
        (setq q (/ (* x c) h_c))
        ; p = 2*k_2
        (setq p (* 2 k_2))
        (setq eta_ov (/ q p))
    )
    (main)
)
