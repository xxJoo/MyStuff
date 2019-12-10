# coding=utf-8
'''波文件转换
将PKPM的地震波文件（xls格式）
    PKPM2010地震波数据（by Kircheis） .xls
写成3D3S波文件格式（txt格式）
    波名+方向.txt
其中主方向 m 次方程 s 竖直方向 v
name_m.txt
name_s.txt
name_v.txt
'''
import os
current_path = os.path.abspath((os.path.dirname(__file__)))
parent_path = os.path.dirname(current_path)
import sys
sys.path.append(current_path)
sys.path.append(parent_path)









# 打开地震波文件
import tkinter as tk
from tkinter import filedialog
root = tk.Tk()      # 创建一个Tkinter.Tk()实例
root.withdraw()     # 将Tkinter.Tk()实例隐藏
# file_path = filedialog.askopenfilename()
file_path = 'PKPM2010地震波数据（by Kircheis） .xls'



# 获取所有表的数组
import xlrd
with xlrd.open_workbook(file_path) as my_book:
    n = len(my_book.sheets())
    # print('sheetsAmount: %s' % n) # 105
    my_book.sheet_names() # list ['RH1TG025', 'RH1TG030' ...]
    print(my_book.sheet_names())
    name = my_book.sheet_names()[0] # RH1TG025
    sheet = my_book.sheet_by_name(name)
    # print('{ %s }有 %s 行， %s 列' % (sheet.name, sheet.nrows, sheet.ncols))
    # { RH1TG025 }有 1002 行， 6 列
    with open((name + '_m' + '.txt'), 'w') as my_file:
        s = str(sheet.cell_value(0,0))
        my_file.write(s)
        s = str(sheet.cell_value(0,1))
        my_file.write(s)


    # 对单个表执行操作

    # 获取单个表的行数

        # 打开一个txt文件

        # 在txt文件的第一行写入波时间

        # 在txt文件的第二行写入波的时间步长

        # 在txt文件的第三行开始记录波文件C列

        # 将表的A列B列写入txt文件的最后一行

        # 循环txt文件操作记录E列和F列

    # 对所有表执行此记录操作




