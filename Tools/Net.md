
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

NET USER ���������޸ļ�����ϵ��û��ʻ���
�ڲ������л��������ʹ��ʱ�����г���������û��ʻ���
�û��ʻ���Ϣ�洢���û��ʻ����ݿ��С�

- **username**  
	������ӡ�ɾ�����޸Ļ�鿴���û��ʻ����ơ�
	�û��ʻ�����������Ϊ 20 ���ַ���
- **password**   
	ָ��������û��ʻ����롣
	����ĳ��ȱ����� NET ACCOUNTS ����� /MINPWLEN ѡ���������õ���С������ƥ�䡣
	������ 14 ���ַ���
- **\***   
	����������ʾ����������ʾ�¼�������ʱ����������ʾ���롣
- **/DOMAIN**     
	�ڵ�ǰ������������ִ�д˲�����
- **/ADD**        
	���û��ʻ����ݿ�����û��ʻ���
- **/DELETE**      
	���û��ʻ����ݿ�ɾ���û��ʻ���


## options

- **/ACTIVE:{YES | NO}**   
	�����ȡ�������ʻ���������ʻ����ڲ��״̬��
	���û����޷����ʸ÷�������Ĭ������Ϊ��YES����
- **/COMMENT:"text"**            
	�ṩ�й��û��ʻ���������ע�͡����ı���������������
- **/COUNTRYCODE:nnn**           
	ʹ�ò���ϵͳ����/��������ִ��ָ���������ļ���
    ����ʾ�û������ʹ�����Ϣ��
	ֵ 0 ��ʾĬ�ϵĹ���/�������롣
- **/EXPIRES:{date | NEVER}**    
	������������ڣ��ɵ����ʻ����ڡ�
    NEVER ���ʻ�����Ϊ��ʱ�����ơ�
    ��ֹ���ڵĸ�ʽΪ��/��/�ꡣ
    �·ݿ�����һ�����֣�ȫ����ĸƴд��
    ��ʹ��������ĸ����д���������һ����λ����
    ����λ���֡�ʹ��б��(/)(�����ո�)
    �����ڵĸ������ָ�����
- **/FULLNAME:"name"**           
	�û���ȫ��(�������û���)������������������������
- **/HOMEDIR:pathname**          
	Ϊ�û���Ŀ¼����·����·��������ڡ�
- **/PASSWORDCHG:{YES | NO}**    
	ָ���û��Ƿ���Ը��������롣Ĭ������Ϊ��YES����
- **PASSWORDREQ:{YES | NO}**    
	ָ���û��ʻ��Ƿ����ӵ�����롣Ĭ������Ϊ��YES����
- **/LOGONPASSWORDCHG:{YES|NO}**   
	ָ���û��Ƿ�Ӧ���´ε�¼ʱ���������롣Ĭ������Ϊ��NO����
- **/PROFILEPATH[:path]**        
	Ϊ�û���¼�����ļ�����·����
- **/SCRIPTPATH:pathname**       
	�û���¼�ű���λ�á�
- **/TIMES:{times | ALL}**       
	��¼ʱ�䡣ʱ���ʾΪ
	����[-����][,����[-����]],ʱ��[-ʱ��][,ʱ��[-ʱ��]]��
	��������Ϊ 1 Сʱ�����ڿ���������ƴд��Ҳ��������д��
    Сʱ������ 12- �� 24-Сʱ��ǡ�����12-Сʱ��ǣ�
	��ʹ�� am��pm��a.m. ��p.m��
	ALL ��ʾ�û�����ʼ�յ�¼���հױ�ʾ�û����ܵ�¼��
	ʹ�ö��Ž����ں�ʱ�������ʹ�÷ֺŽ�������ں�ʱ�������
- __/USERCOMMENT:"text"__        
	�������Ա��ӻ�����ʻ����û�ע�͡�
- __/WORKSTATIONS:{computername[,...] | \*}__   
	�г���� 8 ̨�û��������ڵ�¼������ļ������
	��� /WORKSTATIONS û���б������б�Ϊ *��
	���û�����ͨ���κμ������¼�����硣












���벻����������Ե�Ҫ��
���
��С���볤��
���븴����
������ʷ



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
��дԱ����
ΪԱ�������û�

������
������Ա
Ϊ�����Ȩ��
# --------------------------------------------

ת�����̸�ʽ


FAT
NTFS
EXT

convert d: /fs:ntfs

# --------------------------------------------


�ļ�ɾ���̳�Ȩ��
administrator
weixiaobao

��ȡ
д��
�޸�
��ȫ


# --------------------------------------------

whoami
�ļ���ɾ���̳�Ȩ��

��ȡ
�޸�

����Ȩ��



# --------------------------------------------
hostname
ipconfig

�ļ���Ȩ�޺�ntfsȨ��

# --------------------------------------------
dfs �ػ��˿��Է�����


