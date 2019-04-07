; Autolisp
; 
; 20190403

(defun c:aaa (/ *error* main doc)
	(vl-load-com)
	(defun main()
		(princ "\n������aaa������")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))

		; �������
		; �γɷ�յ�Ԫ
		; boundary ����

		; �γɶ���� ͼԪ�� �� ѡ���
		(setq ent-name (car (entsel)))
		; ��� �˶���� �ı�������
		(setq vla-data (vlax-ename->vla-object ent-name))
		; (vlax-dump-Object vla-data)
		(setq mycoor (vlax-get-property vla-data 'Coordinates))
		(setq mycoorlist (vlax-safearray->list (vlax-variant-value mycoor)))

		; (princ mycoorlist)
		; (princ mycoorlist)
		; (prin1 mycoorlist)
		; (print mycoorlist)
		; (print mycoorlist)
		; (print mycoorlist)

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

;	----------------------------------------------------------------------
; 	IAcadLWPolyline: AutoCAD Lightweight Polyline �ӿ�
;	����ֵ:
;   Application (RO) = #<VLA-OBJECT IAcadApplication 00007ff74f3c3f10>
;   Area (RO) = 6.7975e+006
;   Closed = -1
;   ConstantWidth = 0.0
;   Coordinate = ...����ʾ������������...
;   Coordinates = (49814.3 15110.4 49364.3 15110.4 49364.3 15560.4 ... )
;   Document (RO) = #<VLA-OBJECT IAcadDocument 0000023e10c05368>
;   Elevation = 0.0
;   EntityTransparency = "ByLayer"
;   Handle (RO) = "1E2E"
;   HasExtensionDictionary (RO) = 0
;   Hyperlinks (RO) = #<VLA-OBJECT IAcadHyperlinks 0000023e117a9b88>
;   Layer = "BEAM"
;   Length (RO) = 11000.0
;   Linetype = "ByLayer"
;   LinetypeGeneration = 0
;   LinetypeScale = 1.0
;   Lineweight = -1
;   Material = "ByLayer"
;   Normal = (0.0 0.0 1.0)
;   ObjectID (RO) = 42
;   ObjectName (RO) = "AcDbPolyline"
;   OwnerID (RO) = 43
;   PlotStyleName = "ByLayer"
;   Thickness = 0.0
;   TrueColor = #<VLA-OBJECT IAcadAcCmColor 0000023e117a8c20>
;   Visible = -1
;	----------------------------------------------------------------------

 


; ���õ�����
; Area
; Closed
; ConstantWidth
; Coordinate
; Coordinates
; Handle
; Lineweight
; Material
; Thickness

; �õ������ĳһ������
; ���ر�������





; �õ��������͵����Ե�ֵ
; (vlax-variant-value )

; ���������͵����Ե�ֵ(Ҳ�Ǳ���)ת��Ϊһ������
; (vlax-safearray->list )

; �ж϶�����Ƿ�պ�
; (vlax-curve-isClosed )

; (setq points-safearray )

; ��������ߵı�
; �ж��������໥λ�ù�ϵ




(defun c:bbb (/ *error* main doc)
	(vl-load-com)

	(defun (d)
		(if (and (= (vla-get-ActiveSpace d) 0) (= (vla-get-MSpace d) ':vlax-false))
			(vla-get-PaperSpace d)
			(vla-get-ModelSpace d)
		)
	)
	


	(defun main()
		(princ "\nbbb����ʼ")
		(vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))

		; ���������

		; �õ�ѡ��ͼԪ�ı� myentlist
		(setq myentlist (entget (car(entsel))))

		; �õ����е� pts
		(setq i 0)
		(setq pts nil) 
		(repeat (length myentlist) 
			(if (= (car (nth i myentlist)) 10) 
				(setq pts (append pts (list (cdr (nth i myentlist)))))
			) 
			(setq i (1+ i))
		) 
		(print pts)

		; �õ����е� pts2
		(setq pts2 nil)
		(foreach lst myentlist 
			(if (= (car lst) 10) 
				(setq pts2 (append pts2 (list (cdr lst))))
			)
		)
		(print pts2)


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

; ����ߵ�����

; ѡ�����: 
; (
; 	(-1 . <ͼԪ��: 7ff443b46b60>) 
; 	(0 . "LWPOLYLINE") 
; 	(330 . <ͼԪ��: 7ff443b039f0>) 
; 	(5 . "1E8E") 
; 	(100 . "AcDbEntity") 
; 	(67 . 0) 
; 	(410 . "Model") 
; 	(8 . "BEAM") 
; 	(100 . "AcDbPolyline") 
; 	(90 . 4) 
; 	(70 . 1) 
; 	(43 . 0.0) 
; 	(38 . 0.0) 
; 	(39 . 0.0) 
; 	(10 0.0 0.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(10 5000.0 0.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(10 5000.0 2000.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(10 0.0 2000.0) 
; 	(40 . 0.0) 
; 	(41 . 0.0) 
; 	(42 . 0.0) 
; 	(91 . 0) 
; 	(210 0.0 0.0 1.0))
; ����: *ȡ��*








