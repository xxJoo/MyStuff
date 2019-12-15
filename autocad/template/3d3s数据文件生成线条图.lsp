(vl-load-com)
(defun c:3d3s (/ xty_Str_ToLstBy xty_get_dxf xty_lst_TostrBy getnewlst Readtxt xty_delspace ly_mak file jmxx_lst jdzb_lst dyxx_lst i pt1 pt2 lay)
  (defun xty_Str_ToLstBy (Str Key / i s lst)
    ;| xty_Str_ToLstBy
    ͨ�ú��� ���ַ����Ը��� Key �ֽ�ɱ�
    ������
      Str �ַ���
      Key �ָ���
    ����ֵ �ַ�����
    |;
    (while (setq i (vl-string-search Key Str))
      (setq
        s   (substr Str 1 i)
        Str (substr Str (+ 2 (if i i 0)))
        Lst (cons s Lst)
      )
    )
    (reverse (cons str Lst))
  )
  (defun xty_get_dxf (en num /)
    ;| xty_get_dxf
    ͨ�ú��� ��ȡͼԪdxf����ֵ
    ����
      en------ͼԪ��
      num-----����
    ����ֵ ����ֵ
    |;
    (cdr (assoc num (entget en)))
  )
  (defun xty_lst_TostrBy (lst Key / Str)
    ;| xty_lst_TostrBy
    ͨ�ú��� ���ַ������Ը���Key�ϲ�Ϊ�ַ���
    ������
      lst------�ַ�����
      Key------���ӷ�
    ����ֵ �ַ���
    |;
    (setq str 
      (apply 'strcat
        (mapcar '(lambda (x) (strcat x key))
          (reverse (cdr (reverse lst)))
        )
      )
    )
    (strcat str (last lst))
  )
  (defun getnewlst (lst oi / a c)
    ;| getnewlst
    ��� ����ż��
      t   ����
      nil ż��
    |;
    (setq
      a 0
      c '(lambda (x) (= (rem (setq a (1+ a)) 2) 0))
    )
    (if oi
      (vl-remove-if c lst)
      (reverse (cdr (reverse (vl-remove-if-not c lst))))
    )
  )
  (defun Readtxt (file-txt str-S str-E / fn fp mode1 mode2 lst a)
    ;| Readtxt
    (Readtxt "1.txt" "*SECTION" "*SECT-COLOR")
    |;
    (if (setq fn (findfile file-txt))
      (progn
        (setq
          fp (open fn "r")
          mode1 t
          mode2 nil
          lst '()
        )
        (while (and mode1 (setq a (read-line fp)))
          (if (or mode2 (equal a str-S))
            (setq
              lst   (cons a lst)
              mode2 t
            )
          )
          (if (equal a str-E)
            (setq
              mode1    nil
              mode2    nil
            )
          )
        )
        (close fp)
        (cdr (reverse (cdr lst)))
      )
    )
  )
  (defun xty_delspace (str /)
    ;| xty_delspace
    ɾ���ַ��������пո�
    |;
    (vl-list->string (vl-remove 32 (vl-string->list str)))
  )
  (defun ly_mak (l_l l_c l_s l_n /)
    ;| ly_mak
    ͨ�ú��� ����Ƿ����ͼ�㣬���޴���֮
    ������
      l_l------����(�ַ���)
      l_c------��ɫ(����)
      l_s------ͼ��״̬(����)
      l_n------ͼ����(�ַ���)
    |;
    (if    (= (tblobjname "LAYER" l_n) nil)
      (progn
        (entmake (list
          (cons 0 "LAYER")
          (cons 100 "AcDbSymbolTableRecord")
          (cons 100 "AcDbLayerTableRecord")
          (cons 6 l_l)
          (cons 62 l_c)
          (cons 70 l_s)
          (cons 2 l_n)
        ))
      )
    )
  )
  ; ��ȡ3d3s�ļ�
  (setq file (getfiled "ѡ��������ļ�" "e:/" "3d3s" 8))
  ; ��ȡ������Ϣ((���ͺ� . �����)��������)
  (setq jmxx_lst
    (mapcar 
      '(lambda (x)
        (mapcar 'xty_delspace (xty_Str_ToLstBy x ","))
      )
      (Readtxt file "*SECTION" "*SECT-COLOR")
    )
  )
  (setq jmxx_lst
    (vl-remove-if-not '(lambda (x) (= 16 (length x))) jmxx_lst)
  )
  (setq jmxx_lst
    (mapcar
      '(lambda (x)
        (list (atoi (car x)) (atoi (cadr x)) (cadddr x))
      )
      jmxx_lst
    )
  )
  ; ����ͼ��
  (setq i 1)
  (foreach x jmxx_lst
    (ly_mak "CONTINUOUS" i 0 (last x))
    (setq i (1+ i))
  )
  ; ��ȡ�ڵ���Ϣ(�ڵ�� x y z)
  (setq jdzb_lst 
    (mapcar 
      '(lambda (x)
        (mapcar 'atof (xty_Str_ToLstBy x ","))
      )
      (Readtxt file "*NODE" "*COORD-NODE")
    )
  )
  ; ��ȡ�ߵ�Ԫ��Ϣ(��Ԫ�� ���ͺ� ����� �ڵ�1 �ڵ�2)
  (setq dyxx_lst
    (mapcar 
      '(lambda (x)
        (mapcar 'xty_delspace (xty_Str_ToLstBy x ","))
      )
      (Readtxt file "*ELE_LINE" "*CONSTRAINT")
    )
  )
  (setq dyxx_lst
    ; (vl-remove-if-not '(lambda (x) (= 13 (length x))) dyxx_lst)
    ; cw �޸ĵ� bug
    ; 3d3s v 14.1
    (vl-remove-if-not '(lambda (x) (= 15 (length x))) dyxx_lst)
  )
  (setq dyxx_lst
    (mapcar
      '(lambda    (x)
        (list
          (atoi (car x))
          (atoi (nth 3 x))
          (atoi (nth 4 x))
          (atoi (nth 5 x))
          (atoi (nth 6 x))
        )
      )
      dyxx_lst
    )
  )
  ; ����
  (foreach x dyxx_lst
    (setq pt1 (cdr (nth (1- (nth 3 x)) jdzb_lst)))
    (setq pt2 (cdr (nth (1- (nth 4 x)) jdzb_lst)))
    (if
      (setq lay (last (car (vl-remove-if-not
        '(lambda (y) (and (= (car y) (cadr x)) (= (cadr y) (caddr x))))
        jmxx_lst
      ))))

      (setq lay lay)
      (setq lay "0")
    )
    (entmake
      (list '(0 . "line")
        (cons 8 lay)
        (cons 10 pt1)
        (cons 11 pt2)
      )
    )
  )
  (princ)
)
(defun c:fzb (/ get_dxf ss x_ssn)
  (defun x_ssn (ss / n lst)
    (repeat (setq N (sslength ss))
      (setq LST (cons (ssname SS (setq N (1- N))) LST))
    )
  )
  (defun get_dxf (en num /) (cdr (assoc num (entget en))))
  (setq ss (ssget '((0 . "line"))))
  (foreach n (x_ssn ss)
    (vlax-ldata-put
      n
      "coordinate"
      (list (get_dxf n 10) (get_dxf n 11))
    )
  )
)
(defun c:bzb (/ x_ssn get_dxf ly_mak emk_t ss lst sca pt pty ptx ptz pt10 pt11 tx ty tz ptlst ct ht)
  (defun x_ssn (ss / n lst)
    (repeat (setq N (sslength ss))
      (setq LST (cons (ssname SS (setq N (1- N))) LST))
    )
  )
  (defun get_dxf (en num /) (cdr (assoc num (entget en))))

  (defun ly_mak (l_l l_c l_s l_n /)
    ;| ly_mak
    ͨ�ú���  ����Ƿ����ͼ�㣬���޴���֮
    ������
      l_l------����(�ַ���)
      l_c------��ɫ(����)
      l_s------ͼ��״̬(����)
      l_n------ͼ����(�ַ���)
    |;
    (if (= (tblobjname "LAYER" l_n) nil)
      (progn
        (entmake
          (list
            (cons 0 "LAYER")
            (cons 100 "AcDbSymbolTableRecord")
            (cons 100 "AcDbLayerTableRecord")
            (cons 6 l_l)
            (cons 62 l_c)
            (cons 70 l_s)
            (cons 2 l_n)
          ) ;_ ����list
        ) ;_ ����entmake
      ) ;_ ����progn
    ) ;_ ����if
  ) ;_ ����defun

  (defun emk_t (layer pt1 pt2 text ang n72 n73 h /)
    ;| emk_t
      �ж���    pt1=pt2
      �����    pt2'(0 0 0)
      �ж���    n72 1
      �����    n72 0
      ���ж���  n73 2
    |;
    (entmake
      (list
        '(0 . "text")
        '(100 . "AcDbEntity")
        (cons 8 layer)
        '(100 . "AcDbText")
        (cons 10 pt1)
        (cons 1 text)
        (cons 40 h)
        '(41 . 0.75)
        '(7 . "standard")
        (cons 72 n72)
        (cons 11 pt2)
        (cons 50 ang)
        (cons 73 n73)
      ) ;_ ����list
    ) ;_ ����entmake
  ) ;_ ����defun
  (setq
    ss  (ssget)
    lst (x_ssn ss)
    ct  (* 1.0 (getreal "\n��ͼ����:"))
    ht  (* 1.0 (getreal "\n��ͼ����:"))
    sca (* ct (/ ht ct))
  )
  ; (print (entget (car lst)))
  
  (ly_mak "CONTINUOUS" 2 0 "����")
  (foreach n lst
    ; (setq pt10 (car (vlax-ldata-get n "coordinate")))
    (setq pt10 (cdr (assoc 10 (entget n))))
    ; (setq pt11 (cadr (vlax-ldata-get n "coordinate")))
    (setq pt11 (cdr (assoc 11 (entget n))))
    ; (print  pt10)
    (if (null (vl-remove-if-not '(lambda (x) (equal pt10 x 1e-6)) ptlst))
      (progn
        (setq pt (get_dxf n 10))
        (setq pty (polar pt 0 (* sca 2.00)))
        (setq ptx (polar pty (/ pi 2) (* sca 3.00)))
        (setq ptz (polar pty (/ pi -2) (* sca 3.00)))
        (setq tx (strcat "X=" (rtos (car pt10) 2 0)))
        (setq ty (strcat "Y=" (rtos (cadr pt10) 2 0)))
        (setq tz (strcat "Z=" (rtos (caddr pt10) 2 0)))
        (emk_t "����" ptx ptx tx 0 0 2 (* sca 2.50))
        (emk_t "����" pty pty ty 0 0 2 (* sca 2.50))
        (emk_t "����" ptz ptz tz 0 0 2 (* sca 2.50))
        (setq ptlst (cons pt10 ptlst))
      )
    )
    (if (null (vl-remove-if-not '(lambda (x) (equal pt11 x 1e-6)) ptlst))
      (progn
        (setq pt (get_dxf n 11))
        (setq pty (polar pt 0 (* sca 2.00)))
        (setq ptx (polar pty (/ pi 2) (* sca 3.00)))
        (setq ptz (polar pty (/ pi -2) (* sca 3.00)))
        (setq tx (strcat "X=" (rtos (car pt11) 2 0)))
        (setq ty (strcat "Y=" (rtos (cadr pt11) 2 0)))
        (setq tz (strcat "Z=" (rtos (caddr pt11) 2 0)))
        (emk_t "����" ptx ptx tx 0 0 2 (* sca 2.50))
        (emk_t "����" pty pty ty 0 0 2 (* sca 2.50))
        (emk_t "����" ptz ptz tz 0 0 2 (* sca 2.50))
        (setq ptlst (cons pt11 ptlst))
      )
    )
    (vlax-ldata-delete n "coordinate")
  )
)
(defun c:del0 (/ ss get_dxf)
  ;| del0
  ɾ��0������
  |;
  (defun get_dxf (en num /) (cdr (assoc num (entget en))))
  (setq ss (ssget '((0 . "line"))))
  (foreach n (x_ssn ss)
    (if (equal (get_dxf n 10) (get_dxf n 11) 1e-6)
      (entdel n)
    )
  )
)
(defun c:fxyc (/ ss i sn ent lx a)
  ;| fxyc
  ��������
  |;
  (setq ss (ssget))
  (command "SELECT" "ALL" "R" ss "")
  (setq ss (ssget "P"))
  (setq i 0)
  (repeat (sslength ss)
    (setq sn (ssname ss i))
    (setq ent (entget sn))
    (setq lx (cdr (assoc 60 ent)))
    (if (= lx nil)
      (progn
        (setq a (list (cons 60 1)))
        (setq ent (append ent a))
        (entmod ent)
      )
    )
    (if (/= lx nil)
      (progn
        (setq ent (subst (cons 60 1) (assoc 60 ent) ent))
        (entmod ent)
      )
    )
    (setq i (1+ i))
  )
  (princ)
)
(defun c:yc (/ ss i ent lx a)
  ;| yc
  ����
  |;
  (setq ss (ssget))
  (setq i 0)
  (repeat (sslength ss)
    (setq sn (ssname ss i))
    (setq ent (entget sn))
    (setq lx (cdr (assoc 60 ent)))
    (if (= lx nil)
      (progn
        (setq a (list (cons 60 1)))
        (setq ent (append ent a))
        (entmod ent)
      )
    )
    (if (/= lx nil)
      (progn
        (setq ent (subst (cons 60 1) (assoc 60 ent) ent))
        (entmod ent)
      )
    )
    (setq i (1+ i))
  )
  (princ)
)
(defun c:xs (/ ss i sn ent)
  ;| xs
  ȫ����ʾ
  |;
  (setq ss (ssget "x" '((60 . 1))))
  (setq i 0)
  (repeat (sslength ss)
    (setq sn (ssname ss i))
    (setq ent (entget sn))
    (setq ent (subst (cons 60 0) (assoc 60 ent) ent))
    (entmod ent)
    (setq i (1+ i))
  )
  (princ)
)
(defun bjm1 (ss / del_z ly_mak emk_t ct ht lst n i en pt1 pt2 tl len ang sca col)
  (defun del_z (pt /)
    (setq pt (reverse (cdr (reverse pt))))
  ) ;_ ����defun
  (defun ly_mak    (l_l l_c l_s l_n /)
    (if (= (tblobjname "LAYER" l_n) nil)
      (progn
        (entmake
          (list
            (cons 0 "LAYER")
            (cons 100 "AcDbSymbolTableRecord")
            (cons 100 "AcDbLayerTableRecord")
            (cons 6 l_l)
            (cons 62 l_c)
            (cons 70 l_s)
            (cons 2 l_n)
          )
        )
      )
    )
  )
  (defun emk_t (layer pt1 pt2 text ang n72 n73 h /)
    (entmake 
      (list
        '(0 . "text")
        '(100 . "AcDbEntity")
        (cons 8 layer)
        '(100 . "AcDbText")
        (cons 10 pt1)
        (cons 1 text)
        (cons 40 h)
        '(41 . 0.75)
        '(7 . "standard")
        (cons 72 n72)
        (cons 11 pt2)
        (cons 50 ang)
        (cons 73 n73)
      ) ;_ ����list
    ) ;_ ����entmake
  ) ;_ ����defun
  (setq
    ct (* 1.0 (getreal "\n��ͼ����:"))
    ht  (* 1.0 (getreal "\n��ͼ����:"))
    sca (* ct (/ ht ct))
  )
  (setq lst nil)
  (setq n (sslength ss))
  (setq i 0)
  (ly_mak "CONTINUOUS" 20 0 "����")
  (while (< i n)
    (setq en (entget (ssname ss i)))
    (setq pt1 (cdr (assoc 10 en)))
    (setq col (cdr (assoc 8 en)))
    (if (= (member pt1 lst) nil)
      (setq lst (cons pt1 lst))
    ) ;_ ����if
    (setq pt2 (cdr (assoc 11 en)))
    (if (= (member pt2 lst) nil)
      (setq lst (cons pt2 lst))
    ) ;_ ����if
    (setq len (distance pt1 pt2))
    (setq tl (rtos len))
    (if
      (and
        (or (< (car pt1) (car pt2))
          (equal (car pt1) (car pt2) 0.000001)
        ) ;_ ����or
        (or (< (cadr pt1) (cadr pt2))
          (equal (cadr pt1) (cadr pt2) 0.000001)
        ) ;_ ����or
      ) ;_ ����and
      (progn
        (setq ang (angle pt1 pt2))
        (setq PM
          (polar (POLAR (del_z pt1) ang (/ (DISTANCE (del_z pt1) (del_z pt2)) 2))
            (+ ang (/ pi 2))
            (* sca 1.)
          ) ;_ ����polar
        ) ;_ ����setq
      )                    ;��һ����progn
      (if
        (and
          (or (> (car pt1) (car pt2))
            (equal (car pt1) (car pt2) 0.000001)
          ) ;_ ����or
          (or (< (cadr pt1) (cadr pt2))
            (equal (cadr pt1) (cadr pt2) 0.000001)
          ) ;_ ����or
        ) ;_ ����and
        (progn
          (setq ang (angle pt2 pt1))
          (setq PM
            (polar
              (POLAR (del_z pt2) ang (/ (DISTANCE (del_z pt2) (del_z pt1)) 2))
              (+ ang (/ pi 2))
              (* sca 1.)
            ) ;_ ����polar
          ) ;_ ����setq
        )                ;�ڶ�����progn
        (if
          (and
            (or (> (car pt1) (car pt2))
              (equal (car pt1) (car pt2) 0.000001)
            ) ;_ ����or
            (or (> (cadr pt1) (cadr pt2))
              (equal (cadr pt1) (cadr pt2) 0.000001)
            ) ;_ ����or
          ) ;_ ����and
          (progn
            (setq ang (angle pt2 pt1))
            (setq PM
              (polar
                (POLAR (del_z pt2) ang (/ (DISTANCE (del_z pt2) (del_z pt1)) 2))
                (+ ang (/ pi 2))
                (* sca 1.)
              ) ;_ ����polar
            ) ;_ ����setq
          )                ;��������progn
          (progn
            (setq ang (angle pt1 pt2))
            (setq PM
              (polar
                (POLAR (del_z pt1) ang (/ (DISTANCE (del_z pt1) (del_z pt2)) 2))
                (+ ang (/ pi 2))
                (* sca 1.)
              ) ;_ ����polar
            ) ;_ ����setq
          )                ;��������progn
        )                ;��������if
      )                    ;�ڶ�����if
    )                    ;��һ����if
    (emk_t "����" pm pm col ang 1 0 (* sca 2.5))
    (setq i (1+ i))
  ) ;_ ����while
  (PRINC)
) ;_ ���� defun
(defun c:bjm nil(bjm1 (ssget)))
(defun bxc1 (ss / del_z ly_mak emk_t ct ht lst n i en pt1 pt2 ptm tl len ang sca)
  (defun del_z (pt /)
    (setq pt (reverse (cdr (reverse pt))))
  ) ;_ ����defun
  (defun ly_mak    (l_l l_c l_s l_n /)
    (if (= (tblobjname "LAYER" l_n) nil)
      (progn
        (entmake
          (list
            (cons 0 "LAYER")
            (cons 100 "AcDbSymbolTableRecord")
            (cons 100 "AcDbLayerTableRecord")
            (cons 6 l_l)
            (cons 62 l_c)
            (cons 70 l_s)
            (cons 2 l_n)
          )
        )
      )
    )
  )
  (defun emk_t (layer pt1 pt2 text ang n72 n73 h /)
    (entmake
      (list '(0 . "text")
        '(100 . "AcDbEntity")
        (cons 8 layer)
        '(100 . "AcDbText")
        (cons 10 pt1)
        (cons 1 text)
        (cons 40 h)
        '(41 . 0.75)
        '(7 . "standard")
        (cons 72 n72)
        (cons 11 pt2)
        (cons 50 ang)
        (cons 73 n73)
      ) ;_ ����list
    ) ;_ ����entmake
  ) ;_ ����defun
  (setq
    ct  (* 1.0 (getreal "\n��ͼ����:"))
    ht  (* 1.0 (getreal "\n��ͼ����:"))
    sca (* ct (/ ht ct))
  )
  (setq lst nil)
  (setq n (sslength ss))
  (setq i 0)
  (ly_mak "CONTINUOUS" 6 0 "�˼���")
  (while (< i n)
    (setq en (entget (ssname ss i)))
    (setq pt1 (cdr (assoc 10 en)))
    (if (= (member pt1 lst) nil)
      (setq lst (cons pt1 lst))
    ) ;_ ����if
    (setq pt2 (cdr (assoc 11 en)))
    (if (= (member pt2 lst) nil)
      (setq lst (cons pt2 lst))
    ) ;_ ����if
    (setq len (distance pt1 pt2))
    (setq tl (rtos len 2 0))
    (if
      (and
        (or (< (car pt1) (car pt2))
          (equal (car pt1) (car pt2) 0.000001)
        ) ;_ ����or
        (or (< (cadr pt1) (cadr pt2))
          (equal (cadr pt1) (cadr pt2) 0.000001)
        ) ;_ ����or
      ) ;_ ����and
      (progn
        (setq ang (angle pt1 pt2))
        (setq PM
          (polar
            (POLAR (del_z pt1) ang (/ (DISTANCE (del_z pt1) (del_z pt2)) 2))
            (+ ang (/ pi 2))
            (* sca 1.)
          ) ;_ ����polar
        ) ;_ ����setq
      )                    ;��һ����progn
      (if
        (and
          (or (> (car pt1) (car pt2))
            (equal (car pt1) (car pt2) 0.000001)
          ) ;_ ����or
          (or (< (cadr pt1) (cadr pt2))
           (  equal (cadr pt1) (cadr pt2) 0.000001)
          ) ;_ ����or
        ) ;_ ����and
        (progn
          (setq ang (angle pt2 pt1))
          (setq PM
            (polar
              (POLAR (del_z pt2) ang (/ (DISTANCE (del_z pt2) (del_z pt1)) 2) )
              (+ ang (/ pi 2))
              (* sca 1.)
            ) ;_ ����polar
          ) ;_ ����setq
        )                ;�ڶ�����progn
        (if
          (and
            (or (> (car pt1) (car pt2))
              (equal (car pt1) (car pt2) 0.000001)
            ) ;_ ����or
            (or (> (cadr pt1) (cadr pt2))
              (equal (cadr pt1) (cadr pt2) 0.000001)
            ) ;_ ����or
          ) ;_ ����and
          (progn
            (setq ang (angle pt2 pt1))
            (setq PM
              (polar
                (POLAR (del_z pt2) ang (/ (DISTANCE (del_z pt2) (del_z pt1)) 2))
                (+ ang (/ pi 2))
                (* sca 1.)
              ) ;_ ����polar
            ) ;_ ����setq
          )                ;��������progn
          (progn
            (setq ang (angle pt1 pt2))
            (setq PM
              (polar
                (POLAR (del_z pt1) ang (/ (DISTANCE (del_z pt1) (del_z pt2)) 2))
                (+ ang (/ pi 2))
                (* sca 1.)
              ) ;_ ����polar
            ) ;_ ����setq
          )                ;��������progn
        )                ;��������if
      )                    ;�ڶ�����if
    )                    ;��һ����if
    (emk_t "�˼���" pm pm tl ang 1 0 (* sca 2.5))
    (setq i (1+ i))
  ) ;_ ����while
  (PRINC)
) ;_ ���� defun
(defun c:bxc nil (bxc1 (ssget)))

