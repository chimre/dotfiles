$networkAdapterName = 'Wi-Fi'
$retryIntervalSecond = 30

$fileName = [System.IO.Path]::GetFileName($PSCommandPath)
$fileBody = [System.IO.Path]::GetFileNameWithoutExtension($fileName)
$logfullPath = (Join-Path $PSScriptRoot $fileBody) + '.log'

function createLogFile($aFullPath) {
  $utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
  [System.IO.File]::WriteAllText($aFullPath, "", $utf8NoBomEncoding)
}

function appendTextToLogFile($aText, $aFullPath) {
  Write-Output ($aText + "`n") | Out-File $aFullPath -Encoding UTF8 -Append -NoNewline
}

function prepare($aLogFileFullPath) {
  if ((Test-Path $aLogFileFullPath) -ne $True) {
    createLogFile $aLogFileFullPath
    appendTextToLogFile "# Restart Wifi DateTime Log" $aLogFileFullPath
  }
}

function execute($aLogFileFullPath, $aNetworkAdapterName, $aRetryIntervalSecond) {
  while ($(Test-NetConnection | rg PingSucceeded).split(':')[1].Trim() -ne 'True') {
    $currentDateTime = (Get-Date -Format "o") -replace "\.[0-9]+"
    appendTextToLogFile $currentDateTime $aLogFileFullPath
    Restart-NetAdapter -Name $aNetworkAdapterName
    Start-Sleep $aRetryIntervalSecond
  }
}

prepare $logfullPath
execute $logfullPath $networkAdapterName $retryIntervalSecond

Exit 0

