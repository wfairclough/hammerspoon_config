
-- Paste clipboard contents by typing for those pesky apps that don't allow pasting
hs.hotkey.bind({ "cmd", "alt" }, "V", function()
	hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

