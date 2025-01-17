local M = {}

function M.prettyPrintTable(t, indent)
	indent = indent or 2
	local formatting = string.rep("  ", indent)
	if type(t) ~= "table" then
		print(formatting .. tostring(t))
		return
	end
	print(formatting .. "{")
	for k, v in pairs(t) do
		local key = type(k) == "string" and string.format("%q", k) or tostring(k)
		if type(v) == "table" then
			io.write(formatting .. "  [" .. key .. "] = ")
			M.prettyPrintTable(v, indent + 1)
		else
			local value = type(v) == "string" and string.format("%q", v) or tostring(v)
			print(formatting .. "  [" .. key .. "] = " .. value .. ",")
		end
	end
	print(formatting .. "}")
end

function M.printKeys(t)
	if type(t) ~= "table" then
		print(type(t))
		print(tostring(t))
		return
	end
	for key, code in pairs(t) do
		print(key, code)
	end
end

-- for key, code in pairs(hs.keycodes.map) do
--     print(key, code)
-- end
--
--

FFMPEG_BIN = "/opt/homebrew/bin/ffmpeg"
function M.convertMovToWebm(inputFile, outputFile)
	print("convertMovToWebm")
	local ffmpegCommand =
		string.format("%q -i %q -c:v libvpx-vp9 -b:v 1M -c:a libopus %q", FFMPEG_BIN, inputFile, outputFile)
	print(ffmpegCommand)
	local task = hs.task.new("/bin/bash", function(exitCode)
		print("ffmpeg completed with exit code", exitCode)
	end, function(task, stdOut, stdErr)
		-- print("ffmpeg stdout:", stdOut)
		print("ffmpeg stderr:", stdErr)
		return true
	end, { "-c", ffmpegCommand })

	if task then
		hs.alert.show("Task started")
		task:start()
		hs.alert.show("Webm file created")
	else
		hs.alert.show("Failed to start task")
	end
end

function M.getNewestFile(dir, ext)
	local newestFile = nil
	local newestTime = 0
	for file in hs.fs.dir(dir) do
		if file:sub(-3) == ext then
			local time = hs.fs.attributes(dir .. file).change
			if time > newestTime then
				newestTime = time
				newestFile = file
			end
		end
	end
	return newestFile
end

function M.promptToConvertMovToWebm(defaultFile)
	local files = hs.dialog.chooseFileOrFolder("Choose a file to convert", defaultFile, true, false, false, { "mov" })
	local file = files[1]
	if file then
		local output = file.sub(1, -4) .. ".webm"
		M.convertMovToWebm(file, output)
	end
end

return M
