local function extractCurrentChromeUrl()
    local script = [[
    tell application "Google Chrome"
        set currentURL to URL of active tab of first window
    end tell
    return currentURL
    ]]
    local ok, currentURL = hs.applescript(script)
    if not ok then
        hs.alert.show("Failed to extract URL from Chrome")
        return
    end
    return currentURL
end

local function copyCurrentChromeUrl()
    local currentChromeUrl = extractCurrentChromeUrl()
    hs.pasteboard.setContents(currentChromeUrl)
    hs.alert.show(currentChromeUrl)
end

-- Sequential keybindings, e.g. Hyper-W,J for Jira
local webMode = hs.hotkey.modal.new(HYPER, 'w') --- enter the web mode
local webModeRunning = false;
function webMode:entered()
    local function alertAndAutoClose ()
        webModeRunning = true;
        -- hs.alert'Entered web mode\n J = Jira\n C = Confluence\n G = Github\n E = Extract URL\n T = Extract Jira Ticket number\n Esc = Exit'
        hs.alert [[
        Entered web mode
        L = Copy URL
        ]]
        hs.timer.delayed.new(3, function() if(webModeRunning) then webMode:exit() end end):start() --auto exists after 3 sec
    end
    alertAndAutoClose()
end
function webMode:exited()
    webModeRunning = false;
    hs.alert'Exited web mode'
end
webMode:bind('', 'g', function() hs.urlevent.openURLWithBundle('https://github.com/wfairclough', 'com.brave.Browser'); webMode:exit(); end)
-- webMode:bind('', 't', function() copyCurrentChromeJiraTicketNumber(); webMode:exit(); end)
webMode:bind('', 'l', function() copyCurrentChromeUrl(); webMode:exit(); end)
webMode:bind('', 'escape', function() webMode:exit() end)
