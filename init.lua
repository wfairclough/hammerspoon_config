log = hs.logger.new('main', 'info')
HYPER = { "cmd", "alt", "ctrl", "shift" }

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

hs.hotkey.bind(HYPER, "R", function()
	hs.reload()
  hs.notify.new({
    title="Hammerspoon",
    informativeText="Reloaded Config",
  }):send()
end)

-- Example handling for URL events
-- try: open -g "hammerspoon://someAlert?foo=bar" in terminal
hs.urlevent.bind("someAlert", function(eventName, params)
	hs.alert.show("Received someAlert with params: " .. hs.inspect(params))
end)


-- INIT

require("alacritty")
require("app-switcher")
require("clipboard")
require("hold-to-quit")
require("mic")
require("web-mode")
require("window-mgmt")

--

