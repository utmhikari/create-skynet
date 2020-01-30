local Skynet = require("skynet")
local Socket = require("skynet.socket")
local Sprotoloader = require("sprotoloader")
local Strings = require("strings")
local Logger = require("logger")

local WATCHDOG
local host
local send_request

local CMD = {}
local REQUEST = {}
local client_fd


function REQUEST:get()
	print("get", self.what)
	local r = Skynet.call("SIMPLEDB", "lua", "get", self.what)
	return { result = r }
end

function REQUEST:set()
	print("set", self.what, self.value)
	local r = Skynet.call("SIMPLEDB", "lua", "set", self.what, self.value)
end

function REQUEST:handshake()
	return {
		msg = "Welcome to Skynet, I will send heartbeat every 5 sec."
	}
end

function REQUEST:quit()
	Skynet.call(WATCHDOG, "lua", "close", client_fd)
end

local function request(name, args, response)
	local f = assert(REQUEST[name])
	local r = f(args)
	if response then
		return response(r)
	end
end

local function send_package(pack)
	local package = string.pack(">s2", pack)
	Socket.write(client_fd, package)
end

Skynet.register_protocol {
	name = "client",
	id = Skynet.PTYPE_CLIENT,
	unpack = function (msg, sz)
		return host:dispatch(msg, sz)
	end,
	dispatch = function (fd, _, type, ...)
		assert(fd == client_fd)	-- You can use fd to reply message
		Skynet.ignoreret()	-- session is fd, don't call Skynet.ret
		Skynet.trace()
		Logger.info("Dispatch:", Strings.tostring({
			fd = fd,
			type = type,
			others = {...}
		}))
		if type == "REQUEST" then
			local ok, result  = pcall(request, ...)
			if ok then
				if result then
					send_package(result)
				end
			else
				Logger.info(result)
			end
		else
			assert(type == "RESPONSE")
			error "This example doesn't support request client"
		end
	end
}

function CMD.start(conf)
	local fd = conf.client
	local gate = conf.gate
	WATCHDOG = conf.watchdog
	-- slot 1,2 set at main.lua
	host = Sprotoloader.load(1):host "package"
	send_request = host:attach(Sprotoloader.load(2))
	Skynet.fork(function()
		while true do
			send_package(send_request "heartbeat")
			Skynet.sleep(500)
		end
	end)

	client_fd = fd
	Skynet.call(gate, "lua", "forward", fd)
end

function CMD.disconnect()
	-- todo: do something before exit
	Skynet.exit()
end

Skynet.start(function()
	Skynet.dispatch("lua", function(_,_, command, ...)
		Skynet.trace()
		local f = CMD[command]
		Skynet.ret(Skynet.pack(f(...)))
	end)
end)
