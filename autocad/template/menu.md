

[AutoCAD常用菜单](https://wenku.baidu.com/view/a363f1d133d4b14e852468eb.html)
***
- 下拉式菜单
- 快捷菜单
- 局部菜单
- 输入板菜单
- 图像菜单
- 按钮菜单
- 辅助菜单
- 屏幕菜单
*** 

# 菜单类型


1. *.mnu 模板菜单文件 文本文件
2. *.mnc
3. *.mnr
4. *.mns
5. *.mnl


# 菜单结构

1. ***MENUGROUP 定义带单组
2. ***AuXn 辅助功能菜单（系统定点设备菜单），n从1到4
3. ***IMAGE 定义图像菜单
4. ***POPn 定义下拉菜单和快捷键
5. ***BOTTONSn 设置按键功能
6. ***SCREEN 定义屏幕菜单
7. ***TOOLBAR 定义工具栏按钮功能
8. ***TABLETn 定义数字化一菜单
9. ***HELPSTRING 定义帮助信息

# 下拉菜单

ID_DIMLINE [LINE] ^C^CLINE
- ID_DIMLINE 标识符
- [LINE] 菜单项名称
- LINE 功能命令

# 菜单项语法
```mnc
;
^M
^|
\
-
^C
^D
^G
^O
^B
*^c^c命令A
->
\t
~
&
<-
+
^P
^T
^X
^Z
[]
^E
^H
```

# 子菜单的定义和调用

## 子菜单的定义

**子菜单名 [项号]

**sap 3


## 子菜单的调用


### 用一个菜单项来调用


### 执行命令时调用



# 快捷菜单

# 快捷键

# 图像菜单
