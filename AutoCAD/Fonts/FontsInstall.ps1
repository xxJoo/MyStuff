# Problem 1
# when copying files to the cad install path
# access denied because of the authority

# Problem 2
# how to find the install path
# but not manually
function FindInstallPath {
	param (
		$var1,
		$var2
	)
	# AutoCAD 2012 2016
	# R18.2 Acad-A001:804
	# R20.1 Acad-F001:804
	$myvar1 =  # System.Array
	Get-ChildItem HKLM:\SOFTWARE\Autodesk\AutoCAD -recurse -include *Acad-?001:804* |
	Get-ItemProperty -Name 'acadlocation'|
	Select-Object -Property acadlocation
	# AutoCAD 2008
	# Acad-6001:804
	$myvar2 = # System.Object
	Get-ChildItem HKLM:\SOFTWARE\Wow6432Node\Autodesk\AutoCAD -recurse -include *Acad-?001:804* |
	Get-ItemProperty -Name 'acadlocation'|
	Select-Object -Property acadlocation 

	$myvar1.Get(0).acadlocation
	# C:\Program Files\Autodesk\AutoCAD 2012 - Simplified Chinese
	$myvar1.Get(1).acadlocation
	# C:\Program Files\Autodesk\AutoCAD 2016
	$myvar2.AcadLocation
	# C:\Program Files (x86)\AutoCAD 2008
}

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
