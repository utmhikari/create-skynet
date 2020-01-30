-- path configurations
ROOT = "./"

-- skynet root
SKYNET_ROOT = ROOT .. "skynet/"

-- lower level services/libs
INTERNAL_ROOT = ROOT .. "internal/"
INTERNAL_SERVICE_DIR = INTERNAL_ROOT .. "service/"
INTERNAL_LUALIB_DIR = INTERNAL_ROOT .. "lualib/"
INTERNAL_LUACLIB_DIR = INTERNAL_ROOT .. "luaclib/"

-- services and libs
SERVICE_DIR = ROOT .. "service/"
LUALIB_DIR = ROOT .. "lualib/"
LUACLIB_DIR = ROOT .. "luaclib/"

luaservice = SKYNET_ROOT .. "service/?.lua;" .. SERVICE_DIR .. "?.lua;" .. SERVICE_DIR .. "?/main.lua;" .. INTERNAL_SERVICE_DIR .. "?.lua;" .. INTERNAL_SERVICE_DIR .. "?/main.lua"

lualoader = SKYNET_ROOT .. "lualib/loader.lua"

lua_path = SKYNET_ROOT .. "lualib/?.lua;" .. SKYNET_ROOT .. "lualib/?/init.lua;" .. LUALIB_DIR .. "?.lua;" .. INTERNAL_LUALIB_DIR .. "?.lua"

lua_cpath = SKYNET_ROOT .. "luaclib/?.so;" .. LUACLIB_DIR .. "?.so;" .. INTERNAL_LUACLIB_DIR .. "?.so"

cpath = SKYNET_ROOT .. "cservice/?.so"

-- snax = ROOT.."examples/?.lua;"..ROOT.."test/?.lua"