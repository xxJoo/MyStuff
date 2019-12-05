;;; <LISPDOC>
;;; <SUBR>(AutoCAD_init)</SUBR>
;;; <DESC>PreSettings for a new opened dwg file</DESC>
;;; <RET>Nothing</RET>
;;; </LISPDOC>
;;; 类文件参照
;;; http://help.autodesk.com/view/ACD/2016/ENU/?guid=GUID-A809CD71-4655-44E2-B674-1FE200B9FE30
(vl-load-com)
; --------------------------------------------------------------------------------

; (findfile 文件名)	返回：该文件名的路径及文件名
; (findfile "AutoCAD_Settings.dvb")

; TODO 如何加载 vb 文件
; (command "_VBALOAD"  "AutoCAD_Settings.dvb")

;; 获取 acad 对象 acadObj 
(setq acadObj (vlax-get-acad-object))
; 获取当前的设置
(setq preferences (vla-get-Preferences acadObj))
; 获取文件设置
(setq file_setting (vla-get-Files preferences))
; 获取当前支持的路径 SupportPath
(setq currSupportPath (vla-get-SupportPath file_setting))
; (alert (strcat "The current value for SupportPath is " currSupportPath))

;; TODO 获取当前路径
; (setq newSupportPath (?))
; (setq newSupportPath (vla-get-Path "AutoCAD_init.lsp"))
; (print path)


; 增加支持路径 newSupportPath
; (setq newSupportPath newSupportPath)
; 没有找到当前路径的临时替代路径
(setq newSupportPath "C:\\Tangent")
; 在文件设置 file_setting 中添加新路径 newSupportPath
(vla-put-SupportPath file_setting newSupportPath)
; 复原支持路径
(vla-put-SupportPath file_setting currSupportPath)
; 提示支持路径已经复原
; (alert (strcat "The SupportPath value is reset to " currSupportPath))






; (getvar "STARTINFOLDER")
; "E:\\Users\\dell\\Documents\\"

; (getvar "TRUSTEDPATHS")
; "C:\\Tangent\\TArchT20V3\\SYS;C:\\Tangent\\TArchT20V3\\SYS20;C:\\Tangent\\TArchT20V3\\SYS20x64;C:\\Tangent\\TArchT20V3\\Lisp"

; (getvar "ACADLSPASDOC")
; 0


(defun load_functions ()
  ; 添加path变量到搜索路径  加载其他模块

  ; FIXME 脚本文件 utf8 编码时, 中文在 cad 的命令行显示为乱码
  ; (prompt "\n***** << AutoCAD_init.lsp 加载开始>> *****\n")
  (prompt "\n***** << AutoCAD_init.lsp 加载开始>> *****\n")

  (load "Bolt.lsp")
  (load "Calculation.lsp")
  (load "GL.lsp")
  (load "Length.lsp")
  (load "LineSetDivide.lsp")
  (load "ListEntity.lsp")
  (load "MarkPoint.lsp") 
  (load "MarkTube.lsp")
  (load "OverlapRate.lsp")
  (load "Bitch_5.8.VLX")
)
(load_functions)


(defun set_parameter ()
  ; 函数说明
  ; 设置一些打开cad之后的参数
  
  ; 如果是 cad 2016 则执行以下命令
  (if (= (getvar "ACADVER") "20.1s (LMS Tech)")
    (progn
      (setvar "startmode" 0)     ; 无开始窗口 CAD2012 无此命令
      (setvar "COLORTHEME" 0)    ; 配色方案 暗 CAD2012 无此命令
      (setvar "XDWGFADECTL" 50)  ; 外部参照显示透明度
    )
    "not cad 2016"
  )

  (setvar "dimassoc" 1)      ; 标注不关联
  (setvar "shortcutmenu" 0)  ; 不适用右键
  (setvar "PICKBOX" 8)       ; 拾取框大小
  (setvar "PICKSTYLE" 0)     ; 无对象编组选择
  ; (FILETAB)                ; 显示文件选项卡
  ; (FILETABCLOSE)           ; 不显示文件选项卡
  (setvar "CURSORSIZE" 5)  ; 十字光标大小
  (setvar "XFADECTL" 70)     ; 在位编辑和注释性图示
  (setvar "SAVETIME" 30)     ; 自动保存时间
  (setvar "ISAVEBAK" 0)      ; 每次保存均创建备份 否
  (setvar "LWDEFAULT" 25)    ; 0.25 mm 线宽

  ; 点大小
  ; (getvar "PDSIZE")
  ; 相对于屏幕 负数
  ; 按绝对单位 正数
  (setvar "PDSIZE" 200) ; 点的大小为 200
  
  ; 点样式
  ; (getvar "PDMODE")
  ; --------------------
  ; 小圆点 0
  ; 空白 1
  ; 加号+ 2
  ; 叉叉x 3
  ; 点加向上一段线 4
  ; --------------------
  ; 小圆点 加圆圈
  ; --------------------
  ; 小圆点 32
  ; 空白 33
  ; 加号+ 34
  ; 叉叉x 35
  ; 点加向上一段线 36
  ; --------------------
  ; 小圆点 加正方形  
  ; --------------------
  ; 小圆点 64
  ; 空白 65
  ; 加号+ 66
  ; 叉叉x 67
  ; 点加向上一段线 68
  ; --------------------
  ; 加圆圈和正方形
  ; --------------------
  ; 小圆点 96
  ; 空白 97
  ; 加号+ 98
  ; 叉叉x 99
  ; 点加向上一段线 100
  ; --------------------
  (setvar "PDMODE" 100) ; 点的模式为 

  (setvar "OSMODE" 5375) ; 对象捕捉
  ; TODO 自动保存为2004格式
  ; TODO 电子传递设置
  ; TODO 文字样式
  ; TODO 标注样式

)
(set_parameter)



