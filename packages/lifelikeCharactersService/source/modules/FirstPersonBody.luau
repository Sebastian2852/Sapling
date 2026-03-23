local Players = game:GetService("Players")
local player = Players.LocalPlayer

local FirstPersonBody = {}

function FirstPersonBody.makeCharacterVisible()
	local character = player.Character
	if character == nil then
		return
	end

	local humanoid = character:WaitForChild("Humanoid")
	humanoid.CameraOffset = Vector3.new(0, 0, -1)

	local characterParts = {
		"LowerTorso",
		"UpperTorso",
		"RightFoot",
		"LeftLowerArm",
		"LeftFoot",
		"LeftLowerLeg",
		"RightLowerArm",
		"LeftHand",
		"LeftUpperArm",
		"RightUpperLeg",
		"RightUpperArm",
		"RightHand",
		"LeftUpperLeg",
		"RightLowerLeg",
	}

	for _, limb in character:GetChildren() do
		if limb:IsA("BasePart") then
			if table.find(characterParts, limb.Name) then
				limb.Transparency = 0
				limb.LocalTransparencyModifier = 0
			end
		end
	end
end

return FirstPersonBody
