$ip = "10.100.124.45"
$portName = "IP_$ip"

Add-Printer -Name "Lexmark MS632dwe" -DriverName "Universal Print Class Driver" -PortName $portName
