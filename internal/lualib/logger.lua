-- logger lib
-- TODO: customize logger

local Skynet = require("skynet")
local Strings = require("strings")

local tinsert = table.insert
local tunpack = table.unpack

local Logger = {}

local function raw_log(...)
    t = {}
    for _, v in ipairs({...}) do
        tinsert(t, Strings.tostring(v))
    end
    Skynet.error(tunpack(t))
end

function Logger.debug(...)
    raw_log(...)
end

function Logger.info(...)
    raw_log(...)
end

function Logger.warn(...)
    raw_log(...)
end

function Logger.error(...)
    raw_log(...)
end

return Logger
