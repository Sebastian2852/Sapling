# Services

Services are the core of sapling, there is nothing really special about them. A service is simply a normal module script. Have a look at this service below:

```lua
local MyAwesomeService = {}

return MyAwesomeService
```

However, as with all single script architecture frameworks, we need a runtime script to load our services. Here is a basic runtime script:

```lua
local Sapling = require(...)
Sapling.loadServices(script.Parent.Services)
Sapling.fireLifecycle("onStart")
```

This expects your services to live in a folder next to your runtime server script in a folder called "Services". By default sapling will only load direct children
however a second boolean paramater can be passed into `loadServices` to control if descendats are used instead.

Lifecycles are a little bit more complicated and as so have their own guide page, however for now we can ignore that and make our service actually do something.

In our service we can create a `onStart` function which does what we want the service to do when the game is started. In this example we are just printing out a random
number.

```lua
local MyAwesomeService = {}

function MyAwesomeService.onStart() -- [!code ++]
    local rng = Random.new() -- [!code ++]
    print(rng:NextInteger(1, 10)) -- [!code ++]
end -- [!code ++]

return MyAwesomeService
```

This is a basic quick outline of how services work in Sapling. As sapling aims to be heavily customisable it leaves a lot to be done by you, the developer using it. This is why
there is no real `.start()` function, instead having to fire your own lifecycle.