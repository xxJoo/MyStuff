
(prompt "zdbh �Զ����")
(prompt "zdbh ���ֹ�")


(defun c:zdbh (/ n pt)
  (setq n (getint "\n��ʼ��ţ�"))
  (while (setq pt (getpoint "\nʰȡ��:"))
    (command "text" pt 300 0 (rtos n 2 0))
    (setq n (1+ n))
  )
)


(defun c:fgg (/ en pt1 pt2 pt3 b h tt en1 en2)
  (vl-load-com)
  ; ���� fgg
  ; ֱ�߱߷��ֹ�
  (setq  
    oldcmd (getvar "cmdecho")
    oldsanp (getvar "osmode"))
  (setvar "cmdecho" 0)
  (setvar "osmode" 0)

  (setq
    b  (getreal "\n��:")
    h  (getreal "\n��:")
    tt (getreal "\n��:"))
  (while
    ; TODO ����ֱ���� entsel ���˹�����
    (and
      (setq en (car (entsel "\nʰȡ���ߣ�")))
      (= "LINE" (cdr (assoc 0 (entget en)))))
    (setq
      pt1 (vlax-curve-getStartPoint en)
      pt2 (vlax-curve-getEndPoint en)
      pt3 pt1)
    (if  (> (last pt1) (last pt2))
      (setq
        pt1  pt2
        pt2  pt3))
    (setq pt3 (list (car pt2) (cadr pt2) (last pt1)))
    (command "ucs" "w")
    (command "ucs" 3 pt1 pt2 pt3)
    (command "ucs" 3 '(0 0 0) '(0 1 0) '(0 0 1))
    (command "rectang"
       (list (* 0.5 h) (* 0.5 b))
       (list (* -0.5 h) (* -0.5 b)))
    (setq en1 (entlast))
    (command "region" en1 "")
    (setq en1 (entlast))
    (command "rectang"
       (list (- (* 0.5 h) tt) (- (* 0.5 b) tt))
       (list (+ (* -0.5 h) tt) (+ (* -0.5 b) tt)))
    (setq en2 (entlast))
    (command "region" en2 "")
    (setq en2 (entlast))
    (command "_subtract" en1 "" en2 "")
    (command "_extrude" (entlast) "" "p" en)
    (command "ucs" "w"))
  (setvar "cmdecho" oldcmd)
  (setvar "osmode" oldsanp)
)
