local hsutils = require("hsutils")

-- WinWin
-- local winWin = hs.loadSpoon("WinWin") or error("WinWin spoon could not be loaded.")
-- hs.hotkey.bind({ "leftctrl", "leftalt" }, "up", function()
--   print("toggleMaximize")
--   winWin:moveAndResize("maximize")
-- end)

local winHalfsAndThirds = hs.loadSpoon("WindowHalfsAndThirds")
	or error("WindowHalfsAndThirds spoon could not be loaded.")
hs.hotkey.bind({ "leftcmd", "leftalt" }, "up", function()
	print("toggleMaximize")
	local win = hs.window.focusedWindow() or error("No focused window")
	hsutils.prettyPrintTable(win:frame())
	hsutils.printKeys(win)
	winHalfsAndThirds:toggleMaximized()
end)

-- HYPER+C to recenter focused window in current screen
hs.hotkey.bind(HYPER, "-", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	local screen = win:screen()
	local max = screen:frame()
	local f = win:frame()
	f.x = max.x + (max.w - f.w) / 2
	f.y = max.y + (max.h - f.h) / 2
	win:setFrame(f)
end)
