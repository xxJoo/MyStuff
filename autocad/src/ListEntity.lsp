;;; <LISPDOC>
;;; <SUBR>(Bolt)</SUBR>
;;; <DESC>List Entity</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>


(prompt "\nC_ListEntity.lsp\n")
(prompt "�鿴һ��ʵ��ı�\n")


(defun c:ListEntity (/ *error* main doc)
  (vl-load-com)
  (defun main()
    (princ "\nListEntity")
    (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
    ; -------------------------------------------------------------------------
    ; main
    ; -------------------------------------------------------------------------

    ; ȡ����׽�������Ӧ
    (setq old_cmdecho (getvar "cmdecho"))
    (setq old_os (getvar "osmode"))
    (setvar "cmdecho" 0)
    (setvar "osmode" 0)

    ; ѡһ��ʵ�� myEntity
    (setq en (entsel))
    ; (<ͼԪ��: 7ff49f405f70> (1682.32 -31.5799 0.0))
    (setq myEntityName(car en))
    (setq selectPoint(cadr en))

    (setq myEntityList(entget myEntityName))
    (princ myEntityList)
    ; (setq str (type myEntityList)) ; TOO myEntityList ����
    ; (setq pt selectPoint)
    ; (entmake (list
    ;   '(0 . "TEXT")
    ;   (cons 1 str)
    ;   (cons 10 pt)
    ;   (cons 40 5)
    ; ))

    ; (entmake (list
    ;   '(0 . "MTEXT")
    ;   '(100 . "AcDbEntity")
    ;   '(100 . "AcDbMText")
    ;   '(7 . "Standard")
    ;   (cons 1 str)
    ;   (cons 10 pt)
    ; ))

    ; �ָ���ǰͼ���ļ��Ĳ�׽���ú�������Ӧ����
    (setvar "cmdecho" old_cmdecho)
    (setvar "osmode" old_os)

    ; -------------------------------------------------------------------------
    ; end of main
    ; -------------------------------------------------------------------------
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
