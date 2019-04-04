
$myFontsPath = 
	"D:\MyDoc\AutoCAD\Fonts\"

# $CAD2012FontsPath = 
	# "D:\Desktop\MyFile"
# $CAD2016FontsPath = 
	# "D:\Desktop\MyFile2"

$CAD2012FontsPath = 
	"C:\Program Files\Autodesk\AutoCAD 2012 - Simplified Chinese\Fonts\"
$CAD2016FontsPath = 
	"C:\Program Files\Autodesk\AutoCAD 2016\Fonts\"

$source = $myFontsPath + "*.shx"
$destination = $CAD2012FontsPath, $CAD2016FontsPath

foreach ($des in $destination)
{
    xcopy $source $des /e
}
