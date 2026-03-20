local ServiceManager = require(script.Parent.Parent.modules.ServiceManager)

local BaseDispatcher = {}
BaseDispatcher.__index = BaseDispatcher

export type BaseDispatcher = typeof(setmetatable(
	{} :: {
		__ClassName: string,
	},
	BaseDispatcher
))

function BaseDispatcher.collectFunctions(self: BaseDispatcher, name: string)
	return ServiceManager.collectFunctions(name)
end

function BaseDispatcher.dispatch(self: BaseDispatcher, name: string, ...: any)
	error("No dispatch impl")
end

function BaseDispatcher.new()
	local self = setmetatable({}, BaseDispatcher) :: BaseDispatcher
	self.__ClassName = "BaseDispatcher"
	return self
end

function BaseDispatcher.is<T>(obj: T)
	if typeof(obj) ~= "table" then
		return false
	end

	return obj["__ClassName"] == "BaseDispatcher"
end

return BaseDispatcher
