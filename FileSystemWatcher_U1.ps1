<# // BUILD #>
$uc_frompath = "C:\TEST_PARENT\TEST_PARENT.txt"
$uc_topath = "C:\TEST_MAIN\TEST_PARENT.txt"

If ([System.IO.File]::Exists($uc_topath))
{ }

Else
{
	Copy-Item $uc_frompath $uc_topath
}





<# // MAIN #>
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "C:\TEST_MAIN"
$watcher.Filter = "TEST_MAIN.txt"
$watcher.EnableRaisingEvents = $true

$uc_mainpath = "C:\TEST_MAIN\TEST_MAIN.txt"
$uc_logpath = "C:\TEST_LOG\LOG.txt"

$action_1 =
{
	$changetype = $event.SourceEventArgs.ChangeType
	$newpath = $event.SourceEventArgs.FullPath

    Write-Host "PATH: $newpath"
	Write-Host "$changetype $(get-date)`n"

	"PATH: $newpath" | Out-File $uc_logpath -Append
	"$changetype $(get-date)`n" | Out-File $uc_logpath -Append

	Start-Job -Name UC_MAINJOB -ScriptBlock {
		$user = "ADMIN"
		$pass = "PASS"
		$pair = "$($user):$($pass)"
		$joburl = "http://USER:PASS@HOST:PORT/REPO_PATH:execution"
		
		$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
		$basicAuthValue = "Basic $encodedCreds"
		$Headers = @{Authorization = $basicAuthValue}
		
		Invoke-WebRequest -Uri $joburl -Headers $Headers
	}
	Sleep 10
	Stop-Job -Name UC_MAINJOB
}

$action_2 =
{
	$changetype = $event.SourceEventArgs.ChangeType
	$oldpath = $event.SourceEventArgs.OldFullPath
	$newpath = $event.SourceEventArgs.FullPath

	If ($uc_mainpath -eq $newpath)
	{
		Write-Host "OLDPATH: $oldpath"
		Write-Host "NEWPATH: $newpath"
        Write-Host "$changetype $(get-date)`n"

		"OLDPATH: $oldpath" | Out-File $uc_logpath -Append
		"NEWPATH: $newpath" | Out-File $uc_logpath -Append
		"$changetype $(get-date)`n" | Out-File $uc_logpath -Append

	Start-Job -Name UC_MAINJOB -ScriptBlock {
		$user = "ADMIN"
		$pass = "PASS"
		$pair = "$($user):$($pass)"
		$joburl = "http://USER:PASS@HOST:PORT/REPO_PATH:execution"
		
		$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))
		$basicAuthValue = "Basic $encodedCreds"
		$Headers = @{Authorization = $basicAuthValue}
		
		Invoke-WebRequest -Uri $joburl -Headers $Headers
	}
	Sleep 10
	Stop-Job -Name UC_MAINJOB
	}

	Else
	{
		Write-Host "OLDPATH: $oldpath"
		Write-Host "NEWPATH: $newpath"
        Write-Host "$changetype $(get-date)`n"

		"OLDPATH: $oldpath" | Out-File $uc_logpath -Append
		"NEWPATH: $newpath" | Out-File $uc_logpath -Append
		"$changetype $(get-date)`n" | Out-File $uc_logpath -Append
	}
}

$action_0 =
{
	$changetype = $event.SourceEventArgs.ChangeType
	$newpath = $event.SourceEventArgs.FullPath

	Write-Host "PATH: $newpath"
    Write-Host "$changetype $(get-date)`n"

	"PATH: $newpath" | Out-File $uc_logpath -Append
	"$changetype $(get-date)`n" | Out-File $uc_logpath -Append
}

Register-ObjectEvent $watcher 'Created' -Action $action_1
Register-ObjectEvent $watcher 'Renamed' -Action $action_2
Register-ObjectEvent $watcher 'Deleted' -Action $action_0





<# // PARENT #>
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "C:\TEST_MAIN"
$watcher.Filter = "TEST_PARENT.txt"
$watcher.EnableRaisingEvents = $true

$uc_mainpath = "C:\TEST_MAIN\TEST_MAIN.txt"
$uc_logpath = "C:\TEST_LOG\LOG.txt"
$uc_parentpath = "C:\TEST_MAIN\TEST_PARENT.txt"
$uc_frompath = "C:\TEST_PARENT\TEST_PARENT.txt"
$uc_topath = "C:\TEST_MAIN\TEST_PARENT.txt"

$actionparent_1 =
{
	$changetype = $event.SourceEventArgs.ChangeType
	$newpath = $event.SourceEventArgs.FullPath

    Write-Host "PATH: $newpath"
	Write-Host "$changetype $(get-date)`n"

	"PATH: $newpath" | Out-File $uc_logpath -Append
	"$changetype $(get-date)`n" | Out-File $uc_logpath -Append
}

$actionparent_2 =
{
	$changetype = $event.SourceEventArgs.ChangeType
	$oldpath = $event.SourceEventArgs.OldFullPath
	$newpath = $event.SourceEventArgs.FullPath

	If ($uc_parentpath -eq $newpath)  
	{
		Write-Host "OLDPATH: $oldpath"
		Write-Host "NEWPATH: $newpath"
        Write-Host "$changetype $(get-date)`n"

		"OLDPATH: $oldpath" | Out-File $uc_logpath -Append
		"NEWPATH: $newpath" | Out-File $uc_logpath -Append
		"$changetype $(get-date)`n" | Out-File $uc_logpath -Append
	}

	ElseIf ($uc_mainpath -eq $newpath)  
	{
        Copy-Item $uc_frompath $uc_topath
    }

	Else
	{
		Write-Host "OLDPATH: $oldpath"
		Write-Host "NEWPATH: $newpath"
        Write-Host "$changetype $(get-date)`n"

		"OLDPATH: $oldpath" | Out-File $uc_logpath -Append
		"NEWPATH: $newpath" | Out-File $uc_logpath -Append
		"$changetype $(get-date)`n" | Out-File $uc_logpath -Append

		Copy-Item $uc_frompath $uc_topath
	}
}

$actionparent_0 =
{
	$changetype = $event.SourceEventArgs.ChangeType
	$newpath = $event.SourceEventArgs.FullPath

    Write-Host "PATH: $newpath"
	Write-Host "$changetype $(get-date)`n"

	"PATH: $newpath" | Out-File $uc_logpath -Append
	"$changetype $(get-date)`n" | Out-File $uc_logpath -Append

	Copy-Item $uc_frompath $uc_topath
}

Register-ObjectEvent $watchertransfer 'Created' -Action $actionparent_1
Register-ObjectEvent $watchertransfer 'Renamed' -Action $actionparent_2
Register-ObjectEvent $watchertransfer 'Deleted' -Action $actionparent_0





<# // CLOSE #>
<# Get-EventSubscriber | Unregister-Event #>