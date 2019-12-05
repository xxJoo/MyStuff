;;; <LISPDOC>
;;; <SUBR>(Calculation)</SUBR>
;;; <DESC>Calculate the text string result</DESC>
;;; <RET>flout</RET>
;;; </LISPDOC>

(prompt "\nC_Calculation.lsp\n")
(prompt "���㵥���ı�����ʽ\n")

(defun c:cf (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\n***���㵥���ı�����ʽ***\n")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        
        ; ȡ�������Ӧ
        (setq old_cmdecho (getvar "cmdecho"))
        (setvar "cmdecho" 0)
        
        ; ѡ�����ʽ�ӵĵ����ı�:ͼԪ�� ���������
        (setq en (entsel "ѡ�����ʽ�ӵĵ����ı�ͼԪ:\n"))

        ; ͨ��ͼԪ�� �õ�ͼԪ����(�б�)
        (setq enData (entget(car en)))

        ; 1 �ŵ�� (1 . "1+3*9")
        ; ��� �ı�
        (setq expression (cdr (assoc 1 enData)))

        ; �����ı����� ��ֵ�� result
        
        (arxload "geomcal")
        (setq result (cal expression)) 
        ; (command "cal" (strcat "result=" expression))

        ; �ѽ����ӡ������̨
        (princ "result:")
        (princ result)
        
        ; �� en ͼԪת��Ϊ vla-object
        (setq en_vlaObject (vlax-ename->vla-object (car en)))
        
        ; ������ǰ en_vlaObject ͼԪ
        (setq en_copy_vlaObject (vla-Copy en_vlaObject))

        ; en_vlaObject ƽ�� x ����
        (setq L (getdist "\n������ƽ�ƾ���"))
        (setq 
            point1 (vlax-3d-point 0 0 0)
            point2 (vlax-3d-point L 0 0)
            ; point1 (getpoint "�����һ��")
            ; point2 (getpoint "����ڶ���")
        )
        (vla-Move en_copy_vlaObject point1 point2)

        ; ������������ͼԪ en_copy_vlaObject �ı���Ϊ result
        (setq en_copy (entget (vlax-vla-object->ename en_copy_vlaObject)))
        (setq resultString (vl-princ-to-string result))
        (setq en_copy (subst (cons 1 resultString) (assoc 1 en_copy) en_copy))

        ; ��ͼֽ��(drawing)����en_copy_vlaObject
        (entmod en_copy)


        ; �ָ���ǰͼ���ļ���������Ӧ����
        (setvar "cmdecho" old_cmdecho)

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




;**********************һЩ�����õ������**********************
;(car en1);���ش���"en1"�еĵ�һ��Ԫ��
;(cadr en1);���ش���"en1"�еĵڶ���Ԫ��
;(setq en1 (entsel));"entsel"����ѡȡһ��ͼԪ�����ذ���ͼԪ���Ƽ�ѡ������Ĵ���
;(setq en1_data (entget(car en1)))
;(setq en2 (entsel))
;(setq en2_data (entget(car en2)))
;(setq en3 (entsel))
;(setq en3_data (entget(car en1)))
;
;(setq expression (assoc 40 en1_data))
;(setq newr (cons 40 400))
;(setq en1_data (subst newr expression en1_data))
;(entmod en1_data);����"en1_data"ͼԪ
;**********************һЩ�����õ������**********************



