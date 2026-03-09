param(
  [string]$UserDataDir = "D:\Prj\onizuka-playwright-profile",
  [int]$Port = 9222,
  [string]$Url = "https://accounts.google.com/"
)

$chromeCandidates = @(
  (Join-Path $env:ProgramFiles "Google\Chrome\Application\chrome.exe"),
  (Join-Path ${env:ProgramFiles(x86)} "Google\Chrome\Application\chrome.exe")
) | Where-Object { $_ -and (Test-Path $_) }

if (-not $chromeCandidates) {
  throw "Google Chrome was not found in Program Files."
}

$chromePath = $chromeCandidates[0]

if (-not (Test-Path $UserDataDir)) {
  New-Item -ItemType Directory -Path $UserDataDir -Force | Out-Null
}

$arguments = @(
  "--user-data-dir=$UserDataDir",
  "--remote-debugging-port=$Port",
  "--no-first-run",
  "--no-default-browser-check",
  "--new-window",
  $Url
)

& cmd.exe /c start "" "$chromePath" $arguments
Write-Output "Launched Chrome with user-data-dir $UserDataDir on port $Port"
