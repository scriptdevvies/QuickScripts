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




local nIKYHUBBBB = Instance.new("ScreenGui")
local Makethisdragable = Instance.new("Frame")
local frame2 = DraggableObject.new(Makethisdragable)
frame2:Enable()
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_3 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Frame_4 = Instance.new("Frame")
local Frame_5 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local textbutton1 = Instance.new("ImageButton")
local UICorner_4 = Instance.new("UICorner")
local textbutton2 = Instance.new("ImageButton")
local UICorner_5 = Instance.new("UICorner")
local textbutton3 = Instance.new("ImageButton")
local UICorner_6 = Instance.new("UICorner")
local textbutton4 = Instance.new("ImageButton")
local UICorner_7 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local TextLabel_2 = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local TextLabel_3 = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local TextLabel_4 = Instance.new("TextLabel")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local TextLabel_5 = Instance.new("TextLabel")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")
local UICorner_8 = Instance.new("UICorner")

--Properties:

nIKYHUBBBB.Name = "nIKY HUBBBB"
nIKYHUBBBB.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
nIKYHUBBBB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Makethisdragable.Name = "Makethisdragable"
Makethisdragable.Parent = nIKYHUBBBB
Makethisdragable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Makethisdragable.BorderColor3 = Color3.fromRGB(0, 0, 0)
Makethisdragable.BorderSizePixel = 0
Makethisdragable.Position = UDim2.new(0.315920711, 0, 0.104960784, 0)
Makethisdragable.Size = UDim2.new(0.345425963, 0, 0.788168848, 0)

Frame.Parent = Makethisdragable
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0453666933, 0, 0.920255005, 0)
Frame.Size = UDim2.new(0.914131224, 0, 0.0797447488, 0)

Frame_2.Parent = Makethisdragable
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.460938066, 0, 0.936042607, 0)
Frame_2.Size = UDim2.new(0.0784230679, 0, 0.0464582182, 0)

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Frame_2

Frame_3.Parent = Makethisdragable
Frame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(-0.00286818063, 0, 1.55325708e-07, 0)
Frame_3.Size = UDim2.new(0.0949125811, 0, 0.999999821, 0)

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = Frame_3

Frame_4.Parent = Makethisdragable
Frame_4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(0.0453666933, 0, 1.86390864e-07, 0)
Frame_4.Size = UDim2.new(0.914131522, 0, 0.0760066211, 0)

Frame_5.Parent = Makethisdragable
Frame_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(0.924962342, 0, 1.24260566e-07, 0)
Frame_5.Size = UDim2.new(0.0750373006, 0, 0.999999881, 0)

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Frame_5

textbutton1.Name = "textbutton1"
textbutton1.Parent = Makethisdragable
textbutton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbutton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
textbutton1.BorderSizePixel = 0
textbutton1.Position = UDim2.new(0.177367836, 0, 0.210565001, 0)
textbutton1.Size = UDim2.new(0.274200499, 0, 0.17193301, 0)
textbutton1.Image = "http://www.roblox.com/asset/?id=7488932274"

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = textbutton1

textbutton2.Name = "textbutton2"
textbutton2.Parent = Makethisdragable
textbutton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbutton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
textbutton2.BorderSizePixel = 0
textbutton2.Position = UDim2.new(0.5501405, 0, 0.210565001, 0)
textbutton2.Size = UDim2.new(0.274200439, 0, 0.17193301, 0)
textbutton2.Image = "http://www.roblox.com/asset/?id=130099881051812"

UICorner_5.CornerRadius = UDim.new(1, 0)
UICorner_5.Parent = textbutton2

textbutton3.Name = "textbutton3"
textbutton3.Parent = Makethisdragable
textbutton3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbutton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
textbutton3.BorderSizePixel = 0
textbutton3.Position = UDim2.new(0.187627405, 0, 0.549245477, 0)
textbutton3.Size = UDim2.new(0.27420041, 0, 0.171932757, 0)
textbutton3.Image = "http://www.roblox.com/asset/?id=14893198015"

UICorner_6.CornerRadius = UDim.new(1, 0)
UICorner_6.Parent = textbutton3

textbutton4.Name = "textbutton4"
textbutton4.Parent = Makethisdragable
textbutton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbutton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
textbutton4.BorderSizePixel = 0
textbutton4.Position = UDim2.new(0.560400188, 0, 0.549245477, 0)
textbutton4.Size = UDim2.new(0.274200261, 0, 0.171932757, 0)
textbutton4.Image = "http://www.roblox.com/asset/?id=16054510719"

UICorner_7.CornerRadius = UDim.new(1, 0)
UICorner_7.Parent = textbutton4

TextLabel.Parent = Makethisdragable
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.133682624, 0, 0.012753888, 0)
TextLabel.Size = UDim2.new(0.729805708, 0, 0.0484695584, 0)
TextLabel.Font = Enum.Font.Arial
TextLabel.Text = "iLikeCats 15"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 18.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true

UITextSizeConstraint.Parent = TextLabel
UITextSizeConstraint.MaxTextSize = 18

TextLabel_2.Parent = Makethisdragable
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.534994781, 0, 0.722733974, 0)
TextLabel_2.Size = UDim2.new(0.326931238, 0, 0.0686833784, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Fling gui"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UITextSizeConstraint_2.Parent = TextLabel_2
UITextSizeConstraint_2.MaxTextSize = 14

TextLabel_3.Parent = Makethisdragable
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.151961967, 0, 0.384053767, 0)
TextLabel_3.Size = UDim2.new(0.326931328, 0, 0.068683289, 0)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Auto farm"
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

UITextSizeConstraint_3.Parent = TextLabel_3
UITextSizeConstraint_3.MaxTextSize = 14

TextLabel_4.Parent = Makethisdragable
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.524734378, 0, 0.384053767, 0)
TextLabel_4.Size = UDim2.new(0.326931238, 0, 0.068683289, 0)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "Infinite yield"
TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

UITextSizeConstraint_4.Parent = TextLabel_4
UITextSizeConstraint_4.MaxTextSize = 14

TextLabel_5.Parent = Makethisdragable
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.162221536, 0, 0.722733974, 0)
TextLabel_5.Size = UDim2.new(0.326931298, 0, 0.0686833784, 0)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "Cmd-x"
TextLabel_5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

UITextSizeConstraint_5.Parent = TextLabel_5
UITextSizeConstraint_5.MaxTextSize = 14

UICorner_8.CornerRadius = UDim.new(0, 100)
UICorner_8.Parent = Makethisdragable
