# Lifecycles

## The basics

Lifecycles are a major part of sapling, they are easy to understand and use.

At a very basic level we can think of lifecycle as a signal, however rather than having to connect it like a regular signal, sapling does this all for you.
If we look at this basic runtime script from the Serices example, we can see that it fires a `onStart` lifecycle.

```lua{3}
local Sapling = require(...)
Sapling.loadServices(script.Parent.Services)
Sapling.fireLifecycle("onStart")
```

This simply just means that the `onStart` function will be called on every service that has it.

## Dispatchers

Dispatchers allow you to customise *how* lifecycles call functions. This is a more advanced subject that will rarley have any use but there could be some cases
where the default behaviour doesnt match what you want.

Firstly we need to understand how to actually create lifecycles. Sapling doest export the Lifecycle class directly however you can create a new `Lifecycle` object
via the `createLifecycle` function, which allows you to pass a name *and* a dispatcher of your choosing, as well as returning the `Lifecycle` object.

To give an example here is that same runtime script but using the `Lifecycle` class rather than shorthand functions.

```lua
local Sapling = require(...)
Sapling.loadServices(script.Parent.Services)
Sapling.fireLifecycle("onStart") -- [!code --]
local onStartLf = Sapling.createLifecycle("onStart") -- [!code ++]
onStartLf:fire() -- [!code ++]
```

:::danger
Its important to know that if you create a lifecycle with the name "foo", any lifecycles created in the future with that same name "foo" will just return the existing lifecycle instead.
This behaviour is so that the `fireLifecycle()` shorthand can exist as well as to avoid confusion with dispatchers.
:::

Additionally Sapling provides some built-in dispatcher which you can use by default. These can be accessed via `Sapling.Dispatchers.*`.


```lua
local Sapling = require(...)
Sapling.loadServices(script.Parent.Services)
local onStartLf = Sapling.createLifecycle("onStart") -- [!code --]
local onStartLf = Sapling.createLifecycle("onStart", Sapling.Dispatchers.AsyncDispatcher.new()) -- [!code ++]
onStartLf:fire()
```

## Creating custom dispatchers

Creating your own dispatcher is super simple. Firstly we need to extend the base dispatcher class. We can do this with the handy `extendBaseDispatcher()` function like so

```lua
local MyCoolDispatcher = Sapling.extendBaseDispatcher()
```

Then we need to add our custom functionality to the `dispatch` method.

```lua
local MyCoolDispatcher = Sapling.extendBaseDispatcher()

function MyCoolDispatcher.dispatch( -- [!code ++]
    self: typeof(MyCoolDispatcher), -- [!code ++]
    name: string, -- [!code ++]
    ...: any, -- [!code ++]
) -- [!code ++]
end -- [!code ++]
```

I wont go into detail on how to implement dispatchers as its quite simple but here is an example blocking dispatcher class:

```lua
local BlockingDispatcher = Sapling.extendBaseDispatcher()

function BlockingDispatcher.dispatch(
    self: typeof(BlockingDispatcher),
    name: string,
    ...: any,
)
    -- The :collectFunctions() is a method on the baseDispatcher class, you can override it yourself
    -- if you really want but there is simply no point to.
	local functions = self:collectFunctions(name)

    -- Loop through all the functiosn and call them
	for _, fn in functions do
		fn(...)
	end
end

return BlockingDispatcher
```

```lua
local BlockingDispatcher = require(...)
local Sapling = require(...)

Sapling.createLifecycle("onInit", BlockingDispatcher.new())
```