-- Load necessary Hammerspoon extensions
BluetoothWatcher = hs.timer.doEvery(10, function()
	-- Command to list connected Bluetooth devices
	local output, status = hs.execute("system_profiler SPBluetoothDataType")

	if status then
		-- Function to extract connected device names
		local function getConnectedDevices(input)
			local connectedDevices = {}

			-- Match the block under "Connected:" and before "Not Connected:"
			local connectedSection = input:match("Connected:(.-)Not Connected:")

			if connectedSection then
				for deviceName in connectedSection:gmatch("%s*(.-):%s*\n") do
					if deviceName ~= "" then
						table.insert(connectedDevices, deviceName)
					end
				end
			end

			return connectedDevices
		end
    local connectedDevices = getConnectedDevices(output)

		-- Print or process connected devices
		if #connectedDevices > 0 then

      -- If connectedDevices container Glove80 then switch HYPER to HYPER = { "cmd", "alt", "ctrl", "shift" }

      for i, device in ipairs(connectedDevices) do
        if device == "Glove80" then
          HYPER = { "cmd", "alt", "ctrl", "shift" }
          print("Glove80 connected")
        end
      end


			-- hs.notify
			-- 	.new({ title = "Bluetooth Devices", informativeText = table.concat(connectedDevices, "\n") })
			-- 	:send()
		else
      HYPER = { "rcmd", "ralt" }
			-- hs.notify.new({ title = "Bluetooth Devices", informativeText = "No devices connected" }):send()
		end
	else
		-- hs.notify
		-- 	.new({ title = "Bluetooth Error", informativeText = "Failed to retrieve Bluetooth information" })
		-- 	:send()
	end
end)

-- Start the watcher
-- BluetoothWatcher:start()
print("Bluetooth Watcher started")
