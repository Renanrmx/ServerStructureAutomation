# Taxa de atualização em segundos
$UpdateInterval = 30

while ($true) {
    $Partitions = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

    foreach ($Partition in $Partitions) {
        $FreeSpaceGB = [math]::Round($Partition.FreeSpace / 1GB, 2)
        Write-Host "Partition $($Partition.DeviceID): Free Space $($FreeSpaceGB)GB"
    }

    Start-Sleep -Seconds $UpdateInterval
}