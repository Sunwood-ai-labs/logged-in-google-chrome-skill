param(
  [int]$Port = 9222
)

$result = Test-NetConnection -ComputerName 127.0.0.1 -Port $Port

if (-not $result.TcpTestSucceeded) {
  throw "CDP port $Port is not reachable on 127.0.0.1."
}

Write-Output "CDP port $Port is reachable."
