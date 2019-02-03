# SClass
Small Class Implementation

This readme is incomplete

# Features
class() returns the class twice so you can easily make a local alias for it. Given the case of ```local foo, bar = class()``` foo is the same as bar

# Usage

```lua
local class = require('sclass')

local foo = class()

function foo:init()
  print('hello!')
end

local bar = class(foo)

local baz = bar() -- hello!
```
the function returned from sclass will return the same value twice... this allows you to do the following:
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
mydog:bark() -- woof
```
