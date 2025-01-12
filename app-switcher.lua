
print("Loading AppLauncher")

local appLauncher = hs.loadSpoon("AppLauncher") or error("AppLauncher spoon could not be loaded.")
local mappings = {
	B = "Google Chrome",
	F = "Finder",
	S = "Safari",
	H = "Hammerspoon",
	T = "Alacritty",
	V = "Visual Studio Code",
	W = "Windows 11",
	X = "Xcode",
}
mappings["1"] = "1Password"
mappings["A"] = "Arc"
appLauncher.modifiers = HYPER
appLauncher:bindHotkeys(mappings)

print("AppLauncher loaded")
