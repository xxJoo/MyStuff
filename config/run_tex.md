


- 查看TeX的版本号：`tex -v`
```shell
TeX 3.14159265 (TeX Live 2015/W32TeX)
kpathsea version 6.2.1
Copyright 2015 D.E. Knuth.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the TeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the TeX source.
Primary author of TeX: D.E. Knuth.
```
- 查看LaTeX的版本号：`latex -v`
```shell
pdfTeX 3.14159265-2.6-1.40.16 (TeX Live 2015/W32TeX)
kpathsea version 6.2.1
Copyright 2015 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
Compiled with libpng 1.6.17; using libpng 1.6.17
Compiled with zlib 1.2.8; using zlib 1.2.8
Compiled with xpdf version 3.04
```
- 查看XeLeTeX的版本号：`xelatex -v`
```shell
XeTeX 3.14159265-2.6-0.99992 (TeX Live 2015/W32TeX)
kpathsea version 6.2.1
Copyright 2015 SIL International, Jonathan Kew and Khaled Hosny.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the XeTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the XeTeX source.
Primary author of XeTeX: Jonathan Kew.
Compiled with ICU version 55.1; using 55.1
Compiled with zlib version 1.2.8; using 1.2.8
Compiled with FreeType2 version 2.5.5; using 2.5.5
Compiled with Graphite2 version 1.2.4; using 1.2.4
Compiled with HarfBuzz version 0.9.40; using 0.9.40
Compiled with libpng version 1.6.17; using 1.6.17
Compiled with poppler version 0.32.0
Compiled with fontconfig version 2.11.93; using 2.11.93
```

- 更新版本
在命令行输入：`tlmgr update --all`
```
PS D:\xxx\> tlmgr update --all
Terminating on signal SIGINT(2)
终止批处理操作吗(Y/N)? n
```
测试不可用(很久没有反应)

# 用命令行来编译.tex文件

## 用LaTeX编译
- 生成.dvi文件:
若想编译text.tex文件，
则可在命令行输入：`latex test.tex`
此时会生成几个中间文件，
其中.dvi就是TeX以前的标准输出文件。
现在已经发展为.pdf文件。
- 生成.pdf文件
在生成.dvi的基础上，
使用命令:`dvipdfmx test.dvi`
便可转化为.pdf文件

## 用XeLaTeX编译

## 用LaTeX编译


