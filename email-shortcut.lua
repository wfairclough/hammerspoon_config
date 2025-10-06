local M = {}

local logger = hs.logger.new("email-shortcut", "info")

local EMAIL_ADDRESS = "will.fairclough@thebrowser.company"

local SONG_QUESTIONS = {
	" Tell me why?",
	" Is it too late now to say sorry?",
	" Are we human, or are we dancer?",
	" What's my age again?",
	" Where is the love?",
	" Do you ever feel like a plastic bag?",
	" Who let the dogs out?",
	" Do you believe in life after love?",
	" Why'd you only call me when you're high?",
	" Why you gotta be so rude?",
	" Are you gonna be my girl?",
	" What's my name again?",
	" Is it worth it? Let me work it?",
	" Where did I go wrong?",
	" What do you mean?",
	" How many special people change?",
}

hs.hotkey.bind(HYPER, "E", function()
	logger.i("Typing email address")
	hs.eventtap.keyStrokes(EMAIL_ADDRESS)
	hs.alert.show("Email typed")
end)

hs.hotkey.bind(HYPER, "Q", function()
	local randomIndex = math.random(1, #SONG_QUESTIONS)
	local question = SONG_QUESTIONS[randomIndex]
	logger.i("Typing random question: " .. question)
	hs.eventtap.keyStrokes(question)
end)

return M
