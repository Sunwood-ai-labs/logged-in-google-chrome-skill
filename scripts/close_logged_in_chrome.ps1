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
  Select-Object -ExpandProperty ProcessId -Unique

foreach ($pid in $rootPids) {
  taskkill /PID $pid /T /F | Out-Null
}

Write-Output "Closed Chrome processes using $UserDataDir"
