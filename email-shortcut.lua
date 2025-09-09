local M = {}

local logger = hs.logger.new("email-shortcut", "info")

local EMAIL_ADDRESS = "will.fairclough@thebrowser.company"

hs.hotkey.bind(HYPER, "E", function()
    logger.i("Typing email address")
    hs.eventtap.keyStrokes(EMAIL_ADDRESS)
    hs.alert.show("Email typed")
end)

return M