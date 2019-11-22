
# NET

- ACCOUNTS
- COMPUTER
- CONFIG
- CONTINUE
- FILE
- GROUP
- HELP
- HELPMSG
- LOCALGROUP
- PAUSE
- SESSION
- SHARE
- START
- STATISTICS
- STOP
- TIME
- USE
- USER
- VIEW 


# NET USER

```
NET USER [username [password | *] [options]] [/DOMAIN]
NET USER username {password | *} /ADD [options] [/DOMAIN]
NET USER username [/DELETE] [/DOMAIN]
NET USER username [/TIMES:{times | ALL}]
```

NET USER 将创建并修改计算机上的用户帐户。
在不进行切换的情况下使用时，将列出计算机的用户帐户。
用户帐户信息存储在用户帐户数据库中。

- **username**  
	可以添加、删除、修改或查看的用户帐户名称。
	用户帐户名称最多可以为 20 个字符。
- **password**   
	指定或更改用户帐户密码。
	密码的长度必须与 NET ACCOUNTS 命令的 /MINPWLEN 选项中所设置的最小长度相匹配。
	可以是 14 个字符。
- **\***   
	生成密码提示。在密码提示下键入密码时，将不会显示密码。
- **/DOMAIN**     
	在当前域的域控制器上执行此操作。
- **/ADD**        
	向用户帐户数据库添加用户帐户。
- **/DELETE**      
	从用户帐户数据库删除用户帐户。


## options

- **/ACTIVE:{YES | NO}**   
	激活或取消激活帐户。如果该帐户处于不活动状态，
	其用户将无法访问该服务器。默认设置为“YES”。
- **/COMMENT:"text"**            
	提供有关用户帐户的描述性注释。将文本用引号括起来。
- **/COUNTRYCODE:nnn**           
	使用操作系统国家/地区代码执行指定的语言文件，
    以显示用户帮助和错误消息。
	值 0 表示默认的国家/地区代码。
- **/EXPIRES:{date | NEVER}**    
	如果设置了日期，可导致帐户过期。
    NEVER 将帐户设置为无时间限制。
    截止日期的格式为月/日/年。
    月份可以是一个数字，全部字母拼写，
    或使用三个字母的缩写。年可以是一个两位数字
    或四位数字。使用斜线(/)(不留空格)
    将日期的各个部分隔开。
- **/FULLNAME:"name"**           
	用户的全名(而不是用户名)。将该名称用引号引起来。
- **/HOMEDIR:pathname**          
	为用户主目录设置路径。路径必须存在。
- **/PASSWORDCHG:{YES | NO}**    
	指定用户是否可以更改其密码。默认设置为“YES”。
- **PASSWORDREQ:{YES | NO}**    
	指定用户帐户是否必须拥有密码。默认设置为“YES”。
- **/LOGONPASSWORDCHG:{YES|NO}**   
	指定用户是否应在下次登录时更改其密码。默认设置为“NO”。
- **/PROFILEPATH[:path]**        
	为用户登录配置文件设置路径。
- **/SCRIPTPATH:pathname**       
	用户登录脚本的位置。
- **/TIMES:{times | ALL}**       
	登录时间。时间表示为
	日期[-日期][,日期[-日期]],时间[-时间][,时间[-时间]]，
	增量限制为 1 小时。日期可以是完整拼写，也可以是缩写。
    小时可以是 12- 或 24-小时标记。对于12-小时标记，
	请使用 am、pm、a.m. 或p.m。
	ALL 表示用户可以始终登录，空白表示用户不能登录。
	使用逗号将日期和时间隔开，使用分号将多个日期和时间隔开。
- __/USERCOMMENT:"text"__        
	允许管理员添加或更改帐户的用户注释。
- __/WORKSTATIONS:{computername[,...] | \*}__   
	列出多达 8 台用户可以用于登录到网络的计算机。
	如果 /WORKSTATIONS 没有列表，或其列表为 *，
	则用户可以通过任何计算机登录到网络。












密码不满足密码策略的要求
检查
最小密码长度
密码复杂性
密码历史



# --------------------------------------------

net user zhang3 123.abc /add
net user li4 123.abc /add

net user li4 /del
net user zhang3 /del

# --------------------------------------------

net localgroup Structure /add
net localgroup Architecture /add

net localgroup Structure li4 /add
net localgroup xiaoshoubu li4 /add

net localgroup jishubu /del
net localgroup xiaoshoubu /del

net localgroup administrators zhang3 /add
net user zhang3 /active:yes

net localgroup administrators zhang3 /del


# --------------------------------------------
填写员工表单
为员工创建用户

创建组
添加组成员
为组分配权限
# --------------------------------------------

转换磁盘格式


FAT
NTFS
EXT

convert d: /fs:ntfs

# --------------------------------------------


文件删除继承权限
administrator
weixiaobao

读取
写入
修改
完全


# --------------------------------------------

whoami
文件夹删除继承权限

读取
修改

特殊权限



# --------------------------------------------
hostname
ipconfig

文件夹权限和ntfs权限

# --------------------------------------------
dfs 关机了可以访问吗


