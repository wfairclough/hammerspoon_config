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


return M
