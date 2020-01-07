# coding=utf8
# CalcutaionTemp/Calcutation.py

import os
# 引入模板文件
from string import Template
# 当前文件路径
path_of_this_file = os.path.abspath(os.path.dirname(__file__))


class MyTemplate(Template):
    '''我的模板类
    替代符号为默认为 $ 改为 #
    '''
    delimiter = '#'

def useTemplate(dic_var, full_path):
    '''返回替换目标模板参数后的内容
    目标模板    full_path
    参数        dic_var
    返回内容    res
    '''
    with open(full_path, 'r', encoding='utf-8') as tex_file:
        temp_content = tex_file.read()
    # 替换模板文本
    s = MyTemplate(temp_content)
    res = s.substitute(dic_var)
    return res



if __name__ == '__main__':
    os.system('cls')

    # 计算并保存过程变量
    from Calculation import calculation
    dic_var = calculation()
    print(dic_var)

    # 计算书模板路径
    path_of_template = os.path.join(path_of_this_file,'CalTemp.tex')
    # 计算书字符串
    res = useTemplate(dic_var, path_of_template)

    # 输出 tex 计算书
    cal_path = os.path.join(path_of_this_file, 'calculation.tex')
    with open(cal_path, 'w', encoding='utf8') as tex_file:
        tex_file.write(res)
    # os.system(f'pandoc {cal_path} --output calculation.docx')
# 将计算书转为 doc
# pandoc calculation.tex --output calculation.docx

