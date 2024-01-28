--use framework "Foundation"

on run argv
	tell application "Messages"
		set groupName to my JoinList(argv, " ")
		set desiredChat to ""
		try
			set desiredChat to {name, handle, account} of participants of (chat groupName)
		on error myError
			log "Could not find group: " & quoted form of groupName
			error number -2763
		end try
		
		set chatNames to first item of desiredChat
		set chatNumbers to second item of desiredChat
		set chatAccounts to third item of desiredChat
		
		set itemOffset to 1
		set builtOutput to ""
		repeat (number of chatNames) times
			set builtOutput to builtOutput & (item itemOffset of chatNumbers) & " @ " & (item itemOffset of chatNames) & linefeed
			set itemOffset to itemOffset + 1
		end repeat
				
		set the clipboard to builtOutput
	end tell
end run

on JoinList(theList, theDelimiter)
	set theBackup to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theString to theList as string
	set AppleScript's text item delimiters to theBackup
	return theString
end JoinList

on NewUUID()
	--use framework "Foundation"
	return current application's NSUUID's UUID()'s UUIDString as text
end NewUUID

on NewTempfile()
	set targetFolder to ""
	tell application "System Events"
		set targetFolder to quoted form of (get POSIX path of temporary items folder & (my NewUUID()))
	end tell
	return targetFolder
end NewTempfile
