local RunService = game:GetService("RunService")

local sapling = _G.Sapling
assert(sapling, "Cannot find sapling, have you called, loadPackages?")
sapling.addModule(script)

local LifelikeCharactersServiceClient = require(script.LifelikeCharactersServiceClient)

--[=[
	@class LifelikeCharactersService
	A simple package to automatically bring characters to life by doing the following:
	- Better footstep sounds
	- Seeing your body in first person
	- Head following camera angle in first & third person.
]=]
local LifelikeCharactersService = {}

--[=[
	@return LifelikeCharactersServiceClient
	@client
	
	Returns the client API. This can only be called on the client.
]=]
function LifelikeCharactersService.getClient()
	assert(RunService:IsClient(), "This can only be called on the client")
	return LifelikeCharactersServiceClient
end

--[=[
	@tag Lifecycle
	Lifecycle function called by sapling to setup the package.
]=]
function LifelikeCharactersService.saplingPackageStart()
	if RunService:IsClient() then
		LifelikeCharactersServiceClient.setup()
	else
	end
end

return LifelikeCharactersService
