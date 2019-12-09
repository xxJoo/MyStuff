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
        ; 选区一个集合的圆 set_Bolts
        (setq set_Bolts (ssget '((0 . "CIRCLE"))))
        (setq n (sslength set_Bolts))

        ; set the text height
        ; 设置标注文字的高度 textHeight
        (setq textHeight (getvar "TEXTSIZE"))
        (setq textHeight_User 
            (getreal (strcat "\ntext height<" (rtos textHeight 2 2) ">:"))
        )
        (if (null textHeight_User)
            (setq textHeight_User textHeight)
        )

        ; 圆形群 list points_mid
        (setq points_mid nil)
        ; 半径群 list points_r
        (setq points_r nil)

        (if (/= n nil)
            (progn
                (setq i 0)
                ; i = 0, 1, ... n-1
                (while (< i n)
                    ; 操作第 i 个圆形的参数表 BoltEntlist
                    (setq BoltEntlist (entget (ssname set_Bolts i)))

                    ; 获得此圆形的半径 point_r 实数类型
                    (setq point_r (cdr (assoc 40 BoltEntlist)))
                    ; 将此实数装进一个 list point_r
                    ; 这里为什么要这么做 ?????????????????????????????
                    (setq point_r (list point_r))
                    ; 将此单个半径的 list 加入到半径群 list points_r 的最后
                    (setq points_r (append points_r point_r))

                    ; 获得此圆形的圆心 point_center 实数类型
                    (setq point_center (cdr (assoc 10 BoltEntlist)))
                    ; 将此实数装进一个 list point_center
                    ; 这里为什么要这么做 ?????????????????????????????
                    (setq point_center (list point_center))
                    ; 将此单个圆心的 list 加入到圆心群 list 的最后 points_mid
                    (setq points_mid (append points_mid point_center))
        
                    (setq i (+ i 1))
                ); end while
            ); end progn
        ); end if
        ; 圆形群 list points_mid
        ; 半径群 list points_r
        ; 求解完毕

        ; 求形心函数(CaluShapeCenter) 赋值给 shapeCenter
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


    ; -----------------------------------------------------------------------------
    ; (defun GetProperty(selectedSet)
    ;     (setq e (car (ssget)))
    ;     (setq mySet (ssget))
    ;     (foreach k mySet 
    ;         (command "region" k )
    ;     )
    ;     (setq vlaobj (vlax-ename->vla-object e))
    ;     (vlax-safearray->List (variant-value (vlax-get-property vlaobj 'centroid)))
    ; )


    ; (defun copy()
    ;     (setq
    ;         e (car (entsel))
    ;         pc (cdr (assoc 10 (entget e)))
    ;         r (cdr (assoc 40 (entget e)))
    ;         p (getpoint "\n    select a point:")
    ;         k (getreal "\n    input a real nummber:")
    ;     )
    ;     (command "copy" "cp")
    ;     (repeat  180
    ;         (command (polar pc (/ (* 2 n pi) 180)r))
    ;     )
    ; )
    ; -----------------------------------------------------------------------------

    (main)
)
