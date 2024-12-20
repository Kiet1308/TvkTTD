if getgenv().Nousigi then 
	if game.CoreGui:FindFirstChild("Nousigi Hub GUI") then for i, v in ipairs(game.CoreGui:GetChildren()) do if string.find(v.Name,  "Nousigi Hub") then v:Destroy() end end end
end
getgenv().Nousigi = true

local DisableAnimation = game.Players.LocalPlayer.PlayerGui:FindFirstChild('TouchGui')

local T1UIColor = {
	["Border Color"] = Color3.fromRGB(255, 64, 64),
	["Click Effect Color"] = Color3.fromRGB(230, 230, 230),
	["Setting Icon Color"] = Color3.fromRGB(230, 230, 230),
	["Logo Image"] = "http://www.roblox.com/asset/?id=98976281849470",
	["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
	["Search Icon Highlight Color"] = Color3.fromRGB(255, 64, 64),
	["GUI Text Color"] = Color3.fromRGB(230, 230, 230),
	["Text Color"] = Color3.fromRGB(230, 230, 230),
	["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
	["Title Text Color"] = Color3.fromRGB(255, 64, 64),
	["Background Main Color"] = Color3.fromRGB(43, 43, 43),
	["Background 1 Color"] = Color3.fromRGB(43, 43, 43),
	["Background 1 Transparency"] = 0,
	["Background 2 Color"] = Color3.fromRGB(90, 90, 90),
	["Background 3 Color"] = Color3.fromRGB(53, 53, 53),
	["Background Image"] = "",
	["Page Selected Color"] = Color3.fromRGB(255, 64, 64),
	["Section Text Color"] = Color3.fromRGB(255, 64, 64),
	["Section Underline Color"] = Color3.fromRGB(255, 64, 64),
	["Toggle Border Color"] = Color3.fromRGB(255, 64, 64),
	["Toggle Checked Color"] = Color3.fromRGB(230, 230, 230),
	["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
	["Button Color"] = Color3.fromRGB(255, 64, 64),
	["Label Color"] = Color3.fromRGB(255, 46, 46),
	["Dropdown Icon Color"] = Color3.fromRGB(230, 230, 230),
	["Dropdown Selected Color"] = Color3.fromRGB(255, 64, 64),
	["Dropdown Selected Check Color"] = Color3.fromRGB(219, 64, 64),
	["Textbox Highlight Color"] = Color3.fromRGB(255, 64, 64),
	["Box Highlight Color"] = Color3.fromRGB(255, 64, 64),
	["Slider Line Color"] = Color3.fromRGB(75, 75, 75),
	["Slider Highlight Color"] = Color3.fromRGB(194, 25, 25),
	["Tween Animation 1 Speed"] = DisableAnimation and 0 or 0.25,
	["Tween Animation 2 Speed"] = DisableAnimation and 0 or 0.5,
	["Tween Animation 3 Speed"] = DisableAnimation and 0 or 0.1,
	["Text Stroke Transparency"] = .5
}


local IndexUIColor = {
	["Border Color"] = Color3.fromRGB(184, 212, 255),
	["Click Effect Color"] = Color3.fromRGB(230, 230, 230),
	["Setting Icon Color"] = Color3.fromRGB(230, 230, 230),
	["Logo Image"] = "rbxassetid://16791647668",
	["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
	["Search Icon Highlight Color"] = Color3.fromRGB(184, 212, 255),
	["GUI Text Color"] = Color3.fromRGB(230, 230, 230),
	["Text Color"] = Color3.fromRGB(230, 230, 230),
	["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
	["Title Text Color"] = Color3.fromRGB(184, 212, 255),
	["Background Main Color"] = Color3.fromRGB(43, 43, 43),
	["Background 1 Color"] = Color3.fromRGB(43, 43, 43),
	["Background 1 Transparency"] = 0,
	["Background 2 Color"] = Color3.fromRGB(90, 90, 90),
	["Background 3 Color"] = Color3.fromRGB(53, 53, 53),
	["Background Image"] = "",
	["Page Selected Color"] = Color3.fromRGB(184, 212, 255),
	["Section Text Color"] = Color3.fromRGB(184, 212, 255),
	["Section Underline Color"] = Color3.fromRGB(184, 212, 255),
	["Toggle Border Color"] = Color3.fromRGB(184, 212, 255),
	["Toggle Checked Color"] = Color3.fromRGB(230, 230, 230),
	["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
	["Button Color"] = Color3.fromRGB(184, 212, 255),
	["Label Color"] = Color3.fromRGB(138, 189, 255),
	["Dropdown Icon Color"] = Color3.fromRGB(230, 230, 230),
	["Dropdown Selected Color"] = Color3.fromRGB(184, 212, 255),
	["Dropdown Selected Check Color"] = Color3.fromRGB(131, 181, 255),
	["Textbox Highlight Color"] = Color3.fromRGB(184, 212, 255),
	["Box Highlight Color"] = Color3.fromRGB(184, 212, 255),
	["Slider Line Color"] = Color3.fromRGB(75, 75, 75),
	["Slider Highlight Color"] = Color3.fromRGB(67, 94, 131),
	["Tween Animation 1 Speed"] = DisableAnimation and 0 or 0.25,
	["Tween Animation 2 Speed"] = DisableAnimation and 0 or 0.5,
	["Tween Animation 3 Speed"] = DisableAnimation and 0 or 0.1,
	["Text Stroke Transparency"] = .5
}



getgenv().UIColor = getgenv().T1 and T1UIColor or IndexUIColor

getgenv().UIToggled = false


local currcolor = {}
local Library = {};
local Library_Function = {}
local TweenService = game:GetService('TweenService')
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function makeDraggable(topBarObject, object)
	local dragging = nil
	local dragInput = nil
	local dragStart = nil
	local startPosition = nil
	topBarObject.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPosition = object.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	topBarObject.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	uis.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			if not djtmemay and cac then
				TweenService:Create(object, TweenInfo.new(DisableAnimation and 0 or 0.35,Enum.EasingStyle.Linear,Enum.EasingDirection.Out), {
					Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
				}):Play()
			elseif not djtmemay and not cac then
				object.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
			end
		end
	end)
end

Library_Function.Gui = Instance.new('ScreenGui')
Library_Function.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library_Function.Gui.Name = 'Nousigi Hub GUI'
Library_Function.Gui.Enabled = false

getgenv().ReadyForGuiLoaded = false
spawn(function()
	repeat task.wait()
	until getgenv().ReadyForGuiLoaded
	if getgenv().UIToggled then
		Library_Function.Gui.Enabled = true
	end
end)


Library_Function.NotiGui = Instance.new('ScreenGui')
Library_Function.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library_Function.NotiGui.Name = 'Nousigi Hub Notification'

Library_Function.HideGui = Instance.new('ScreenGui')
Library_Function.HideGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library_Function.HideGui.Name = 'Nousigi Hub Btn'


local btnHide = Instance.new('TextButton', Library_Function.HideGui) 
btnHide.BackgroundTransparency = 1
btnHide.Text = ""
btnHide.AnchorPoint = Vector2.new(0, 1)
btnHide.Size = UDim2.new(0,50,0,50)
btnHide.Position = UDim2.new(0,15,1,-15)

local btnHideFrame = Instance.new('Frame', btnHide)
btnHideFrame.AnchorPoint = Vector2.new(0, 1)
btnHideFrame.Size = UDim2.new(0,50,0,50)
btnHideFrame.Position = UDim2.new(0,0,1,0)
btnHideFrame.Name = "dut dit"
btnHideFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
btnHideFrame.BackgroundTransparency = getgenv().UIToggled and 0 or .25

local imgHide = Instance.new('ImageLabel', btnHide)
imgHide.AnchorPoint = Vector2.new(0, 0)
imgHide.Image = getgenv().UIColor["Logo Image"]
imgHide.BackgroundTransparency = 1
imgHide.Size = UDim2.new(0,getgenv().UIToggled and (getgenv().T1 and 30 or 40) or (getgenv().T1 and 25 or 30),0, getgenv().UIToggled and (getgenv().T1 and 30 or 40) or (getgenv().T1 and 25 or 30))
imgHide.AnchorPoint = Vector2.new(.5,.5)
imgHide.Position = UDim2.new(.5,0,.5,0)

local UICornerBtnHide = Instance.new("UICorner")
UICornerBtnHide.Parent = btnHideFrame
UICornerBtnHide.CornerRadius = UDim.new(1,0)

Library.ToggleUI = function()
	getgenv().UIToggled = not getgenv().UIToggled
    local sizeXY = getgenv().UIToggled and (getgenv().T1 and 30 or 40) or (getgenv().T1 and 25 or 30)
	TweenService:Create(imgHide, TweenInfo.new(DisableAnimation and 0 or .25), {Size = UDim2.new(0,sizeXY,0,sizeXY)}):Play()
	TweenService:Create(btnHideFrame, TweenInfo.new(DisableAnimation and 0 or .25), {BackgroundTransparency = getgenv().UIToggled and 0 or .25}):Play()
	if game.CoreGui:FindFirstChild("Nousigi Hub GUI")then for a,b in ipairs(game.CoreGui:GetChildren())do if b.Name=="Nousigi Hub GUI"then b.Enabled= getgenv().UIToggled end end end
end

Library.DestroyUI = function()
    if game.CoreGui:FindFirstChild("Nousigi Hub GUI") then for i, v in ipairs(game.CoreGui:GetChildren()) do if string.find(v.Name,  "Nousigi Hub") then v:Destroy() end end end
end

if true then
	local button = btnHide -- Assuming this is a TextButton or ImageButton
	local UIS = game:GetService("UserInputService")
	
	local dragging = false
	local dragInput, dragStart, startPos
	local holdTime = 0.1 -- Time to hold before dragging is enabled
	local holdStarted = 0
	
	-- Function to update the button's position
	local function update(input)
		local delta = input.Position - dragStart
		button.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
	
	-- Function to detect the start of dragging (for both mouse and touch)
	local function onInputBegan(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			holdStarted = tick() -- Record the time when holding starts
			dragStart = input.Position
			startPos = button.Position
	
			-- Listen for release to stop dragging
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					holdStarted = 0 -- Reset the hold timer
				end
			end)
		end
	end
	
	-- Function to detect when dragging stops
	local function onInputEnded(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
			holdStarted = 0 -- Reset the hold timer
		end
	end
	
	-- Detect input movement (for both mouse and touch)
	local function onInputChanged(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end
	
	-- Connect the events
	button.InputBegan:Connect(onInputBegan)
	button.InputEnded:Connect(onInputEnded)
	button.InputChanged:Connect(onInputChanged)
	
	-- RenderStepped updates the position while dragging
	RunService.RenderStepped:Connect(function()
		if holdStarted > 0 and (tick() - holdStarted >= holdTime) and not dragging then
			dragging = true
		end
	
		if dragging and dragInput then
			update(dragInput)
		end
	end)
		
end

btnHide.MouseButton1Click:Connect(function() 
	Library.ToggleUI()
end)

local NotiContainer = Instance.new("Frame")
local NotiList = Instance.new("UIListLayout")

NotiContainer.Name = "NotiContainer"
NotiContainer.Parent = Library_Function.NotiGui
NotiContainer.AnchorPoint = Vector2.new(1, 1)
NotiContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
NotiContainer.BackgroundTransparency = 1.000
NotiContainer.Position = UDim2.new(1, -5, 1, -5)
NotiContainer.Size = UDim2.new(0, 350, 1, -10)

NotiList.Name = "NotiList"
NotiList.Parent = NotiContainer
NotiList.SortOrder = Enum.SortOrder.LayoutOrder
NotiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotiList.Padding = UDim.new(0, 5)


Library_Function.Gui.Parent = game:GetService('CoreGui')
Library_Function.NotiGui.Parent = game:GetService('CoreGui')
Library_Function.HideGui.Parent = game:GetService('CoreGui')

function Library_Function.Getcolor(color)
	return {math.floor(color.r*255),math.floor(color.g*255),math.floor(color.b*255)}
end

local libCreateNoti = function(Setting)
	getgenv().TitleNameNoti = Setting.Title or ""; 
	local Desc = Setting.Desc; 
	local Timeshow = Setting.ShowTime or 10;

	local NotiFrame = Instance.new("Frame")
	local Noticontainer = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Topnoti = Instance.new("Frame")
	local Ruafimg = Instance.new("ImageLabel")
	local RuafimgCorner = Instance.new("UICorner")
	local TextLabelNoti = Instance.new("TextLabel")
	local CloseContainer = Instance.new("Frame")
	local CloseImage = Instance.new("ImageLabel")
	local TextButton = Instance.new("TextButton")
	local TextLabelNoti2 = Instance.new("TextLabel")

	NotiFrame.Name = "NotiFrame"
	NotiFrame.Parent = NotiContainer
	NotiFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	NotiFrame.BackgroundTransparency = 1.000
	NotiFrame.ClipsDescendants = true
	NotiFrame.Position = UDim2.new(0, 0, 0, 0)
	NotiFrame.Size = UDim2.new(1, 0, 0, 0)
	NotiFrame.AutomaticSize = Enum.AutomaticSize.Y

	Noticontainer.Name = "Noticontainer"
	Noticontainer.Parent = NotiFrame
	Noticontainer.Position = UDim2.new(1, 0, 0, 0)
	Noticontainer.Size = UDim2.new(1, 0, 1, 6)
	Noticontainer.AutomaticSize = Enum.AutomaticSize.Y
	Noticontainer.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Noticontainer

	Topnoti.Name = "Topnoti"
	Topnoti.Parent = Noticontainer
	Topnoti.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	Topnoti.BackgroundTransparency = 1.000
	Topnoti.Position = UDim2.new(0, 0, 0, 5)
	Topnoti.Size = UDim2.new(1, 0, 0, 25)

	Ruafimg.Name = "Ruafimg"
	Ruafimg.Parent = Topnoti
	Ruafimg.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	Ruafimg.BackgroundTransparency = 1.000
	Ruafimg.Position = UDim2.new(0, 5, 0, getgenv().T1 and 5 or 0)
	Ruafimg.Size = UDim2.new(0, getgenv().T1 and 30 or 25, 0, getgenv().T1 and 15 or 25)
	Ruafimg.Image = getgenv().UIColor["Logo Image"]

	RuafimgCorner.CornerRadius = UDim.new(1, 0)
	RuafimgCorner.Name = "RuafimgCorner"
	RuafimgCorner.Parent = Ruafimg
	
	local colorR = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[1])
	local colorG = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[2])
	local colorB = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[3])
	local color = colorR .. ',' .. colorG .. ',' .. colorB
	TextLabelNoti.Text = "<font color=\"rgb(" .. color .. ")\">Nousigi Hub</font> "..getgenv().TitleNameNoti
	
	TextLabelNoti.Name = "TextLabelNoti"
	TextLabelNoti.Parent = Topnoti
	TextLabelNoti.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	TextLabelNoti.BackgroundTransparency = 1.000
	TextLabelNoti.Position = UDim2.new(0, getgenv().T1 and 40 or 35, 0, 0)
	TextLabelNoti.Size = UDim2.new(1, getgenv().T1 and -40 or -35, 1, 0)
	TextLabelNoti.Font = Enum.Font.GothamBold
	TextLabelNoti.TextSize = 14.000
	TextLabelNoti.TextWrapped = true
	TextLabelNoti.TextXAlignment = Enum.TextXAlignment.Left
	TextLabelNoti.RichText = true
	TextLabelNoti.TextColor3 = getgenv().UIColor["GUI Text Color"]

	CloseContainer.Name = "CloseContainer"
	CloseContainer.Parent = Topnoti
	CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
	CloseContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	CloseContainer.BackgroundTransparency = 1.000
	CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
	CloseContainer.Size = UDim2.new(0, 22, 0, 22)

	CloseImage.Name = "CloseImage"
	CloseImage.Parent = CloseContainer
	CloseImage.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	CloseImage.BackgroundTransparency = 1.000
	CloseImage.Size = UDim2.new(1, 0, 1, 0)
	CloseImage.Image = "rbxassetid://3926305904"
	CloseImage.ImageRectOffset = Vector2.new(284, 4)
	CloseImage.ImageRectSize = Vector2.new(24, 24)
	CloseImage.ImageColor3 = getgenv().UIColor["Search Icon Color"]

	TextButton.Parent = CloseContainer
	TextButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	TextButton.BackgroundTransparency = 1.000
	TextButton.Size = UDim2.new(1, 0, 1, 0)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = ""
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14.000

	if Desc then
		TextLabelNoti2.Name = 'TextColor'
		TextLabelNoti2.Parent = Noticontainer
		TextLabelNoti2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		TextLabelNoti2.BackgroundTransparency = 1.000
		TextLabelNoti2.Position = UDim2.new(0, 10, 0, 35)
		TextLabelNoti2.Size = UDim2.new(1, -15, 0, 0)
		TextLabelNoti2.Font = Enum.Font.GothamBold
		TextLabelNoti2.Text = Desc
		TextLabelNoti2.TextSize = 14.000
		TextLabelNoti2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabelNoti2.RichText = true
		TextLabelNoti2.TextColor3 = getgenv().UIColor["Text Color"]
		TextLabelNoti2.AutomaticSize = Enum.AutomaticSize.Y
		TextLabelNoti2.TextWrapped = true
	end

	local function remove()
		TweenService:Create(Noticontainer,TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{Position = UDim2.new(1,0,0,0)}):Play()
		wait(.25)
		NotiFrame:Destroy()
	end

	TweenService:Create(Noticontainer,TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{Position = UDim2.new(0,0,0,0)}):Play()

	TextButton.MouseEnter:Connect(function()
		TweenService:Create(CloseImage, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}):Play()
	end)

	TextButton.MouseLeave:Connect(function()
		TweenService:Create(CloseImage, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{ImageColor3 = getgenv().UIColor["Search Icon Color"]}):Play()
	end)

	TextButton.MouseButton1Click:Connect(function()
		wait(.25)
		remove()
	end)

	spawn(function()
		wait(Timeshow)
		remove()
	end)

end

function Library.CreateNoti(Setting, bypass)
    if not getgenv().Config or bypass then
        local s, e = pcall(function()
            libCreateNoti(Setting)
        end)
        if e then print(e) end
    end
end

function Library.CreateMain(Setting)

	local TitleNameMain = tostring(Setting.Title) or "Nousigi Hub"
	getgenv().MainDesc = Setting.Desc or ""

	local djtmemay = false
	cac = false

	local Main = Instance.new("Frame")
	local maingui = Instance.new("ImageLabel")
	local MainCorner = Instance.new("UICorner")
	local TopMain = Instance.new("Frame")
	local Ruafimg = Instance.new("ImageLabel")
	local TextLabelMain = Instance.new("TextLabel")
	local PageControl = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local ControlList = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ControlTitle = Instance.new("TextLabel")
	local MainPage = Instance.new("Frame")
	local UIPage = Instance.new("UIPageLayout")
	local Concacontainer = Instance.new("Frame")
	local Concacmain = Instance.new("Frame")
	local MainContainer

	Main.Name = "Main"
	Main.Parent = Library_Function.Gui
	Main.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	Main.BackgroundTransparency = 1.000
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Size = UDim2.new(0, 629, 0, 359)

	makeDraggable(Main, Main)

	maingui.Name = "maingui"
	maingui.Parent = Main
	maingui.AnchorPoint = Vector2.new(0.5, 0.5)
	maingui.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	maingui.BackgroundTransparency = 1.000
	maingui.Position = UDim2.new(0.5, 0, 0.5, 0)
	maingui.Selectable = true
	maingui.Size = UDim2.new(1, 30, 1, 30)
	maingui.Image = "rbxassetid://8068653048"
	maingui.ScaleType = Enum.ScaleType.Slice
	maingui.SliceCenter = Rect.new(15, 15, 175, 175)
	maingui.SliceScale = 1.300
	maingui.ImageColor3 = getgenv().UIColor["Border Color"]
	maingui.ImageTransparency = 1

	maingui.ImageColor3 = getgenv().UIColor['Title Text Color']
	local colorR = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[1])
	local colorG = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[2])
	local colorB = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[3])
	local color = colorR .. ',' .. colorG .. ',' .. colorB
	TextLabelMain.Text = "<font color=\"rgb("..color..")\">Nousigi Hub</font> " .. getgenv().MainDesc

	MainContainer = Instance.new("ImageLabel")
	MainContainer.Name = "MainContainer"
	MainContainer.Parent = Main
	MainContainer.BackgroundColor3 = getgenv().UIColor['Background Main Color']
	MainContainer.Size = UDim2.new(1, 0, 1, 0)

	getgenv().ReadyForGuiLoaded = true
	
	MainCorner.CornerRadius = UDim.new(0, 4)
	MainCorner.Name = "MainCorner"
	MainCorner.Parent = MainContainer

	Concacontainer.Name = "Concacontainer"
	Concacontainer.Parent = MainContainer
	Concacontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Concacontainer.BackgroundTransparency = 1.000
	Concacontainer.ClipsDescendants = true
	Concacontainer.Position = UDim2.new(0, 0, 0, 30)
	Concacontainer.Size = UDim2.new(1, 0, 1, -30)
	
	Concacmain.Name = "Concacmain"
	Concacmain.Parent = Concacontainer
	Concacmain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Concacmain.BackgroundTransparency = 1.000
	Concacmain.Selectable = true
	Concacmain.Size = UDim2.new(1, 0, 1, 0)
	
	TopMain.Name = "TopMain"
	TopMain.Parent = MainContainer
	TopMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopMain.BackgroundTransparency = 1.000
	TopMain.Size = UDim2.new(1, 0, 0, 25)
	
	Ruafimg.Name = "Ruafimg"
	Ruafimg.Parent = TopMain
	Ruafimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Ruafimg.BackgroundTransparency = 1.000
	Ruafimg.Position = UDim2.new(0, 5, 0, getgenv().T1 and 5 or 0)
	Ruafimg.Size = UDim2.new(0, getgenv().T1 and 30 or 25, 0, getgenv().T1 and 15 or 25)
	Ruafimg.Image = getgenv().UIColor["Logo Image"]

	
	TextLabelMain.Name = "TextLabelMain"
	TextLabelMain.Parent = TopMain
	TextLabelMain.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	TextLabelMain.BackgroundTransparency = 1.000
	TextLabelMain.Position = UDim2.new(0, getgenv().T1 and 40 or 35, 0, 0)
	TextLabelMain.Size = UDim2.new(1, getgenv().T1 and -40 or -35, 1, 0)
	TextLabelMain.Font = Enum.Font.GothamBold
	TextLabelMain.RichText = true
	TextLabelMain.TextSize = 16.000
	TextLabelMain.TextWrapped = true
	TextLabelMain.TextXAlignment = Enum.TextXAlignment.Left
	TextLabelMain.TextColor3 = getgenv().UIColor["GUI Text Color"]

	local colorR = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[1])
	local colorG = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[2])
	local colorB = tostring(Library_Function.Getcolor(getgenv().UIColor['Title Text Color'])[3])
	local color = colorR .. ',' .. colorG .. ',' .. colorB
	TextLabelMain.Text = "<font color=\"rgb("..color..")\">Nousigi Hub</font> " .. getgenv().MainDesc

	PageControl.Name = "Background1"
	PageControl.Parent = Concacmain
	PageControl.Position = UDim2.new(0, 5, 0, 0)
	PageControl.Size = UDim2.new(0, 180, 0, 325)
	PageControl.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
	PageControl.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = PageControl

	ControlList.Name = "ControlList"
	ControlList.Parent = PageControl
	ControlList.Active = true
	ControlList.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	ControlList.BackgroundTransparency = 1.000
	ControlList.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ControlList.BorderSizePixel = 0
	ControlList.Position = UDim2.new(0, 0, 0, 30)
	ControlList.Size = UDim2.new(1, -5, 1, -30)
	ControlList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	ControlList.CanvasSize = UDim2.new(0, 0, 0, 0)
	ControlList.ScrollBarThickness = 5
	ControlList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

	UIListLayout.Parent = ControlList
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	ControlTitle.Name = "GUITextColor"
	ControlTitle.Parent = PageControl
	ControlTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	ControlTitle.BackgroundTransparency = 1.000
	ControlTitle.Position = UDim2.new(0, 5, 0, 0)
	ControlTitle.Size = UDim2.new(1, 0, 0, 25)
	ControlTitle.Font = Enum.Font.GothamBold
	ControlTitle.Text = TitleNameMain
	ControlTitle.TextSize = 14.000
	ControlTitle.TextXAlignment = Enum.TextXAlignment.Left
	ControlTitle.TextColor3 = getgenv().UIColor["GUI Text Color"]

	MainPage.Name = "MainPage"
	MainPage.Parent = Concacmain
	MainPage.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
	MainPage.BackgroundTransparency = 1.000
	MainPage.ClipsDescendants = true
	MainPage.Position = UDim2.new(0, 190, 0, 0)
	MainPage.Size = UDim2.new(0, 435, 0, 325)

	UIPage.Name = "UIPage"
	UIPage.Parent = MainPage
	UIPage.FillDirection = Enum.FillDirection.Vertical
	UIPage.SortOrder = Enum.SortOrder.LayoutOrder
	UIPage.EasingDirection = Enum.EasingDirection.InOut
	UIPage.EasingStyle = Enum.EasingStyle.Quart
	UIPage.Padding = UDim.new(0, 10)
	UIPage.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]

	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ControlList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
	end)

	local Main_Function = {}

	local LayoutOrderBut = -1
	local LayoutOrder = -1
	local PageCounter = 1

	function Main_Function.CreatePage(Setting)

		local Page_Name = tostring(Setting.Page_Name) 
		local Page_Title = tostring(Setting.Page_Title)

		LayoutOrder = LayoutOrder + 1
		LayoutOrderBut = LayoutOrderBut + 1

		--Control 
		local PageName = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local TabNameCorner = Instance.new("UICorner")
		local Line = Instance.new("Frame")
		local InLine = Instance.new("Frame")
		local LineCorner = Instance.new("UICorner")
		local TabTitleContainer = Instance.new("Frame")
		local TabTitle = Instance.new("TextLabel")
		local PageButton = Instance.new("TextButton")


		PageName.Name = Page_Name.."_Control"
		PageName.Parent = ControlList
		PageName.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		PageName.BackgroundTransparency = 1.000
		PageName.Size = UDim2.new(1, -10, 0, 25)
		PageName.LayoutOrder = LayoutOrderBut

		Frame.Parent = PageName
		Frame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0, 5, 0, 0)
		Frame.Size = UDim2.new(1, -5, 1, 0)

		TabNameCorner.CornerRadius = UDim.new(0, 4)
		TabNameCorner.Name = "TabNameCorner"
		TabNameCorner.Parent = Frame

		Line.Name = "Line"
		Line.Parent = Frame
		Line.AnchorPoint = Vector2.new(0, 0.5)
		Line.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		Line.BackgroundTransparency = 1.000
		Line.Position = UDim2.new(0, 0, 0.5, 0)
		Line.Size = UDim2.new(0, 14, 1, 0)

		InLine.Name = "PageInLine"
		InLine.Parent = Line
		InLine.AnchorPoint = Vector2.new(0.5, 0.5)
		InLine.BorderSizePixel = 0
		InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
		InLine.Size = UDim2.new(1, -10, 1, -10)
		InLine.BackgroundColor3 = getgenv().UIColor["Page Selected Color"]
		InLine.BackgroundTransparency = 1.000

		LineCorner.Name = "LineCorner"
		LineCorner.Parent = InLine

		TabTitleContainer.Name = "TabTitleContainer"
		TabTitleContainer.Parent = Frame
		TabTitleContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		TabTitleContainer.BackgroundTransparency = 1.000
		TabTitleContainer.Position = UDim2.new(0, 15, 0, 0)
		TabTitleContainer.Size = UDim2.new(1, -15, 1, 0)

		TabTitle.Name = "GUITextColor"
		TabTitle.Parent = TabTitleContainer
		TabTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.Size = UDim2.new(1, 0, 1, 0)
		TabTitle.Font = Enum.Font.GothamBold
		TabTitle.Text = Page_Name
		TabTitle.TextColor3 = Color3.fromRGB(230, 230, 230)
		TabTitle.TextSize = 14.000
		TabTitle.TextXAlignment = Enum.TextXAlignment.Left
		TabTitle.TextColor3 = getgenv().UIColor["GUI Text Color"]

		PageButton.Name = "PageButton"
		PageButton.Parent = PageName
		PageButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		PageButton.BackgroundTransparency = 1.000
		PageButton.Size = UDim2.new(1, 0, 1, 0)
		PageButton.Font = Enum.Font.SourceSans
		PageButton.Text = ""
		PageButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		PageButton.TextSize = 14.000

		-- Container

		local PageContainer = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local PageTitle = Instance.new("TextLabel")
		local PageList = Instance.new("ScrollingFrame")
		local Pagelistlayout = Instance.new("UIListLayout")

		local CurrentPage = PageCounter
		PageCounter = PageCounter + 1
		PageContainer.Name = "Page" .. CurrentPage
		PageContainer.Parent = MainPage
		PageContainer.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
		PageContainer.Position = UDim2.new(0, 190, 0, 30)
		PageContainer.Size = UDim2.new(0, 435, 0, 325)
		PageContainer.LayoutOrder = LayoutOrder
		PageContainer.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = PageContainer

		PageTitle.Name = "GUITextColor"
		PageTitle.Parent = PageContainer
		PageTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		PageTitle.BackgroundTransparency = 1.000
		PageTitle.Position = UDim2.new(0, 5, 0, 0)
		PageTitle.Size = UDim2.new(1, 0, 0, 25)
		PageTitle.Font = Enum.Font.GothamBold
		PageTitle.Text = Page_Title
		PageTitle.TextSize = 16.000
		PageTitle.TextXAlignment = Enum.TextXAlignment.Left
		PageTitle.TextColor3 = getgenv().UIColor["GUI Text Color"]

		PageList.Name = "PageList"
		PageList.Parent = PageContainer
		PageList.Active = true
		PageList.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
		PageList.BackgroundTransparency = 1.000
		PageList.BorderColor3 = Color3.fromRGB(27, 42, 53)
		PageList.BorderSizePixel = 0
		PageList.Position = UDim2.new(0, 5, 0, 30)
		PageList.Size = UDim2.new(1, -10, 1, -30)
		PageList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageList.ScrollBarThickness = 5
		PageList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		PageList.ScrollingEnabled = true
		PageList.VerticalScrollBarInset = Enum.ScrollBarInset.Always

		Pagelistlayout.Name = "Pagelistlayout"
		Pagelistlayout.Parent = PageList
		Pagelistlayout.SortOrder = Enum.SortOrder.LayoutOrder
		Pagelistlayout.Padding = UDim.new(0, 5)
		Pagelistlayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			PageList.CanvasSize = UDim2.new(0, 0, 0, Pagelistlayout.AbsoluteContentSize.Y)
		end)

		local PageSearch = Instance.new("Frame")
		local PageSearchCorner = Instance.new("UICorner")
		local SearchFrame = Instance.new("Frame")
		local SearchIcon = Instance.new("ImageLabel")
		local SearchButton = Instance.new("TextButton")
		local SearchBox = Instance.new("TextBox")

		PageSearch.Name = "Page Search"
		PageSearch.Parent = PageContainer
		PageSearch.AnchorPoint = Vector2.new(1, 0)
		PageSearch.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
		PageSearch.Position = UDim2.new(1, -5, 0, 5)
		PageSearch.Size = UDim2.new(0, 20, 0, 20)
		PageSearch.ClipsDescendants = true

		PageSearchCorner.CornerRadius = UDim.new(0, 2)
		PageSearchCorner.Name = "PageSearchCorner"
		PageSearchCorner.Parent = PageSearch

		SearchFrame.Name = "SearchFrame"
		SearchFrame.Parent = PageSearch
		SearchFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchFrame.BackgroundTransparency = 1.000
		SearchFrame.Size = UDim2.new(0, 20, 0, 20)

		SearchIcon.Name = "SearchIcon"
		SearchIcon.Parent = SearchFrame
		SearchIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchIcon.BackgroundTransparency = 1.000
		SearchIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
		SearchIcon.Size = UDim2.new(0, 16, 0, 16)
		SearchIcon.Image = "rbxassetid://8154282545"
		SearchIcon.ImageColor3 = getgenv().UIColor["Search Icon Color"]

		SearchButton.Name = "Search Button"
		SearchButton.Parent = SearchFrame
		SearchButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchButton.BackgroundTransparency = 1.000
		SearchButton.Size = UDim2.new(1, 0, 1, 0)
		SearchButton.Font = Enum.Font.SourceSans
		SearchButton.Text = ""
		SearchButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		SearchButton.TextSize = 14.000

		SearchBox.Name = "Search Box"
		SearchBox.Parent = PageSearch
		SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SearchBox.BackgroundTransparency = 1.000
		SearchBox.Position = UDim2.new(0, 30, 0, 0)
		SearchBox.Size = UDim2.new(1, -30, 1, 0)
		SearchBox.Font = Enum.Font.GothamBold
		SearchBox.Text = ""
		SearchBox.TextSize = 14.000
		SearchBox.TextXAlignment = Enum.TextXAlignment.Left
		SearchBox.PlaceholderText = "Search Section name"
		SearchBox.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
		SearchBox.TextColor3 = getgenv().UIColor["Text Color"]
		
		local Openned = false 

		SearchButton.MouseEnter:Connect(function()
			TweenService:Create(SearchIcon,TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]),{ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"]}):Play()
		end)

		SearchButton.MouseLeave:Connect(function()
			TweenService:Create(SearchIcon,TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]),{ImageColor3 = getgenv().UIColor["Search Icon Color"]}):Play()
		end)

		SearchButton.MouseButton1Click:Connect(function()
			Openned = not Openned
			local size = Openned and UDim2.new(0,175,0,20) or  UDim2.new(0,20,0,20)
			game.TweenService:Create(PageSearch,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Size = size}):Play()
		end)

		local function hideOtherFrame()
			for i,v in next, PageList:GetChildren() do 
				if not v:IsA('UIListLayout') then 
					v.Visible = false
				end
			end
		end
		
		local function showFrameName()
			for i, v in pairs(PageList:GetChildren()) do
				if not v:IsA('UIListLayout') then 
					if string.find(string.lower(v.Name),string.lower(SearchBox.Text)) then 
						v.Visible = true
					end
				end
			end
		end
		
		SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
			hideOtherFrame()
			showFrameName()
		end)

		for i,v in pairs(ControlList:GetChildren()) do
			if not (v:IsA('UIListLayout')) then
				if i == 2 then 
					v.Frame.Line.PageInLine.BackgroundTransparency = 0
				end
			end
		end

		PageButton.MouseButton1Click:Connect(function()
			if tostring(UIPage.CurrentPage) == PageContainer.Name then 
				return
			end

			for i,v in pairs(MainPage:GetChildren()) do
				if not (v:IsA('UIPageLayout')) and not (v:IsA('UICorner')) then
					v.Visible = false
				end
			end

			PageContainer.Visible = true 
			UIPage:JumpTo(PageContainer)

			for i,v in next, ControlList:GetChildren() do
				if not (v:IsA('UIListLayout')) then
					if v.Name == Page_Name.."_Control" then 
						TweenService:Create(v.Frame.Line.PageInLine,TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
							BackgroundTransparency = 0
						}):Play()
					else
						TweenService:Create(v.Frame.Line.PageInLine,TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
							BackgroundTransparency = 1
						}):Play()
					end
				end
			end
		end)

		local pageFunction = {}

			function pageFunction.CreateSection(Section_Name, Toggleable, SectionGap, SectionColor)

				local Toggleable = Toggleable or false

				local Section = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local Topsec = Instance.new("Frame")
				local Sectiontitle = Instance.new("TextLabel")
				local Linesec = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local SectionList = Instance.new("UIListLayout")


				Section.Name = Section_Name.."_Dot"
				Section.Parent = PageList
				Section.Size = UDim2.new(1, -5, 0, 30)
				Section.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
				Section.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
				Section.ClipsDescendants = true

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = Section

				Topsec.Name = "Topsec"
				Topsec.Parent = Section
				Topsec.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
				Topsec.BackgroundTransparency = 1.000
				Topsec.Size = UDim2.new(0, 415, 0, 30)

				Sectiontitle.Name = "Sectiontitle"
				Sectiontitle.Parent = Topsec
				Sectiontitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
				Sectiontitle.BackgroundTransparency = 1.000
				Sectiontitle.Size = UDim2.new(1, 0, 1, 0)
				Sectiontitle.Font = Enum.Font.GothamBold
				Sectiontitle.Text = Section_Name
				Sectiontitle.TextSize = 14.000
				Sectiontitle.TextColor3 = SectionColor and SectionColor or  getgenv().UIColor["Section Text Color"]

				Linesec.Name = "Linesec"
				Linesec.Parent = Topsec
				Linesec.AnchorPoint = Vector2.new(0.5, 1)
				Linesec.BorderSizePixel = 0
				Linesec.Position = UDim2.new(0.5, 0, 1, -2)
				Linesec.Size = UDim2.new(1, -10, 0, 2)
				Linesec.BackgroundColor3 = SectionColor and SectionColor or getgenv().UIColor["Section Underline Color"]

				local SizeSectionY
				local sectionIsVisible = false

				if Toggleable then

					local VisibilitySectionFrame = Instance.new("Frame")
					local VisibilitySectionFrameCorner = Instance.new("UICorner")
					local visibility = Instance.new("ImageButton")
					local visibility_off = Instance.new("ImageButton")
					local VisibilityButton = Instance.new("TextButton")

					VisibilityButton.Name = "VisibilityButton"
					VisibilityButton.Parent = Topsec
					VisibilityButton.AnchorPoint = Vector2.new(1, 0.5)
					VisibilityButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					VisibilityButton.BackgroundTransparency = 1.000
					VisibilityButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					VisibilityButton.BorderSizePixel = 0
					VisibilityButton.Font = Enum.Font.SourceSans
					VisibilityButton.Text = ""
					VisibilityButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					VisibilityButton.TextSize = 14.000
					VisibilityButton.ZIndex = 2
					VisibilityButton.Position = UDim2.new(1, -5, 0.5, 0)
					VisibilityButton.Size = UDim2.new(0, 20, 0, 20)

					VisibilitySectionFrame.Name = "VisibilitySectionFrame"
					VisibilitySectionFrame.Parent = Topsec
					VisibilitySectionFrame.AnchorPoint = Vector2.new(1, 0.5)
					VisibilitySectionFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					VisibilitySectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					VisibilitySectionFrame.BorderSizePixel = 0
					VisibilitySectionFrame.Position = UDim2.new(1, -5, 0.5, 0)
					VisibilitySectionFrame.Size = UDim2.new(0, 20, 0, 20)

					VisibilitySectionFrameCorner.CornerRadius = UDim.new(0, 4)
					VisibilitySectionFrameCorner.Name = "VisibilitySectionFrameCorner"
					VisibilitySectionFrameCorner.Parent = VisibilitySectionFrame

					visibility.Name = "visibility"
					visibility.Parent = VisibilitySectionFrame
					visibility.AnchorPoint = Vector2.new(0.5, 0.5)
					visibility.BackgroundTransparency = 1.000
					visibility.LayoutOrder = 4
					visibility.Position = UDim2.new(0.5, 0, 0.5, 0)
					visibility.Size = UDim2.new(1, -4, 1, -4)
					visibility.ZIndex = 2
					visibility.Image = "rbxassetid://3926307971"
					visibility.ImageRectOffset = Vector2.new(84, 44)
					visibility.ImageRectSize = Vector2.new(36, 36)
					visibility.ImageTransparency = 1

					visibility_off.Name = "visibility_off"
					visibility_off.Parent = VisibilitySectionFrame
					visibility_off.AnchorPoint = Vector2.new(0.5, 0.5)
					visibility_off.BackgroundTransparency = 1.000
					visibility_off.LayoutOrder = 4
					visibility_off.Position = UDim2.new(0.5, 0, 0.5, 0)
					visibility_off.Size = UDim2.new(1, -4, 1, -4)
					visibility_off.ZIndex = 2
					visibility_off.Image = "rbxassetid://3926307971"
					visibility_off.ImageRectOffset = Vector2.new(564, 44)
					visibility_off.ImageRectSize = Vector2.new(36, 36)
					visibility_off.ImageTransparency = 0

					VisibilityButton.MouseButton1Down:Connect(function()
						sectionIsVisible = not sectionIsVisible
						TweenService:Create(visibility, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]/2),{
							ImageTransparency = sectionIsVisible and 0 or 1
						}):Play()
						wait(getgenv().UIColor["Tween Animation 1 Speed"]/4)
						TweenService:Create(visibility_off, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]/2),{
							ImageTransparency = sectionIsVisible and 1 or 0
						}):Play()
						TweenService:Create(Section, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
							Size =  UDim2.new(1, -5, 0, (sectionIsVisible and SizeSectionY or 30)) 
						}):Play()
					end)
				end
				if SectionGap then
					local SectionGap = Instance.new("Frame")
                    SectionGap.Name = "SectionGap"
                    SectionGap.Parent = PageList
                    SectionGap.Size = UDim2.new(1, -5, 0, 30)
                    SectionGap.ClipsDescendants = true
                    SectionGap.Transparency = 1
				end

				UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.51, 0.02), NumberSequenceKeypoint.new(1.00, 1.00)}
				UIGradient.Parent = Linesec

				SectionList.Name = "SectionList"
				SectionList.Parent = Section
				SectionList.SortOrder = Enum.SortOrder.LayoutOrder
				SectionList.Padding = UDim.new(0, 5)

				SectionList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					if (not Toggleable) then
						Section.Size = UDim2.new(1, -5, 0, SectionList.AbsoluteContentSize.Y + 5)
					end
					SizeSectionY = SectionList.AbsoluteContentSize.Y + 5
					if sectionIsVisible then
						TweenService:Create(Section, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
							Size =  UDim2.new(1, -5, 0, SizeSectionY) 
						}):Play()
					end
				end)

				local sectionFunction = {}

					function sectionFunction.CreateToggle(Setting, Callback)

						local Title = tostring(Setting.Title)
						local Desc = Setting.Desc
						local Default = Setting.Default
						if Default == nil then Default = false end
						local Callback = Callback or function() end

						local ToggleFrame = Instance.new("Frame")
						local TogFrame1 = Instance.new("Frame")
						local checkbox = Instance.new("ImageLabel")
						local check = Instance.new("ImageLabel")
						local ToggleDesc = Instance.new("TextLabel")
						local ToggleTitle = Instance.new("TextLabel")
						local ToggleBg = Instance.new("Frame")
						local ToggleCorner = Instance.new("UICorner")
						local ToggleButton = Instance.new("TextButton")
						local ToggleList = Instance.new("UIListLayout")

						ToggleFrame.Name = "ToggleFrame"
						ToggleFrame.Parent = Section
						ToggleFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						ToggleFrame.BackgroundTransparency = 1.000
						ToggleFrame.Position = UDim2.new(0, 0, 0.300000012, 0)
						ToggleFrame.Size = UDim2.new(1, 0 , 0, 0)
						ToggleFrame.AutomaticSize = Enum.AutomaticSize.Y

						TogFrame1.Name = "TogFrame1"
						TogFrame1.Parent = ToggleFrame
						TogFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
						TogFrame1.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						TogFrame1.BackgroundTransparency = 1.000
						TogFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
						TogFrame1.Size = UDim2.new(1, -10, 0, 0)
						TogFrame1.AutomaticSize = Enum.AutomaticSize.Y

						checkbox.Name = "checkbox"
						checkbox.Parent = TogFrame1
						checkbox.AnchorPoint = Vector2.new(1, 0.5)
						checkbox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						checkbox.BackgroundTransparency = 1.000
						checkbox.Position = UDim2.new(1, -5, 0.5, 3)
						checkbox.Size = UDim2.new(0, 25, 0, 25)
						checkbox.Image = "rbxassetid://4552505888"
						checkbox.ImageColor3 = getgenv().UIColor["Toggle Border Color"]

						check.Name = "check"
						check.Parent = checkbox
						check.AnchorPoint = Vector2.new(0, 1)
						check.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						check.BackgroundTransparency = 1.000
						check.Position = UDim2.new(0, 0, 1, 0)
						check.Image = "rbxassetid://4555411759"
						check.ImageColor3 = getgenv().UIColor["Toggle Checked Color"]

						local cac = 5
						if Desc then
							cac = 0
							ToggleDesc.Name = "ToggleDesc"
							ToggleDesc.Parent = TogFrame1
							ToggleDesc.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
							ToggleDesc.BackgroundTransparency = 1.000
							ToggleDesc.Position = UDim2.new(0, 15, 0, 20)
							ToggleDesc.Size = UDim2.new(1, -50, 0, 0)
							ToggleDesc.Font = Enum.Font.GothamBlack
							ToggleDesc.Text = Desc
							ToggleDesc.TextSize = 13.000
							ToggleDesc.TextWrapped = true
							ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
							ToggleDesc.RichText = true
							ToggleDesc.AutomaticSize = Enum.AutomaticSize.Y
							ToggleDesc.TextColor3 = getgenv().UIColor["Toggle Desc Color"]
						else
							ToggleDesc.Text = ''
						end

						ToggleTitle.Name = "TextColor"
						ToggleTitle.Parent = TogFrame1
						ToggleTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						ToggleTitle.BackgroundTransparency = 1.000
						ToggleTitle.Position = UDim2.new(0, 10, 0, cac)
						ToggleTitle.Size = UDim2.new(1, -10, 0, 20)
						ToggleTitle.Font = Enum.Font.GothamBlack
						ToggleTitle.Text = Title
						ToggleTitle.TextSize = 14.000
						ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
						ToggleTitle.TextYAlignment = Enum.TextYAlignment.Center
						ToggleTitle.RichText = true
						ToggleTitle.AutomaticSize = Enum.AutomaticSize.Y
						ToggleTitle.TextColor3 = getgenv().UIColor["Text Color"]

						ToggleBg.Name = "Background1"
						ToggleBg.Parent = TogFrame1
						ToggleBg.Size = UDim2.new(1, 0, 1, 6)
						ToggleBg.ZIndex = 0
						ToggleBg.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
						ToggleBg.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						ToggleCorner.CornerRadius = UDim.new(0, 4)
						ToggleCorner.Name = "ToggleCorner"
						ToggleCorner.Parent = ToggleBg

						ToggleButton.Name = "ToggleButton"
						ToggleButton.Parent = TogFrame1
						ToggleButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						ToggleButton.BackgroundTransparency = 1.000
						ToggleButton.AnchorPoint = Vector2.new(1, 0.5)
						ToggleButton.Size = UDim2.new(0, 25, 0, 25)
						ToggleButton.Position = UDim2.new(1, -5, 0.5, 3)
						ToggleButton.Font = Enum.Font.SourceSans
						ToggleButton.Text = ""
						ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
						ToggleButton.TextSize = 14.000

						ToggleList.Name = "ToggleList"
						ToggleList.Parent = ToggleFrame
						ToggleList.HorizontalAlignment = Enum.HorizontalAlignment.Center
						ToggleList.SortOrder = Enum.SortOrder.LayoutOrder
						ToggleList.VerticalAlignment = Enum.VerticalAlignment.Center
						ToggleList.Padding = UDim.new(0, 5)

						local function ChangeStage(val)

							local csize = val and UDim2.new(1,-4,1,-4) or UDim2.new(0,0,0,0)
							local pos = val and UDim2.new(.5,0,.5,0) or UDim2.new(0,0,1,0)
							local apos = val and Vector2.new(.5,.5) or Vector2.new(0,1)

							game.TweenService:Create(check,TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{Size = csize, Position = pos, AnchorPoint = apos}):Play()

							Callback(val)

						end

						if Callback then ChangeStage(Default) end 

						local function ButtonClick() 
							Default = not Default
							ChangeStage(Default)
						end
						ToggleButton.MouseButton1Down:Connect(function()
							ButtonClick()
						end)

						local toggleFunction = {}

							function toggleFunction.SetStage(value)
								if value ~= Default then 
									ButtonClick()
								end
							end

						return toggleFunction


					end

					function sectionFunction.CreateButton(Setting, Callback)

						local Title = Setting.Title
						local Callback = Callback or function() end

						local ButtonFrame = Instance.new("Frame")
						local ButtonBG = Instance.new("Frame")
						local ButtonCorner = Instance.new("UICorner")
						local ButtonTitle = Instance.new("TextLabel")
						local Button = Instance.new("TextButton")

						ButtonFrame.Name = Title..'dot'
						ButtonFrame.Parent = Section
						ButtonFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						ButtonFrame.BackgroundTransparency = 1.000
						ButtonFrame.Position = UDim2.new(0, 0, 0.300000012, 0)
						ButtonFrame.Size = UDim2.new(1, 0, 0, 25)

						ButtonBG.Name = "ButtonBG"
						ButtonBG.Parent = ButtonFrame
						ButtonBG.AnchorPoint = Vector2.new(0.5, 0.5)
						ButtonBG.Position = UDim2.new(0.5, 0, 0.5, 0)
						ButtonBG.Size = UDim2.new(1, -10, 1, 0)
						ButtonBG.BackgroundColor3 = getgenv().UIColor["Button Color"]
						ButtonBG.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						ButtonCorner.CornerRadius = UDim.new(0, 4)
						ButtonCorner.Name = "ButtonCorner"
						ButtonCorner.Parent = ButtonBG

						ButtonTitle.Name = "TextColor"
						ButtonTitle.Parent = ButtonBG
						ButtonTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						ButtonTitle.BackgroundTransparency = 1.000
						ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
						ButtonTitle.Size = UDim2.new(1, -10, 1, 0)
						ButtonTitle.Font = Enum.Font.GothamBlack
						ButtonTitle.RichText = true
						ButtonTitle.Text = Title
						ButtonTitle.TextSize = 14.000
						ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
						ButtonTitle.TextColor3 = getgenv().UIColor["Text Color"]
						ButtonTitle.TextStrokeTransparency = getgenv().UIColor["Text Stroke Transparency"]

						Button.Name = "Button"
						Button.Parent = ButtonBG
						Button.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						Button.BackgroundTransparency = 1.000
						Button.Size = UDim2.new(1, 0, 1, 0)
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = Color3.fromRGB(0, 0, 0)
						Button.TextSize = 14.000

						Button.MouseButton1Down:Connect(function()
							Callback()
						end)

					end

					function sectionFunction.CreateLabel(Setting)

						local Title = tostring(Setting.Title)

						local LabelFrame = Instance.new("Frame")
						local LabelBG = Instance.new("Frame")
						local LabelCorner = Instance.new("UICorner")
						local LabelTitle = Instance.new("TextLabel")

						LabelFrame.Name = "LabelFrame"
						LabelFrame.Parent = Section
						LabelFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						LabelFrame.BackgroundTransparency = 1.000
						LabelFrame.Position = UDim2.new(0, 0, 0, 0)
						LabelFrame.Size = UDim2.new(1, 0, 0, 0)
						LabelFrame.AutomaticSize = Enum.AutomaticSize.Y

						LabelBG.Name = "LabelBG"
						LabelBG.Parent = LabelFrame
						LabelBG.AnchorPoint = Vector2.new(0.5, 0)
						LabelBG.Position = UDim2.new(0.5, 0, 0, 0)
						LabelBG.Size = UDim2.new(1, -10, 0, -10)
						LabelBG.BackgroundColor3 = getgenv().UIColor["Label Color"]
						LabelBG.AutomaticSize = Enum.AutomaticSize.Y
						LabelBG.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						LabelCorner.CornerRadius = UDim.new(0, 4)
						LabelCorner.Name = "LabelCorner"
						LabelCorner.Parent = LabelBG

						LabelTitle.Name = "TextColor"
						LabelTitle.Parent = LabelBG
						LabelTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						LabelTitle.BackgroundTransparency = 1.000
						LabelTitle.Position = UDim2.new(0, 10, 0, 3)
						LabelTitle.Size = UDim2.new(1, -20, 1, 0)
						LabelTitle.Font = Enum.Font.GothamBlack
						LabelTitle.Text = Title
						LabelTitle.TextSize = 14.000
						LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
						LabelTitle.AutomaticSize = Enum.AutomaticSize.Y
						LabelTitle.TextWrapped = true
						LabelTitle.TextColor3 = getgenv().UIColor["Text Color"]
						LabelTitle.TextStrokeTransparency = getgenv().UIColor["Text Stroke Transparency"]

						local labelFunction = {}

							function labelFunction.SetText(text)
								LabelTitle.Text = text
							end

							function labelFunction.SetColor(color)
								LabelTitle.TextColor3 = color
							end

						return labelFunction
					end

					function sectionFunction.CreateDropdown(Setting, Callback)

						local Title = tostring(Setting.Title)
						local List = Setting.List
						local Search = Setting.Search or false
						local Selected = Setting.Selected or false
						local Slider = Setting.Slider or false
						local SliderRelease = Setting.SliderRelease or false
						local Default = Setting.Default
						local Callback = Callback or function() end
						local IndexTable = Setting.IndexTable
						local pairs = Setting.SortPairs or pairs

						local DropdownFrame = Instance.new("Frame")
						local Dropdownbg = Instance.new("Frame")
						local Dropdowncorner = Instance.new("UICorner")
						local Topdrop = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")
						local ImgDrop = Instance.new("ImageLabel")
						local DropdownButton = Instance.new("TextButton")
						local Dropdownlisttt = Instance.new("Frame")
						local DropdownScroll = Instance.new("ScrollingFrame")
						local ScrollContainer = Instance.new("Frame")
						local ScrollContainerList = Instance.new("UIListLayout")


						local dropdownLeave = false


						local Dropdowntitle; 
						if Search then 
							Dropdowntitle = Instance.new("TextBox")
						else
							Dropdowntitle = Instance.new("TextLabel")
						end


						DropdownFrame.Name = Title.."DropdownFrame"
						DropdownFrame.Parent = Section
						DropdownFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						DropdownFrame.BackgroundTransparency = 1.000
						DropdownFrame.Position = UDim2.new(0, 0, 0.473684222, 0)
						DropdownFrame.Size = UDim2.new(1, 0, 0, 25)

						Dropdownbg.Name = "Background1"
						Dropdownbg.Parent = DropdownFrame
						Dropdownbg.AnchorPoint = Vector2.new(0.5, 0.5)
						Dropdownbg.Position = UDim2.new(0.5, 0, 0.5, 0)
						Dropdownbg.Size = UDim2.new(1, -10, 1, 0)
						Dropdownbg.ClipsDescendants = true
						Dropdownbg.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
						Dropdownbg.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						Dropdowncorner.CornerRadius = UDim.new(0, 4)
						Dropdowncorner.Name = "Dropdowncorner"
						Dropdowncorner.Parent = Dropdownbg

						Topdrop.Name = "Background2"
						Topdrop.Parent = Dropdownbg
						Topdrop.Size = UDim2.new(1, 0, 0, 25)
						Topdrop.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
						Topdrop.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						UICorner.CornerRadius = UDim.new(0, 4)
						UICorner.Parent = Topdrop

						Dropdowntitle.Name = "TextColorPlaceholder"
						Dropdowntitle.Parent = Topdrop
						Dropdowntitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						Dropdowntitle.BackgroundTransparency = 1.000
						Dropdowntitle.Position = UDim2.new(0, 10, 0, 0)
						Dropdowntitle.Size = UDim2.new(1, -40, 1, 0)
						Dropdowntitle.Font = Enum.Font.GothamBlack
						Dropdowntitle.Text = ''
						Dropdowntitle.TextSize = 14.000
						Dropdowntitle.TextXAlignment = Enum.TextXAlignment.Left
						Dropdowntitle.ClipsDescendants = true
						local Sel = Instance.new("StringValue",Dropdowntitle)
						Sel.Value = ""
						if Default and table.find(List,Default) then 
                            Sel.Value = Default
						end
						if not Selected then
							if Search then
								Dropdowntitle.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
								Dropdowntitle.PlaceholderText = Title..': '..tostring(Default or ""); 
							else
								Dropdowntitle.Text = Title..': '..tostring(Default or ""); 
							end
						else
							if Search then
								Dropdowntitle.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
								Dropdowntitle.PlaceholderText = Title..': '..tostring(Default or ""); 
							else
								Dropdowntitle.Text = Title..': '..tostring(Default or ""); 
							end
						end
						Dropdowntitle.TextColor3 = getgenv().UIColor["Text Color"]
						
						ImgDrop.Name = "ImgDrop"
						ImgDrop.Parent = Topdrop
						ImgDrop.AnchorPoint = Vector2.new(1, 0.5)
						ImgDrop.BackgroundTransparency = 1.000
						ImgDrop.BorderColor3 = Color3.fromRGB(27, 42, 53)
						ImgDrop.Position = UDim2.new(1, -6, 0.5, 0)
						ImgDrop.Size = UDim2.new(0, 15, 0, 15)
						ImgDrop.Image = "rbxassetid://6954383209"
						ImgDrop.ImageColor3 = getgenv().UIColor["Dropdown Icon Color"]

						DropdownButton.Name = "DropdownButton"
						DropdownButton.Parent = Topdrop
						DropdownButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						DropdownButton.BackgroundTransparency = 1.000
						DropdownButton.Size = Search and UDim2.new(0,30,0,30) or UDim2.new(1, 0, 1 ,0)
						DropdownButton.Position = Search and UDim2.new(1, -35, 0, 0) or UDim2.new(0 ,0 ,0 ,0)
						DropdownButton.Font = Enum.Font.GothamBold
						DropdownButton.Text = ""
						DropdownButton.TextColor3 = Color3.fromRGB(230, 230, 230)
						DropdownButton.TextSize = 14.000

						Dropdownlisttt.Name = "Dropdownlisttt"
						Dropdownlisttt.Parent = Dropdownbg
						Dropdownlisttt.BackgroundTransparency = 1.000
						Dropdownlisttt.BorderSizePixel = 0
						Dropdownlisttt.Position = UDim2.new(0, 0, 0, 25)
						Dropdownlisttt.Size = UDim2.new(1, 0, 0, 25)
						Dropdownlisttt.BackgroundColor3 = Color3.fromRGB(230, 230, 230)

						DropdownScroll.Name = "DropdownScroll"
						DropdownScroll.Parent = Dropdownlisttt
						DropdownScroll.Active = true
						DropdownScroll.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						DropdownScroll.BackgroundTransparency = 1.000
						DropdownScroll.BorderSizePixel = 0
						DropdownScroll.Size = UDim2.new(1, 0, 1, 0)
						DropdownScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
						DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
						DropdownScroll.ScrollBarThickness = 5
						DropdownScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
						DropdownScroll.ScrollingEnabled = true
						DropdownScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

						ScrollContainer.Name = "ScrollContainer"
						ScrollContainer.Parent = DropdownScroll
						ScrollContainer.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						ScrollContainer.BackgroundTransparency = 1.000
						ScrollContainer.Position = UDim2.new(0, 5, 0, 5)
						ScrollContainer.Size = UDim2.new(1, -15, 1, -5)

						ScrollContainerList.Name = "ScrollContainerList"
						ScrollContainerList.Parent = ScrollContainer
						ScrollContainerList.SortOrder = Enum.SortOrder.LayoutOrder
						ScrollContainerList.Padding = UDim.new(0, 5)

						ScrollContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
							DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 10 + ScrollContainerList.AbsoluteContentSize.Y + 5)
						end)

						local isbusy = false

						local found = {}

						local searchtable = {}
						
						local function edit()
							for i in pairs(found) do
								found[i] = nil
							end
							for h, l in pairs(ScrollContainer:GetChildren()) do
								if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
									l.Visible = false
								end
							end
							Dropdowntitle.Text = string.lower(Dropdowntitle.Text)
						end

						local function SearchDropdown()
							local Results = {}
							for i, v in pairs(searchtable) do
								if string.find(v, Dropdowntitle.Text) then
									table.insert(found, v)
								end
							end
							for a, b in pairs(ScrollContainer:GetChildren()) do
								for c, d in pairs(found) do
									if d == b.Name then
										b.Visible = true
									end
								end
							end
						end

						local function clear_object_in_list()
							for i,v in next, ScrollContainer:GetChildren() do 
								if v:IsA('Frame') then 
									v:Destroy()
								end
							end
						end

						local ListNew = List


						local function refreshlist(SortPairs)
							pairs = SortPairs or pairs
							clear_object_in_list()

							searchtable = {}
							
							for i, v in pairs(ListNew) do
								if Selected then
									table.insert(searchtable, string.lower(i))
								elseif Slider then
									table.insert(searchtable, string.lower(v['Title']))
								else
									table.insert(searchtable, string.lower(v))
								end
							end

							

							if Selected then 

								for i,v in pairs (ListNew) do

									local SampleItem = Instance.new("Frame")
									local SampleItemCorner = Instance.new("UICorner")
									local SampleItemBG = Instance.new("Frame")
									local SampleItemBGCorner = Instance.new("UICorner")
									local SampleItemTitle = Instance.new("TextLabel")
									local SampleItemCheck = Instance.new("ImageButton")
									local SampleItemButton = Instance.new("TextButton")


									SampleItem.Name = string.lower(i)
									SampleItem.Parent = ScrollContainer
									SampleItem.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
									SampleItem.BackgroundTransparency = 1.000
									SampleItem.BorderColor3 = Color3.fromRGB(27, 42, 53)
									SampleItem.LayoutOrder = 1
									SampleItem.Position = UDim2.new(0, 0, 0.208333328, 0)
									SampleItem.Size = UDim2.new(1, 0, 0, 25)

									SampleItemCorner.CornerRadius = UDim.new(0, 4)
									SampleItemCorner.Name = "SampleItemCorner"
									SampleItemCorner.Parent = SampleItem

									SampleItemBG.Name = "SampleItemBG"
									SampleItemBG.Parent = SampleItem
									SampleItemBG.AnchorPoint = Vector2.new(0.5, 0.5)
									SampleItemBG.BackgroundColor3 = v and UIColor["Dropdown Selected Check Color"] or Color3.fromRGB(255, 255, 255)
									SampleItemBG.BackgroundTransparency = v and .5 or 1
									SampleItemBG.BorderColor3 = Color3.fromRGB(27, 42, 53)
									SampleItemBG.Position = UDim2.new(0.5, 0, 0.5, 0)
									SampleItemBG.Size = UDim2.new(1, 0, 1, 0)

									SampleItemBGCorner.CornerRadius = UDim.new(0, 4)
									SampleItemBGCorner.Name = "SampleItemBGCorner"
									SampleItemBGCorner.Parent = SampleItemBG

									SampleItemTitle.Name = "SampleItemTitle"
									SampleItemTitle.Parent = SampleItemBG
									SampleItemTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									SampleItemTitle.BackgroundTransparency = 1.000
									SampleItemTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
									SampleItemTitle.Position = UDim2.new(0, 10, 0, 0)
									SampleItemTitle.Size = UDim2.new(1, -40, 0, 25)
									SampleItemTitle.Font = Enum.Font.GothamBlack
									SampleItemTitle.Text = i
									SampleItemTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
									SampleItemTitle.TextSize = 14.000
									SampleItemTitle.TextStrokeTransparency = 0.500
									SampleItemTitle.TextXAlignment = Enum.TextXAlignment.Left

									SampleItemCheck.Name = "SampleItemCheck"
									SampleItemCheck.Parent = SampleItemBG
									SampleItemCheck.AnchorPoint = Vector2.new(1, 0.5)
									SampleItemCheck.BackgroundTransparency = 1.000
									SampleItemCheck.Position = UDim2.new(1, 0, 0.5, 0)
									SampleItemCheck.Size = UDim2.new(0, 25, 0, 25)
									SampleItemCheck.ZIndex = 2
									SampleItemCheck.Image = "rbxassetid://3926305904"
									SampleItemCheck.ImageColor3 = UIColor["Dropdown Selected Check Color"]
									SampleItemCheck.ImageRectOffset = Vector2.new(312, 4)
									SampleItemCheck.ImageRectSize = Vector2.new(24, 24)
									SampleItemCheck.ImageTransparency = v and 0 or 1

									SampleItemButton.Name = "SampleItemButton"
									SampleItemButton.Parent = SampleItem
									SampleItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
									SampleItemButton.BackgroundTransparency = 1.000
									SampleItemButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
									SampleItemButton.BorderSizePixel = 0
									SampleItemButton.Size = UDim2.new(1, 0, 1, 0)
									SampleItemButton.Font = Enum.Font.SourceSans
									SampleItemButton.TextColor3 = getgenv().UIColor["Text Color"]
									SampleItemButton.TextSize = 14.000
									SampleItemButton.TextTransparency = 1.000

									SampleItemButton.MouseEnter:Connect(function()
										if v then return end
										TweenService:Create(
											SampleItemBG,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												BackgroundColor3 = Color3.fromRGB(255, 255, 255)
											}
										):Play()

										TweenService:Create(
											SampleItemBG,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												BackgroundTransparency = .7
											}
										):Play()
									end)

									SampleItemButton.MouseLeave:Connect(function()
										if v then return end
										TweenService:Create(
											SampleItemBG,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												BackgroundColor3 = Color3.fromRGB(255, 255, 255)
											}
										):Play()

										TweenService:Create(
											SampleItemBG,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												BackgroundTransparency = 1
											}
										):Play()
									end)

									SampleItemButton.MouseButton1Click:Connect(function()
										v = not v 
										TweenService:Create(
											SampleItemCheck,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												ImageTransparency = v and 0 or 1
											}
										):Play()
										
										TweenService:Create(
											SampleItemBG,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												BackgroundColor3 = v and UIColor["Dropdown Selected Check Color"] or Color3.fromRGB(255, 255, 255)
											}
										):Play()

										TweenService:Create(
											SampleItemBG,
											TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
												BackgroundTransparency = v and .5 or 1
											}
										):Play()

										if Callback then
											Callback(i,v)
											ListNew[i] = v
										end

						
										if Search then
											Dropdowntitle.PlaceholderText = Title..': '
										else
											Dropdowntitle.Text = Title..': '
										end

									end)

								end

							elseif Slider then
								for i,v in pairs(ListNew) do
									
									local TitleText = tostring(v.Title) or ""
									local minValue = tonumber(v.Min) or 0
									local maxValue = tonumber(v.Max) or 100
									local Precise = v.Precise or false
									local DefaultValue = tonumber(v.Default) or minValue

									local SizeChia = 365;

									local SliderFrame = Instance.new("Frame")
									local SliderCorner = Instance.new("UICorner")
									local SliderBG = Instance.new("Frame")
									local SliderBGCorner = Instance.new("UICorner")
									local SliderTitle = Instance.new("TextLabel")
									local SliderBar = Instance.new("Frame")
									local SliderButton = Instance.new("TextButton")
									local SliderBarCorner = Instance.new("UICorner")
									local Bar = Instance.new("Frame")
									local BarCorner = Instance.new("UICorner")
									local Sliderboxframe = Instance.new("Frame")
									local Sliderbox = Instance.new("UICorner")
									local Sliderbox_2 = Instance.new("TextBox")

									SliderFrame.Name = string.lower(v['Title'])
									SliderFrame.Parent = ScrollContainer
									SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
									SliderFrame.BackgroundTransparency = 1.000
									SliderFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
									SliderFrame.Size = UDim2.new(1, 0, 0, 50)

									SliderCorner.CornerRadius = UDim.new(0, 4)
									SliderCorner.Name = "SliderCorner"
									SliderCorner.Parent = SliderFrame

									SliderBG.Name = "Background1"
									SliderBG.Parent = SliderFrame
									SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
									SliderBG.Position = UDim2.new(0.5, 0, 0.5, 0)
									SliderBG.Size = UDim2.new(1, -10, 1, 0)
									SliderBG.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
									SliderBG.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

									SliderBGCorner.CornerRadius = UDim.new(0, 4)
									SliderBGCorner.Name = "SliderBGCorner"
									SliderBGCorner.Parent = SliderBG

									SliderTitle.Name = "TextColor"
									SliderTitle.Parent = SliderBG
									SliderTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
									SliderTitle.BackgroundTransparency = 1.000
									SliderTitle.Position = UDim2.new(0, 10, 0, 0)
									SliderTitle.Size = UDim2.new(1, -10, 0, 25)
									SliderTitle.Font = Enum.Font.GothamBlack
									SliderTitle.Text = TitleText
									SliderTitle.TextSize = 14.000
									SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
									SliderTitle.TextColor3 = getgenv().UIColor["Text Color"]

									SliderBar.Name = "SliderBar"
									SliderBar.Parent = SliderFrame
									SliderBar.AnchorPoint = Vector2.new(.5, 0.5)
									SliderBar.Position = UDim2.new(.5, 0, 0.5, 14)
									SliderBar.Size = UDim2.new(1, -20, 0, 6)
									SliderBar.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]

									SliderButton.Name = "SliderButton "
									SliderButton.Parent = SliderBar
									SliderButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
									SliderButton.BackgroundTransparency = 1.000
									SliderButton.Size = UDim2.new(1, 0, 1, 0)
									SliderButton.Font = Enum.Font.GothamBold
									SliderButton.Text = ""
									SliderButton.TextColor3 = Color3.fromRGB(230, 230, 230)
									SliderButton.TextSize = 14.000

									SliderBarCorner.CornerRadius = UDim.new(1, 0)
									SliderBarCorner.Name = "SliderBarCorner"
									SliderBarCorner.Parent = SliderBar

									Bar.Name = "Bar"
									Bar.BorderSizePixel = 0
									Bar.Parent = SliderBar
									Bar.Size = UDim2.new(0, 0, 1, 0)
									Bar.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]

									BarCorner.CornerRadius = UDim.new(1, 0)
									BarCorner.Name = "BarCorner"
									BarCorner.Parent = Bar

									Sliderboxframe.Name = "Background2"
									Sliderboxframe.Parent = SliderFrame
									Sliderboxframe.AnchorPoint = Vector2.new(1, 0)
									Sliderboxframe.Position = UDim2.new(1, -10, 0, 5)
									Sliderboxframe.Size = UDim2.new(0, 150, 0, 25)
									Sliderboxframe.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]

									Sliderbox.CornerRadius = UDim.new(0, 4)
									Sliderbox.Name = "Sliderbox"
									Sliderbox.Parent = Sliderboxframe

									Sliderbox_2.Name = "TextColor"
									Sliderbox_2.Parent = Sliderboxframe
									Sliderbox_2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
									Sliderbox_2.BackgroundTransparency = 1.000
									Sliderbox_2.Size = UDim2.new(1, 0, 1, 0)
									Sliderbox_2.Font = Enum.Font.GothamBold
									Sliderbox_2.Text = ""
									Sliderbox_2.TextSize = 14.000
									Sliderbox_2.TextColor3 = getgenv().UIColor["Text Color"]

									SliderButton.MouseEnter:Connect(function()
										TweenService:Create(Bar,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{BackgroundColor3 = getgenv().UIColor["Slider Highlight Color"]}):Play()
									end)

									SliderButton.MouseLeave:Connect(function()
										TweenService:Create(Bar,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{BackgroundColor3 = getgenv().UIColor["Slider Line Color"]}):Play()
									end)

									local callBackAndSetText = function(val)
										Sliderbox_2.Text = val
										ListNew[i].Default = val
										Callback(i,v)
									end

									if DefaultValue then 
										if DefaultValue <= minValue then DefaultValue = minValue elseif DefaultValue >= maxValue then DefaultValue = maxValue end
										Bar.Size = UDim2.new(1 - ((maxValue - DefaultValue) / (maxValue - minValue)),0, 0, 6)
										callBackAndSetText(DefaultValue)
									end
									if SliderRelease then

										local dragging = false
										local dragInput
										local holdTime = 0 
										local holdStarted = 0

										-- Function to detect the start of dragging (for both mouse and touch)
										local function onInputBegan(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												holdStarted = tick() -- Record the time when holding starts
										
												-- Listen for release to stop dragging
												input.Changed:Connect(function()
													if input.UserInputState == Enum.UserInputState.End then
														dragging = false
														holdStarted = 0 -- Reset the hold timer
													end
												end)
											end
										end
										
										-- Function to detect when dragging stops
										local function onInputEnded(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												dragging = false
												holdStarted = 0 -- Reset the hold timer
											end
										end

										-- Detect input movement (for both mouse and touch)
										local function onInputChanged(input)
											if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
												dragInput = input
											end
										end
										
										-- Connect the events
										SliderButton.InputBegan:Connect(onInputBegan)
										SliderButton.InputEnded:Connect(onInputEnded)
										SliderButton.InputChanged:Connect(onInputChanged)
										
										-- RenderStepped updates the position while dragging
										RunService.RenderStepped:Connect(function()
											if holdStarted > 0 and (tick() - holdStarted >= holdTime) and not dragging then
												dragging = true
											end
										
											if dragging and dragInput then
												local value = Precise and  tonumber(string.format("%.1f",(((tonumber(maxValue) - tonumber(minValue)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(minValue))) or math.floor((((tonumber(maxValue) - tonumber(minValue)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(minValue))
												pcall(function()
													callBackAndSetText(value)
												end)
												Bar.Size = UDim2.new(0, math.clamp(dragInput.Position.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
											end
										end)
									
									else
										local dragging = false
										local dragInput
										local holdTime = 0 -- Time to hold before dragging is enabled
										local holdStarted = 0

										-- Function to detect the start of dragging (for both mouse and touch)
										local function onInputBegan(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												holdStarted = tick() -- Record the time when holding starts
										
												-- Listen for release to stop dragging
												input.Changed:Connect(function()
													if input.UserInputState == Enum.UserInputState.End then
														dragging = false
														holdStarted = 0 -- Reset the hold timer
													end
												end)
											end
										end
										
										-- Function to detect when dragging stops
										local function onInputEnded(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												dragging = false
												holdStarted = 0 -- Reset the hold timer
											end
										end

										-- Detect input movement (for both mouse and touch)
										local function onInputChanged(input)
											if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
												dragInput = input
											end
										end
										
										-- Connect the events
										SliderButton.InputBegan:Connect(onInputBegan)
										SliderButton.InputEnded:Connect(onInputEnded)
										SliderButton.InputChanged:Connect(onInputChanged)
										
										-- RenderStepped updates the position while dragging
										RunService.RenderStepped:Connect(function()
											if holdStarted > 0 and (tick() - holdStarted >= holdTime) and not dragging then
												dragging = true
											end
										
											if dragging and dragInput then
												local value = Precise and  tonumber(string.format("%.1f",(((tonumber(maxValue) - tonumber(minValue)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(minValue))) or math.floor((((tonumber(maxValue) - tonumber(minValue)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(minValue))
												pcall(function()
													callBackAndSetText(value)
												end)
												Bar.Size = UDim2.new(0, math.clamp(dragInput.Position.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
											end
										end)
									end

									local function GetSliderValue(Value)
										if tonumber(Value) <= minValue then
											Bar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
											callBackAndSetText(minValue)
										elseif tonumber(Value) >= maxValue then
											Bar.Size = UDim2.new(0,(maxValue  /  maxValue * SizeChia), 0, 6)
											callBackAndSetText(maxValue)
										else
											Bar.Size = UDim2.new(1 - ((maxValue - Value) / (maxValue - minValue)),0, 0, 6)
											callBackAndSetText(Value)
										end
									end


									Sliderbox_2.FocusLost:Connect(function()
										GetSliderValue(Sliderbox_2.Text)
									end)
									
								end
							else

								for i,v in pairs (ListNew) do		
									if typeof(v) == "string" then
										local SampleItem = Instance.new("Frame")
										local SampleItemCorner = Instance.new("UICorner")
										local SampleItemBG = Instance.new("Frame")
										local SampleItemBGCorner = Instance.new("UICorner")
										local SampleItemTitle = Instance.new("TextLabel")
										local SampleItemCheck = Instance.new("ImageButton")
										local SampleItemButton = Instance.new("TextButton")
	
	
										SampleItem.Name = string.lower(v)
										SampleItem.Parent = ScrollContainer
										SampleItem.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
										SampleItem.BackgroundTransparency = 1.000
										SampleItem.BorderColor3 = Color3.fromRGB(27, 42, 53)
										SampleItem.LayoutOrder = 1
										SampleItem.Position = UDim2.new(0, 0, 0.208333328, 0)
										SampleItem.Size = UDim2.new(1, 0, 0, 25)
	
										SampleItemCorner.CornerRadius = UDim.new(0, 4)
										SampleItemCorner.Name = "SampleItemCorner"
										SampleItemCorner.Parent = SampleItem
	
										SampleItemBG.Name = "SampleItemBG"
										SampleItemBG.Parent = SampleItem
										SampleItemBG.AnchorPoint = Vector2.new(0.5, 0.5)
										SampleItemBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										SampleItemBG.BackgroundTransparency = 1
										SampleItemBG.BorderColor3 = Color3.fromRGB(27, 42, 53)
										SampleItemBG.Position = UDim2.new(0.5, 0, 0.5, 0)
										SampleItemBG.Size = UDim2.new(1, 0, 1, 0)
	
										SampleItemBGCorner.CornerRadius = UDim.new(0, 4)
										SampleItemBGCorner.Name = "SampleItemBGCorner"
										SampleItemBGCorner.Parent = SampleItemBG
	
										SampleItemTitle.Name = "SampleItemTitle"
										SampleItemTitle.Parent = SampleItemBG
										SampleItemTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										SampleItemTitle.BackgroundTransparency = 1.000
										SampleItemTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
										SampleItemTitle.Position = UDim2.new(0, 10, 0, 0)
										SampleItemTitle.Size = UDim2.new(1, -40, 0, 25)
										SampleItemTitle.Font = Enum.Font.GothamBlack
										SampleItemTitle.Text = v
										SampleItemTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
										SampleItemTitle.TextSize = 14.000
										SampleItemTitle.TextStrokeTransparency = 0.500
										SampleItemTitle.TextXAlignment = Enum.TextXAlignment.Left
	
										SampleItemCheck.Name = "SampleItemCheck"
										SampleItemCheck.Parent = SampleItemBG
										SampleItemCheck.AnchorPoint = Vector2.new(1, 0.5)
										SampleItemCheck.BackgroundTransparency = 1.000
										SampleItemCheck.Position = UDim2.new(1, 0, 0.5, 0)
										SampleItemCheck.Size = UDim2.new(0, 25, 0, 25)
										SampleItemCheck.ZIndex = 2
										SampleItemCheck.Image = "rbxassetid://3926305904"
										SampleItemCheck.ImageColor3 = UIColor["Dropdown Selected Check Color"]
										SampleItemCheck.ImageRectOffset = Vector2.new(312, 4)
										SampleItemCheck.ImageRectSize = Vector2.new(24, 24)
										SampleItemCheck.ImageTransparency = 1
	
										SampleItemButton.Name = "SampleItemButton"
										SampleItemButton.Parent = SampleItem
										SampleItemButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										SampleItemButton.BackgroundTransparency = 1.000
										SampleItemButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
										SampleItemButton.BorderSizePixel = 0
										SampleItemButton.Size = UDim2.new(1, 0, 1, 0)
										SampleItemButton.Font = Enum.Font.SourceSans
										SampleItemButton.TextColor3 = getgenv().UIColor["Text Color"]
										SampleItemButton.TextSize = 14.000
										SampleItemButton.TextTransparency = 1.000
	
										SampleItemButton.MouseEnter:Connect(function()
											if Sel.Value == v then return end
											TweenService:Create(
												SampleItemBG,
												TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
													BackgroundColor3 = Color3.fromRGB(255, 255, 255)
												}
											):Play()
	
											TweenService:Create(
												SampleItemBG,
												TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
													BackgroundTransparency = .7
												}
											):Play()
										end)
	
										SampleItemButton.MouseLeave:Connect(function()
											if Sel.Value == v then return end
											TweenService:Create(
												SampleItemBG,
												TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
													BackgroundColor3 = Color3.fromRGB(255, 255, 255)
												}
											):Play()
	
											TweenService:Create(
												SampleItemBG,
												TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
													BackgroundTransparency = 1
												}
											):Play()
										end)
	
										SampleItemButton.MouseButton1Click:Connect(function()
											if Search then
												Dropdowntitle.PlaceholderText = Title..': '..v or ""
												Sel.Value= v
												
											else
												Dropdowntitle.Text = Title..': '..v or ""
												Sel.Value= v
											end
										
											TweenService:Create(
												SampleItemBG,
												TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
													BackgroundColor3 = UIColor["Dropdown Selected Check Color"]
												}
											):Play()
	
											TweenService:Create(
												SampleItemBG,
												TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]),{
													BackgroundTransparency = .5
												}
											):Play()
											if Callback then 
												Callback(v)
											end

											if Search then
												Dropdowntitle.Text = ""
											end

											refreshlist()
										end)

										if Sel.Value == v then
											SampleItemBG.BackgroundTransparency = .5;
											SampleItemBG.BackgroundColor3 = UIColor["Dropdown Selected Check Color"]
											SampleItem.LayoutOrder = 0
										end

									end
									
								end


							end

						end	

						if Search then
							Dropdowntitle.Changed:Connect(function()
								edit()
								SearchDropdown()
							end)
						end

						if typeof(Default) ~= 'table' then
							Callback(Default)
							if Search then
								Dropdowntitle.PlaceholderText = Title..': '..tostring(Default or "")
							else
								Dropdowntitle.Text = Title..': '..tostring(Default or "")
							end
						elseif Slider then
							Dropdowntitle.Text = ''
							Dropdowntitle.PlaceholderText = Title..': '
						elseif Selected then
							if Search then
								Dropdowntitle.PlaceholderText = Title..': '
							else
								Dropdowntitle.Text = Title..': '
							end
						end

						DropdownButton.MouseButton1Click:Connect(function()
							refreshlist()
							isbusy = not isbusy
							local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
							local mainsize = isbusy and UDim2.new(1, 0,0, 200) or UDim2.new(1, 0,0, 25)
							local DropCRotation = isbusy and 90 or 0

							TweenService:Create(Dropdownlisttt,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Size = listsize}):Play()
							TweenService:Create(DropdownFrame,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Size = mainsize}):Play()
							TweenService:Create(ImgDrop,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Rotation = DropCRotation}):Play()

						end)


						local dropdownFunction = {rf=refreshlist}

						function dropdownFunction:ClearText(v)
							if not Selected then
								if Search then
									Dropdowntitle.PlaceholderText = Title..': ' .. (v or "")
								else
									Dropdowntitle.Text = Title..': ' .. (v or "")
								end
							else
								Dropdowntitle.Text = Title..': ' .. (v or "")
							end
						end

						function dropdownFunction:GetNewList(List)
							Sel.Value = ""
							--refreshlist()
							isbusy = false
							local listsize = isbusy and UDim2.new(1, 0,0, 170) or UDim2.new(1, 0,0, 0)
							local mainsize = isbusy and UDim2.new(1, 0,0, 200) or UDim2.new(1, 0,0, 25)
							local DropCRotation = isbusy and 90 or 0
							
							TweenService:Create(Dropdownlisttt,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Size = listsize}):Play()
							TweenService:Create(DropdownFrame,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Size = mainsize}):Play()
							TweenService:Create(ImgDrop,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{Rotation = DropCRotation}):Play()
							
							ListNew = {}
							ListNew = List
							refreshlist()
							if Search then
								Dropdowntitle.PlaceholderText = Title..': '
							else
								Dropdowntitle.Text = Title..': '
							end

						end
						
						return dropdownFunction

					end

					function sectionFunction.CreateBind(Setting, Callback)

						local TitleText = tostring(Setting.Title) or ""
						local KeyCode = Setting.Key
						local Default = Setting.Default or Setting.Key
						local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
						local Callback = Callback or function() end
						
						KeyCode = tostring(KeyCode):gsub("Enum.UserInputType.", "")
						KeyCode = tostring(KeyCode):gsub("Enum.KeyCode.", "")

						local BindFrame = Instance.new("Frame")
						local BindCorner = Instance.new("UICorner")
						local BindBG = Instance.new("Frame")
						local ButtonCorner = Instance.new("UICorner")
						local BindButtonTitle = Instance.new("TextLabel")
						local Button = Instance.new("TextButton")
						local BindCor = Instance.new("Frame")
						local ButtonCorner_2 = Instance.new("UICorner")
						local Bindkey = Instance.new("TextButton")

						BindFrame.Name = TitleText.."bguvl"
						BindFrame.Parent = Section
						BindFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
						BindFrame.BackgroundTransparency = 1.000
						BindFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
						BindFrame.Size = UDim2.new(1, 0, 0, 35)

						BindCorner.CornerRadius = UDim.new(0, 4)
						BindCorner.Name = "BindCorner"
						BindCorner.Parent = BindFrame

						BindBG.Name = "Background1"
						BindBG.Parent = BindFrame
						BindBG.AnchorPoint = Vector2.new(0.5, 0.5)
						BindBG.Position = UDim2.new(0.5, 0, 0.5, 0)
						BindBG.Size = UDim2.new(1, -10, 1, 0)
						BindBG.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
						BindBG.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						ButtonCorner.CornerRadius = UDim.new(0, 4)
						ButtonCorner.Name = "ButtonCorner"
						ButtonCorner.Parent = BindBG

						BindButtonTitle.Name = "TextColor"
						BindButtonTitle.Parent = BindBG
						BindButtonTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						BindButtonTitle.BackgroundTransparency = 1.000
						BindButtonTitle.Position = UDim2.new(0, 10, 0, 0)
						BindButtonTitle.Size = UDim2.new(1, -10, 1, 0)
						BindButtonTitle.Font = Enum.Font.GothamBlack
						BindButtonTitle.Text = TitleText
						BindButtonTitle.TextSize = 14.000
						BindButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
						BindButtonTitle.TextColor3 = getgenv().UIColor["Text Color"]

						BindCor.Name = "Background2"
						BindCor.Parent = BindBG
						BindCor.AnchorPoint = Vector2.new(1, 0.5)
						BindCor.Position = UDim2.new(1, -5, 0.5, 0)
						BindCor.Size = UDim2.new(0, 150, 0, 25)
						BindCor.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]

						ButtonCorner_2.CornerRadius = UDim.new(0, 4)
						ButtonCorner_2.Name = "ButtonCorner"
						ButtonCorner_2.Parent = BindCor

						Bindkey.Name = "Bindkey"
						Bindkey.Parent = BindCor
						Bindkey.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						Bindkey.BackgroundTransparency = 1.000
						Bindkey.Size = UDim2.new(1, 0, 1, 0)
						Bindkey.Font = Enum.Font.GothamBold
						Bindkey.Text = tostring(Default):gsub("Enum.KeyCode.", "");
						Bindkey.TextSize = 14.000
						Bindkey.TextColor3 = getgenv().UIColor["Text Color"]

						local WhitelistedType = {
							[Enum.UserInputType.MouseButton1] = "Mouse1";
							[Enum.UserInputType.MouseButton2] = "Mouse2";
							[Enum.UserInputType.MouseButton3] = "Mouse3";
						};

						Bindkey.MouseButton1Click:Connect(function()
							local Connection;
		
							Bindkey.Text = "...";
		
							Connection = game:GetService("UserInputService").InputBegan:Connect(function(i)
								if WhitelistedType[i.UserInputType] then
									Bindkey.Text = WhitelistedType[i.UserInputType];
									spawn(function()
										wait(0.1)
										Default = i.UserInputType;
										Type = "UserInputType";
									end);
								elseif i.KeyCode ~= Enum.KeyCode.Unknown then
									Bindkey.Text = tostring(i.KeyCode):gsub("Enum.KeyCode.", "");
									spawn(function()
										wait(0.1)
										Default = i.KeyCode;
										Type = "KeyCode";
									end);
								end;
		
		
								Connection:Disconnect();
							end);
						end);
		
						game:GetService("UserInputService").InputBegan:Connect(function(i)
							if (Default == i.UserInputType or Default == i.KeyCode) then
								Callback(Default);
							end;
						end);
						
					end

					function sectionFunction.CreateBox(Setting, Callback)

						local TitleText = tostring(Setting.Title) or ""
						local Placeholder = tostring(Setting.Placeholder) or ""
						local Default = Setting.Default or false
						local Number_Only = Setting.Number or false 
						local Callback = Callback or function() end

						local BoxFrame = Instance.new("Frame")
						local BoxCorner = Instance.new("UICorner")
						local BoxBG = Instance.new("Frame")
						local ButtonCorner = Instance.new("UICorner")
						local Boxtitle = Instance.new("TextLabel")
						local BoxCor = Instance.new("Frame")
						local ButtonCorner_2 = Instance.new("UICorner")
						local Boxxx = Instance.new("TextBox")
						local Lineeeee = Instance.new("Frame")
						local UICorner = Instance.new("UICorner")

						BoxFrame.Name = "BoxFrame"
						BoxFrame.Parent = Section
						BoxFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
						BoxFrame.BackgroundTransparency = 1.000
						BoxFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
						BoxFrame.Size = UDim2.new(1, 0, 0, 60)

						BoxCorner.CornerRadius = UDim.new(0, 4)
						BoxCorner.Name = "BoxCorner"
						BoxCorner.Parent = BoxFrame

						BoxBG.Name = "Background1"
						BoxBG.Parent = BoxFrame
						BoxBG.AnchorPoint = Vector2.new(0.5, 0.5)
						BoxBG.Position = UDim2.new(0.5, 0, 0.5, 0)
						BoxBG.Size = UDim2.new(1, -10, 1, 0)
						BoxBG.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
						BoxBG.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

						ButtonCorner.CornerRadius = UDim.new(0, 4)
						ButtonCorner.Name = "ButtonCorner"
						ButtonCorner.Parent = BoxBG

						Boxtitle.Name = "TextColor"
						Boxtitle.Parent = BoxBG
						Boxtitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						Boxtitle.BackgroundTransparency = 1.000
						Boxtitle.Position = UDim2.new(0, 10, 0, 0)
						Boxtitle.Size = UDim2.new(1, -10, 0.5, 0)
						Boxtitle.Font = Enum.Font.GothamBlack
						Boxtitle.Text = TitleText
						Boxtitle.TextSize = 14.000
						Boxtitle.TextXAlignment = Enum.TextXAlignment.Left
						Boxtitle.TextColor3 = getgenv().UIColor["Text Color"]

						BoxCor.Name = "Background2"
						BoxCor.Parent = BoxBG
						BoxCor.AnchorPoint = Vector2.new(1, 0.5)
						BoxCor.ClipsDescendants = true
						BoxCor.Position = UDim2.new(1, -5, 0, 40)
						BoxCor.Size = UDim2.new(1, -10, 0, 25)
						BoxCor.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]

						ButtonCorner_2.CornerRadius = UDim.new(0, 4)
						ButtonCorner_2.Name = "ButtonCorner"
						ButtonCorner_2.Parent = BoxCor

						Boxxx.Name = "TextColorPlaceholder"
						Boxxx.Parent = BoxCor
						Boxxx.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						Boxxx.BackgroundTransparency = 1.000
						Boxxx.Position = UDim2.new(0, 5, 0, 0)
						Boxxx.Size = UDim2.new(1, -5, 1, 0)
						Boxxx.Font = Enum.Font.GothamBold
						Boxxx.PlaceholderText = Placeholder
						Boxxx.Text = ""
						Boxxx.TextSize = 14.000
						Boxxx.TextXAlignment = Enum.TextXAlignment.Left
						Boxxx.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
						Boxxx.TextColor3 = getgenv().UIColor["Text Color"]

						Lineeeee.Name = "TextNSBoxLineeeee"
						Lineeeee.Parent = BoxCor
						Lineeeee.BackgroundTransparency = 1.000
						Lineeeee.Position = UDim2.new(0, 0, 1, -2)
						Lineeeee.Size = UDim2.new(1, 0, 0, 6)
						Lineeeee.BackgroundColor3 = getgenv().UIColor["Box Highlight Color"]
						

						UICorner.CornerRadius = UDim.new(1, 0)
						UICorner.Parent = Lineeeee

						Boxxx.Focused:Connect(function() 
							TweenService:Create(Lineeeee,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{BackgroundTransparency = 0}):Play()
						end)

						if Number_Only then 
							Boxxx:GetPropertyChangedSignal("Text"):Connect(function()
								if tonumber(Boxxx.Text) then 
								else 
									Boxxx.PlaceholderText = Placeholder
									Boxxx.Text = ''
								end
							end)
						end

						Boxxx.FocusLost:Connect(function()
							TweenService:Create(Lineeeee,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{BackgroundTransparency = 1}):Play()
							if Boxxx.Text ~= '' then
								Callback(Boxxx.Text)
							end
						end)

						local textbox_function = {}

						if Default then
							Boxxx.Text = Default
							Callback(Default)
						end

						function textbox_function.SetValue(Value)
							Boxxx.Text = Value
							Callback(Value)
						end 

						return textbox_function;


					end

					function sectionFunction.CreateSlider(Setting, Callback)
						
						local TitleText = tostring(Setting.Title) or ""
						local minValue = tonumber(Setting.Min) or 0
						local maxValue = tonumber(Setting.Max) or 100
						local Precise = Setting.Precise or false
                        local DefaultValue = tonumber(Setting.Default) or 0

						local Callback = Callback or function() end

						local SizeChia = 400;

						local Callback = Callback or function() end

						local SliderFrame = Instance.new("Frame")
						local SliderCorner = Instance.new("UICorner")
						local SliderBG = Instance.new("Frame")
						local SliderBGCorner = Instance.new("UICorner")
						local SliderTitle = Instance.new("TextLabel")
						local SliderBar = Instance.new("Frame")
						local SliderButton = Instance.new("TextButton")
						local SliderBarCorner = Instance.new("UICorner")
						local Bar = Instance.new("Frame")
						local BarCorner = Instance.new("UICorner")
						local Sliderboxframe = Instance.new("Frame")
						local Sliderbox = Instance.new("UICorner")
						local Sliderbox_2 = Instance.new("TextBox")

						SliderFrame.Name = TitleText..'buda'
						SliderFrame.Parent = Section
						SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
						SliderFrame.BackgroundTransparency = 1.000
						SliderFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
						SliderFrame.Size = UDim2.new(1, 0, 0, 50)

						SliderCorner.CornerRadius = UDim.new(0, 4)
						SliderCorner.Name = "SliderCorner"
						SliderCorner.Parent = SliderFrame

						SliderBG.Name = "Background1"
						SliderBG.Parent = SliderFrame
						SliderBG.AnchorPoint = Vector2.new(0.5, 0.5)
						SliderBG.Position = UDim2.new(0.5, 0, 0.5, 0)
						SliderBG.Size = UDim2.new(1, -10, 1, 0)
						SliderBG.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
						SliderBG.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
	
						SliderBGCorner.CornerRadius = UDim.new(0, 4)
						SliderBGCorner.Name = "SliderBGCorner"
						SliderBGCorner.Parent = SliderBG

						SliderTitle.Name = "TextColor"
						SliderTitle.Parent = SliderBG
						SliderTitle.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						SliderTitle.BackgroundTransparency = 1.000
						SliderTitle.Position = UDim2.new(0, 10, 0, 0)
						SliderTitle.Size = UDim2.new(1, -10, 0, 25)
						SliderTitle.Font = Enum.Font.GothamBlack
						SliderTitle.Text = TitleText
						SliderTitle.TextSize = 14.000
						SliderTitle.RichText = true
						SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
						SliderTitle.TextColor3 = getgenv().UIColor["Text Color"]

						SliderBar.Name = "SliderBar"
						SliderBar.Parent = SliderFrame
						SliderBar.AnchorPoint = Vector2.new(.5, 0.5)
						SliderBar.Position = UDim2.new(.5, 0, 0.5, 14)
						SliderBar.Size = UDim2.new(0, 400, 0, 6)
						SliderBar.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]

						SliderButton.Name = "SliderButton "
						SliderButton.Parent = SliderBar
						SliderButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						SliderButton.BackgroundTransparency = 1.000
						SliderButton.Size = UDim2.new(1, 0, 1, 0)
						SliderButton.Font = Enum.Font.GothamBold
						SliderButton.Text = ""
						SliderButton.TextColor3 = Color3.fromRGB(230, 230, 230)
						SliderButton.TextSize = 14.000

						SliderBarCorner.CornerRadius = UDim.new(1, 0)
						SliderBarCorner.Name = "SliderBarCorner"
						SliderBarCorner.Parent = SliderBar

						Bar.Name = "Bar"
						Bar.BorderSizePixel = 0
						Bar.Parent = SliderBar
						Bar.Size = UDim2.new(0, 0, 1, 0)
						Bar.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]

						BarCorner.CornerRadius = UDim.new(1, 0)
						BarCorner.Name = "BarCorner"
						BarCorner.Parent = Bar

						Sliderboxframe.Name = "Background2"
						Sliderboxframe.Parent = SliderFrame
						Sliderboxframe.AnchorPoint = Vector2.new(1, 0)
						Sliderboxframe.Position = UDim2.new(1, -10, 0, 5)
						Sliderboxframe.Size = UDim2.new(0, 150, 0, 25)
						Sliderboxframe.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]

						Sliderbox.CornerRadius = UDim.new(0, 4)
						Sliderbox.Name = "Sliderbox"
						Sliderbox.Parent = Sliderboxframe

						Sliderbox_2.Name = "TextColor"
						Sliderbox_2.Parent = Sliderboxframe
						Sliderbox_2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
						Sliderbox_2.BackgroundTransparency = 1.000
						Sliderbox_2.Size = UDim2.new(1, 0, 1, 0)
						Sliderbox_2.Font = Enum.Font.GothamBold
						Sliderbox_2.Text = ""
						Sliderbox_2.TextSize = 14.000
						Sliderbox_2.TextColor3 = getgenv().UIColor["Text Color"]
						
						SliderButton.MouseEnter:Connect(function()
							TweenService:Create(Bar,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{BackgroundColor3 = getgenv().UIColor["Slider Highlight Color"]}):Play()
						end)

						SliderButton.MouseLeave:Connect(function()
							TweenService:Create(Bar,TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]),{BackgroundColor3 = getgenv().UIColor["Slider Line Color"]}):Play()
						end)

                        local callBackAndSetText = function(val)
                            Sliderbox_2.Text = val
                            Callback(tonumber(val))
                        end

                        if DefaultValue then 
                            if DefaultValue <= minValue then DefaultValue = minValue elseif DefaultValue >= maxValue then DefaultValue = maxValue end
                            Bar.Size = UDim2.new(1 - ((maxValue - DefaultValue) / (maxValue - minValue)),0, 0, 6)
                            callBackAndSetText(DefaultValue)
                        end

						local dragging = false
						local dragInput
						local holdTime = 0 -- Time to hold before dragging is enabled
						local holdStarted = 0

						-- Function to detect the start of dragging (for both mouse and touch)
						local function onInputBegan(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								holdStarted = tick() -- Record the time when holding starts
						
								-- Listen for release to stop dragging
								input.Changed:Connect(function()
									if input.UserInputState == Enum.UserInputState.End then
										dragging = false
										holdStarted = 0 -- Reset the hold timer
									end
								end)
							end
						end
						
						-- Function to detect when dragging stops
						local function onInputEnded(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								dragging = false
								holdStarted = 0 -- Reset the hold timer
							end
						end

						-- Detect input movement (for both mouse and touch)
						local function onInputChanged(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								dragInput = input
							end
						end
						
						-- Connect the events
						SliderButton.InputBegan:Connect(onInputBegan)
						SliderButton.InputEnded:Connect(onInputEnded)
						SliderButton.InputChanged:Connect(onInputChanged)
						
						-- RenderStepped updates the position while dragging
						RunService.RenderStepped:Connect(function()
							if holdStarted > 0 and (tick() - holdStarted >= holdTime) and not dragging then
								dragging = true
							end
						
							if dragging and dragInput then
								local value = Precise and  tonumber(string.format("%.1f",(((tonumber(maxValue) - tonumber(minValue)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(minValue))) or math.floor((((tonumber(maxValue) - tonumber(minValue)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(minValue))
								pcall(function()
                                    callBackAndSetText(value)
								end)
								Bar.Size = UDim2.new(0, math.clamp(dragInput.Position.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
							end
						end)

					
						local function GetSliderValue(Value)

							if tonumber(Value) <= minValue then
								Bar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
								callBackAndSetText(minValue)

							elseif tonumber(Value) >= maxValue then
								Bar.Size = UDim2.new(0,(maxValue  /  maxValue * SizeChia), 0, 6)
								callBackAndSetText(maxValue)
							else
								Bar.Size = UDim2.new(1 - ((maxValue - Value) / (maxValue - minValue)),0, 0, 6)
								callBackAndSetText(Value)
							end
							
						end


						Sliderbox_2.FocusLost:Connect(function()
							GetSliderValue(Sliderbox_2.Text)
						end)


						local slider_function = {}

						function slider_function.SetValue(Value)
							GetSliderValue(Value)
						end

						return slider_function


					end


				return sectionFunction

			end

		return pageFunction

	end

	return Main_Function

end

Library.CreateNoti({Title = 'UI Library', Desc = 'The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.', ShowTime = 10}, true)

return Library
