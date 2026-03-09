param(
  [string]$UserDataDir = "D:\Prj\onizuka-playwright-profile"
)

$targets = Get-CimInstance Win32_Process -Filter "name = 'chrome.exe'" |
  Where-Object { $_.CommandLine -like "*$UserDataDir*" }

if (-not $targets) {
  Write-Output "No Chrome processes matched $UserDataDir"
  exit 0
}

$rootPids = $targets |
  Where-Object { $_.CommandLine -notlike "* --type=*" } |
  Select-Object -ExpandProperty ProcessId -Unique

if (-not $rootPids) {
  $rootPids = $targets |
    Select-Object -ExpandProperty ProcessId -First 1
}

foreach ($targetPid in $rootPids) {
  taskkill /PID $targetPid /T /F *> $null
}

Write-Output "Closed Chrome processes using $UserDataDir"
