#!/user/bin/python
# -* - coding:UTF-8 -*-

# File Name: MyMaterial.py





# 导入material模块。
import material

# 创建材料。
myMaterial = myModel.Material(name='Q345')

# 定义弹性材料属性，杨氏模量为2.09E11，泊松比为0.3。
elasticProperties = (2.09E11, 0.3)
myMaterial.Elastic(table=(elasticProperties, ) )
















