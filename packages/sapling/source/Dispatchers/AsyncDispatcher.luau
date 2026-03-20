local BaseDispatcher = require(script.Parent.Parent.classes.BaseDispatcher)

local AsyncDispatcher = setmetatable({}, BaseDispatcher)
AsyncDispatcher.__index = AsyncDispatcher

export type AsyncDispatcher = typeof(setmetatable({} :: BaseDispatcher.BaseDispatcher, AsyncDispatcher))

function AsyncDispatcher.new()
	local self = setmetatable(BaseDispatcher.new(), AsyncDispatcher) :: AsyncDispatcher
	return self
end

function AsyncDispatcher.dispatch(self: AsyncDispatcher, name: string, ...: any)
	local functions = self:collectFunctions(name)
	for _, fn in functions do
		task.spawn(fn, ...)
	end
end

return AsyncDispatcher
