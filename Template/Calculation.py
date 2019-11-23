# coding=utf8
# CalcutaionTemp/Calcutation.py

import os
path_of_this_file = os.path.abspath(os.path.dirname(__file__))

from string import Template
class MyTemplate(Template):
    delimiter = '#'
def calculation():
    '''计算逻辑'''
    a = 1
    b = 2
    c = a + b
    return locals()
def useTemplate(dic_var, full_name):
    with open(full_name, 'r', encoding='utf-8') as tex_file:
        temp_content = tex_file.read()
    # 替换模板文本
    s = MyTemplate(temp_content)
    res = s.substitute(dic_var)
    return res
def calcSheet():
    # 保存过程变量
    dic_var = calculation()
    # 计算书模板路径
    full_name = os.path.join(path_of_this_file,'CalTemp.tex')
    # 计算书
    res = useTemplate(dic_var, full_name)
    print(res)
if __name__ == '__main__':
    calcSheet()
