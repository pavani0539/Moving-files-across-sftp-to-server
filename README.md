# Moving-files-across-sftp-to-server
Files moves from sftp account to the server using power shell script and setting up a job to automatically detect the new incoming file and pushes it to the server.
Steps to set task shceduler:
Add winscp location to environment path variables.
C:\Program Files (x86)\WinSCP
Script Explanation:
•	Copies the files which are older than 365days from Server location to backup folder.
•	Deletes the files which are older than 400days from the backup folder.
•	Synchronizes the files under sftp Path to the server local directory.
Open Task Scheduler -> Create Task -> Provide a name -> select Whether user is logged or not
Select Triggers tab -> New -> on a schedule -> Select Daily and edit the time you want -> advanced settings -> check Repeat task every -> select how frequently you want this job to run -> for a duration of: Indefinitely -> ok
Actions Tab -> Start a Program -> Program/Script: cmd -> Add arguments: /<scripts drive location> <script name> echo %DATE% %TIME%>> output.log -> Start in: <full path of the script> -> ok
eg: Add arguments: /c SFTP_SYNC.bat echo %DATE% %TIME%>> output.log -> Start in: C:\scripts\winscp
Note: If you want to log all the output, do the above step, otherwise just browse the .bat file
Leave everything else as default and click ok, provide administrator password if there is any when prompts.
You are all set.
