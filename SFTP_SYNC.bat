@echo off
echo.
echo. 
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~ Script executed on %date% at %time% ~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo ----- Moving files to backup which are older than 120days -----
echo.
forfiles /p C:\Scripts\ /m *.* /s /d -365 /c "cmd /c move @file C:\Scripts\SFTP\"

TIMEOUT /T 5

echo.
echo ----- Deleting files from backupfolder which are older than 121days -----
echo.
forfiles /p "C:\Scripts\SFTP" /m * /c "cmd /c del /q @path" /d -400

TIMEOUT /T 5

option batch abort
option confirm off
echo.
echo ----- Sycnhronizing files from SFTP to the local -----
echo.
winscp.com /command "open sftp://<sftp_username>:<sftp_password>@<sftp_serverIP>:<sftp_port> -hostkey=""ssh key""" "synchronize local C:\Scripts /<folder_in_sftp>" "exit"
echo.
echo.
echo ~~~~~ Files Copied Successfully ~~~~~
