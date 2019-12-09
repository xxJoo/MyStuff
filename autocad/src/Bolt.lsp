;;; <LISPDOC>
;;; <SUBR>(Bolt)</SUBR>
;;; <DESC>Mark a Bolt</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>


(prompt "\nBolt.lsp\n")
(prompt "��ע��˨(Բ)Ⱥ������\n")

(defun c:Bolt (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nBolt")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        ; ȡ����׽�������Ӧ
        (setq old_cmdecho (getvar "cmdecho"))
        (setq old_os (getvar "osmode"))
        (setvar "cmdecho" 0)
        (setvar "osmode" 0)

        ; select a set of circle
        ; ѡ��һ�����ϵ�Բ set_Bolts
        (setq set_Bolts (ssget '((0 . "CIRCLE"))))
        (setq n (sslength set_Bolts))

        ; set the text height
        ; ���ñ�ע���ֵĸ߶� textHeight
        (setq textHeight (getvar "TEXTSIZE"))
        (setq textHeight_User 
            (getreal (strcat "\ntext height<" (rtos textHeight 2 2) ">:"))
        )
        (if (null textHeight_User)
            (setq textHeight_User textHeight)
        )

        ; Բ��Ⱥ list points_mid
        (setq points_mid nil)
        ; �뾶Ⱥ list points_r
        (setq points_r nil)

        (if (/= n nil)
            (progn
                (setq i 0)
                ; i = 0, 1, ... n-1
                (while (< i n)
                    ; ������ i ��Բ�εĲ����� BoltEntlist
                    (setq BoltEntlist (entget (ssname set_Bolts i)))

                    ; ��ô�Բ�εİ뾶 point_r ʵ������
                    (setq point_r (cdr (assoc 40 BoltEntlist)))
                    ; ����ʵ��װ��һ�� list point_r
                    ; ����ΪʲôҪ��ô�� ?????????????????????????????
                    (setq point_r (list point_r))
                    ; ���˵����뾶�� list ���뵽�뾶Ⱥ list points_r �����
                    (setq points_r (append points_r point_r))

                    ; ��ô�Բ�ε�Բ�� point_center ʵ������
                    (setq point_center (cdr (assoc 10 BoltEntlist)))
                    ; ����ʵ��װ��һ�� list point_center
                    ; ����ΪʲôҪ��ô�� ?????????????????????????????
                    (setq point_center (list point_center))
                    ; ���˵���Բ�ĵ� list ���뵽Բ��Ⱥ list ����� points_mid
                    (setq points_mid (append points_mid point_center))
        
                    (setq i (+ i 1))
                ); end while
            ); end progn
        ); end if
        ; Բ��Ⱥ list points_mid
        ; �뾶Ⱥ list points_r
        ; ������

        ; �����ĺ���(CaluShapeCenter) ��ֵ�� shapeCenter
        (setq shapeCenter (CaluShapeCenter points_mid))
        
        ; �󵥸����Ծ�
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
        ; ���Ծ����
        (setq I (sum List_I))
        ; ת�� list Ϊ string
        ; (setq lst (vl-princ-to-string I))

        ; ��ʾ���Ծص��ַ���
        (setq I_x (cadr I))
        (setq I_y (car I))
        (setq lst 
            (strcat 
                "I_x:" (vl-princ-to-string I_x)
                ";"
                "I_y:" (vl-princ-to-string I_y) 
            )
        )
        
        ; �����Ĵ�д�����Ծ�
        (command "text" "J" "C" shapeCenter textHeight_User "0" lst)

        ; �ָ���ǰͼ���ļ��Ĳ�׽���ú�������Ӧ����
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
    ; ��������
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
                ; ���������õ���Ӧ������
                (apply 'mapcar (cons 'list list_x))
            )
        )
    )
    ; (setq a '((1 2) (3 4) (5 6) (5 6)))
    ; (sum a)
    ; (14 18)
    ; -----------------------------------------------------------------------------



    ; -----------------------------------------------------------------------------
    ; ������
    ; -----------------------------------------------------------------------------
    (defun CaluShapeCenter(points)
        ; mapcar ���÷�
        ; (mapcar '1+ (list a b c))
        ; (11 21 31)
        ; (mapcar '(lambda (x y)  (+ x y))  '(10 20 30) '(1 2 3))
        ; (11 22 33)
        (mapcar 
            ; ��������
            '(lambda (x)
                ; ��ʹ�ó�����ʱ��һ��Ҫ�������� float ����
                (/ (apply '+ x) (float (length points)))
            ) 
            ; �����б�
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
