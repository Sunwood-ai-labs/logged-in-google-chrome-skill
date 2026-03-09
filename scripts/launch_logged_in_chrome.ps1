param(
  [string]$UserDataDir = "D:\Prj\onizuka-playwright-profile",
  [int]$Port = 9222,
  [string]$Url = "https://accounts.google.com/",
  [int]$LaunchTimeoutSec = 15
)

$ErrorActionPreference = "Stop"

function Get-ProfileChromeProcesses {
  param(
    [string]$ProfileDir
  )

  Get-CimInstance Win32_Process -Filter "name = 'chrome.exe'" |
    Where-Object { $_.CommandLine -like "*$ProfileDir*" }
}

function Test-CdpEndpoint {
  param(
    [int]$DebugPort
  )

  try {
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:$DebugPort/json/version" -UseBasicParsing -TimeoutSec 2
    return $response.StatusCode -eq 200
  }
  catch {
    return $false
  }
}

$chromeCandidates = @(
  (Join-Path $env:ProgramFiles "Google\Chrome\Application\chrome.exe"),
  (Join-Path ${env:ProgramFiles(x86)} "Google\Chrome\Application\chrome.exe")
) | Where-Object { $_ -and (Test-Path $_) }

if (-not $chromeCandidates) {
  throw "Google Chrome was not found in Program Files."
}

$chromePath = @($chromeCandidates)[0]

if (-not (Test-Path $UserDataDir)) {
  New-Item -ItemType Directory -Path $UserDataDir -Force | Out-Null
}

$existingProfileProcesses = Get-ProfileChromeProcesses -ProfileDir $UserDataDir
if ($existingProfileProcesses) {
  if (Test-CdpEndpoint -DebugPort $Port) {
    Write-Output "Chrome is already running with user-data-dir $UserDataDir and CDP port $Port is reachable."
    exit 0
  }

  throw "Chrome is already running with user-data-dir $UserDataDir, but the CDP endpoint on port $Port is not reachable. Close it with scripts\close_logged_in_chrome.ps1 and relaunch."
}

$arguments = @(
  "--user-data-dir=$UserDataDir",
  "--remote-debugging-port=$Port",
  "--no-first-run",
  "--no-default-browser-check",
  "--new-window",
  $Url
)

$deadline = (Get-Date).AddSeconds($LaunchTimeoutSec)
$sawProfileProcess = $false

Start-Process -FilePath $chromePath -ArgumentList $arguments | Out-Null

while ((Get-Date) -lt $deadline) {
  Start-Sleep -Milliseconds 500

  $profileProcesses = Get-ProfileChromeProcesses -ProfileDir $UserDataDir
  if ($profileProcesses) {
    $sawProfileProcess = $true
  }

  if ($sawProfileProcess -and (Test-CdpEndpoint -DebugPort $Port)) {
    Write-Output "Launched Chrome with user-data-dir $UserDataDir on port $Port"
    exit 0
  }
}

if (-not $sawProfileProcess) {
  throw "Chrome did not stay running with user-data-dir $UserDataDir. Verify that GUI launch is allowed and retry from an interactive shell if needed."
}

throw "Chrome started with user-data-dir $UserDataDir, but the CDP endpoint on port $Port did not become reachable within $LaunchTimeoutSec seconds. Run scripts\check_cdp_port.ps1, or close and relaunch the dedicated profile."
