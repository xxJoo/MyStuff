# coding=utf8

from string import Template
import fileinput


# Function: ReadFileToString
# input: [string]fileName (the name of a file)
# return: [string]text
def ReadFileToString(fileName):
    lines = []
    for line in fileinput.input(fileName):
        lines.append(line)
    text = ''.join(lines)
    return text

def PutStringToFile(text):
	pass

class MyTemplate(Template):
    delimiter = "#"
    idpattern = "[_a-z0-9]*"

def test1():
    s = '#aa is not #ab'
    t = MyTemplate(s)
    d = {
        'aa':'apple',
        'ab':'banana'
    }
    print (t.substitute(d))

# Function: test2
# input: template name 'CalTemp.tex'
# convert the file to string myText
# replace the params of ti with the value in myText
# write the myText to file 'Calculation.tex'
def test2():
    myText = ReadFileToString('CalTemp.tex')
    t = MyTemplate(myText)
    params = {}
    params['omega_0'] = 0.4
    params['mu_s'] = 1.2
    myText = t.substitute(params)

    f = open('Mycal.tex', 'w')
    f.write(myText)
    f.close

if __name__ == '__main__':
    test1()


