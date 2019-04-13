# Problem 1
# Copy-Item : 对路径“C:\Program Files (x86)\AutoCAD 2008\Fonts\Tssdeng21.shx”的访问被拒绝。

# run this script as
# Administrator !!!!!!!!!!!!!!!!!!!!!!!!!

function FindInstallPath {
	param ()

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

	# store all acadlocation property in $myvar1
	$myvar1 += $myvar2

	# translate acadlocation property to string of path
	# and add the child path \Fonts\
	$CADFontsPath = @()
	foreach($var in $myvar1){
		$CADFontsPath += $var.acadlocation + "\Fonts\"
	}

	# return string array of path
	# of all cad installed fonts folder
	return $CADFontsPath
}

# fonts files must be put in the same path of this script
# get current path and find the fonts file here
$source = $PSScriptRoot + "\*.shx"
$destination = FindInstallPath

# copy the fonts(.shx files) to cad 20xx font folder
foreach ($des in $destination)
{
	# run this script as
	# Administrator !!!!!!!!!!!!!!!!!!!!!!!!!
	# Copy-Item : 对路径“C:\Program Files (x86)\AutoCAD 2008\Fonts\Tssdeng21.shx”的访问被拒绝。
	Copy-Item -Path $source -Destination $des
}
