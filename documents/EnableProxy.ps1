$reg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

$settings = Get-ItemProperty -Path $reg
$settings.ProxyEnable

Set-ItemProperty -Path $reg -Name ProxyEnable -Value 1