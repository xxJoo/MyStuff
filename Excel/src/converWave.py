# coding=utf-8
'''波文件转换
PKPM的地震波文件（xls格式）
    PKPM2010地震波数据（by Kircheis）.xls
    地震波名 seismicWaveName
    特征周期 eigenPeriod
    主方向数 principalDivection ?
    次方向数 secondaryDivection ?
    竖方向数 verticalDivection  ?
    时间步长 recordStepLength
    波总时间 time
    主方向波数据 wave_Principal
    次方向波数据 wave_Secondary
    竖方向波数据 wave_Vertical
读取PKPM的地震波文件并生成 json 文件
    地震波名.json
    其中包含 主方向 次方向 竖向 三条波
写成3D3S波文件格式（txt格式）
    波名+方向.txt
'''
import os
current_path = os.path.abspath((os.path.dirname(__file__)))
parent_path = os.path.dirname(current_path)
import sys
sys.path.append(current_path)
sys.path.append(parent_path)

# 打开地震波文件
# import tkinter as tk
# from tkinter import filedialog
# root = tk.Tk()      # 创建一个Tkinter.Tk()实例
# root.withdraw()     # 将Tkinter.Tk()实例隐藏
# file_path = filedialog.askopenfilename()

file_path = 'PKPM2010地震波数据（by Kircheis）.xls'

import xlrd
with xlrd.open_workbook(file_path) as my_book:
    n = len(my_book.sheets())
    # print('sheetsAmount: %s' % n) # 105
    
    # 获取所有表的数组
    for name in my_book.sheet_names(): # list ['RH1TG025', 'RH1TG030' ...]
        # 对单个表执行操作
        # name = my_book.sheet_names()[0] # RH1TG025
        sheet = my_book.sheet_by_name(name) # RH1TG025 sheet
        # print('{ %s }有 %s 行， %s 列' % (sheet.name, sheet.nrows, sheet.ncols))
        # { RH1TG025 }有 1002 行， 6 列
        seismicWaveName = str(sheet.cell_value(0,1))
        eigenPeriod = float(sheet.cell_value(1,1))
        principalDivection = int(sheet.cell_value(2,1))
        secondaryDivection = int(sheet.cell_value(3,1))
        verticalDivection = int(sheet.cell_value(4,1))
        recordStepLength = float(sheet.cell_value(5,1))
        time = sheet.cell_value(sheet.nrows-1, 2)
        wave_Principal = sheet.col_values(3)
        wave_Principal.pop(0)
        wave_Secondary = sheet.col_values(4)
        wave_Secondary.pop(0)
        wave_Vertical = sheet.col_values(5)
        wave_Vertical.pop(0)
        data_dict = {
            'seismicWaveName': seismicWaveName,
            'eigenPeriod': eigenPeriod,
            'principalDivection': principalDivection,
            'secondaryDivection': secondaryDivection,
            'verticalDivection': verticalDivection,
            'recordStepLength': recordStepLength,
            'time': time,
            'wave_Principal': wave_Principal,
            'wave_Secondary': wave_Secondary,
            'wave_Vertical': wave_Vertical,
        }
        # 打开一个 json 文件 并写入波数据
        with open((r'./wave/'+name+'.json'), 'w', encoding='utf8') as my_file:
            import json
            my_file.write(json.dumps(data_dict))
        # TODO 打开三个 txt 文件 并写入波数据
        # with open((r'./wave/'+name+'m'+'.txt'), 'w', encoding='utf8') as my_file:

