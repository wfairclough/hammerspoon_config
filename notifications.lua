-- Clear visible notification banners from the top-right of the screen

local logger = hs.logger.new("notifications", "info")

-- Clear notifications by swiping them away
local function clearNotificationBanners()
    logger.i("Clearing visible notification banners...")
    
    -- Save current mouse position
    local originalPos = hs.mouse.absolutePosition()
    local screen = hs.screen.mainScreen()
    local screenFrame = screen:frame()
    
    -- Notification positioning
    local startX = screenFrame.x + screenFrame.w - 300  -- Start swipe from middle of notification
    local startY = screenFrame.y + 50  -- First notification position
    
    -- Swipe away 2 notifications
    for i = 0, 1 do
        local y = startY + (i * 80)  -- Notifications are spaced ~80px apart
        
        -- Position mouse at start of swipe
        hs.mouse.absolutePosition({x = startX, y = y})
        hs.timer.usleep(100000)  -- Small delay
        
        -- Mouse down
        hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, {x = startX, y = y}):post()
        hs.timer.usleep(50000)
        
        -- Swipe right smoothly
        for dx = 0, 400, 20 do
            hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDragged, {x = startX + dx, y = y}):post()
            hs.timer.usleep(5000)  -- Very short delay for smooth motion
        end
        
        -- Mouse up
        hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, {x = startX + 400, y = y}):post()
        hs.timer.usleep(200000)  -- Wait for animation to complete
    end
    
    -- Restore mouse position
    hs.mouse.absolutePosition(originalPos)
    
    hs.alert.show("✓ Cleared notification banners")
    logger.i("Finished clearing notifications")
end

-- Bind to HYPER+9
hs.hotkey.bind(HYPER, "9", clearNotificationBanners)

logger.i("Notifications module loaded - use HYPER+9 to clear visible notifications")