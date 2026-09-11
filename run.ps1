$COMMIT = (git rev-parse HEAD).Trim()  
$BASE = "https://phoenix.whfd.itunderground.dk"
$PACKAGE = "https://github.com/2alf/flx/archive/$COMMIT.tar.gz"
$EncodedPackage = [System.Uri]::EscapeDataString($PACKAGE)
$url = "$BASE/stream?package=$EncodedPackage"
$response = Invoke-WebRequest -Uri $url
$response.Content