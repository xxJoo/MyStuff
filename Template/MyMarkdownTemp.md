<!-- Makedown Template -->
<!-- 模板文件 2019.4.3 -->

# 这是一级标题 $x^2+5$
## 这是二级标题
### 这是三级标题
#### 这是四级标题
##### 这是五级标题
###### 这是六级标题

# 字体

来点普通文字
来点普通文字

换行要两个

**这是加粗的文字**

__这是加粗的文字__

*这是倾斜的文字*

***这是斜体加粗的文字***

~~这是加删除线的文字~~




# 引用

>这是引用的内容
>>这是引用的内容
>>>>>>>>>>这是引用的内容

一些文字，又一些文字，文字中有一些引用。

再来些文字，现在要如下引用：[kkk]。


# 分割线


一些文字

---
三个横线

----
四个横线

***
三个星号

*****
四个星号


三个等号

===


# 图片

![blockchain](图片1.jpg "鼠标移动到图片上显示的文字")

*****

图片alt就是显示在图片下面的文字，相当于对图片内容的解释。

图片title是图片的标题，当鼠标移到图片上时显示的内容。title可加可不加

# 超链接




[超链接名](超链接地址 "超链接title")

title可加可不加

下面是一些例子

[我在ubuntu上的安装文件](../vimFile.txt "我在ubuntu上的安装文件")

[请查询百度](http://www.baidu.com "百度官网")




# 列表

## 无序列表 & CheckList

### 无序列表

- 列表内容
+ 列表内容
* 列表内容

注意：- + * 跟内容之间都要有一个空格

### CheckList
- [ ] 列表内容
+ [x] 列表内容
* [x] 列表内容


## 有序列表

1. 列表内容
2. 列表内容


注意：序号跟内容之间要有空格 数字本身没有显示作用

## 列表嵌套

上一级和下一级之间敲三个空格即可

- 一级无序列表内容
    - 二级无序列表内容
    - 二级无序列表内容

- 一级无序列表内容
    - 二级有序列表内容
    - 二级有序列表内容

1. 一级有序列表内容
   
    1. 二级无序列表内容
    2. 二级无序列表内容
   
2. 一级有序列表内容
   
    1. 二级有序列表内容
    2. 二级有序列表内容

# 表格


| 姓名 | 技能  | 排行 |
| ---- | :---: | ---: |
| 刘备 |  哭   | 大哥 |
| 关羽 |  打   | 二哥 |
| 张飞 |  骂   | 三弟 |



第二行分割表头和内容。

-有一个就行，为了对齐，多加了几个

文字默认居左

-两边加：表示文字居中

-右边加：表示文字居右

注：原生的语法两边都要用 | 包起来。此处省略

***

原生的语法示例如下


| 为了比较整齐 | 表头  | 表头 |
| ------------ | :---: | ---: |
| 内容         | 内容  | 内容 |
| 内容         | 内容  | 内容 |

# 代码

单行代码：代码之间分别用一个反引号包起来

`单行代码`

代码块：代码之间分别用三个反引号包起来，且两边的反引号单独占一行

```
代码...
    代码...
    代码...
```

`create database hero;`


```c
#include <stdio.h>

int main()
{
   /* 我的第一个 C 程序 */
   printf("Hello, World! \n");

   return 0;
}
```

# 流程图




```flow 
st=>start: 开始 
e=>end: 登录 
io1=>inputoutput: 输入用户名密码 
sub1=>subroutine: 数据库查询子类 
cond=>condition: 是否有此用户 
cond2=>condition: 密码是否正确 
op=>operation: 读入用户信息

st->io1->sub1->cond 
cond(yes,right)->cond2 
cond(no)->io1(right) 
cond2(yes,right)->op->e 
cond2(no)->io1 
```

```sequence


```




# 公式

居中的公式
$$ f(x) = {\beta}_{2}^{m} + \Sigma b_1 + 0.0123$$

${\beta}_{2}^{m}$ - 物理量一

$\Sigma b_1$ - 物理量二



公式的说明

行内的公式${\beta}_{2}^{m}$是这样的

