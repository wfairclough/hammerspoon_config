
-- Function to copy the current URL from Chrome
local function copyChromeURL()
    -- Get the frontmost window of Chrome
    local chrome = hs.application.get("Google Chrome")
    if chrome then
        -- Use AppleScript to get the URL
        local script = [[
            tell application "Google Chrome"
                set currentURL to URL of active tab of front window
                return currentURL
            end tell
        ]]
        local success, url = hs.osascript.applescript(script)
        if success then
            -- Copy the URL to the clipboard
            hs.pasteboard.setContents(url)
            hs.alert.show("URL copied to clipboard")
        else
            hs.alert.show("Failed to get URL")
        end
    else
        hs.alert.show("Google Chrome is not running")
    end
end

-- Function to create a menu item
local function createChromeMenuItem()
    local chromeMenu = hs.menubar.new()

    if chromeMenu then
        chromeMenu:setTitle("Hammer")
        chromeMenu:setMenu({
            { title = "Copy URL", fn = copyChromeURL }
        })
    end

    return chromeMenu
end

-- Variable to store the menu item
local chromeMenuItem = nil

-- Watch for application changes
hs.application.watcher.new(function(name, event, app)
    if event == hs.application.watcher.activated then
        if name == "Google Chrome" then
            -- Create the menu item when Chrome is active
            if not chromeMenuItem then
                chromeMenuItem = createChromeMenuItem()
            end
        else
            -- Remove the menu item when Chrome is not active
            if chromeMenuItem then
                chromeMenuItem:delete()
                chromeMenuItem = nil
            end
        end
    end
end):start()
