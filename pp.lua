local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("HumanoidRootPart")
local arm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm") or character:FindFirstChild("RightHand")

if torso and arm then
-- Remove the default joint to avoid interference.
local joint = torso:FindFirstChild("Right Shoulder") or torso:FindFirstChild("RightShoulder")
if joint then
joint:Destroy()
end

-- Double the arm's length
local originalSize = arm.Size
arm.Size = Vector3.new(originalSize.X, originalSize.Y , originalSize.Z)

-- Reposition the arm so that its top meets the bottom of the torso
local rotationCorrection = CFrame.Angles(math.rad(90), 0, 0)
arm.CFrame = torso.CFrame * CFrame.new(0, -torso.Size.Y/2, 0) * rotationCorrection * CFrame.new(0, -arm.Size.Y/2, 0)

-- Create a WeldConstraint to lock the arm in place relative to the torso.
local weld = Instance.new("WeldConstraint")
weld.Part0 = torso
weld.Part1 = arm
weld.Parent = torso

end

