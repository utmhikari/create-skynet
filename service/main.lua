local skynet = require "skynet"

skynet.start(function()
	skynet.error("create-skynet start server~")
    skynet.uniqueservice("proto")
    local debug_console_port = skynet.getenv("debug_console_port")
    if debug_console_port then
        skynet.newservice("debug_console", debug_console_port)
    end
	skynet.newservice("db")
    local watchdog = skynet.newservice("watchdog")
    local watchdog_port = skynet.getenv("watchdog_port")
	skynet.call(watchdog, "lua", "start", {
        port = watchdog_port,
        nodelay = true
	})
	skynet.error("Watchdog listening on", watchdog_port)
	skynet.exit()
end)