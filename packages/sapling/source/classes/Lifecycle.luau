local ServiceManager = require(script.Parent.Parent.modules.ServiceManager)

local lifecycles = {} :: { [string]: Lifecycle }

local Lifecycle = {}
Lifecycle.__index = Lifecycle

export type Lifecycle = typeof(setmetatable(
	{} :: {
		_Name: string,
	},
	Lifecycle
))

function Lifecycle.new(name: string)
	if lifecycles[name] ~= nil then
		return lifecycles[name]
	end

	local self = setmetatable({}, Lifecycle) :: Lifecycle
	self._Name = name

	lifecycles[name] = self

	return self
end

function Lifecycle.fire(self: Lifecycle, ...)
	local functions = ServiceManager.collectFunctions(self._Name)
	for _, v in functions do
		v(...)
	end
end

return Lifecycle
