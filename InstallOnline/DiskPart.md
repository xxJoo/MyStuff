转载地址:http://zhanqiguang.blog.163.com/blog/static/4650796220133288331854/

# 显示磁盘配置的命令
- list disk - 显示磁盘列表。例如，list disk。 
- list partition - 显示所选磁盘上的分区列表。例如，list partition。 
- list volume - 显示卷列表。例如，list volume。 
- list vdisk - 显示虚拟磁盘列表。

使用list命令可显示摘要。要显示更多信息，请先设置焦点，然后使用detail 命令替代list命令。

# 设置焦点的命令
- diskpart - 显示diskpart 版本及当前计算机名称 
- select disk n - 焦点设置给具有指定windows nt磁盘号n的磁盘，n可以有list disk命令查看。 如果未指定磁盘号，该命令将显示当前处于焦点的磁盘。 
- select partition n - 将焦点设置给指定分区。如果未指定分区，则显示当前处于焦点的分区。 
- select volume x - 将焦点设置给指定卷。如果未指定卷，该命令将显示当前处于焦点的卷。 
- select vdisk file=x:\xxx.vhd - 焦点设置给指定的虚拟磁盘文件。

# 管理基本磁盘的命令
- active - 将当前处于焦点的分区设置为“活动的”。此设置通知固件此分区是有效系统分区。 
- assign [[letter=l]/[mount=path]] - 为当前处于焦点的分区分配驱动器号或装入点。如果未指定驱动器号，则分配下一个可用驱动器号。 
- create partition primary [size=n] [offset=n] [id=byte/guid] - 在当前驱动器上以一定长度大小和起始地址偏移量创建一个主分区。 如果在mbr磁盘上未指定id字节，此命令将使用类型“0x6”创建分区。可以使用id参数指定分区类型。 如果未在gpt磁盘上指定id guid，此命令将创建msdata分区。可以使用id参数指定任何 guid。 
- create partition extended [size=n] [offset=n] - 在当前驱动器上以一定长度大小和起始地址偏移量创建一个扩展分区。驱动器必须是 mbr 磁盘。 
- create partition logical [size=n] [offset=n] - 在当前磁盘的现有扩展分区中以一定长度大小和起始地址偏移量创建一个逻辑驱动器。 驱动器必须是 mbr 磁盘。 
- delete partition [override] - 删除当前处于焦点的分区。diskpart 禁止删除当前系统、启动或分页卷。 要删除 esp、msr 或已知oem分区，必须指定override参数。 
- extend [size=n] -当前处于焦点的卷扩展到未分配的连续空间。 未分配空间必须在处于焦点的分区之后（前者的扇区偏移量必须大于后者）。 
- remove [[letter=l]/[mount=path]/[all]] - 删除当前处于焦点的分区的驱动器号或装入点。如果指定all参数，则删除所有当前驱动器号和装入点。 如果未指定驱动器号或装入点，则删除驱动器号。

# 管理动态磁盘的命令
- active - 将当前处于焦点的卷设置为“活动的”。此设置通知固件此分区是有效系统分区。 
- add disk=n - 向指定磁盘上的当前处于焦点的卷添加镜像。 
- assign [[letter=l]/[mount=path]] - 为当前处于焦点的卷分配驱动器号或装入点。如果未指定驱动器号，则分配下一个可用驱动器号。 
- break disk=n [nokeep] - 断开当前处于焦点的镜像。 
- create volume simple [size=n] [disk=n] - 在指定磁盘上以一定长度大小创建一个简单卷。 
- create volume stripe [size=n] disk=n[,n[,…]] - 在指定磁盘上创建带区集卷。如果未指定大小，则创建尽可能大的带区卷。 
- create volume raid [size=n] disk=n[,n[,…]] - 在指定磁盘上创建 raid-5 集卷。每一个磁盘上均分配相当于“raid-5 卷大小”的空间量。 如果未指定大小，则创建尽可能大的 raid 5 卷。 
- delete disk [override] - 从磁盘列表中删除缺失的动态磁盘。 如果未指定 override 参数，将删除磁盘上包含的所有简单卷，并删除所有镜像丛。 
- delete partition [override] - 删除当前处于焦点的分区。禁止删除用于包含现有在线动态卷的任何分区。 要删除 esp、msr 或已知 oem 分区，需指定 override 参数。 
- delete volume - 删除当前处于焦点的卷。使用此命令后，将丢失所有数据。 
- extend disk=n [size=n] - 将当前简单卷或扩展卷扩展到指定磁盘上。如果未指定大小，此卷可占用指定磁盘上的所有空闲空间。 
- import -导入外部磁盘组中的所有磁盘。 
- online -使以前离线的磁盘或卷重新在线。 
- remove [[letter=l]/[mount=path]/[all]] - 删除当前处于焦点的卷的驱动器号或装入点。如果使用 all 参数，将删除所有当前驱动器号和装入点。 
- retain -准备将动态简单卷用作启动或系统卷

# 转换磁盘的命令
- convert mbr - 将当前磁盘的分区形式设置为 mbr。可以是基本磁盘或动态磁盘。切勿包含任何有效数据分区或卷。 
- convert gpt - 将当前磁盘的分区形式设置为 gpt。可以是基本磁盘或动态磁盘。切勿包含任何有效数据分区或卷。 
- convert dynamic - 将基本磁盘改为动态磁盘。磁盘可以包含有效数据分区。 
- convert basic - 将空的动态磁盘转换为基本磁盘。

# 其他命令
- exit - 停止 diskpart 并将控制权返回给操作系统。 
- clean [all] - 通过将扇区清零，从当前处于焦点的磁盘删除分区或将卷格式化。 默认情况下，仅改写 mbr 或 gpt 分区信息及任何有关 mbr 磁盘的隐藏扇区信息。 如果指定 all 参数，可将每个扇区都清零，同时可删除驱动器上包含的所有数据。 
- rem […] - 不执行任何操作，但您可以使用此命令注释脚本文件。 
- rescan - 重新扫描所有 i/o 总线并可因此发现添加到计算机上的任何新磁盘。 
- format - 格式化卷或分区. 
- attach - 连接虚拟磁盘文件。 
- detach - 分离虚拟磁盘文件。

# 帮助命令
- help - 显示所有命令列表。

# 命令举例
```diskpart
x:\sources> diskpart

microsoft diskpart 版本 6.1.7601 
copyright (c) 1999-2008 microsoft corporation. 
在计算机上: minwinpc 

diskpart> list disk 

磁盘 ### 状态 大小 可用 dyn gpt 
———— ——– ——— ——— —– —- 
磁盘 0 联机 40 gb 40gb 

diskpart> select disk 0 

磁盘 0 现在是所选磁盘。 

diskpart> create partition primary size=20480 

diskpart 成功创建了指定分区。 

diskpart> create partition extended 

diskpart 成功创建了指定分区。 

diskpart> create partition logical size=10240 

diskpart 成功创建了指定分区。 

diskpart> create partition logical 

diskpart 成功创建了指定分区。 

diskpart> list partition 

分区 ### 类型 大小 偏移量

分区 1 主要 20 gb 1024 kb 
分区 0 扩展的 19 gb 20 gb 
分区 2 逻辑 10 gb 20 gb 
分区 3 逻辑 9 gb 30 gb 

diskpart> list volume 

卷 ### ltr 标签 fs 类型 大小 状态 信息 
———- —- ——————— ——– —————— ——– ————- ——– 
卷 0 d grmculfrer_ udf dvd-rom 3519 mb 正常 
卷 1 raw 磁盘分区 20 gb 正常 
卷 2 raw 磁盘分区 10 gb 正常 
卷 3 raw 磁盘分区 9 gb 正常 

diskpart> select volume 1 

卷 1 是所选卷 

diskpart> assign letter=c 

diskpart 成功分配了驱动器号或者装载点。 

diskpart> select volume 2 

卷 2 是所选卷 

diskpart> assign letter=e 

diskpart 成功分配了驱动器号或者装载点。 

diskpart> select volume 3 

卷 3 是所选卷 

diskpart> assign letter=f 

diskpart 成功分配了驱动器号或者装载点。

diskpart> list volume 

卷 ### ltr 标签 fs 类型 大小 状态 信息 
———- —- ——————— ——– —————— ——– ————- ——– 
卷 0 d grmculfrer_ udf dvd-rom 3519 mb 正常 
卷 1 c raw 磁盘分区 20 gb 正常 
卷 2 e raw 磁盘分区 10 gb 正常 
卷 3 f raw 磁盘分区 9 gb 正常 

diskpart> select partition 1 

分区 1 现在是所选分区。 

diskpart> format fs=ntfs lable="system" quick 

100 百分比已完成 
diskpart 成功格式化该卷。 

diskpart> select partition 2 

分区 2 现在是所选分区。 

diskpart> format fs=ntfs quick 

100 百分比已完成 
diskpart 成功格式化该卷。 

diskpart> select partition 3 

分区 3 现在是所选分区。 

diskpart> format fs=ntfs quick 

100 百分比已完成 
diskpart 成功格式化该卷。 

diskpart> list volume 

卷 ### ltr 标签 fs 类型 大小 状态 信息 
———- —- ——————— ——– —————— ——– ————- ——– 
卷 0 d grmculfrer_ udf dvd-rom 3519 mb 正常 
卷 1 c system ntfs 磁盘分区 20 gb 正常 
卷 2 e ntfs 磁盘分区 10 gb 正常 
卷 3 f ntfs 磁盘分区 9 gb 正常 

diskpart> exit 

退出 diskpart… 

x:\sources>
```