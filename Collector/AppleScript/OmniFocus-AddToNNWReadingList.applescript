-- This script presumes that you are an OmniFocus user, 
-- and that you'd like to have a project in OmniFocus for a reading list of articles from Collector. 
-- Running this script creates a new task in an OmniFocus project called "Collector reading list"
-- with information about the current article.

-- Ideally, the name of the task will be the name of the article, but some articles don't have names
-- so if there is not name for the article, just use a default string "A CollectorArticle without a title"
to getTitleOrSomething()
	tell application "Collector"
		set myTitle to the title of the current article
		if (myTitle is "") then
			set myTitle to "A CollectorArticle without a title"
		end if
	end tell
end getTitleOrSomething


-- Here's where the script starts

-- first get the url and the title of the current article
tell application "Collector"
	set myUrl to the url of the current article
	set myTitle to my getTitleOrSomething()
end tell

tell application "OmniFocus"
	tell document 1
		
		-- Second, ensure that the front OmniFocus document has a project called  "Collector reading list"
		set names to name of every project
		if names does not contain "Collector reading list" then
			make new project with properties {name:"Collector reading list"}
		end if
		
		-- lastly, add a task in that project referring to the current article 
		-- the "Note" field of the task will contain the url for the article
		tell project "Collector reading list"
			make new task with properties {name:myTitle, note:myUrl}
		end tell
		
	end tell
end tell