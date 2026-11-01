local range = script.Parent.doorrange
local doorright = script.Parent.DoorRight
local doorleft = script.Parent.Doorleft
local TS = game:GetService("TweenService")
local isOpen = false
local info = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false)
local info2 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In, 0, false)


local rstart = doorright.Position
local lstart = doorleft.Position

local openR = TS:Create(doorright, info, {Position = rstart + Vector3.new(-13,0,0)})
local openL = TS:Create(doorleft, info, {Position = lstart + Vector3.new(13,0,0)})

local closeR = TS:Create(doorright, info2, {Position = rstart})
local closeL = TS:Create(doorleft, info2, {Position = lstart})

range.Touched:Connect(function(thing)
	if isOpen then return end
	local humanoid = thing.Parent:FindFirstChild("Humanoid")
	if not humanoid then return end
		
		
		 
			
	
	
	isOpen = true

	openR:Play()
	
	openL:Play()	
	
	local humansNear = true
	
	while humansNear do
		
		for _, thing in ipairs(workspace:GetPartsInPart(range)) do
			if thing.Parent:FindFirstChild("Humanoid") then
				humansNear = true
				break
			else
				humansNear = false
			end
		end
		task.wait(0.25)
	end
	
	closeR:Play()
	
	closeL:Play()
	
	isOpen = false

end)
