


; 获取一些 cad 对象 
; 形成封闭单元
; 这个可以自己用 cad 的命令实现
(prompt "选择形成封闭板的区域")
(setq cad-objects (ssget))
(setq my-sets (command "pedit" "m" cad-objects "" "Y" "J" "0" ""))

; 选择一些 cad 对象
; 筛选其中封闭的多段线
; 将其赋值给 my-closed-plines
(prompt "选择封闭板")
(setq my-closed-plines (ssget (list '(0 . "LWPOLYLINE") '(70 . 1))))
(command "move" my-closed-plines "" "0,0" "10000,0")
(sslength my-closed-plines)
(car my-closed-plines)

!my-sets




; 判断这些线能形成多少个封闭的面

; 获得这些面对象

; 对每一个面对象进行操作

; 判断面对象的相互位置关系

; 


; 获取鼠标选择图元的信息
(entget (car(entsel)))


(vlax-dump-Object cad-objects)