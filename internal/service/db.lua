local Skynet = require("skynet")
local Logger = require("logger")
require("skynet.manager")

local db = {}
local command = {}

function command.GET(key)
	Logger.info(db[key])
	return db[key]
end

function command.SET(key, value)
	local last = db[key]
	db[key] = value
	return last
end

Skynet.start(function()
	Skynet.dispatch("lua", function(session, address, cmd, ...)
		cmd = cmd:upper()
		if cmd == "PING" then
			assert(session == 0)
			local str = (...)
			if #str > 20 then
				str = str:sub(1,20) .. "...(" .. #str .. ")"
			end
			Logger.info(string.format("%s ping %s", Skynet.address(address), str))
			return
		end
		local f = command[cmd]
		if f then
			Skynet.ret(Skynet.pack(f(...)))
		else
			error(string.format("Unknown command %s", tostring(cmd)))
		end
    end)
    Skynet.register("SIMPLEDB")
end)
