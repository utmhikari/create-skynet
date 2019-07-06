-- 路径设置
root = "./"
skynet_root = root .. "skynet/"
luaservice = skynet_root .. "service/?.lua;" .. root .. "service/?.lua;" .. root .. "service/?/main.lua"
lualoader = skynet_root .. "lualib/loader.lua"
lua_path = skynet_root .. "lualib/?.lua;" .. skynet_root .. "lualib/?/init.lua;" .. root .. "lualib/?.lua"
lua_cpath = skynet_root .. "luaclib/?.so;" .. root .. "luaclib/?.so"
-- snax = root.."examples/?.lua;"..root.."test/?.lua"

-- 基础设置
thread = 8
logger = nil
logpath = "."
harbor = 1
address = "127.0.0.1:2526"
master = "127.0.0.1:2013"
start = "main"
bootstrap = "snlua bootstrap"
standalone = "0.0.0.0:2013"
cpath = skynet_root .. "cservice/?.so"
debug_console_port = 8000

-- 协议设置
sproto_root = root .. "resource/sproto/"

-- watchdog设置
watchdog_port = 8888

