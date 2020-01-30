local Skynet = require("skynet")
local Logger = require("logger")

Skynet.start(function()
	Logger.info("create-skynet start server~")
    Skynet.uniqueservice("proto")
    local debug_console_port = Skynet.getenv("debug_console_port")
    if debug_console_port then
        Skynet.newservice("debug_console", debug_console_port)
    end
	Skynet.newservice("db")
    local watchdog = Skynet.newservice("watchdog")
    local watchdog_port = Skynet.getenv("watchdog_port")
	Skynet.call(watchdog, "lua", "start", {
        port = watchdog_port,
        nodelay = true
	})
	Logger.info("Watchdog listening on", watchdog_port)
	Skynet.exit()
end)