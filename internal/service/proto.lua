-- module proto as examples/proto.lua
local Skynet = require("skynet")
local Sprotoloader = require("sprotoloader")
local Proto = require("proto")

Skynet.start(function()
	Sprotoloader.save(Proto.c2s, 1)
	Sprotoloader.save(Proto.s2c, 2)
	-- don't call skynet.exit() , because sproto.core may unload and the global slot become invalid
end)