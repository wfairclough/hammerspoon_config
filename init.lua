log = hs.logger.new("main", "info")
HYPER_1 = { "cmd", "alt", "ctrl", "shift" }
HYPER_2 = { "rcmd", "ralt" }
HYPERS = {
	HYPER_1,
	HYPER_2,
}

-- Function to read HYPER index from file
local function readHyperIndex()
	local file = io.open(os.getenv("HOME") .. "/.config/hammerspoon/hyper_idx", "r")
	if file then
		local index = tonumber(file:read("*all"))
		file:close()
		return index
	end
	return 1 -- Default to first HYPER if file doesn't exist
end

-- Function to write HYPER index to file
local function writeHyperIndex(index)
	local configDir = os.getenv("HOME") .. "/.config/hammerspoon"
	local filepath = configDir .. "/hyper_idx"

	-- Ensure config directory exists
	if not hs.fs.attributes(configDir) then
		hs.fs.mkdir(configDir)
	end

	-- Open file in write mode, creating it if it doesn't exist
	local file, err = io.open(filepath, "w")
	if not file then
		log.ef("Failed to write hyper_idx: %s", err)
		return false
	end

	-- Write index and close file
	file:write(tostring(index))
	file:close()
	return true
end

-- Initialize HYPER based on saved index
local hyperIndex = readHyperIndex()
HYPER = HYPERS[hyperIndex]

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

hs.hotkey.bind(HYPER, "0", function()
	-- Calculate next HYPER index
	local nextIndex = (hyperIndex % #HYPERS) + 1
	writeHyperIndex(nextIndex)

	local hyper_str = table.concat(HYPERS[nextIndex], "+")

	hs.reload()
	hs.notify
		.new({
			title = "Hammerspoon",
			informativeText = "Update HYPER to " .. hyper_str,
			autoWithdraw = true,
		})
		:send()
end)

hs.hotkey.bind(HYPER, "R", function()
	hs.reload()
	hs.notify
		.new({
			title = "Hammerspoon",
			informativeText = "Reloaded Config",
			autoWithdraw = true,
		})
		:send()
end)

-- Example handling for URL events
-- try: open -g "hammerspoon://someAlert?foo=bar" in terminal
hs.urlevent.bind("someAlert", function(eventName, params)
	hs.alert.show("Received someAlert with params: " .. hs.inspect(params))
end)

-- -- App Watcher
-- function Appwatch(name, event, app)
--   print("appwatch")
--   print(name)
--   print(event)
--   print(app)
--   local win = hs.window.focusedWindow()
--   if not win then
--     print("no window focused")
--     return
--   end
--
--   local lookuptable = {
--     [hs.application.watcher.activated] = "act",
--     [hs.application.watcher.deactivated] = "deact",
--     [hs.application.watcher.hidden] = "hid",
--     [hs.application.watcher.launched] = "lnchd",
--     [hs.application.watcher.launching] = "lnchng",
--     [hs.application.watcher.terminated] = "term",
--     [hs.application.watcher.unhidden] = "unhid"
--   }
--   print(i .. " event: ".. lookuptable[event] .. "; app: " .. hs.window.focusedWindow():application():title())
-- end
--
-- TheAppWatcher = hs.application.watcher.new(function(name,event, app) Appwatch(name,event,app) end)
-- TheAppWatcher:start()

-- INIT

require("alacritty")
require("app-switcher")
-- require("bluetooth")
require("chrome")
require("clipboard")
require("mic")
require("super-keys")
require("web-mode")
require("window-mgmt")
require("notifications")

--
