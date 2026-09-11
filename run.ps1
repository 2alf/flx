$BASE = "https://phoenix.whfd.itunderground.dk"
$PACKAGE = "github:2alf/flx"
$EncodedPackage = [System.Uri]::EscapeDataString($PACKAGE)
$url = "$BASE/stream?package=$EncodedPackage"
$response = Invoke-WebRequest -Uri $url
$response.Content