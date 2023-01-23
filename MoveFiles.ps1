#Yesterday Folder Name
$yesterday_date = (Get-Date).AddDays(-1).Date
$yesterday_folder_name = Get-Date $yesterday_date -Format M_d_yyyy


#Source path where all datewise folder are placed
$src_path = "C:\MoveScript"

#Yesterday folder path where all files are placed including Excel file
$excel_file_path = $src_path + '\' + $yesterday_folder_name


#folder path where datewise folders are placed
$des_path = "C:\MoveScript"

#getting date modified of Exel file in variable
$Date = Get-Item $excel_file_path\*.xls | Foreach {$_.LastWriteTime}

#getting next date timestamp at 12:00 AM
$nextday = (Get-Date).AddDays(0).Date

#genrating name of next date folder (you can change is as per your requirement e.g. 20220708)
$new_folder_name = Get-Date $nextday -Format M_d_yyyy

#Moving files having date modified between date modified of Excel file and next date 12:00 AM
if ( Test-Path $des_path\$new_folder_name ) { #move file only if next date folder exsists
  get-childitem $excel_file_path *.pdf | where-object {$_.LastWriteTime -ge $date -and $_.LastWriteTime -lt $nextday} | 
    move-item -destination $des_path\$new_folder_name

    echo "success: files have been moved"

}

else {
    echo "Error: folder not found"
}


