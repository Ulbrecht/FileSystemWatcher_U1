# FileSystemWatcher_U1
Usage of FileSystemWatcher on Powershell



The first part of the code which start with BUILD section that, transfer your spesific document from your private path to output path.

In the MAIN section, it create a sample file/folder tracking program on the watcher path. In addition, it can declare action phases. 
  In the MAIN part, there is an example of REST-API job execute command with USER:PASS recognition.
  
If you want to track the logs, you can use output-append commands to create and write your messages into log file. There is an example for this part in the code.

In the PARENT section, it create the parent file tracker to save parent file in any time.

Here is the output usage;

  C:\TEST_MAIN has constant TEST_PARENT.txt file.
    if you delete the file, it will transfer by code.
    if you rename the file from TEST_PARENT.txt, it will transfer by code.
    
  If you add TEST_MAIN.txt into C:\TEST_MAIN folder, it will invoke the REST-API job.
  If you rename a file to TEST_MAIN.txt, it will invoke the REST-API job.
  
  Simultaneously, TEST_PARENT.txt and TEST_MAIN.txt will log to log file. 



Thanks,
UMUT CEYLAN
