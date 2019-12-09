;;; <LISPDOC>
;;; <SUBR>(Bolt)</SUBR>
;;; <DESC>List Entity</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>


(prompt "\nC_ListEntity.lsp\n")
(prompt "查看一个实体的表\n")


(defun c:ListEntity (/ *error* main doc)
  (vl-load-com)
  (defun main()
    (princ "\nListEntity")
    (vla-StartUndoMark (setq doc (vla-get-ActiveDocument (vlax-get-acad-object))))
    ; -------------------------------------------------------------------------
    ; main
    ; -------------------------------------------------------------------------

    ; 取消捕捉和命令回应
    (setq old_cmdecho (getvar "cmdecho"))
    (setq old_os (getvar "osmode"))
    (setvar "cmdecho" 0)
    (setvar "osmode" 0)

    ; 选一个实体 myEntity
    (setq en (entsel))
    ; (<图元名: 7ff49f405f70> (1682.32 -31.5799 0.0))
    (setq myEntityName(car en))
    (setq selectPoint(cadr en))

    (setq myEntityList(entget myEntityName))
    (princ myEntityList)
    ; (setq str (type myEntityList)) ; TOO myEntityList 换行
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

    ; 恢复当前图形文件的捕捉设置和命令响应设置
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
