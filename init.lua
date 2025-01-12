log = hs.logger.new('main', 'info')
HYPER = { "cmd", "alt", "ctrl", "shift" }
-- HYPER = { "rcmd", "ralt" }

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
require("web-mode")
require("window-mgmt")

--

