-- Gui to Lua
-- Version: 3.2

-- Instances:
local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject 		= {}
DraggableObject.__index 	= DraggableObject

-- Sets up a new draggable object
function DraggableObject.new(Object)
	local self 			= {}
	self.Object			= Object
	self.DragStarted	= nil
	self.DragEnded		= nil
	self.Dragged		= nil
	self.Dragging		= false

	setmetatable(self, DraggableObject)

	return self
end

-- Enables dragging
function DraggableObject:Enable()
	local object			= self.Object
	local dragInput			= nil
	local dragStart			= nil
	local startPos			= nil
	local preparingToDrag	= false

	-- Updates the element
	local function update(input)
		local delta 		= input.Position - dragStart
		local newPosition	= UDim2_new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		object.Position 	= newPosition

		return newPosition
	end

	self.InputBegan = object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			preparingToDrag = true
			--[[if self.DragStarted then
				self.DragStarted()
			end
			
			dragging	 	= true
			dragStart 		= input.Position
			startPos 		= Element.Position
			--]]

			local connection 
			connection = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and (self.Dragging or preparingToDrag) then
					self.Dragging = false
					connection:Disconnect()

					if self.DragEnded and not preparingToDrag then
						self.DragEnded()
					end

					preparingToDrag = false
				end
			end)
		end
	end)

	self.InputChanged = object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	self.InputChanged2 = UserInputService.InputChanged:Connect(function(input)
		if object.Parent == nil then
			self:Disable()
			return
		end

		if preparingToDrag then
			preparingToDrag = false

			if self.DragStarted then
				self.DragStarted()
			end

			self.Dragging	= true
			dragStart 		= input.Position
			startPos 		= object.Position
		end

		if input == dragInput and self.Dragging then
			local newPosition = update(input)

			if self.Dragged then
				self.Dragged(newPosition)
			end
		end
	end)
end

-- Disables dragging
function DraggableObject:Disable()
	self.InputBegan:Disconnect()
	self.InputChanged:Disconnect()
	self.InputChanged2:Disconnect()

	if self.Dragging then
		self.Dragging = false

		if self.DragEnded then
			self.DragEnded()
		end
	end
end



local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local frame2 = DraggableObject.new(Frame)
frame2:Enable()
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local Frame_4 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_5 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local TextLabel_2 = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(207, 131, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.104166664, 0, 0.104960904, 0)
Frame.Size = UDim2.new(0.22258772, 0, 0.400763363, 0)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0661344826, 0, 0, 0)
Frame_2.Size = UDim2.new(0.867731333, 0, 0.276190519, 0)

Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.0661344826, 0, 0.7238096, 0)
Frame_3.Size = UDim2.new(0.867731333, 0, 0.27619037, 0)

Frame_4.Parent = Frame
Frame_4.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(0.896551788, 0, 6.10948518e-08, 0)
Frame_4.Size = UDim2.new(0.103448272, 0, 0.999999881, 0)

UICorner.CornerRadius = UDim.new(0, 888)
UICorner.Parent = Frame_4

Frame_5.Parent = Frame
Frame_5.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(3.55854439e-08, 0, 6.10948518e-08, 0)
Frame_5.Size = UDim2.new(0.103448272, 0, 0.999999881, 0)

UICorner_2.CornerRadius = UDim.new(0, 888)
UICorner_2.Parent = Frame_5

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.251231521, 0, 0.402314991, 0)
TextButton.Size = UDim2.new(0.497536957, 0, 0.190476194, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Launch"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.Activated:Connect(function()
	while true do
		wait(1)
		local args = {
			[1] = workspace:WaitForChild("Adminium")
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MineEvent"):FireServer(unpack(args))
	end

		while true do
		wait(1)
		local args = {
			[1] = workspace:WaitForChild("Adminium")
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MineEvent"):FireServer(unpack(args))
	end

	while true do
local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(8,1,1)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
wait(3)
end
end)

UITextSizeConstraint.Parent = TextButton
UITextSizeConstraint.MaxTextSize = 39

UICorner_3.CornerRadius = UDim.new(0, 12)
UICorner_3.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.105803527, 0, 0.0447052084, 0)
TextLabel.Size = UDim2.new(0.790748537, 0, 0.164983332, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Elected Admin - Auto Farm"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UITextSizeConstraint_2.Parent = TextLabel
UITextSizeConstraint_2.MaxTextSize = 20

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(170, 85, 255)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.105803527, 0, 0.723809123, 0)
TextLabel_2.Size = UDim2.new(0.790748, 0, 0.276190877, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "nikky hub"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UITextSizeConstraint_3.Parent = TextLabel_2
UITextSizeConstraint_3.MaxTextSize = 20
