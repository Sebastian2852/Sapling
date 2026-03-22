local RunService = game:GetService("RunService")

local sapling = _G.Sapling
assert(sapling, "Cannot find sapling, have you called, loadPackages?")
sapling.addModule(script)

local LifelikeCharacter = {}

function LifelikeCharacter.saplingPackageStart()
	if RunService:IsClient() then
		local client = require(script.characterRealism.client)
		client:Start()
	else
		local Server = require(script.characterRealism.Server)
		Server.start()
	end
end

return LifelikeCharacter
