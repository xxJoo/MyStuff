



matlab中输入`feature('locale')`
2010 2014 和 2016输出
```m
ans = 

               ctype: 'zh_CN.GBK'
             collate: 'zh_CN.GBK'
                time: 'zh_CN.GBK'
             numeric: 'en_US_POSIX.GBK'
            monetary: 'zh_CN.GBK'
            messages: 'zh_CN.GBK'
            encoding: 'GBK'
    terminalEncoding: 'GBK'
         jvmEncoding: 'GBK'
              status: 'MathWorks locale management system initialized.'
             warning: ''
```

matlab中输入`slCharacterEncoding`
```m
ans =

GBK
```

请编辑 matlab 的 locale 数据库文件 lcdata.xml (matlab bin 目录下)

# 2016
删除
```xml
<encoding name="GBK">  
  < encoding_alias name="936">  
</encoding>
```
并将
```xml
<encoding name="UTF-8">  
    <encoding_alias name="utf8"/> 
</encoding>
```
改为
```xml
<encoding name="UTF-8">  
    <encoding_alias name="utf8"/>  
    <encoding_alias name="GBK"/>  
</encoding>
```


# 2010 (未配置成功)

```xml
<locale name="zh_CN" encoding="GB2312" xpg_name="zh_CN.GB2312">
    <alias name="zh-Hans"/>
</locale>
```
这里不做修改

需要修改的地方是：
```xml
<encoding name="GBK"/>
<encoding name="GB2312">
    <encoding_alias name="EUC-CN"/>
</encoding>
```
修改为：
```xml
<encoding name="GBK"/>
<encoding name="utf-8">
    <encoding_alias name="utf8"/>
    <encoding_alias name="GBK"/>
    <encoding_alias name="EUC-CN"/>
</encoding>
```


# Shell 中运行 matlab

命令说明 `matlab -nosplash -nodesktop -r tester`
```
-nosplash                     - Do not display the splash screen during startup.
-nodesktop                    - Do not start the MATLAB desktop. Use V5 MATLAB
                                command window for commands. The Java virtual
                                machine will be started.
-nojvm                        - Shut off all Java support by not starting the
                                Java virtual machine. In particular the MATLAB
                                desktop will not be started.
-memmgr manager               - Set MATLAB_MEM_MGR to manager.
                                manager - cache  (default)
                                    - fast   for large models or MATLAB code
                                             that uses many structure or
                                             object variables. Is not helpful
                                             for large arrays.
                                    - debug  does memory integrity checking.
                                             Useful for debugging memory
                                             problems caused by user mex
                                             files.
-check_malloc                 - same as '-memmgr debug'.
-r MATLAB_command             - Start MATLAB and execute the MATLAB_command.
                                Any "M" file must be on the MATLAB path.
-logfile log                  - Make a copy of any output to the command window
                                in file log. This includes all crash reports.
-timing                       - Print a summary of startup time to the command
                                window. It is also recorded in a timing log,
                                the name of which is printed to the MATLAB
                                command window.
-noFigureWindows              - Never display a figure window
-automation                   - Start MATLAB as an automation server,
                                minimized and without the MATLAB splash screen.
echo     -regserver           - Register MATLAB as a COM server
echo     -unregserver         - Remove MATLAB COM server registry entries.
```

shell 运行 matlab
```powershell
matlab -nodesktop -nosplash -r tester.m
# 未定义变量 "tester" 或类 "tester.m"
matlab -nodesktop -nosplash -nodisplay -nojvm -r tester
# 成功
matlab -nodesktop -nosplash -r tester
# 成功
matlab -nodesktop -nosplash -r "tester"
# 成功
```

带路径运行
```powershell
matlab -sd E:\CW2\Project\GitHub\MyStuff\matlab\ -r tester
# 成功
matlab -sd (Join-Path (pwd) matlab) -nodesktop -nosplash -r tester
# 成功
```