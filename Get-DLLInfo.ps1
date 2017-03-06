Param (
	
    [String]
    $DLLPath="C:\Windows\Microsoft.Net\",

	[String]
    $Filter="System.directoryservices.dll"

)

if ($PSVersionTable.PSVersion.Major -lt 3) {
$lookup = (Get-ChildItem $DLLPath -Filter $Filter -Recurse | select -ExpandProperty versioninfo)
}
else {
$lookup = ((Get-ChildItem $DLLPath -Filter $Filter -Recurse).versioninfo)
}

foreach ($file in $lookup) {
$version = $file | select -ExpandProperty productversion
$fullname = $file | select -ExpandProperty filename
Write-Host "$fullname $version" 
}