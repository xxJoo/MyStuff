rem 删除 C 盘的空文件夹, 在下边C:\处可换成你的指定路径即可
rem 复制以下代码入记事本,另存为Clear.bat双击运行即可

@echo off
for /f "tokens=*" %%a in ('dir /b /ad /s C:\^|sort /r') do rd "%%a" /q 2>nul