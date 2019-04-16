# coding=utf8

import os
import fileinput

from string import Template
from Calculation import Calculation


class MyTemplate(Template):
    delimiter = "#"
    idpattern = "[_a-z0-9]*"

# Function: ReadFileToString
# input: [string]fileName (the name of a file)
# return: [string]text
def ReadFileToString(fileName):
    lines = []
    for line in fileinput.input(fileName):
        lines.append(line)
    text = ''.join(lines)
    return text

# Function: main
# write the myText to file '__ResultCaltulationSheet.tex'
def main():

    # get current path of this script
    pathCurrent = os.path.dirname(__file__) 

    # input: template of current path 'CalTemp.tex'
    # convert the file to string myText
    myText = ReadFileToString(pathCurrent + '\\CalTemp.tex')
    
    # initiate a template from string myText
    t = MyTemplate(myText)

    # get the symbols and values from calculation
    subParams = Calculation()
    
    # replace symbols in template with value
    mySubedText = t.substitute(subParams)

    calculationSheet = open(pathCurrent + '\\__ResultCaltulationSheet.tex', 'w')
    calculationSheet.write(mySubedText)
    calculationSheet.close


if __name__ == '__main__':
    main()

