# SClass
Small Class Implementation

This readme is incomplete

# Features
class() returns the class twice so you can easily make a local alias for it ```local a,b = class()```

# Usage

```lua
local class = require('sclass')

local foo = class()
function foo:init()
  print('hello!')
end

```
```lua
local class = require('sclass')

local Animal = class()

-- Single inheritance
local Dog, self = class(Animal) do
  --self means the same as Dog here
  function self:init(name)
    --shadowed self means instance here
    self.name = name
  end
  
  function self:bark()
    print('woof')
  end
end

local mydog = Dog()
```
