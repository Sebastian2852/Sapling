local Lifecycle = require(script.classes.Lifecycle)
local ServiceManager = require(script.modules.ServiceManager)
local filterArray = require(script.modules.filterArray)

local function instanceOf(className: string)
	return function(instance: Instance)
		return instance:IsA(className)
	end
end

local Sapling = {}

function Sapling.loadServices(parent: Instance, descendants: boolean)
	local instances = if descendants then parent:GetDescendants() else parent:GetChildren()
	local modules = filterArray(instances, instanceOf("ModuleScript"))

	for _, v in modules do
		ServiceManager.addService(v)
	end
end

function Sapling.fireLifecycle(name: string, ...: any)
	local lifecycle = Lifecycle.new(name)
	lifecycle:fire(...)
end

function Sapling.createLifecycle(name: string)
	return Lifecycle.new(name)
end

return Sapling
