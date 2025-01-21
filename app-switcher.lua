
print("Loading AppLauncher")

local appLauncher = hs.loadSpoon("AppLauncher") or error("AppLauncher spoon could not be loaded.")
local mappings = {
  A = "Arc Canary",
	-- B = "Google Chrome",
	C = "Cursor",
	D = "Dia",
	F = "Finder",
	H = "Hammerspoon",
	I = "Raycast",
	L = "Linear",
	M = "Messages",
	N = "Notion",
	P = "Windows 11",
	S = "Slack",
	T = "Alacritty",
	V = "Visual Studio Code",
	X = "Xcode",
	Z = "Zoom.us",
}
mappings["1"] = "1Password"
appLauncher.modifiers = HYPER
appLauncher:bindHotkeys(mappings)


-- HYPER + O should do a CMD + Tab equivalent
hs.hotkey.bind(HYPER, "O", function()
  hs.eventtap.keyStroke({"cmd"}, "tab")
end)

print("AppLauncher loaded")
