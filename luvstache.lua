-- luvstache: Luvit mustache template parsing.
-- Copyright 2014 james2doyle, <james2doyle@gmail.com>
-- Copyright 2013 Olivine Labs, LLC <projects@olivinelabs.com>
-- MIT Licensed.

local string = require('string')
local string_gmatch = require('string').gmatch

string.split = function(str, sep)
  local out = {}
  for m in string_gmatch(str, "[^"..sep.."]+") do out[#out+1] = m end
  return out
end

local luvstache = {
  name     = "luvstache",
  version  = "1.3-1",
  renderer = require("renderer"):new(),
}

return setmetatable(luvstache, {
  __index = function(self, idx)
    if self.renderer[idx] then return self.renderer[idx] end
  end,
  __newindex = function(self, idx, val)
    if idx == "partials" then self.renderer.partials = val end
    if idx == "tags" then self.renderer.tags = val end
  end
})
