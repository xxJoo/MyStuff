;;; <LISPDOC>
;;; <SUBR>(Length)</SUBR>
;;; <DESC>Calculate the Length a each curve and the sum</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>

(prompt "\nC_Length.lsp\n")
(prompt "����������Ŀ���ܳ���\n")


(defun c:Length (/ *error* main doc)
    (vl-load-com)
    (defun main()
        (princ "\nLength statistics")
        (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
        ; -----------------------------------------------------------------------------
        ; main
        ; -----------------------------------------------------------------------------
        
        ; �߶��ܺ�Ϊ 0
        (setq LengthSum 0)
        ; ѡȡһ������ ����:Բ,��Բ,ֱ��,�����,Splint,Բ��
        (setq MySet (ssget '((0 . "CIRCLE,ELLIPSE,LINE,*POLYLINE,SPLINE,ARC")))) 

        ; ���ϼ�������Ϊ 0
        (setq i 0)
        ; ѭ�����ϸ�����
        (repeat (sslength MySet) 
            ; ͨ�����ϵ� i ��Ԫ�ص����� ����ת��Ϊ vla���� ��ֵ�� curve_i
            (setq curve_i (vlax-ename->vla-object (ssname MySet i)))


            ; vlax-curve-getDistAtParam ��������߿�ʼ��ָ�������ĳ���
            ; vlax-curve-getDistAtPoint ��������߿�ʼ��ָ����ĳ���
            ; vlax-curve-getEndParam �����������ڵ���
            ; vlax-curve-getEndPoint �����������ڵ�ֵ��WCS�У�
            ; vlax-curve-getParamAtDist ����ָ�������߶˵���뷵�������Ͻڵ����

            ; ������߿�ʼ��ָ�������ĳ��� length_i
            ; ָ������Ϊ: �����������ڵ���
            (setq length_i (vlax-curve-getDistAtParam curve_i (vlax-curve-getEndParam curve_i))) 

            ; �� length_i ��ӵ��ܳ��� LengthSum
            (setq LengthSum (+ LengthSum length_i))

            ; ��� length_i ��: ��� ����
            (princ (strcat
                "\nCurve Number: " (itoa i) "    "
                "Length: "(rtos length_i 2 3))
            )

            ; ����������
            (setq i (1+ i))
        )

        ; �����������Ŀ
        ; ����ܳ���
        (princ (strcat
            "\nNumber of curves: " (itoa (sslength MySet))
            "\nLengthSum: "(rtos LengthSum 2 3))
        )

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












