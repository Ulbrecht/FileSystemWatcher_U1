# FileSystemWatcher_U1
A.  Usage of FileSystemWatcher on Powershell
  1.  Open Powershell ISE or Powershell Terminal.
  2.  Copy/Paste Code.
  3.  Execute.

  0.  To Close: Run CLOSE section code.

B.  Logic of the U1 Code
  The first part of the code which start with BUILD section that, transfer your spesific document from your private path to output path.

  In the MAIN section, it create a sample file/folder tracking program on the watcher path. In addition, it can declare action phases. 
    In the MAIN part, there is an example of REST-API job execute command with USER:PASS recognition.

  If you want to track the logs, you can use output-append commands to create and write your messages into log file. There is an example for this part in the code.

  In the PARENT section, it create the parent file tracker to save parent file in any time.

C.  Output usage
  C:\TEST_MAIN has constant TEST_PARENT.txt file.
    if you delete the file, it will transfer by code.
    if you rename the file from TEST_PARENT.txt, it will transfer by code.
    
  If you add TEST_MAIN.txt into C:\TEST_MAIN folder, it will invoke the REST-API job.
  If you rename a file to TEST_MAIN.txt, it will invoke the REST-API job.
  
  Simultaneously, TEST_PARENT.txt and TEST_MAIN.txt will log to log file. 
