



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


# 2010

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


