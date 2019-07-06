local util = {
    indent = "    "
}

-- table tostring with buffer
local function tostrtb_b(t, p, b)
    b[#b + 1] = "{"
    local indent = p .. util.indent
    local flag = false
    for k, v in pairs(t) do
        flag = true
        b[#b + 1] = "\n"
        b[#b + 1] = indent
        b[#b + 1] = k
        b[#b + 1] = " = "
        if type(v) == "table" then
            tostrtb_b(v, indent, b)
        else
            b[#b + 1] = tostring(v)
        end
    end
    if flag then
        b[#b + 1] = "\n"
        b[#b + 1] = p
    end
    b[#b + 1] = "}"
end

-- table tostring
local function tostrtb(t, p)
    local buffer = {}
    tostrtb_b(t, p, buffer)
    return table.concat(buffer, "")
end

-- obj tostring with prefix
function tostrp(o, p)
    if type(o) == "table" then
        return tostrtb(o, p)
    else
        return p .. tostring(o)
    end
end

-- obj tostring
function util.tostr(o)
    return tostrp(o, "")
end

return util