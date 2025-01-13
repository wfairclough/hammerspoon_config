
print("Loading AppLauncher")

local appLauncher = hs.loadSpoon("AppLauncher") or error("AppLauncher spoon could not be loaded.")
local mappings = {
	B = "Google Chrome",
	F = "Finder",
	H = "Hammerspoon",
	N = "Notion",
	L = "Linear",
	M = "Messages",
	S = "Slack",
	T = "Alacritty",
	V = "Visual Studio Code",
	W = "Windows 11",
	X = "Xcode",
	Z = "Zoom.us",
}
mappings["1"] = "1Password"
mappings["A"] = "Arc"
appLauncher.modifiers = HYPER
appLauncher:bindHotkeys(mappings)

print("AppLauncher loaded")
