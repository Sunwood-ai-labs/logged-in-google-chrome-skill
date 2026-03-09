param(
  [int]$Port = 9222
)

$ErrorActionPreference = "Stop"

try {
  $response = Invoke-WebRequest -Uri "http://127.0.0.1:$Port/json/version" -UseBasicParsing -TimeoutSec 2
}
catch {
  throw "CDP endpoint http://127.0.0.1:$Port/json/version is not reachable."
}

if ($response.StatusCode -ne 200) {
  throw "CDP endpoint on port $Port returned HTTP $($response.StatusCode)."
}

Write-Output "CDP endpoint on port $Port is reachable."
