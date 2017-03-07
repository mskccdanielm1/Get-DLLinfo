Param (
	
    [String]
    $DLLPath="C:\Windows\Microsoft.Net\",

	[String]
    $Filter="System.directoryservices.dll"

)

if ($PSVersionTable.PSVersion.Major -lt 3) {
$lookup = (Get-ChildItem $DLLPath -Filter $Filter -Recurse | Select-Object -ExpandProperty versioninfo)
}
else {
$lookup = ((Get-ChildItem $DLLPath -Filter $Filter -Recurse).versioninfo)
}

foreach ($file in $lookup) {
$version = $file | Select-Object -ExpandProperty productversion
$fullname = $file | Select-Object -ExpandProperty filename
Write-Host "$fullname $version" 
}