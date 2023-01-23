#getting next date timestamp at 12:00 AM
$Next_date = (Get-Date).AddDays(1).Date
$FolderName = Get-Date $Next_date -Format M_d_yyyy 
$path = "C:\MoveScript" + $FolderName


if (!(Test-Path $Path))
{
New-Item -itemType Directory -Path C:\MoveScrip -Name $FolderName
}
else
{
write-host "Folder already exists"
}