;;; <LISPDOC>
;;; <SUBR>(Bolt)</SUBR>
;;; <DESC>Mark a Bolt</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>


(prompt "\nBolt.lsp\n")
(prompt "标注螺栓(圆)群的形心\n")


(defun c:Bolt (/ *error* main doc)
  (vl-load-com)
  (defun main()
    (princ "\nBolt")
    (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
    ; -----------------------------------------------------------------------------
    ; main
    ; -----------------------------------------------------------------------------

    ; 取消捕捉和命令回应
    (setq old_cmdecho (getvar "cmdecho"))
    (setq old_os (getvar "osmode"))
    (setvar "cmdecho" 0)
    (setvar "osmode" 0)

    ; select a set of circle
    ; 选取一个集合的 lwpolyline,pline,line
    (setq set_Lines (ssget '((0 . "lwpolyline,pline,line"))))
    (setq n (sslength set_Lines))

    (if (/= n nil)
      (progn
        (setq i 0)
        ; i = 0, 1, ... n-1
        (while (< i n)
          (setq name_i (ssname set_Lines i))
          ; <图元名: 7ffffb3a490>
          (setq curve_i (vlax-ename->vla-object name_i))
          ; #<VLA-OBJECT IAcadLWPolyline 000000004603e748>
          (setq Points (vla-get-Coordinates curve_i))
          ; #<variant 8197 ...>
          (setq mysafearray (vlax-variant-value Points))
          ; #<safearray...>
          (vlax-safearray->list mysafearray)

          ; 获得此圆形的半径 point_r 实数类型
          (setq point_r (cdr (assoc 40 BoltEntlist)))
          ; 将此实数装进一个 list
          (setq point_r (list point_r))
          ; 将此单个半径的 list 加入到半径群 list 的最后
          (setq points_r (append points_r point_r))


          ; 获得此圆形的圆心 point_r 实数类型
          (setq point_center (cdr (assoc 10 BoltEntlist)))
          ; 将此实数装进一个 list
          (setq point_center (list point_center))
          ; 将此单个圆心的 list 加入到圆心群 list 的最后
          (setq points_mid (append points_mid point_center))

          (setq i (+ i 1))
        ); end while
      ); end progn
    ); end if
    ; 圆形群 list points_mid
    ; 半径群 list points_r
    ; 求解完毕

    (setq shapeCenter (CaluShapeCenter points_mid))
    
    ; 求单个惯性矩
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
    ; 惯性矩求和
    (setq I (sum List_I))
    ; 转换 list 为 string
    ; (setq lst (vl-princ-to-string I))

    ; 表示惯性矩的字符串
    (setq I_x (cadr I))
    (setq I_y (car I))
    (setq lst 
        (strcat 
            "I_x:" (vl-princ-to-string I_x)
            ";"
            "I_y:" (vl-princ-to-string I_y) 
        )
    )
    
    ; 在形心处写出惯性矩
    (command "text" "J" "C" shapeCenter textHeight_User "0" lst)

    ; 恢复当前图形文件的捕捉设置和命令响应设置
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


  ; -----------------------------------------------------------------------------
  ; 求向量和
  ; -----------------------------------------------------------------------------
  (defun sum(list_x)
    (setq sum_list_x 
      (mapcar 
        '(lambda (x) 
          (apply '+ x)
        ) 
        ; (apply 'mapcar (cons 'list '((1 0 0) (2 2 0) (1 2 0) (3 4 0))))
        ; (mapcar 'list '(1 0 0) '(2 2 0) '(1 2 0) '(3 4 0))
        ; (list (list 1 2 1 3) (list 0 2 2 4) (list 0 0 0 0))
        ; 由行向量得到对应列向量
        (apply 'mapcar (cons 'list list_x))
      )
    )
  )
  ; (setq a '((1 2) (3 4) (5 6) (5 6)))
  ; (sum a)
  ; (14 18)
  ; -----------------------------------------------------------------------------



  ; -----------------------------------------------------------------------------
  ; 求形心
  ; -----------------------------------------------------------------------------
  (defun CaluShapeCenter(points)
    ; mapcar 的用法
    ; (mapcar '1+ (list a b c))
    ; (11 21 31)
    ; (mapcar '(lambda (x y)  (+ x y))  '(10 20 30) '(1 2 3))
    ; (11 22 33)
    (mapcar 
      ; 匿名函数
      '(lambda (x)
        ; 在使用除法的时候一定要有数据是 float 类型
        (/ (apply '+ x) (float (length points)))
      ) 
      ; 操作列表
      ; (apply 'mapcar (cons 'min '((1 0 0) (2 2 0) (1 2 0) (3 4 0))))
      ; (mapcar 'min '(1 0 0) '(2 2 0) '(1 2 0) '(3 4 0))
      ; (list (min 1 2 1 3) (min 0 2 2 4) (min 0 0 0 0))
      (apply 'mapcar (cons 'list points))
    )
  )
  ; (setq a '((1 2) (3 4) (5 6) (5 6)))
  ; (CaluShapeCenter a)
  ; (3.5 4.5)
  ; -----------------------------------------------------------------------------

  (main)
)




