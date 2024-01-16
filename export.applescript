on run argv
	tell application "Messages"
		set groupName to my JoinList(argv, " ")
		set desiredChat to chat
		try
			set desiredChat to {name, handle} of participants of (chat groupName)
		on error myError
			log "Could not find group: " & quoted form of groupName
			return
		end try
		
		set chatNames to first item of desiredChat
		set chatNumbers to second item of desiredChat
		
		set itemOffset to 1
		set builtOutput to ""
		repeat (number of chatNames) times
			set builtOutput to builtOutput & (item itemOffset of chatNumbers) & " Ð " & (item itemOffset of chatNames) & linefeed
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
