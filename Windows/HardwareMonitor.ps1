# Taxa de atualização em segundos
$UpdateInterval = 5

while ($true) {
    $CPU = Get-WmiObject Win32_Processor | Select-Object -ExpandProperty LoadPercentage
    $Memory = Get-WmiObject Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory
    $TotalMemory = Get-WmiObject Win32_OperatingSystem | Select-Object -ExpandProperty TotalVisibleMemorySize
    $UsedMemory = ($TotalMemory - $Memory) / 1MB

    Write-Host "Uso da CPU: $CPU%"
    Write-Host "Uso de RAM: $UsedMemory MB"

    Start-Sleep -Seconds $UpdateInterval
}