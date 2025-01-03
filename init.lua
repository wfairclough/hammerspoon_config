-- Launch or focus applications with hotkeys
-- @param app: string
local function launchOrFocus(app)
    hs.application.launchOrFocus(app)
end

hs.hotkey.bind({"cmd", "alt"}, "A", function() return launchOrFocus("Arc") end)
hs.hotkey.bind({"cmd", "alt"}, "B", function() return launchOrFocus("Chrome") end)
hs.hotkey.bind({"cmd", "alt"}, "S", function() return launchOrFocus("Safari") end)
hs.hotkey.bind({"cmd", "alt"}, "T", function() return launchOrFocus("Alacritty") end)
hs.hotkey.bind({"cmd", "alt"}, "V", function() return launchOrFocus("Visual Studio Code") end)
hs.hotkey.bind({"cmd", "alt"}, "X", function() return launchOrFocus("Xcode") end)

-- Paste clipboard contents by typing for those pesky apps that don't allow pasting
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

