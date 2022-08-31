param ($in_disks, $in_serverName)

$script = {
    $in_disks
    $in_serverName

    $diskArray = $in_disks | ConvertFrom-Json
    $diskArray
    $dataDisks = $diskArray.where{($_.label -ne "C")}
    $newDisks = (Get-Disk).Where{($_.IsSystem -EQ $false -and $_.PartitionStyle -eq "Raw")}
    $newDisksCount = $newDisks.Count
    $dataDisksCount = $dataDisks.Count

    # verify both arrays have the same length
    if ($newDisksCount -eq $dataDisksCount) {
        for ($i = 0; $i -lt $newDisksCount; $i++) {
            if (($newDisks[$i].size)/1024/1024 -eq $dataDisks[$i].size) {
                Write-Host "All good! Doing stuff..."
            } else {
                throw "Size did not match."
            }
        }
    }
    else {
        throw "Data disks mismatch"
    }
}

Invoke-Command -ScriptBlock $script -ArgumentList $in_disks, $in_serverName
