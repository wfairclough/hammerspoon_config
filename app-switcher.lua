print("Loading AppLauncher")

local appLauncher = hs.loadSpoon("AppLauncher") or error("AppLauncher spoon could not be loaded.")
local mappings = {
	A = "Arc Canary",
	-- B = "Google Chrome",
	C = "Claude",
	D = "/Applications/Dia.app/Contents/MacOS/Dia",
	F = "Finder",
	I = "Raycast",
	L = "Linear",
	M = "Messages",
	N = "Notion",
	P = "Proxyman",
	S = "Slack",
	-- T = "Alacritty",
	T = "WezTerm",
	V = "Visual Studio Code",
	X = "Xcode",
	Z = "Zoom.us",
}
mappings["1"] = "1Password"
appLauncher.modifiers = HYPER
appLauncher:bindHotkeys(mappings)

-- HYPER + O should do a CMD + Tab equivalent
hs.hotkey.bind(HYPER, "O", function()
	hs.eventtap.keyStroke({ "cmd" }, "tab")
end)

print("AppLauncher loaded")
