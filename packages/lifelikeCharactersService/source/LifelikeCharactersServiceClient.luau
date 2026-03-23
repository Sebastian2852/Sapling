local FirstPersonBody = require(script.Parent.modules.FirstPersonBody)
local FootstepSystem = require(script.Parent.modules.FootstepSystem)

local isSetup = false

--[=[
    @class LifelikeCharactersServiceClient
    @client

    Can be accessed via [LifelikeCharactersService.getClient].
]=]
local LifelikeCharactersServiceClient = {}

--[=[
    @param material Material

    Sets the sound for the passed `material` to be `sound` where if `sound` is nil then the fallback sound is used, this by default is
    the normal roblox walking sound however this can be overrided with [LifelikeCharactersServiceClient.changeFallbackSound].
]=]
function LifelikeCharactersServiceClient.updateSoundForMaterial(material: Enum.Material, sound: string?)
	FootstepSystem.updateSoundForMaterial(material, sound)
end

--[=[
    Change the default footstep sound that is used when a [Material] doesnt have a sound set.
]=]
function LifelikeCharactersServiceClient.changeFallbackSound(sound: string)
	FootstepSystem.changeFallbackSound(sound)
end

--[=[
    @private
    This function is called for you when the package starts. You do NOT need to call this.
    
    If you call this function it will error.
]=]
function LifelikeCharactersServiceClient.setup()
	assert(not isSetup, "Setup has already been called")
	isSetup = true
	FootstepSystem.setupFootsteps()
	FirstPersonBody.setup()
end

return LifelikeCharactersServiceClient
