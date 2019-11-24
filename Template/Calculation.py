# coding=utf8
# CalcutaionTemp/Calcutation.py



def calculation():
    '''计算逻辑'''
    a = 1
    b = 2
    c = a + b
    return locals()

if __name__ == '__main__':
    import os
    path_of_this_file = os.path.abspath(os.path.dirname(__file__))
    calculation()
