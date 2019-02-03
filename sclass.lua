local mt = {
    __version = "0.0.1"
}
mt.__index = mt

local function is(self, other)
    local mt = self
    while mt do
        mt = mt._super--getmetatable(mt)
        if mt == other then
            return true
        end
    end
    return false
end

local function implement(self,...)
    for i = 1, select("#", ...) do
        for k,v in pairs(select(i,...)) do
            if not self[k] and type(v) == "function" then
                self[k] = v
            end
        end
    end
end


function mt.__call(cls,...)
    local inst = setmetatable({},cls)
    if inst.init then
        --optional return from initializer
        return inst, inst:init(...)
    end
    return inst
end

function mt.__tostring(self)
    return self.__name or tostring(type(self))--"SClass"
end

mt.impl = implement
mt.is = is

local function new(super)
    local super = super or mt
    local cls = {}--_super = super}
    for k,v in pairs(super) do
        if k:find("__") == 1 then
            cls[k] = v
        end
    end
    cls.__index = cls
    cls._class = cls
    cls._super = super

    setmetatable(cls, super)
    return cls,cls
end

return new
