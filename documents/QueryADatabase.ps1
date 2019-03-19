Add-Type -Path C:\app\client\swildman\product\18.0.0\client_1\ODP.NET\managed\common\Oracle.ManagedDataAccess.dll

$username = "FCS"
$password = "fcssys"
$datasource = "(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=fsfs)(PORT=aaaaa))(CONNECT_DATA = (SERVER=dedicated)(SERVICE_NAME=ggsds5)))"
$connectionString = "User Id=$username;Password=$password;Data Source=$datasource"
$query = Get-Content -Path C:\Users\swildman\RENUNCIATION.sql
$connection = New-Object Oracle.ManagedDataAccess.Client.OracleConnection("$connectionString")
$connection.open()
$command = New-Object Oracle.ManagedDataAccess.Client.OracleCommand
$command.Connection = $connection
$command.CommandText = $query
$ds = New-Object system.Data.DataSet
$da = New-Object Oracle.ManagedDataAccess.Client.OracleDataAdapter($command)
[void]$da.fill($ds)
return $ds.Tables[0] | SELECT Settle_due_date, Orduid, Invcode, Deceased, Goneaway, Dealdt, Ifname, Trstcode, Title, Unittype, Auto_Renunc, Client_Money, Renunc_Received_Date, Renunc_Received, Renunc_Received_User, Renunc_Postal_Ref, Client_Money_Reason, Mancode, Status, Proc, Source | Export-CSV "C:\test.csv" -NoTypeInformation
$connection.Close()