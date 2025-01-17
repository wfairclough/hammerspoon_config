local hsutils = require("hsutils")

SCREENSHOT_DIR = os.getenv("HOME") .. "/Pictures/Screenshots/"

hs.hotkey.bind(HYPER, "3", function()
  local fileDisplay1 = SCREENSHOT_DIR .. "Screenshot_" .. os.date("%Y-%m-%d_%H.%M.%S") .. ".png"
  local fileDisplay2 = SCREENSHOT_DIR .. "Screenshot_" .. os.date("%Y-%m-%d_%H.%M.%S") .. "-2" .. ".png"
  hs.task.new("/usr/sbin/screencapture", function(exitCode, stdOut, stdErr)
    if exitCode == 0 then
      hs.pasteboard.setContents(stdOut)
      hs.alert.show("Screenshot copied to clipboard")
    else
      hs.alert.show("Failed to take screenshot")
      print(stdErr)
    end
  end, { "-u", fileDisplay1, fileDisplay2 }):start()
end)

hs.hotkey.bind(HYPER, "4", function()
  hs.task.new("/usr/sbin/screencapture", function(exitCode, stdOut, stdErr)
    if exitCode == 0 then
      hs.alert.show("Screenshot copied to clipboard")
    else
      hs.alert.show("Failed to take screenshot")
      print(stdErr)
    end
  end, { "-i", "-c" }):start()
end)


hs.hotkey.bind(HYPER, "5", function()
  local fileDisplay1 = SCREENSHOT_DIR .. "Screenshot_" .. os.date("%Y-%m-%d_%H.%M.%S") .. ".png"
  local fileDisplay2 = SCREENSHOT_DIR .. "Screenshot_" .. os.date("%Y-%m-%d_%H.%M.%S") .. "-2" .. ".png"
  hs.task.new("/usr/sbin/screencapture", function(exitCode, stdOut, stdErr)
    if exitCode == 0 then
      hs.alert.show("Screenshot copied to clipboard")
    else
      hs.alert.show("Failed to take screenshot")
      print(stdErr)
    end
  end, { "-c", "-i", "-U", fileDisplay1, fileDisplay2 }):start()
end)

hs.hotkey.bind(HYPER, "6", function()
  hs.task.new("/usr/sbin/screencapture", function(exitCode, stdOut, stdErr)
    if exitCode == 0 then
      hs.alert.show("Screen recording done")
      hs.timer.doAfter(1, function()
        local screenCapFile = hsutils.getNewestFile(SCREENSHOT_DIR, "mov")

        if not screenCapFile then
          hs.alert.show("Failed to find screen recording file")
          return
        end
        local file = SCREENSHOT_DIR .. "/" .. screenCapFile
        local output = file:sub(1, -5) .. ".webm"
        hsutils.convertMovToWebm(file, output)
        -- delete the mov file
        hs.fs.delete(screenCapFile)
      end)

    else
      hs.alert.show("Failed to take screenshot")
      print(stdErr)
    end
  end, { "-v", "-k", "-i", "-U", "-D1", "file" }):start()
end)

