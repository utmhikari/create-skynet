-- string utils

local Strings = {}

local tinsert = table.insert
local tconcat = table.concat

-- indent used for table tostring
local DEFAULT_TABLE_TOSTRING_INDENT = "    "

-- table to string
local function tostr_t(t, tb, p, id)
    tinsert(t, "{")
    tinsert(t, "\n")
    local curlen = #t
    local haskey = false
    for k, v in pairs(tb) do
        tinsert(t, p)
        tinsert(t, id)
        tinsert(t, tostring(k))
        tinsert(t, " = ")
        local tv = type(v)
        if tv == "string" then
            local fv = string.format("%q", v):gsub("\\\n", "\\n")
            tinsert(t, fv)
        elseif tv == "table" then
            tostr_t(t, v, p .. id, id)
        else
            tinsert(t, tostring(v))
        end
        tinsert(t, ",\n")
        haskey = true
    end
    if not haskey then
        t[curlen] = ""
    else
        tinsert(t, p)
    end
    tinsert(t, "}")
end

-- object tostring
function Strings.tostring(o)
    tp = type(o)
    if tp == "table" then
        t = {}
        tostr_t(t, o, "", DEFAULT_TABLE_TOSTRING_INDENT)
        return tconcat(t, "")
    end
    return tostring(o)
end

return Strings

