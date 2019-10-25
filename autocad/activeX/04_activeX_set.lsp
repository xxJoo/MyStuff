; 使用集合对象

; (vlax-map-Collection collection-object function)
; (vlax-for)
(vl-load-com)
(setq myacad(vlax-get-acad-object))
(setq mydoc(vla-get-ActiveDocument myacad))
(setq myms(vla-get-ModelSpace mydoc))

; 将某一个函数应用到集合中的每一个对象
(vlax-map-Collection myms 'vlax-dump-Object)
; 将一系列函数应用到集合中的每一个对象
(vlax-for obj myms
	(setq objectColor (vla-get-Color obj))
	(princ "Color")
	(princ objectColor)
	(princ "\n")
)

; 获取集合中的成员对象

; item 方法
; (vla-Item myms index)
(vla-Item myms 0)
; count 属性
(vla-get-Count myms)


