;;; <LISPDOC>
;;; <SUBR>(LineSetDivide)</SUBR>
;;; <DESC>Divide a set of lines into n segment</DESC>
;;; <RET>divide points</RET>
;;; </LISPDOC>
; TODO �ȷ��߶β�����

(prompt "\nC_LineSetDivide.lsp\n")
(prompt "���������ȷ�\n")

(defun c:LineSetDivide (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nLine Set Divide")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------

        ; select a set of lines
        ; ѡȡԲ����ֱ�ߵļ���
        (setq set_Lines (ssget '((0 . "arc,line"))))
        ; ͳ�Ƽ���Ԫ�ظ���
        (setq set_Lenghth (sslength set_Lines))

        ; divide every line into n segments
        ; ��ȡ�ȷ���
        (setq n (getint "divide into ? segments:"))
        ; ������Ϸǿ�
        (if (/= set_Lenghth nil)
            (progn
                ; ��ʼ�������� i
                (setq i 0)
                ; �������� i Ϊ�ﵽ���ϳ���ʱ
                (while (< i set_Lenghth)
                    ; ��ȡ�� i ��Ԫ�ص�ͼԪ�� ���� name_i
                    (setq name_i (ssname set_Lines i))
                    ; ��Ԫ�� i ���ж����ȷ�
                    (command "divide" name_i n)
                    ; ���������� 1
                    (setq i (+ i 1))
                ); end while
            ); end progn
        ); end if
        
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



