Get-PnpDevice -FriendlyName "*USB*" | 
Where-Object { $_.Class -eq "USB" -and $_.Status -eq "OK" } |
ForEach-Object {
    Disable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 1000
    Enable-PnpDevice -InstanceId $_.InstanceId -Confirm:$false -ErrorAction SilentlyContinue
}
