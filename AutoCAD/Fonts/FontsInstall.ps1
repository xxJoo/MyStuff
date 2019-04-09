# Problem 1
# when copying files to the cad install path
# access denied because of the authority

# Problem 2
# how to find the install path
# but not manually

# fonts files must be put in the same path of this script
# get current path and find the fonts file here
$source = $PSScriptRoot + "\*.shx"






#region used for debugging
$CAD2012FontsPath = 
	"D:\Desktop\MyFile"
$CAD2016FontsPath = 
	"D:\Desktop\MyFile2"
#endregion

# $CAD2012FontsPath = 
# 	"C:\Program Files\Autodesk\AutoCAD 2012 - Simplified Chinese\Fonts\"
# $CAD2016FontsPath = 
# 	"C:\Program Files\Autodesk\AutoCAD 2016\Fonts\"

$destination = $CAD2012FontsPath, $CAD2016FontsPath

foreach ($des in $destination)
{
    xcopy $source $des /e
}
