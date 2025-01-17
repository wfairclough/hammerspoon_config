
print("Loading AppLauncher")

local appLauncher = hs.loadSpoon("AppLauncher") or error("AppLauncher spoon could not be loaded.")
local mappings = {
  A = "Arc Canary",
	-- B = "Google Chrome",
	D = "Dia",
	F = "Finder",
	H = "Hammerspoon",
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

print("AppLauncher loaded")
