
-- keys bindings just for Alacritty 

local function bindTmuxKey(key, keyToPress, mods)
  mods = mods or { "alt", "shift" }
  keyToPress = keyToPress or key
  hs.hotkey.bind(mods, key, function()
    print("Alacritty: " .. key)
    local app = hs.application.frontmostApplication()
    if app:name() ~= "Alacritty" then
      print("Not in Alacritty")
      return
    end
    hs.eventtap.keyStroke({ "ctrl" }, "b")
    hs.eventtap.keyStroke({}, keyToPress)
  end)
end

bindTmuxKey("0")
bindTmuxKey("1")
bindTmuxKey("2")
bindTmuxKey("3")
bindTmuxKey("4")
bindTmuxKey("5")
bindTmuxKey("6")
bindTmuxKey("7")
bindTmuxKey("8")
bindTmuxKey("9")

