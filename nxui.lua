-- Inlined UI Library
local libary = (function()
-- // variables
local library = {}
local pages = {}
local sections = {}
local multisections = {}
local mssections = {}
local toggles = {}
local buttons = {}
local sliders = {}
local dropdowns = {}
local multiboxs = {}
local buttonboxs = {}
local textboxs = {}
local keybinds = {}
local colorpickers = {}
local configloaders = {}
local watermarks = {}
local loaders = {}
--
local utility = {}
--
local check_exploit = (syn and "Synapse") or (KRNL_LOADED and "Krnl") or (isourclosure and "ScriptWare") or nil
local plrs = game:GetService("Players")
local cre = game:GetService("CoreGui")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService") 
local uis = game:GetService("UserInputService") 
local hs = game:GetService("HttpService")
local ws = game:GetService("Workspace")
local plr = plrs.LocalPlayer
local cam = ws.CurrentCamera
-- // indexes
library.__index = library
pages.__index = pages
sections.__index = sections
multisections.__index = multisections
mssections.__index = mssections
toggles.__index = toggles
buttons.__index = buttons
sliders.__index = sliders
dropdowns.__index = dropdowns
multiboxs.__index = multiboxs
buttonboxs.__index = buttonboxs
textboxs.__index = textboxs
keybinds.__index = keybinds
colorpickers.__index = colorpickers
configloaders.__index = configloaders
watermarks.__index = watermarks
loaders.__index = loaders
-- // functions
utility.new = function(instance,properties) 
	-- // instance
	local ins = Instance.new(instance)
	-- // properties setting
	for property,value in pairs(properties) do
		ins[property] = value
	end
	-- // return
	return ins
end
--
utility.dragify = function(ins,touse)
	local dragging
	local dragInput
	local dragStart
	local startPos
	--
	local function update(input)
		local delta = input.Position - dragStart
		touse:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.1,true)
	end
	--
	ins.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = touse.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	--
	ins.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	--
	uis.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
--
utility.round = function(n,d)
	return tonumber(string.format("%."..(d or 0).."f",n))
end
--
utility.zigzag = function(X)
	return math.acos(math.cos(X*math.pi))/math.pi
end
--
utility.capatalize = function(s)
	local l = ""
	for v in s:gmatch('%u') do
		l = l..v
	end
	return l
end
--
utility.splitenum = function(enum)
	local s = tostring(enum):split(".")
	return s[#s]
end
--
utility.from_hex = function(h)
	local r,g,b = string.match(h,"^#?(%w%w)(%w%w)(%w%w)$")
	return Color3.fromRGB(tonumber(r,16), tonumber(g,16), tonumber(b,16))
end
--
utility.to_hex = function(c)
	return string.format("#%02X%02X%02X",c.R *255,c.G *255,c.B *255)
end
--
utility.removespaces = function(s)
   return s:gsub(" ","")
end
-- // main
function library:new(props)
	-- // properties
	local textsize = props.textsize or props.TextSize or props.textSize or props.Textsize or 12
	local font = props.font or props.Font or "RobotoMono"
	local name = props.name or props.Name or props.UiName or props.Uiname or props.uiName or props.username or props.Username or props.UserName or props.userName or "new ui"
	local color = props.color or props.Color or props.mainColor or props.maincolor or props.MainColor or props.Maincolor or props.Accent or props.accent or Color3.fromRGB(130, 210, 220)
	-- // variables
	local window = {}
	-- // main
	local screen = utility.new(
		"ScreenGui",
		{
			Name = tostring(math.random(0,999999))..tostring(math.random(0,999999)),
			DisplayOrder = 9999,
			ResetOnSpawn = false,
			ZIndexBehavior = "Global",
			Parent = cre
		}
	)
	--
        if (check_exploit == "Synapse" and syn.request) then
	syn.protect_gui(screen)
        end
	-- 1
	local outline = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = color,
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(0,500,0,606),
			Position = UDim2.new(0.5,0,0.5,0),
			Parent = screen
		}
	)
	-- 2
	local outline2 = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(1,-4,1,-4),
			Position = UDim2.new(0.5,0,0.5,0),
			Parent = outline
		}
	)
	-- 3
	local indent = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0.5,0,0.5,0),
			Parent = outline2
		}
	)
	-- 4
	local main = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,1),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,-10,1,-25),
			Position = UDim2.new(0.5,0,1,-5),
			Parent = outline2
		}
	)
	--
	local title = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0.5,0,0,0),
			Parent = outline2
		}
	)
	-- 5
	local outline3 = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0.5,0,0.5,0),
			Parent = main
		}
	)
	--
	utility.new(
		"ImageLabel",
		{
			BackgroundTransparency = 1,
			Image = "rbxassetid://2181804340",
			ImageTransparency = 0.9,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			ZIndex = 0,
			Parent = outline3
		}
	)
	--
	local titletext = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,1,0),
			Position = UDim2.new(0.5,0,0,0),
			Font = font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextXAlignment = "Left",
			TextSize = textsize,
			TextStrokeTransparency = 0,
			Parent = title
		}
	)
	-- 6
	local holder = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-6,1,-6),
			Position = UDim2.new(0.5,0,0.5,0),
			Parent = main
		}
	)
	-- 7
	local holder = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-6,1,-6),
			Position = UDim2.new(0.5,0,0.5,0),
			Parent = main
		}
	)
	-- 8
	local tabs = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,1),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,-20),
			Position = UDim2.new(0.5,0,1,0),
			Parent = holder
		}
	)
	--
	local tabsbuttons = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,21),
			Position = UDim2.new(0.5,0,0,0),
			ZIndex = 2,
			Parent = holder
		}
	)
	-- 9
	local outline4 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = tabs
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Horizontal",
			Padding = UDim.new(0,2),
			Parent = tabsbuttons
		}
	)
	--
	utility.dragify(title,outline)
	-- // window tbl
	window = {
		["screen"] = screen,
		["holder"] = holder,
		["labels"] = {},
		["tabs"] = outline4,
		["tabsbuttons"] = tabsbuttons,
		["outline"] = outline,
		["pages"] = {},
		["pointers"] = {},
		["dropdowns"] = {},
		["multiboxes"] = {},
		["buttonboxs"] = {},
		["colorpickers"] = {},
		["x"] = true,
		["y"] = true,
		["key"] = Enum.KeyCode.RightShift,
		["textsize"] = textsize,
		["font"] = font,
		["theme"] = {
			["accent"] = color
		},
		["themeitems"] = {
			["accent"] = {
				["BackgroundColor3"] = {},
				["BorderColor3"] = {},
				["TextColor3"] = {}
			}
		}
	}
	--
	table.insert(window.themeitems["accent"]["BackgroundColor3"],outline)
	--
	local toggled = true
	local cooldown = false
	local saved = UDim2.new(0,0,0,0)
	--
	uis.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.Keyboard then
			if Input.KeyCode == window.key then
				if cooldown == false then
					if toggled then
						cooldown = true
						toggled = not toggled
						saved = outline.Position
						local xx,yy = 0,0
						local xxx,yyy = 0,0
						--
						if (outline.AbsolutePosition.X+(outline.AbsoluteSize.X/2)) < (cam.ViewportSize.X/2) then
							xx = -3
						else
							xx = 3
						end
						--
						if window.y then
							if (outline.AbsolutePosition.Y+(outline.AbsoluteSize.Y/2)) < (cam.ViewportSize.Y/2) then
								yy = -3
							else
								yy = 3
							end
						else
							yy = saved.Y.Scale
							yyy = saved.Y.Offset
						end
						--
						if window.x == false and window.y == false then
							screen.Enabled = false
						else
							ts:Create(outline, TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In), {Position = UDim2.new(xx,xxx,yy,yyy)}):Play()
						end
						wait(0.5)
						cooldown = false
					else
						cooldown = true
						toggled = not toggled
						if window.x == false and window.y == false then
							screen.Enabled = true
						else
							ts:Create(outline, TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {Position = saved}):Play()
						end
						wait(0.5)
						cooldown = false
					end
				end
			end
		end
	end)
	--
	window.labels[#window.labels+1] = titletext
	-- // metatable indexing + return
	setmetatable(window, library)
	return window
end
--
function library:watermark()
	local watermark = {}
	--
	local outline = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundColor3 = self.theme.accent,
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(0,300,0,26),
			Position = UDim2.new(1,-10,0,10),
			ZIndex = 9900,
			Visible = false,
			Parent = self.screen
		}
	)
	--
	table.insert(self.themeitems["accent"]["BackgroundColor3"],outline)
	--
	local outline2 = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(1,-4,1,-4),
			Position = UDim2.new(0.5,0,0.5,0),
			ZIndex = 9901,
			Parent = outline
		}
	)
	--
	local indent = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0.5,0,0.5,0),
			ZIndex = 9902,
			Parent = outline2
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,1,0),
			Position = UDim2.new(0.5,0,0,0),
			Font = self.font,
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextXAlignment = "Left",
			TextSize = self.textsize,
			TextStrokeTransparency = 0,
			ZIndex = 9903,
			Parent = indent
		}
	)
	--
	local con
	con = title:GetPropertyChangedSignal("TextBounds"):Connect(function()
		outline.Size = UDim2.new(0,title.TextBounds.X+20,0,26)
	end)
	--
	watermark = {
		["outline"] = outline,
		["outline2"] = outline2,
		["indent"] = indent,
		["title"] = title,
		["connection"] = con
	}
	--
	self.labels[#self.labels+1] = title
	--
	setmetatable(watermark,watermarks)
	return watermark
end
--
function watermarks:update(content)
	local content = content or {}
	local watermark = self
	--
	local text = ""
	--
	for i,v in pairs(content) do
		text = text..i..": "..v.."  "
	end
	--
	text = text:sub(0, -3)
	--
	watermark.title.Text = text
end
--
function watermarks:updateside(side)
	side = utility.removespaces(tostring(side):lower())
	--
	local sides = {
		topright = {
			AnchorPoint = Vector2.new(1,0),
			Position = UDim2.new(1,-10,0,10)
		},
		topleft = {
			AnchorPoint = Vector2.new(0,0),
			Position = UDim2.new(0,10,0,10)
		},
		bottomright = {
			AnchorPoint = Vector2.new(1,1),
			Position = UDim2.new(1,-10,1,-10)
		},
		bottomleft = {
			AnchorPoint = Vector2.new(0,1),
			Position = UDim2.new(0,10,1,-10)
		}
	}
	--
	if sides[side] then
		self.outline.AnchorPoint = sides[side].AnchorPoint
		self.outline.Position = sides[side].Position
	end
end
--
function library:loader(props)
	local name = props.name or props.Name or props.LoaderName or props.Loadername or props.loaderName or props.loadername or "Loader"
	local scriptname = props.scriptname or props.Scriptname or props.ScriptName or props.scriptName or "Universal"
	local closed = props.close or props.Close or props.closecallback or props.Closecallback or props.CloseCallback or props.closeCallback or function()end
	local logedin = props.login or props.Login or props.logincallback or props.Logincallback or props.LoginCallback or props.loginCallback or function()end
	local loader = {}
	--
	local screen = utility.new(
		"ScreenGui",
		{
			Name = tostring(math.random(0,999999))..tostring(math.random(0,999999)),
			DisplayOrder = 9999,
			ResetOnSpawn = false,
			ZIndexBehavior = "Global",
			Parent = cre
		}
	)
        if (check_exploit == "Synapse" and syn.request) then
	syn.protect_gui(screen)
        end
	--
	local outline = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(168, 52, 235),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(0,300,0,90),
			Position = UDim2.new(0.5,0,0.5,0),
			ZIndex = 9900,
			Visible = false,
			Parent = screen
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(1,-4,1,-4),
			Position = UDim2.new(0.5,0,0.5,0),
			ZIndex = 9901,
			Parent = outline
		}
	)
	--
	local indent = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0.5,0,0.5,0),
			ZIndex = 9902,
			Parent = outline2
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,0,20),
			Position = UDim2.new(0.5,0,0,0),
			Font = "RobotoMono",
			Text = name,
			TextColor3 = Color3.fromRGB(168, 52, 235),
			TextXAlignment = "Center",
			TextSize = 12,
			TextStrokeTransparency = 0,
			ZIndex = 9903,
			Parent = indent
		}
	)
	--
	local scripttitle = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,0,20),
			Position = UDim2.new(0.5,0,0,20),
			Font = "RobotoMono",
			Text = "Script: "..scriptname,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = "Center",
			TextSize = 12,
			TextStrokeTransparency = 0,
			ZIndex = 9903,
			Parent = indent
		}
	)
	--
	local makebutton = function(name,parent)
		local button_holder = utility.new(
			"Frame",
			{
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 9904,
				Parent = parent
			}
		)
		--
		local button_outline = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 9905,
				Parent = button_holder
			}
		)
		--
		local button_outline2 = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(56, 56, 56),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 9906,
				Parent = button_outline
			}
		)
		--
		local button_color = utility.new(
			"Frame",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderSizePixel = 0,
				Size = UDim2.new(1,0,0,0),
				Position = UDim2.new(0,0,0,0),
				ZIndex = 9907,
				Parent = button_outline2
			}
		)
		--
		utility.new(
			"UIGradient",
			{
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
				Rotation = 90,
				Parent = button_color
			}
		)
		--
		local button_button = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,1,0),
				Position = UDim2.new(0,0,0,0),
				Text = name,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = 12,
				TextStrokeTransparency = 0,
				Font = "RobotoMono",
				ZIndex = 9908,
				Parent = button_holder
			}
		)
		--
		return {button_holder,button_outline,button_button}
	end
	--
	local close = makebutton("close",indent)
	local login = makebutton("login",indent)
	--
	close[1].AnchorPoint = Vector2.new(0.5,0)
	close[1].Size = UDim2.new(0.5,0,0,20)
	close[1].Position = UDim2.new(0.5,0,0,40)
	--
	login[1].AnchorPoint = Vector2.new(0.5,0)
	login[1].Size = UDim2.new(0.5,0,0,20)
	login[1].Position = UDim2.new(0.5,0,0,62)
	--
	close[3].MouseButton1Down:Connect(function()
		close[2].BorderColor3 = Color3.fromRGB(168, 52, 235)
		outline:TweenPosition(UDim2.new(-1.5,0,0.5,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.75,true)
		closed()
		wait(0.05)
		close[2].BorderColor3 = Color3.fromRGB(12,12,12)
		wait(0.7)
		screen:Remove()
	end)
	--
	login[3].MouseButton1Down:Connect(function()
		login[2].BorderColor3 = Color3.fromRGB(168, 52, 235)
		outline:TweenPosition(UDim2.new(1.5,0,0.5,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.75,true)
		logedin()
		wait(0.05)
		login[2].BorderColor3 = Color3.fromRGB(12,12,12)
		wait(0.7)
		screen:Remove()
	end)
	--
	loader = {
		["outline"] = outline,
		["outline2"] = outline2,
		["indent"] = indent,
		["title"] = title
	}
	--
	setmetatable(loader,loaders)
	return loader
end
--
function loaders:toggle()
	self.outline.Visible = true
end
--
function watermarks:toggle(bool)
	local watermark = self
	--
	watermark.outline.Visible = bool
end
--
function library:saveconfig()
	local cfg = {}
	--
	for i,v in pairs(self.pointers) do
		cfg[i] = {}
		for c,d in pairs(v) do
			cfg[i][c] = {}
			for x,z in pairs(d) do
				if typeof(z.current) == "Color3" then
					cfg[i][c][x] = {z.current.R,z.current.G,z.current.B}
				else
					cfg[i][c][x] = z.current
				end
			end
		end
	end
	--
	return hs:JSONEncode(cfg)
end
--
function library:loadconfig(cfg)
	local cfg = hs:JSONDecode(readfile(cfg))
	for i,v in pairs(cfg) do
		for c,d in pairs(v) do
			for x,z in pairs(d) do
				if z ~= nil then
					if self.pointers[i] ~= nil and self.pointers[i][c] ~= nil and self.pointers[i][c][x] ~= nil then
						self.pointers[i][c][x]:set(z)
					end
				end
			end
		end
	end
end
--
function library:settheme(theme,color)
	local window = self
	--
	if window.theme[theme] then
		window.theme[theme] = color
	end
	--
	if window.themeitems[theme] then
		for i,v in pairs(window.themeitems[theme]) do
			for z,x in pairs(v) do
				x[i] = color
			end
		end
	end
end
--
function library:setkey(key)
	if typeof(key) == "EnumItem" then
		local window = self
		window.key = key
	end
end
--
function library:settoggle(side,bool)
	if side == "x" then
		self.x = bool
	else
		self.y = bool
	end
end
--
function library:setfont(font)
	if font ~= nil then
		local window = self
		for i,v in pairs(window.labels) do
			if v ~= nil then
				v.Font = font
			end
		end
	end
end
--
function library:settextsize(size)
	if size ~= nil then
		local window = self
		for i,v in pairs(window.labels) do
			if v ~= nil then
				v.TextSize = size
			end
		end
	end
end
--
function library:page(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	-- // variables
	local page = {}
	-- // main
	local tabbutton = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0,75,1,0),
			Parent = self.tabsbuttons
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = tabbutton
		}
	)
	--
	local button = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = tabbutton
		}
	)
	--
	local r_line = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 0,
			Size = UDim2.new(0,1,0,1),
			Position = UDim2.new(1,0,1,1),
			ZIndex = 2,
			Parent = outline
		}
	)
	--
	local l_line = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 0,
			Size = UDim2.new(0,1,0,1),
			Position = UDim2.new(0,0,1,1),
			ZIndex = 2,
			Parent = outline
		}
	)
	--
	local line = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,0,2),
			Position = UDim2.new(0,0,1,0),
			ZIndex = 2,
			Parent = outline
		}
	)
	--
	local label = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,0),
			Font = self.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.textsize,
			TextStrokeTransparency = 0,
			Parent = outline
		}
	)
	--
	local pageholder = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-20,1,-20),
			Position = UDim2.new(0.5,0,0.5,0),
			Visible = false,
			Parent = self.tabs
		}
	)
	--
	local left = utility.new(
		"ScrollingFrame",
		{
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0.5,-5,1,0),
			Position = UDim2.new(0,0,0,0),
			AutomaticCanvasSize = "Y",
			CanvasSize = UDim2.new(0,0,0,0),
			ScrollBarImageTransparency = 0,
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			VerticalScrollBarInset = "ScrollBar",
			VerticalScrollBarPosition = "Right",
			Parent = pageholder
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Padding = UDim.new(0,10),
			Parent = left
		}
	)
	--
	local right = utility.new(
		"ScrollingFrame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0.5,-5,1,0),
			Position = UDim2.new(1,0,0,0),
			AutomaticCanvasSize = "Y",
			CanvasSize = UDim2.new(0,0,0,0),
			ScrollBarImageTransparency = 0,
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			VerticalScrollBarInset = "ScrollBar",
			VerticalScrollBarPosition = "Right",
			Parent = pageholder
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Padding = UDim.new(0,10),
			Parent = right
		}
	)
	-- // page tbl
	page = {
		["library"] = self,
		["outline"] = outline,
		["r_line"] = r_line,
		["l_line"] = l_line,
		["line"] = line,
		["page"] = pageholder,
		["left"] = left,
		["right"] = right,
		["open"] = false,
		["pointers"] = {}
	}
	--
	table.insert(self.pages,page)
	--
	button.MouseButton1Down:Connect(function()
		if page.open == false then
			for i,v in pairs(self.pages) do
				if v ~= page then
					if v.open then
						v.page.Visible = false
						v.open = false
						v.outline.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
						v.line.Size = UDim2.new(1,0,0,2)
						v.line.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					end
				end
			end
			--
			self:closewindows()
			--
			page.page.Visible = true
			page.open = true
			page.outline.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			page.line.Size = UDim2.new(1,0,0,3)
			page.line.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		self.pointers[tostring(pointer)] = page.pointers
	end
	--
	self.labels[#self.labels+1] = label
	-- // metatable indexing + return
	setmetatable(page, pages)
	return page
end
--
function pages:openpage()
	local page = self
	--
	if page.open == false then
		for i,v in pairs(page.library.pages) do
			if v ~= page then
				if v.open then
					v.page.Visible = false
					v.open = false
					v.outline.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
					v.line.Size = UDim2.new(1,0,0,2)
					v.line.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
				end
			end
		end
		--
		page.page.Visible = true
		page.open = true
		page.outline.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		page.line.Size = UDim2.new(1,0,0,3)
		page.line.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end
end
--
function pages:section(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local side = props.side or props.Side or props.sectionside or props.Sectionside or props.SectionSide or props.sectionSide or "left"
	local size = props.size or props.Size or props.yaxis or props.yAxis or props.YAxis or props.Yaxis or 200
	side = side:lower()
	-- // variables
	local section = {}
	-- // main
	local sectionholder = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,size),
			Parent = self[side]
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = sectionholder
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundColor3 = self.library.theme.accent,
			BorderSizePixel = 0,
			Size = UDim2.new(1,-2,0,1),
			Position = UDim2.new(0.5,0,0,0),
			Parent = outline
		}
	)
	--
	table.insert(self.library.themeitems["accent"]["BackgroundColor3"],color)
	--
	local content = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,-12,1,-25),
			Position = UDim2.new(0.5,0,1,-5),
			ClipsDescendants = false,
			Parent = outline
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-5,0,20),
			Position = UDim2.new(0,5,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = outline
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Padding = UDim.new(0,5),
			Parent = content
		}
	)
	-- // section tbl
	section = {
		["library"] = self.library,
		["sectionholder"] = sectionholder,
		["color"] = color,
		["content"] = content,
		["pointers"] = {}
	}
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = section.pointers
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	-- // metatable indexing + return
	setmetatable(section, sections)
	return section
end
--
function pages:multisection(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local side = props.side or props.Side or props.sectionside or props.Sectionside or props.SectionSide or props.sectionSide or "left"
	local size = props.size or props.Size or props.yaxis or props.yAxis or props.YAxis or props.Yaxis or 200
	side = side:lower()
	-- // variables
	local multisection = {}
	-- // main
	local sectionholder = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,size),
			Parent = self[side]
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = sectionholder
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundColor3 = self.library.theme.accent,
			BorderSizePixel = 0,
			Size = UDim2.new(1,-2,0,1),
			Position = UDim2.new(0.5,0,0,0),
			Parent = outline
		}
	)
	--
	table.insert(self.library.themeitems["accent"]["BackgroundColor3"],color)
	--
	local tabsholder = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0,1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,-15),
			Position = UDim2.new(0,0,1,0),
			Parent = outline
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-5,0,20),
			Position = UDim2.new(0,5,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = outline
		}
	)
	--
	local buttons = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,-6,0,20),
			Position = UDim2.new(0.5,0,0,5),
			Parent = tabsholder
		}
	)
	--
	local tabs = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,1),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,-6,1,-27),
			Position = UDim2.new(0.5,0,1,-3),
			Parent = tabsholder
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Horizontal",
			Padding = UDim.new(0,2),
			Parent = buttons
		}
	)
	--
	local tabs_outline = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = tabs
		}
	)
	-- // section tbl
	multisection = {
		["library"] = self.library,
		["sectionholder"] = sectionholder,
		["color"] = color,
		["tabsholder"] = tabsholder,
		["mssections"] = {},
		["buttons"] = buttons,
		["tabs"] = tabs,
		["tabs_outline"] = tabs_outline,
		["pointers"] = {}
	}
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = multisection.pointers
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	-- // metatable indexing + return
	setmetatable(multisection,multisections)
	return multisection
end
--
function multisections:section(props)
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	-- // variables
	local mssection = {}
	-- // main
	local tabbutton = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0,60,0,20),
			Parent = self.buttons
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = tabbutton
		}
	)
	--
	local button = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = tabbutton
		}
	)
	--
	local r_line = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 0,
			Size = UDim2.new(0,1,0,1),
			Position = UDim2.new(1,0,1,1),
			ZIndex = 2,
			Parent = outline
		}
	)
	--
	local l_line = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 0,
			Size = UDim2.new(0,1,0,1),
			Position = UDim2.new(0,0,1,1),
			ZIndex = 2,
			Parent = outline
		}
	)
	--
	local line = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,0,2),
			Position = UDim2.new(0,0,1,0),
			ZIndex = 2,
			Parent = outline
		}
	)
	--
	local label = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			Parent = outline
		}
	)
	--
	local content = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,-6,1,-27),
			Position = UDim2.new(0.5,0,1,-3),
			Parent = self.tabs_outline
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Padding = UDim.new(0,5),
			Parent = content
		}
	)
	-- // mssection tbl
	mssection = {
		["library"] = self.library,
		["outline"] = outline,
		["r_line"] = r_line,
		["l_line"] = l_line,
		["line"] = line,
		["content"] = content,
		["open"] = false,
		["pointers"] = {}
	}
	--
	table.insert(self.mssections,mssection)
	--
	button.MouseButton1Down:Connect(function()
		if mssection.open == false then
			for i,v in pairs(self.mssections) do
				if v ~= mssection then
					if v.open then
						v.page.Visible = false
						v.open = false
						v.outline.BackgroundColor3 = Color3.fromRGB(31, 31 ,31)
						v.line.Size = UDim2.new(1,0,0,2)
						v.line.BackgroundColor3 = Color3.fromRGB(31, 31 ,31)
					end
				end
			end
			--
			mssection.library:closewindows()
			--
			mssection.content.Visible = true
			mssection.open = true
			mssection.outline.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
			mssection.line.Size = UDim2.new(1,0,0,3)
			mssection.line.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = mssection.pointers
		end
	end
	--
	self.library.labels[#self.library.labels+1] = label
	-- // metatable indexing + return
	setmetatable(mssection,mssections)
	return mssection
end
--
function sections:toggle(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or props.toggle or props.Toggle or props.toggled or props.Toggled or false
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	-- // variables
	local toggle = {}
	-- // main
	local toggleholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0,15,0,15),
			Parent = toggleholder
		}
	)
	--
	local button = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = toggleholder
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-20,1,0),
			Position = UDim2.new(0,20,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = toggleholder
		}
	)
	--
	local col = Color3.fromRGB(20, 20, 20)
	if def then
		col = self.library.theme.accent
	end
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = col,
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = outline
		}
	)
	if def then
		table.insert(self.library.themeitems["accent"]["BackgroundColor3"],color)
	end
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	-- // toggle tbl
	toggle = {
		["library"] = self.library,
		["toggleholder"] = toggleholder,
		["title"] = title,
		["color"] = color,
		["callback"] = callback,
		["current"] = def
	}
	--
	button.MouseButton1Down:Connect(function()
		if toggle.current then
			toggle.callback(false)
			toggle.color.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			local find = table.find(self.library.themeitems["accent"]["BackgroundColor3"],toggle.color)
			if find then
				table.remove(self.library.themeitems["accent"]["BackgroundColor3"],find)
			end
			toggle.current = false
		else
			toggle.callback(true)
			toggle.color.BackgroundColor3 = self.library.theme.accent
			table.insert(self.library.themeitems["accent"]["BackgroundColor3"],toggle.color)
			toggle.current = true
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = toggle
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	-- // metatable indexing + return
	setmetatable(toggle, toggles)
	return toggle
end
--
function toggles:set(bool)
	if bool ~= nil then
		local toggle = self
		toggle.callback(bool)
		toggle.current = bool
		if bool then
			toggle.color.BackgroundColor3 = self.library.theme.accent
			table.insert(self.library.themeitems["accent"]["BackgroundColor3"],toggle.color)
		else
			toggle.color.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			local find = table.find(self.library.themeitems["accent"]["BackgroundColor3"],toggle.color)
			if find then
				table.remove(self.library.themeitems["accent"]["BackgroundColor3"],find)
			end
		end
	end
end
--
function sections:button(props)
	-- // properties
	local name = props.name or props.Name or "new button"
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	-- // variables
	local button = {}
	-- // main
	local buttonholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,20),
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = buttonholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = outline
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Parent = outline2
		}
	)
	--
	local gradient = utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local buttonpress = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			Font = self.library.font,
			Parent = buttonholder
		}
	)
	--
	buttonpress.MouseButton1Down:Connect(function()
		callback()
		outline.BorderColor3 = self.library.theme.accent
		table.insert(self.library.themeitems["accent"]["BorderColor3"],outline)
		wait(0.05)
		outline.BorderColor3 = Color3.fromRGB(12, 12, 12)
		local find = table.find(self.library.themeitems["accent"]["BorderColor3"],outline)
		if find then
			table.remove(self.library.themeitems["accent"]["BorderColor3"],find)
		end
	end)
	-- // button tbl
	button = {
		["library"] = self.library
	}
	--
	self.library.labels[#self.library.labels+1] = buttonpress
	-- // metatable indexing + return
	setmetatable(button, buttons)
	return button
end
--
function sections:slider(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or 0
	local max = props.max or props.Max or props.maximum or props.Maximum or 100
	local min = props.min or props.Min or props.minimum or props.Minimum or 0
	local rounding = props.rounding or props.Rounding or props.round or props.Round or props.decimals or props.Decimals or false
	local ticking = props.tick or props.Tick or props.ticking or props.Ticking or false
	local measurement = props.measurement or props.Measurement or props.digit or props.Digit or props.calc or props.Calc or ""
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	def = math.clamp(def,min,max)
	-- // variables
	local slider = {}
	-- // main
	local sliderholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,25),
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,12),
			Position = UDim2.new(0,0,0,15),
			Parent = sliderholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = outline
		}
	)	
	--
	local value = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,2),
			Position = UDim2.new(0,0,0.5,0),
			Font = self.library.font,
			Text = def..measurement.."/"..max..measurement,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			ZIndex = 3,
			Parent = outline
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Parent = outline2
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local slide = utility.new(
		"Frame",
		{
			BackgroundColor3 = self.library.theme.accent,
			BorderSizePixel = 0,
			Size = UDim2.new((1 / color.AbsoluteSize.X) * (color.AbsoluteSize.X / (max - min) * (def - min)),0,1,0),
			ZIndex = 2,
			Parent = outline
		}
	)
	table.insert(self.library.themeitems["accent"]["BackgroundColor3"],slide)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = slide
		}
	)
	--
	local sliderbutton = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = sliderholder
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = sliderholder
		}
	)
	-- // slider tbl
	slider = {
		["library"] = self.library,
		["outline"] = outline,
		["sliderbutton"] = sliderbutton,
		["title"] = title,
		["value"] = value,
		["slide"] = slide,
		["color"] = color,
		["max"] = max,
		["min"] = min,
		["current"] = def,
		["measurement"] = measurement,
		["tick"] = ticking,
		["rounding"] = rounding,
		["callback"] = callback
	}
	--
	local function slide()
		local size = math.clamp(plr:GetMouse().X - slider.color.AbsolutePosition.X ,0 ,slider.color.AbsoluteSize.X)
		local result = (slider.max - slider.min) / slider.color.AbsoluteSize.X * size + slider.min
		if slider.rounding then
			local newres = math.floor(result)
			value.Text = newres..slider.measurement.."/"..slider.max..slider.measurement
			slider.current = newres
			slider.callback(newres)
			if slider.tick then
				slider.slide:TweenSize(UDim2.new((1 / slider.color.AbsoluteSize.X) * (slider.color.AbsoluteSize.X / (slider.max - slider.min) * (newres - slider.min)) ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
			else
				slider.slide:TweenSize(UDim2.new((1 / slider.color.AbsoluteSize.X) * size ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
			end
		else
			local newres = utility.round(result ,2)
			value.Text = newres..slider.measurement.."/"..slider.max..slider.measurement
			slider.current = newres
			slider.callback(newres)
			if slider.tick then
				slider.slide:TweenSize(UDim2.new((1 / slider.color.AbsoluteSize.X) * (slider.color.AbsoluteSize.X / (slider.max - slider.min) * (newres - slider.min)) ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
			else
				slider.slide:TweenSize(UDim2.new((1 / slider.color.AbsoluteSize.X) * size ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
			end
		end
	end
	--
	sliderbutton.MouseButton1Down:Connect(function()
		slider.holding = true
		slide()
		table.insert(self.library.themeitems["accent"]["BorderColor3"],outline)
		outline.BorderColor3 = self.library.theme.accent
	end)
	--
	uis.InputChanged:Connect(function()
		if slider.holding then
			slide()
		end
	end)
	--
	uis.InputEnded:Connect(function(Input)
		if Input.UserInputType.Name == 'MouseButton1' and slider.holding then
			slider.holding = false
			outline.BorderColor3 = Color3.fromRGB(12, 12, 12)
			local find = table.find(self.library.themeitems["accent"]["BorderColor3"],outline)
			if find then
				table.remove(self.library.themeitems["accent"]["BorderColor3"],find)
			end
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = slider
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	self.library.labels[#self.library.labels+1] = value
	-- // metatable indexing + return
	setmetatable(slider, sliders)
	return slider
end
--
function sliders:set(value)
	local size = math.clamp((self.color.AbsoluteSize.X / (self.max - self.min) * (value - self.min)) ,0 ,self.color.AbsoluteSize.X)
	local result = value
	if self.rounding then
		local newres = math.floor(result)
		self.value.Text = newres..self.measurement.."/"..self.max..self.measurement
		self.current = newres
		self.callback(newres)
		if self.tick then
			self.slide:TweenSize(UDim2.new((1 / self.color.AbsoluteSize.X) * (self.color.AbsoluteSize.X / (self.max - self.min) * (newres - self.min)) ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
		else
			self.slide:TweenSize(UDim2.new((1 / self.color.AbsoluteSize.X) * size ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
		end
	else
		local newres = utility.round(result ,2)
		self.value.Text = newres..self.measurement.."/"..self.max..self.measurement
		self.current = newres
		self.callback(newres)
		if self.tick then
			self.slide:TweenSize(UDim2.new((1 / self.color.AbsoluteSize.X) * (self.color.AbsoluteSize.X / (self.max - self.min) * (newres - self.min)) ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
		else
			self.slide:TweenSize(UDim2.new((1 / self.color.AbsoluteSize.X) * size ,0 ,1 ,0) ,Enum.EasingDirection.Out ,Enum.EasingStyle.Quad ,0.15 ,true)
		end
	end
end
--
function library:closewindows(ignore)
	local window = self
	--
	for i,v in pairs(window.dropdowns) do
		if v ~= ignore then
			if v.open then
				v.optionsholder.Visible = false
				v.indicator.Text = "-"
				v.open = false
			end
		end
	end
	--
	for i,v in pairs(window.multiboxes) do
		if v ~= ignore then
			if v.open then
				v.optionsholder.Visible = false
				v.indicator.Text = "-"
				v.open = false
			end
		end
	end
	--
	for i,v in pairs(window.buttonboxs) do
		if v ~= ignore then
			if v.open then
				v.optionsholder.Visible = false
				v.indicator.Text = "-"
				v.open = false
			end
		end
	end
	--
	for i,v in pairs(window.colorpickers) do
		if v ~= ignore then
			if v.open then
				v.cpholder.Visible = false
				v.open = false
			end
		end
	end
end
--
function sections:dropdown(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or ""
	local max = props.max or props.Max or props.maximum or props.Maximum or 12
	local options = props.options or props.Options or props.Settings or props.settings or {}
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	-- // variables
	local dropdown = {}
	-- // main
	local dropdownholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,35),
			ZIndex = 2,
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,15),
			Parent = dropdownholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline2
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local value = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-20,1,0),
			Position = UDim2.new(0,5,0,0),
			Font = self.library.font,
			Text = def,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			ClipsDescendants = true,
			Parent = outline
		}
	)
	--
	local indicator = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,1,0),
			Position = UDim2.new(0.5,0,0,0),
			Font = self.library.font,
			Text = "+",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Right",
			ClipsDescendants = true,
			Parent = outline
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = dropdownholder
		}
	)
	--
	local dropdownbutton = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = dropdownholder
		}
	)
	--
	local optionsholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,34),
			Visible = false,
			ZIndex = 50,
			Parent = dropdownholder
		}
	)
	--
	-- max = max visible rows; list scrolls for more options
	max = math.clamp(tonumber(max) or 8, 1, 30)
	local visibleRows = math.clamp(#options, 1, max)
	local listHeight = (18 * visibleRows) + 4
	optionsholder.Size = UDim2.new(1, 0, 0, listHeight)
	--
	local optionsoutline = utility.new(
		"ScrollingFrame",
		{
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			ClipsDescendants = true,
			CanvasSize = UDim2.new(0,0,0,18*math.max(#options,1)),
			AutomaticCanvasSize = Enum.AutomaticSize.None,
			ScrollBarImageTransparency = 0,
			ScrollBarImageColor3 = Color3.fromRGB(255,255,255),
			ScrollBarThickness = 4,
			VerticalScrollBarInset = "ScrollBar",
			VerticalScrollBarPosition = "Right",
			ZIndex = 51,
			Parent = optionsholder
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Parent = optionsoutline
		}
	)
	-- // dropdown tbl
	dropdown = {
		["library"] = self.library,
		["optionsholder"] = optionsholder,
		["optionsoutline"] = optionsoutline,
		["indicator"] = indicator,
		["options"] = options,
		["max"] = max,
		["title"] = title,
		["value"] = value,
		["open"] = false,
		["titles"] = {},
		["buttons"] = {},
		["current"] = def,
		["callback"] = callback
	}
	--
	table.insert(dropdown.library.dropdowns,dropdown)
	--
	for i,v in pairs(options) do
		local ddoptionbutton = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,0,18),
				Text = "",
				ZIndex = 6,
				Parent = optionsoutline
			}
		)
		--
		local ddoptiontitle = utility.new(
			"TextLabel",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-10,1,0),
				Position = UDim2.new(0.5,0,0,0),
				Font = self.library.font,
				Text = v,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				TextXAlignment = "Left",
				ClipsDescendants = true,
				ZIndex = 6,
				Parent = ddoptionbutton
			}
		)
		--
		self.library.labels[#self.library.labels+1] = ddoptiontitle
		--
		table.insert(dropdown.titles,ddoptiontitle)
		table.insert(dropdown.buttons,ddoptionbutton)
		--
		if v == dropdown.current then ddoptiontitle.TextColor3 = self.library.theme.accent end
		--
		ddoptionbutton.MouseButton1Down:Connect(function()
			optionsholder.Visible = false
			dropdown.open = false
			indicator.Text = "+"
			for z,x in pairs(dropdown.titles) do
				if x.TextColor3 == self.library.theme.accent then
					x.TextColor3 = Color3.fromRGB(255,255,255)
				end
			end
			dropdown.current = v
			dropdown.value.Text = v
			ddoptiontitle.TextColor3 = self.library.theme.accent
			table.insert(self.library.themeitems["accent"]["TextColor3"],ddoptiontitle)
			dropdown.callback(v)
		end)
	end
	--
	dropdownbutton.MouseButton1Down:Connect(function()
		dropdown.library:closewindows(dropdown)
		for i,v in pairs(dropdown.titles) do
			if v.Text == dropdown.current then
				v.TextColor3 = dropdown.library.theme.accent
			else
				v.TextColor3 = Color3.fromRGB(255,255,255)
			end
		end
		optionsholder.Visible = not dropdown.open
		dropdown.open = not dropdown.open
		if dropdown.open then
			indicator.Text = "-"
		else
			indicator.Text = "+"
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = dropdown
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	self.library.labels[#self.library.labels+1] = value
	-- // metatable indexing + return
	setmetatable(dropdown, dropdowns)
	return dropdown
end
--
function sections:buttonbox(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or ""
	local max = props.max or props.Max or props.maximum or props.Maximum or 4
	local options = props.options or props.Options or props.Settings or props.settings or {}
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	-- // variables
	local buttonbox = {}
	-- // main
	local buttonboxholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,35),
			ZIndex = 2,
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,15),
			Parent = buttonboxholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline2
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local indicator = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,1,0),
			Position = UDim2.new(0.5,0,0,0),
			Font = self.library.font,
			Text = "+",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Right",
			ClipsDescendants = true,
			Parent = outline
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = buttonboxholder
		}
	)
	--
	local buttonboxbutton = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = buttonboxholder
		}
	)
	--
	local optionsholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,34),
			Visible = false,
			Parent = buttonboxholder
		}
	)
	--
	local size = #options
	--
	size = math.clamp(size,1,max)
	--
	local optionsoutline = utility.new(
		"ScrollingFrame",
		{
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,size,2),
			Position = UDim2.new(0,0,0,0),
			ClipsDescendants = true,
			CanvasSize = UDim2.new(0,0,0,18*#options),
			ScrollBarImageTransparency = 0.25,
			ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
			ScrollBarThickness = 5,
			VerticalScrollBarInset = "ScrollBar",
			VerticalScrollBarPosition = "Right",
			ZIndex = 5,
			Parent = optionsholder
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Parent = optionsoutline
		}
	)
	-- // buttonbox tbl
	buttonbox = {
		["library"] = self.library,
		["optionsholder"] = optionsholder,
		["indicator"] = indicator,
		["options"] = options,
		["title"] = title,
		["open"] = false,
		["titles"] = {},
		["current"] = def,
		["callback"] = callback
	}
	--
	table.insert(buttonbox.library.buttonboxs,buttonbox)
	--
	for i,v in pairs(options) do
		local bboptionbutton = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,0,18),
				Text = "",
				ZIndex = 6,
				Parent = optionsoutline
			}
		)
		--
		local bboptiontitle = utility.new(
			"TextLabel",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-10,1,0),
				Position = UDim2.new(0.5,0,0,0),
				Font = self.library.font,
				Text = v,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				TextXAlignment = "Left",
				ClipsDescendants = true,
				ZIndex = 6,
				Parent = bboptionbutton
			}
		)
		--
		self.library.labels[#self.library.labels+1] = bboptiontitle
		--
		table.insert(buttonbox.titles,bboptiontitle)
		--
		bboptionbutton.MouseButton1Down:Connect(function()
			optionsholder.Visible = false
			buttonbox.open = false
			indicator.Text = "+"
			buttonbox.current = v
			buttonbox.callback(v)
		end)
	end
	--
	buttonboxbutton.MouseButton1Down:Connect(function()
		buttonbox.library:closewindows(buttonbox)
		optionsholder.Visible = not buttonbox.open
		buttonbox.open = not buttonbox.open
		if buttonbox.open then
			indicator.Text = "-"
		else
			indicator.Text = "+"
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = buttonbox
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	-- // metatable indexing + return
	setmetatable(buttonbox, buttonboxs)
	return buttonbox
end
--

function dropdowns:Refresh(newOptions)
	local dropdown = self
	newOptions = newOptions or {}
	dropdown.options = newOptions

	for _, b in pairs(dropdown.buttons or {}) do
		pcall(function() b:Destroy() end)
	end
	dropdown.buttons = {}
	dropdown.titles = {}

	local max = dropdown.max or 12
	max = math.clamp(tonumber(max) or 12, 1, 30)
	local visibleRows = math.clamp(#newOptions, 1, max)
	local listHeight = (18 * visibleRows) + 4
	if dropdown.optionsholder then
		dropdown.optionsholder.Size = UDim2.new(1, 0, 0, listHeight)
	end
	if dropdown.optionsoutline then
		dropdown.optionsoutline.CanvasSize = UDim2.new(0, 0, 0, 18 * math.max(#newOptions, 1))
	end

	local parent = dropdown.optionsoutline
	if not parent then return end

	for _, v in pairs(newOptions) do
		local ddoptionbutton = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,0,18),
				Text = "",
				ZIndex = 6,
				Parent = parent
			}
		)
		local ddoptiontitle = utility.new(
			"TextLabel",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-10,1,0),
				Position = UDim2.new(0.5,0,0,0),
				Font = dropdown.library.font,
				Text = v,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = dropdown.library.textsize,
				TextStrokeTransparency = 0,
				TextXAlignment = "Left",
				ClipsDescendants = true,
				ZIndex = 6,
				Parent = ddoptionbutton
			}
		)
		table.insert(dropdown.titles, ddoptiontitle)
		table.insert(dropdown.buttons, ddoptionbutton)
		if v == dropdown.current then
			ddoptiontitle.TextColor3 = dropdown.library.theme.accent
		end
		ddoptionbutton.MouseButton1Down:Connect(function()
			dropdown.optionsholder.Visible = false
			dropdown.open = false
			dropdown.indicator.Text = "+"
			for _, x in pairs(dropdown.titles) do
				x.TextColor3 = Color3.fromRGB(255,255,255)
			end
			dropdown.current = v
			dropdown.value.Text = v
			ddoptiontitle.TextColor3 = dropdown.library.theme.accent
			dropdown.callback(v)
		end)
	end

	local still = false
	for _, v in pairs(newOptions) do
		if v == dropdown.current then still = true break end
	end
	if not still and #newOptions > 0 then
		dropdown.current = newOptions[1]
		dropdown.value.Text = newOptions[1]
	elseif #newOptions == 0 then
		dropdown.value.Text = ""
	end
end
--
function dropdowns:set(value)
	if value ~= nil then
		local dropdown = self
		if table.find(dropdown.options,value) then
			self.current = tostring(value)
			self.value.Text = tostring(value)
			self.callback(tostring(value))
			for z,x in pairs(dropdown.titles) do
				if x.Text == value then
					x.TextColor3 = dropdown.library.theme.accent
				else
					x.TextColor3 = Color3.fromRGB(255,255,255)
				end
			end
		end
	end
end
--
function sections:multibox(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or {}
	local max = props.max or props.Max or props.maximum or props.Maximum or 4
	local options = props.options or props.Options or props.Settings or props.settings or {}
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	local defstr = ""
	if #def > 1 then
		for i,v in pairs(def) do
			if i == #def then
				defstr = defstr..v
			else
				defstr = defstr..v..", "
			end
		end
	else
		for i,v in pairs(def) do
			defstr = defstr..v
		end
	end
	-- // variables
	local multibox = {}
	-- // main
	local multiboxholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,35),
			ZIndex = 2,
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,15),
			Parent = multiboxholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline2
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local value = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-20,1,0),
			Position = UDim2.new(0,5,0,0),
			Font = self.library.font,
			Text = defstr,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			ClipsDescendants = true,
			Parent = outline
		}
	)
	--
	local indicator = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,1,0),
			Position = UDim2.new(0.5,0,0,0),
			Font = self.library.font,
			Text = "+",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Right",
			ClipsDescendants = true,
			Parent = outline
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = multiboxholder
		}
	)
	--
	local dropdownbutton = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			Parent = multiboxholder
		}
	)
	--
	local optionsholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,34),
			Visible = false,
			Parent = multiboxholder
		}
	)
	--
	local size = #options
	--
	size = math.clamp(size,1,max)
	--
	local optionsoutline = utility.new(
		"ScrollingFrame",
		{
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,size,2),
			Position = UDim2.new(0,0,0,0),
			ClipsDescendants = true,
			CanvasSize = UDim2.new(0,0,0,18*#options),
			ScrollBarImageTransparency = 0.25,
			ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
			ScrollBarThickness = 5,
			VerticalScrollBarInset = "ScrollBar",
			VerticalScrollBarPosition = "Right",
			ZIndex = 5,
			Parent = optionsholder
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Parent = optionsoutline
		}
	)
	-- // dropdown tbl
	multibox = {
		["library"] = self.library,
		["indicator"] = indicator,
		["optionsholder"] = optionsholder,
		["options"] = options,
		["value"] = value,
		["open"] = false,
		["titles"] = {},
		["current"] = def,
		["callback"] = callback
	}
	--
	table.insert(multibox.library.multiboxes,multibox)
	--
	for i,v in pairs(options) do
		local ddoptionbutton = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,0,18),
				Text = "",
				ZIndex = 6,
				Parent = optionsoutline
			}
		)
		--
		local ddoptiontitle = utility.new(
			"TextLabel",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-10,1,0),
				Position = UDim2.new(0.5,0,0,0),
				Font = self.library.font,
				Text = v,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				TextXAlignment = "Left",
				ClipsDescendants = true,
				ZIndex = 6,
				Parent = ddoptionbutton
			}
		)
		--
		self.library.labels[#self.library.labels+1] = ddoptiontitle
		--
		table.insert(multibox.titles,ddoptiontitle)
		--
		for c,b in pairs(def) do if v == b then ddoptiontitle.TextColor3 = self.library.theme.accent end end
		--
		ddoptionbutton.MouseButton1Down:Connect(function()
			local find = table.find(multibox.current,v)
			if find == nil then
				table.insert(multibox.current,v)
				local str = ""
				if #multibox.current > 1 then
					for i,v in pairs(multibox.current) do
						if i == #multibox.current then
							str = str..v
						else
							str = str..v..", "
						end
					end
				else
					for i,v in pairs(multibox.current) do
						str = str..v
					end
				end
				value.Text = str
				ddoptiontitle.TextColor3 = self.library.theme.accent
				table.insert(self.library.themeitems["accent"]["TextColor3"],ddoptiontitle)
				multibox.callback(multibox.current)
			else
				table.remove(multibox.current,find)
				local str = ""
				if #multibox.current > 1 then
					for i,v in pairs(multibox.current) do
						if i == #multibox.current then
							str = str..v
						else
							str = str..v..", "
						end
					end
				else
					for i,v in pairs(multibox.current) do
						str = str..v
					end
				end
				value.Text = str
				ddoptiontitle.TextColor3 = Color3.fromRGB(255,255,255)
				multibox.callback(multibox.current)
			end
		end)
	end
	--
	dropdownbutton.MouseButton1Down:Connect(function()
		multibox.library:closewindows(multibox)
		for i,v in pairs(multibox.titles) do
			if v.TextColor3 ~= Color3.fromRGB(255,255,255) then
				v.TextColor3 = self.library.theme.accent
			end
		end
		optionsholder.Visible = not multibox.open
		multibox.open = not multibox.open
		if multibox.open then
			indicator.Text = "-"
		else
			indicator.Text = "+"
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = multibox
		end
	end
	--
	self.library.labels[#self.library.labels+1] = value
	self.library.labels[#self.library.labels+1] = title
	-- // metatable indexing + return
	setmetatable(multibox, multiboxs)
	return multibox
end
--
function buttonboxs:set(value)
	if value ~= nil then
		local dropdown = self
		if table.find(dropdown.options,value) then
			self.current = tostring(value)
			self.callback(tostring(value))
		end
	end
end
--
function multiboxs:set(tbl)
	if tbl then
		local multibox = self
		if typeof(tbl) == "table" then
			multibox.current = {}
			for i,v in pairs(tbl) do
				if table.find(multibox.options,v) then
					table.insert(multibox.current,v)
				end
			end
			--
			for i,v in pairs(multibox.titles) do
				if v.TextColor3 == multibox.library.theme.accent then
					v.TextColor3 = Color3.fromRGB(255,255,255)
				end
				if table.find(tbl,v.Text) then
					v.TextColor3 = multibox.library.theme.accent
				end
			end
			--
			local str = ""
			if #multibox.current > 1 then
				for i,v in pairs(multibox.current) do
					if i == #multibox.current then
						str = str..v
					else
						str = str..v..", "
					end
				end
			else
				for i,v in pairs(multibox.current) do
					str = str..v
				end
			end
			--
			multibox.value.Text = str
		end
	end
end
--
function sections:textbox(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or ""
	local placeholder = props.placeholder or props.Placeholder or props.placeHolder or props.PlaceHolder or props.placeholdertext or props.PlaceHolderText or props.PlaceHoldertext or props.placeHolderText or props.placeHoldertext or props.Placeholdertext or props.PlaceholderText or props.placeholderText or ""
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	-- // variables
	local textbox = {}
	-- // main
	local textboxholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,35),
			ZIndex = 2,
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,20),
			Position = UDim2.new(0,0,0,15),
			Parent = textboxholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = outline
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Parent = outline2
		}
	)
	--
	local gradient = utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local button = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			Font = self.library.font,
			Parent = textboxholder
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = textboxholder
		}
	)
	--
	local tbox = utility.new(
		"TextBox",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,0,20),
			Position = UDim2.new(0.5,0,0,15),
			PlaceholderText = placeholder,
			Text = def,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextTruncate = "AtEnd",
			Font = self.library.font,
			Parent = textboxholder
		}
	)
	-- // textbox tbl
	textbox = {
		["library"] = self.library,
		["tbox"] = tbox,
		["current"] = def,
		["callback"] = callback
	}
	--
	button.MouseButton1Down:Connect(function()
		tbox:CaptureFocus()
	end)
	--
	tbox.Focused:Connect(function()
		outline.BorderColor3 = self.library.theme.accent
		table.insert(self.library.themeitems["accent"]["BorderColor3"],outline)
	end)
	--
	tbox.FocusLost:Connect(function(enterPressed)
		textbox.current = tbox.Text
		callback(tbox.Text)
		outline.BorderColor3 = Color3.fromRGB(12, 12, 12)
		local find = table.find(self.library.themeitems["accent"]["BorderColor3"],outline)
		if find then
			table.remove(self.library.themeitems["accent"]["BorderColor3"],find)
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = textbox
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	self.library.labels[#self.library.labels+1] = tbox
	-- // metatable indexing + return
	setmetatable(textbox, textboxs)
	return textbox
end
--
function textboxs:set(value)
	self.tbox.Text = value
	self.current = value
	self.callback(value)
end
--
function sections:keybind(props)
	-- // properties
	local name = props.name or props.Name or props.page or props.Page or props.pagename or props.Pagename or props.PageName or props.pageName or "new ui"
	local def = props.def or props.Def or props.default or props.Default or nil
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	local allowed = props.allowed or props.Allowed or 1
	--
	local default = ".."
	local typeis = nil
	--
	if typeof(def) == "EnumItem" then
		if def == Enum.UserInputType.MouseButton1 then
			if allowed == 1 then
				default = "MB1"
				typeis = "UserInputType"
			end
		elseif def == Enum.UserInputType.MouseButton2 then
			if allowed == 1 then
				default = "MB2"
				typeis = "UserInputType"
			end
		elseif def == Enum.UserInputType.MouseButton3 then
			if allowed == 1 then
				default = "MB3"
				typeis = "UserInputType"
			end
		else
			local capd = utility.capatalize(def.Name)
			if #capd > 1 then
				default = capd
			else
				default = def.Name
			end
			typeis = "KeyCode"
		end
	end
	-- // variables
	local keybind = {}
	-- // main
	local keybindholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,17),
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0,40,1,0),
			Position = UDim2.new(1,0,0,0),
			Parent = keybindholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline
		}
	)
	--
	local value = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = default,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Center",
			Parent = outline
		}
	)
	--
	outline.Size = UDim2.new(0,value.TextBounds.X+20,1,0)
	--
	local color = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = outline2
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = color
		}
	)
	--
	local button = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			Font = self.library.font,
			Parent = keybindholder
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = keybindholder
		}
	)
	-- // keybind tbl
	keybind = {
		["library"] = self.library,
		["down"] = false,
		["outline"] = outline,
		["value"] = value,
		["allowed"] = allowed,
		["current"] = {typeis,utility.splitenum(def)},
		["pressed"] = false,
		["callback"] = callback
	}
	--
	button.MouseButton1Down:Connect(function()
		if keybind.down == false then
			outline.BorderColor3 = self.library.theme.accent
			table.insert(self.library.themeitems["accent"]["BorderColor3"],outline)
			wait()
			keybind.down = true
		end
	end)
	--
	button.MouseButton2Down:Connect(function()
		keybind.down = false
		keybind.current = {nil,nil}
		outline.BorderColor3 = Color3.fromRGB(12, 12, 12)
		local find = table.find(self.library.themeitems["accent"]["BorderColor3"],outline)
		if find then
			table.remove(self.library.themeitems["accent"]["BorderColor3"],find)
		end
		value.Text = ".."
		outline.Size = UDim2.new(0,value.TextBounds.X+20,1,0)
	end)
	--
	local function turn(typeis,current)
		outline.Size = UDim2.new(0,value.TextBounds.X+20,1,0)
		keybind.down = false
		keybind.current = {typeis,utility.splitenum(current)}
		outline.BorderColor3 = Color3.fromRGB(12, 12, 12)
		local find = table.find(self.library.themeitems["accent"]["BorderColor3"],outline)
		if find then
			table.remove(self.library.themeitems["accent"]["BorderColor3"],find)
		end
	end
	--
	uis.InputBegan:Connect(function(Input)
		if keybind.down then
			if Input.UserInputType == Enum.UserInputType.Keyboard then
				local capd = utility.capatalize(Input.KeyCode.Name)
				if #capd > 1 then
					value.Text = capd
				else
					value.Text = Input.KeyCode.Name
				end
				turn("KeyCode",Input.KeyCode)
				callback(Input.KeyCode)
			end
			if allowed == 1 then
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					value.Text = "MB1"
					turn("UserInputType",Input)
					callback(Input)
				elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
					value.Text = "MB2"
					turn("UserInputType",Input)
					callback(Input)
				elseif Input.UserInputType == Enum.UserInputType.MouseButton3 then
					value.Text = "MB3"
					turn("UserInputType",Input)
					callback(Input)
				end
			end
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = keybind
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	self.library.labels[#self.library.labels+1] = value
	-- // metatable indexing + return
	setmetatable(keybind, keybinds)
	return keybind
end
--
function keybinds:set(key)
	if key then
		if typeof(key) == "EnumItem" or typeof(key) == "table" then
			if typeof(key) == "table" then
				if key[1] and key[2] then
					key = Enum[key[1]][key[2]]
				else
					return
				end
			end
			local keybind = self
			local typeis = ""
			--
			local default = ".."
			--
			if key == Enum.UserInputType.MouseButton1 then
				if keybind.allowed == 1 then
					default = "MB1"
					typeis = "UserInputType"
				end
			elseif key == Enum.UserInputType.MouseButton2 then
				if keybind.allowed == 1 then
					default = "MB2"
					typeis = "UserInputType"
				end
			elseif key == Enum.UserInputType.MouseButton3 then
				if keybind.allowed == 1 then
					default = "MB3"
					typeis = "UserInputType"
				end
			else
				local capd = utility.capatalize(key.Name)
				if #capd > 1 then
					default = capd
				else
					default = key.Name
				end
				typeis = "KeyCode"
			end
			--
			keybind.value.Text = default
			keybind.current = {typeis,utility.splitenum(key)}
			keybind.callback(keybind.current)
			keybind.outline.Size = UDim2.new(0,keybind.value.TextBounds.X+20,1,0)
			--
			if keybind.down then
				keybind.down = false
				keybind.outline.BorderColor3 = Color3.fromRGB(12, 12, 12)
				local find = table.find(self.library.themeitems["accent"]["BorderColor3"],keybind.outline)
				if find then
					table.remove(self.library.themeitems["accent"]["BorderColor3"],find)
				end
			end
		end
	end
end
--
function sections:colorpicker(props)
	-- // properties
	local name = props.name or props.Name or "new colorpicker"
	local cpname = props.cpname or props.Cpname or props.CPname or props.CPName or props.cPname or props.cpName or props.colorpickername or nil
	local def = props.def or props.Def or props.default or props.Default or Color3.fromRGB(255,255,255)
	local callback = props.callback or props.callBack or props.CallBack or props.Callback or function()end
	--
	local h,s,v = def:ToHSV()
	-- // variables
	local colorpicker = {}
	-- // main
	local colorpickerholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			ZIndex = 2,
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0,30,1,0),
			Position = UDim2.new(1,0,0,0),
			Parent = colorpickerholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = outline
		}
	)
	--
	local cpcolor = utility.new(
		"Frame",
		{
			BackgroundColor3 = def,
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Parent = outline2
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
			Rotation = 90,
			Parent = cpcolor
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Font = self.library.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			Parent = colorpickerholder
		}
	)
	--
	local button = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			Font = self.library.font,
			Parent = colorpickerholder
		}
	)
	--
	local cpholder = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,0,230),
			Position = UDim2.new(0,0,1,5),
			Visible = false,
			ZIndex = 5,
			Parent = colorpickerholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			ZIndex = 5,
			Parent = cpholder
		}
	)
	--
	local color = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundColor3 = self.library.theme.accent,
			BorderSizePixel = 0,
			Size = UDim2.new(1,-2,0,1),
			Position = UDim2.new(0.5,0,0,0),
			ZIndex = 5,
			Parent = outline2
		}
	)
	--
	table.insert(self.library.themeitems["accent"]["BackgroundColor3"],color)
	--
	local cptitle = utility.new(
		"TextLabel",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,-10,0,20),
			Position = UDim2.new(0.5,0,0,0),
			Font = self.library.font,
			Text = cpname or name,
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Left",
			ZIndex = 5,
			Parent = outline2
		}
	)
	--
	local cpholder2 = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0.875,0,0,150),
			Position = UDim2.new(0,5,0,20),
			ZIndex = 5,
			Parent = outline2
		}
	)
	--
	local outline3 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromHSV(h,1,1),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			ZIndex = 5,
			Parent = cpholder2
		}
	)
	--
	local cpimage = utility.new(
		"ImageButton",
		{
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			ZIndex = 5,
			Image = "rbxassetid://7074305282",
			Parent = outline3
		}
	)
	--
	local cpcursor = utility.new(
		"ImageLabel",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0,6,0,6),
			Position = UDim2.new(s,0,1-v,0),
			ZIndex = 5,
			Image = "rbxassetid://7074391319",
			Parent = cpimage
		}
	)
	--
	local huepicker = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(1,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0.05,0,0,150),
			Position = UDim2.new(1,-5,0,20),
			ZIndex = 5,
			Parent = outline2
		}
	)
	--
	local outline4 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			ZIndex = 5,
			Parent = huepicker
		}
	)
	--
	local huebutton = utility.new(
		"TextButton",
		{
			AnchorPoint = Vector2.new(0,0),
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Text = "",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			Font = self.library.font,
			ZIndex = 5,
			Parent = huepicker
		}
	)
	--
	utility.new(
		"UIGradient",
		{
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 153, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(209, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(55, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 102)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 102, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(51, 0, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(204, 0, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))},
			Rotation = 90,
			Parent = outline4
		}
	)
	--
	local huecursor = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(0,12,0,6),
			Position = UDim2.new(0.5,0,h,0),
			ZIndex = 5,
			Parent = outline4
		}
	)
	--
	local huecursor_inline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromHSV(h,1,1),
			BorderColor3 = Color3.fromRGB(255, 255, 255),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			ZIndex = 5,
			Parent = huecursor
		}
	)
	--
	local function textbox(parent,size,position)
		local textbox_holder = utility.new(
			"Frame",
			{
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = position,
				Size = size,
				ZIndex = 5,
				Parent = parent
			}
		)
		--
		local outline5 = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 5,
				Parent = textbox_holder
			}
		)
		--
		local outline6 = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(56, 56, 56),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 5,
				Parent = outline5
			}
		)
		--
		local color2 = utility.new(
			"Frame",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderSizePixel = 0,
				Size = UDim2.new(1,0,0,0),
				Position = UDim2.new(0,0,0,0),
				ZIndex = 5,
				Parent = outline6
			}
		)
		--
		utility.new(
			"UIGradient",
			{
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
				Rotation = 90,
				Parent = color2
			}
		)
		--
		local tbox = utility.new(
			"TextBox",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,1,0),
				Position = UDim2.new(0.5,0,0,0),
				PlaceholderColor3 = Color3.fromRGB(255,255,255),
				PlaceholderText = "",
				Text = "",
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				Font = self.library.font,
				ZIndex = 5,
				Parent = textbox_holder
			}
		)
		--
		local tbox_button = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,1,0),
				Position = UDim2.new(0,0,0,0),
				Text = "",
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				Font = self.library.font,
				ZIndex = 5,
				Parent = textbox_holder
			}
		)
		--
		tbox_button.MouseButton1Down:Connect(function()
			tbox:CaptureFocus()
		end)
		--
		return {textbox_holder,tbox,outline5}
	end
	--
	local red = textbox(outline2,UDim2.new(0,62,0,20),UDim2.new(0,5,0,175))
	local green = textbox(outline2,UDim2.new(0,62,0,20),UDim2.new(0,5,0,175))
	green[1].AnchorPoint = Vector2.new(0.5,0)
	green[1].Position = UDim2.new(0.5,0,0,175)
	local blue = textbox(outline2,UDim2.new(0,62,0,20),UDim2.new(0,5,0,175))
	blue[1].AnchorPoint = Vector2.new(1,0)
	blue[1].Position = UDim2.new(1,-5,0,175)
	local hex = textbox(outline2,UDim2.new(1,-10,0,20),UDim2.new(0,5,0,200))
	hex[2].Size = UDim2.new(1,-12,1,0)
	hex[2].TextXAlignment = "Left"
	-- // colorpicker tbl
	colorpicker = {
		["library"] = self.library,
		["cpholder"] = cpholder,
		["cpcolor"] = cpcolor,
		["huecursor"] = huecursor,
		["outline3"] = outline3,
		["huecursor_inline"] = huecursor_inline,
		["cpcursor"] = cpcursor,
		["current"] = def,
		["open"] = false,
		["cp"] = false,
		["hue"] = false,
		["hsv"] = {h,s,v},
		["red"] = red[2],
		["green"] = green[2],
		["blue"] = blue[2],
		["hex"] = hex[2],
		["callback"] = callback
	}
	--
	table.insert(self.library.colorpickers,colorpicker)
	--
	local function updateboxes()
		colorpicker.red.PlaceholderText = "R: "..tostring(math.floor(colorpicker.current.R*255))
		colorpicker.green.PlaceholderText = "G: "..tostring(math.floor(colorpicker.current.G*255))
		colorpicker.blue.PlaceholderText = "B: "..tostring(math.floor(colorpicker.current.B*255))
		colorpicker.hex.PlaceholderText = "Hex: "..utility.to_hex(colorpicker.current)
	end
	--
	updateboxes()
	--
	local function movehue()
		local posy = math.clamp(plr:GetMouse().Y-outline3.AbsolutePosition.Y,0,outline3.AbsoluteSize.Y)
		local resy = (1/outline3.AbsoluteSize.Y)*posy
		outline3.BackgroundColor3 = Color3.fromHSV(resy,1,1)
		huecursor_inline.BackgroundColor3 = Color3.fromHSV(resy,1,1)
		colorpicker.hsv[1] = resy
		colorpicker.current = Color3.fromHSV(colorpicker.hsv[1],colorpicker.hsv[2],colorpicker.hsv[3])
		cpcolor.BackgroundColor3 = colorpicker.current
		updateboxes()
		colorpicker.callback(colorpicker.current)
		huecursor:TweenPosition(UDim2.new(0.5,0,resy,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.15,true)
	end
	--
	local function movecp()
		local posx,posy = math.clamp(plr:GetMouse().X-outline3.AbsolutePosition.X,0,outline3.AbsoluteSize.X),math.clamp(plr:GetMouse().Y-outline3.AbsolutePosition.Y,0,outline3.AbsoluteSize.Y)
		local resx,resy = (1/outline3.AbsoluteSize.X)*posx,(1/outline3.AbsoluteSize.Y)*posy
		colorpicker.hsv[2] = resx
		colorpicker.hsv[3] = 1-resy
		colorpicker.current = Color3.fromHSV(colorpicker.hsv[1],colorpicker.hsv[2],colorpicker.hsv[3])
		cpcolor.BackgroundColor3 = colorpicker.current
		updateboxes()
		colorpicker.callback(colorpicker.current)
		cpcursor:TweenPosition(UDim2.new(resx,0,resy,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.15,true)
	end
	--
	button.MouseButton1Down:Connect(function()
		self.library:closewindows(colorpicker)
		cpholder.Visible = not colorpicker.open
		colorpicker.open = not colorpicker.open
	end)
	--
	huebutton.MouseButton1Down:Connect(function()
		colorpicker.hue = true
		movehue()
	end)
	--
	cpimage.MouseButton1Down:Connect(function()
		colorpicker.cp = true
		movecp()
	end)
	--
	uis.InputChanged:Connect(function()
		if colorpicker.cp then
			movecp()
		end
		if colorpicker.hue then
			movehue()
		end
	end)
	--
	uis.InputEnded:Connect(function(Input)
		if Input.UserInputType.Name == 'MouseButton1'  then
			if colorpicker.cp then
				colorpicker.cp = false
			end
			if colorpicker.hue then
				colorpicker.hue = false
			end
		end
	end)
	--
	red[2].Focused:Connect(function()
		red[3].BorderColor3 = self.library.theme.accent
	end)
	--
	red[2].FocusLost:Connect(function()
		local saved = red[2].Text
		local num = tonumber(saved)
		if num then
			saved = tostring(math.clamp(tonumber(saved),0,255))
			red[2].Text = ""
			if saved then
				if #saved >= 1 and #saved <= 3 then
					red[2].PlaceholderText = "R: "..tostring(saved)
				end
				colorpicker:set(Color3.fromRGB(tonumber(saved),colorpicker.current.G*255,colorpicker.current.B*255))
				red[3].BorderColor3 = Color3.fromRGB(12,12,12)
			else
				red[3].BorderColor3 = Color3.fromRGB(12,12,12)
			end
		else
			red[2].Text = ""
			red[3].BorderColor3 = Color3.fromRGB(12,12,12)
		end
	end)
	--
	green[2].Focused:Connect(function()
		green[3].BorderColor3 = self.library.theme.accent
	end)
	--
	green[2].FocusLost:Connect(function()
		local saved = green[2].Text
		local num = tonumber(saved)
		if num then
			saved = tostring(math.clamp(tonumber(saved),0,255))
			green[2].Text = ""
			if saved then
				if #saved >= 1 and #saved <= 3 then
					green[2].PlaceholderText = "G: "..tostring(saved)
				end
				colorpicker:set(Color3.fromRGB(colorpicker.current.R*255,tonumber(saved),colorpicker.current.B*255))
				green[3].BorderColor3 = Color3.fromRGB(12,12,12)
			else
				green[3].BorderColor3 = Color3.fromRGB(12,12,12)
			end
		else
			green[2].Text = ""
			green[3].BorderColor3 = Color3.fromRGB(12,12,12)
		end
	end)
	--
	blue[2].Focused:Connect(function()
		blue[3].BorderColor3 = self.library.theme.accent
	end)
	--
	blue[2].FocusLost:Connect(function()
		local saved = blue[2].Text
		local num = tonumber(saved)
		if num then
			saved = tostring(math.clamp(tonumber(saved),0,255))
			blue[2].Text = ""
			if saved then
				if #saved >= 1 and #saved <= 3 then
					blue[2].PlaceholderText = "B: "..tostring(saved)
				end
				colorpicker:set(Color3.fromRGB(colorpicker.current.R*255,colorpicker.current.G*255,tonumber(saved)))
				blue[3].BorderColor3 = Color3.fromRGB(12,12,12)
			else
				blue[3].BorderColor3 = Color3.fromRGB(12,12,12)
			end
		else
			blue[2].Text = ""
			blue[3].BorderColor3 = Color3.fromRGB(12,12,12)
		end
	end)
	--
	hex[2].Focused:Connect(function()
		hex[3].BorderColor3 = self.library.theme.accent
	end)
	--
	hex[2].FocusLost:Connect(function()
		local saved = hex[2].Text
		if #saved >= 6 and #saved <= 7 then
			local e,s = pcall(function()
				utility.from_hex(saved)
			end)
			if e == true then
				local hexcolor = utility.from_hex(saved)
				if hexcolor then
					colorpicker:set(hexcolor)
					hex[2].Text = ""
					hex[3].BorderColor3 = Color3.fromRGB(12,12,12)
				else
					hex[2].Text = ""
					hex[3].BorderColor3 = Color3.fromRGB(12,12,12)
				end
			else
				hex[2].Text = ""
				hex[3].BorderColor3 = Color3.fromRGB(12,12,12)
			end
		else
			hex[2].Text = ""
			hex[3].BorderColor3 = Color3.fromRGB(12,12,12)
		end
	end)
	--
	local pointer = props.pointer or props.Pointer or props.pointername or props.Pointername or props.PointerName or props.pointerName or nil
	--
	if pointer then
		if self.pointers then
			self.pointers[tostring(pointer)] = colorpicker
		end
	end
	--
	self.library.labels[#self.library.labels+1] = title
	self.library.labels[#self.library.labels+1] = hex[2]
	self.library.labels[#self.library.labels+1] = red[2]
	self.library.labels[#self.library.labels+1] = green[2]
	self.library.labels[#self.library.labels+1] = blue[2]
	self.library.labels[#self.library.labels+1] = cptitle
	-- // metatable indexing + return
	setmetatable(colorpicker, colorpickers)
	return colorpicker
end
--
function colorpickers:set(color)
	if color then
		if typeof(color) == "table" then
			color = Color3.fromRGB(color[1]*255,color[2]*255,color[3]*255)
		end
		local colorpicker = self
		local h,s,v = color:ToHSV()
		--
		local function updateboxes()
			colorpicker.red.PlaceholderText = "R: "..tostring(math.floor(colorpicker.current.R*255))
			colorpicker.green.PlaceholderText = "G: "..tostring(math.floor(colorpicker.current.G*255))
			colorpicker.blue.PlaceholderText = "B: "..tostring(math.floor(colorpicker.current.B*255))
			colorpicker.hex.PlaceholderText = "Hex: "..utility.to_hex(colorpicker.current)
		end
		--
		local function movehue()
			colorpicker.outline3.BackgroundColor3 = Color3.fromHSV(h,1,1)
			colorpicker.huecursor_inline.BackgroundColor3 = Color3.fromHSV(h,1,1)
			colorpicker.hsv[1] = h
			colorpicker.current = Color3.fromHSV(colorpicker.hsv[1],colorpicker.hsv[2],colorpicker.hsv[3])
			colorpicker.cpcolor.BackgroundColor3 = colorpicker.current
			colorpicker.huecursor:TweenPosition(UDim2.new(0.5,0,h,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.15,true)
		end
		--
		local function movecp()
			colorpicker.hsv[2] = s
			colorpicker.hsv[3] = v
			colorpicker.current = Color3.fromHSV(colorpicker.hsv[1],colorpicker.hsv[2],colorpicker.hsv[3])
			colorpicker.cpcolor.BackgroundColor3 = colorpicker.current
			colorpicker.cpcursor:TweenPosition(UDim2.new(s,0,1-v,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.15,true)
		end
		--
		movehue()
		movecp()
		updateboxes()
		colorpicker.callback(colorpicker.current)
	end
end
--
function sections:configloader(props)
	-- // properties
	local folder = props.folder or props.Folder
	-- // variables
	local configloader = {}
	-- // main
	local clholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,222),
			Parent = self.content
		}
	)
	--
	local outline = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = clholder
		}
	)
	--
	local outline2 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Parent = outline
		}
	)
	--
	local title = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1,0,0,15),
			Position = UDim2.new(0,0,0,3),
			Font = self.library.font,
			Text = "configs",
			TextColor3 = Color3.fromRGB(255,255,255),
			TextSize = self.library.textsize,
			TextStrokeTransparency = 0,
			TextXAlignment = "Center",
			Parent = outline
		}
	)
	--
	self.library.labels[#self.library.labels+1] = title
	--
	local color = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundColor3 = self.library.theme.accent,
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,-6,0,1),
			Position = UDim2.new(0.5,0,0,19),
			Parent = outline
		}
	)
	--
	table.insert(self.library.themeitems["accent"]["BackgroundColor3"],color)
	--
	local buttonsholder = utility.new(
		"Frame",
		{
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,0,64),
			Position = UDim2.new(0,0,0,150),
			Parent = outline
		}
	)
	--
	local configsholder = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5,0),
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,-10,0,120),
			Position = UDim2.new(0.5,0,0,25),
			Parent = outline
		}
	)
	--
	local outline3 = utility.new(
		"Frame",
		{
			BackgroundColor3 = Color3.fromRGB(24, 24, 24),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderMode = "Inset",
			BorderSizePixel = 1,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			Parent = configsholder
		}
	)
	--
	local outline4 = utility.new(
		"ScrollingFrame",
		{
			BackgroundColor3 = Color3.fromRGB(56, 56, 56),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1,0,1,0),
			Position = UDim2.new(0,0,0,0),
			ClipsDescendants = true,
			AutomaticCanvasSize = "Y",
			CanvasSize = UDim2.new(0,0,0,0),
			ScrollBarImageTransparency = 0.25,
			ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
			ScrollBarThickness = 5,
			VerticalScrollBarInset = "ScrollBar",
			VerticalScrollBarPosition = "Right",
			Parent = outline3
		}
	)
	--
	utility.new(
		"UIListLayout",
		{
			FillDirection = "Vertical",
			Padding = UDim.new(0,0),
			Parent = outline4
		}
	)
	--
	local createdbuttons = {}
	local selected
	--
	local makebutton = function(name,toggled)
		local createdbutton = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,0,18),
				Position = UDim2.new(0,0,0,0),
				Text = "",
				Parent = outline4
			}
		)
		--
		local grey = utility.new(
			"Frame",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundColor3 = Color3.fromRGB(125, 125, 125),
				BackgroundTransparency = 0.9,
				BorderSizePixel = 0,
				Size = UDim2.new(1,-4,1,0),
				Position = UDim2.new(0.5,0,0,0),
				Visible = false,
				Parent = createdbutton
			}
		)
		--
		local createdtitle = utility.new(
			"TextLabel",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,-10,1,0),
				Position = UDim2.new(0.5,0,0,0),
				Font = self.library.font,	
				Text = name,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				TextXAlignment = "Left",
				Parent = createdbutton
			}
		)
		--
		self.library.labels[#self.library.labels+1] = createdtitle
		--
		local createdb = {
			["button"] = createdbutton,
			["grey"] = grey,
			["title"] = createdtitle,
			["name"] = name
		}
		--
		table.insert(createdbuttons,createdb)
		--
		if toggled then
			createdb.grey.Visible = true
			createdb.title.TextColor3 = self.library.theme.accent
			table.insert(self.library.themeitems["accent"]["TextColor3"],createdb.title)
			selected = createdb
		end
		--
		createdbutton.MouseButton1Down:Connect(function()
			for i,v in pairs(createdbuttons) do
				if v ~= createdb then
					v.grey.Visible = false
					v.title.TextColor3 = Color3.fromRGB(255,255,255)
					local find = table.find(self.library.themeitems["accent"]["TextColor3"],v.title)
					if find then
						table.remove(self.library.themeitems["accent"]["TextColor3"],find)
					end
				end
			end
			--
			createdb.grey.Visible = true
			createdb.title.TextColor3 = self.library.theme.accent
			table.insert(self.library.themeitems["accent"]["TextColor3"],createdb.title)
			selected = createdb
		end)
	end
	--
	local newbutton = function(parent,name)
		local button_holder = utility.new(
			"Frame",
			{
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 5,
				Parent = parent
			}
		)
		--
		local button_outline = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 5,
				Parent = button_holder
			}
		)
		--
		local button_outline2 = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(56, 56, 56),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 5,
				Parent = button_outline
			}
		)
		--
		local button_color = utility.new(
			"Frame",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderSizePixel = 0,
				Size = UDim2.new(1,0,0,0),
				Position = UDim2.new(0,0,0,0),
				ZIndex = 5,
				Parent = button_outline2
			}
		)
		--
		utility.new(
			"UIGradient",
			{
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
				Rotation = 90,
				Parent = button_color
			}
		)
		--
		local button_button = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,1,0),
				Position = UDim2.new(0,0,0,0),
				Text = name,
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				Font = self.library.font,
				ZIndex = 5,
				Parent = button_holder
			}
		)
		--
		self.library.labels[#self.library.labels+1] = button_button
		--
		return {button_holder,button_outline,button_button}
	end
	--
	local function textbox(parent)
		local textbox_holder = utility.new(
			"Frame",
			{
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 5,
				Parent = parent
			}
		)
		--
		local outline5 = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 5,
				Parent = textbox_holder
			}
		)
		--
		local outline6 = utility.new(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(24, 24, 24),
				BorderColor3 = Color3.fromRGB(56, 56, 56),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Position = UDim2.new(0,0,0,0),
				Size = UDim2.new(1,0,1,0),
				ZIndex = 5,
				Parent = outline5
			}
		)
		--
		local color2 = utility.new(
			"Frame",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderSizePixel = 0,
				Size = UDim2.new(1,0,0,0),
				Position = UDim2.new(0,0,0,0),
				ZIndex = 5,
				Parent = outline6
			}
		)
		--
		utility.new(
			"UIGradient",
			{
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 191, 204)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))},
				Rotation = 90,
				Parent = color2
			}
		)
		--
		local tbox = utility.new(
			"TextBox",
			{
				AnchorPoint = Vector2.new(0.5,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,1,0),
				Position = UDim2.new(0.5,0,0,0),
				PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
				PlaceholderText = "",
				Text = "",
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				Font = self.library.font,
				ZIndex = 5,
				Parent = textbox_holder
			}
		)
		--
		local tbox_button = utility.new(
			"TextButton",
			{
				AnchorPoint = Vector2.new(0,0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1,0,1,0),
				Position = UDim2.new(0,0,0,0),
				Text = "",
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = self.library.textsize,
				TextStrokeTransparency = 0,
				Font = self.library.font,
				ZIndex = 5,
				Parent = textbox_holder
			}
		)
		--
		tbox_button.MouseButton1Down:Connect(function()
			tbox:CaptureFocus()
		end)
		--
		return {textbox_holder,tbox,outline5}
	end
	--
	local refresh = function()
		for i,v in pairs(createdbuttons) do
			v.button:Remove()
			v.grey:Remove()
			v.title:Remove()
		end
		createdbuttons = {}
		for i,v in pairs(listfiles(folder)) do
			if v:sub(-4) == ".cfg" then
				if i == 1 then 
					makebutton(v:sub(#tostring(folder)+2, -5),true)
				else
					makebutton(v:sub(#tostring(folder)+2, -5),false)
				end
			end
		end
	end
	--
	refresh()
	--
	local name = textbox(buttonsholder)
	local load = newbutton(buttonsholder,"Load")
	local delete = newbutton(buttonsholder,"Delete")
	local save = newbutton(buttonsholder,"Save")
	local create = newbutton(buttonsholder,"Create")
	--
	name[1].Size = UDim2.new(1,-10,0,20)
	load[1].Size = UDim2.new(0.5,-6,0,20)
	delete[1].Size = UDim2.new(0.5,-6,0,20)
	save[1].Size = UDim2.new(0.5,-6,0,20)
	create[1].Size = UDim2.new(0.5,-6,0,20)
	--
	name[1].Position = UDim2.new(0.5,0,0,0)
	name[1].AnchorPoint = Vector2.new(0.5,0)
	--
	load[1].Position = UDim2.new(0,5,0,22)
	load[1].AnchorPoint = Vector2.new(0,0)
	--
	delete[1].Position = UDim2.new(1,-5,0,22)
	delete[1].AnchorPoint = Vector2.new(1,0)
	--
	save[1].Position = UDim2.new(0,5,0,44)
	save[1].AnchorPoint = Vector2.new(0,0)
	--
	create[1].Position = UDim2.new(1,-5,0,44)
	create[1].AnchorPoint = Vector2.new(1,0)
	--
	name[2].PlaceholderText = "Name"
	--
	local currentname = nil
	--
	name[2].Focused:Connect(function()
		name[3].BorderColor3 = self.library.theme.accent
	end)
	--
	name[2].FocusLost:Connect(function()
		local saved = name[2].Text
		if #saved >= 3 and #saved <= 15 then
			currentname = saved
		else
			name[2].Text = ""
			currentname = nil
		end
		name[3].BorderColor3 = Color3.fromRGB(12,12,12)
	end)
	--
	load[3].MouseButton1Down:Connect(function()
		self.library:loadconfig(folder..selected.name..".cfg")
		load[2].BorderColor3 = self.library.theme.accent
		wait(0.05)
		load[2].BorderColor3 = Color3.fromRGB(12,12,12)
	end)
	--
	delete[3].MouseButton1Down:Connect(function()
		delfile(folder..selected.name..".cfg")
		delete[2].BorderColor3 = self.library.theme.accent
		wait(0.05)
		delete[2].BorderColor3 = Color3.fromRGB(12,12,12)
		wait()
		refresh()
	end)
	--
	save[3].MouseButton1Down:Connect(function()
		writefile(folder..selected.name..".cfg", self.library:saveconfig())
		save[2].BorderColor3 = self.library.theme.accent
		wait(0.05)
		save[2].BorderColor3 = Color3.fromRGB(12,12,12)
		wait()
		refresh()
	end)
	--
	create[3].MouseButton1Down:Connect(function()
		writefile(folder..currentname..".cfg", self.library:saveconfig())
		create[2].BorderColor3 = self.library.theme.accent
		wait(0.05)
		create[2].BorderColor3 = Color3.fromRGB(12,12,12)
		wait()
		refresh()
	end)
	-- // button tbl
	configloader = {
		["library"] = self.library
	}
	-- // metatable indexing + return
	setmetatable(configloader, configloaders)
	return configloader 
end

--
function library:panel(props)
	local name = props.name or props.Name or "panel"
	local width = props.width or props.Width or 220
	local position = props.position or props.Position or UDim2.new(0, 10, 0, 60)
	local anchor = props.anchor or props.AnchorPoint or Vector2.new(0, 0)
	local visible = props.visible
	if visible == nil then visible = true end

	local panel = {}

	local outline = utility.new(
		"Frame",
		{
			AnchorPoint = anchor,
			BackgroundColor3 = self.theme.accent,
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(0, width, 0, 28),
			Position = position,
			ZIndex = 9800,
			Visible = visible,
			Parent = self.screen
		}
	)
	table.insert(self.themeitems["accent"]["BackgroundColor3"], outline)

	local outline2 = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BorderColor3 = Color3.fromRGB(12, 12, 12),
			BorderSizePixel = 1,
			Size = UDim2.new(1, -4, 1, -4),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ZIndex = 9801,
			Parent = outline
		}
	)

	local indent = utility.new(
		"Frame",
		{
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			BorderColor3 = Color3.fromRGB(56, 56, 56),
			BorderSizePixel = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ZIndex = 9802,
			Parent = outline2
		}
	)

	local titlebar = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -10, 0, 18),
			Position = UDim2.new(0, 5, 0, 2),
			Font = self.font,
			Text = name,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = "Left",
			TextSize = self.textsize,
			TextStrokeTransparency = 0,
			ZIndex = 9803,
			Parent = indent
		}
	)

	local body = utility.new(
		"TextLabel",
		{
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -10, 1, -22),
			Position = UDim2.new(0, 5, 0, 20),
			Font = self.font,
			Text = "",
			TextColor3 = Color3.fromRGB(220, 220, 220),
			TextXAlignment = "Left",
			TextYAlignment = "Top",
			TextSize = self.textsize,
			TextStrokeTransparency = 0,
			TextWrapped = true,
			ZIndex = 9803,
			Parent = indent
		}
	)

	utility.dragify(titlebar, outline)
	utility.dragify(indent, outline)

	self.labels[#self.labels + 1] = titlebar
	self.labels[#self.labels + 1] = body

	panel.outline = outline
	panel.body = body
	panel.title = titlebar
	panel.library = self

	function panel:set(text)
		body.Text = text or ""
		task.defer(function()
			local bounds = body.TextBounds
			local h = math.max(28, (bounds and bounds.Y or 0) + 28)
			local w = math.max(width, (bounds and bounds.X or 0) + 20)
			local lines = 1
			for _ in string.gmatch(body.Text, "\n") do
				lines = lines + 1
			end
			h = math.max(h, 18 + lines * (self.library.textsize + 4))
			outline.Size = UDim2.new(0, w, 0, h)
		end)
	end

	function panel:setlines(lines)
		if typeof(lines) == "table" then
			panel:set(table.concat(lines, "\n"))
		else
			panel:set(tostring(lines or ""))
		end
	end

	function panel:setvisible(state)
		outline.Visible = state and true or false
	end

	function panel:setposition(pos)
		outline.Position = pos
	end

	return panel
end

return library

end)()

local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/imagoodpersond/puppyware/main/notify"))()
local Notify = NotifyLibrary.Notify

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local LogService = game:GetService("LogService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local CONFIG_FOLDER = "SoA_Configs"
makefolder(CONFIG_FOLDER)

local function setVisible(obj, state)
    if obj then pcall(function() obj.Visible = state == true end) end
end

local function getRigs() return workspace:WaitForChild("Ignore"):WaitForChild("Rigs") end
local function getDoors() return workspace:WaitForChild("Interactable"):WaitForChild("Doors") end
local function getContainers() return workspace:WaitForChild("Interactable"):WaitForChild("Containers") end
local function getPickUps() return workspace:WaitForChild("Interactable"):WaitForChild("PickUps") end

--------------------------------------------------
-- Settings
--------------------------------------------------

local Settings = {
    Viewmodel = {
        Invisible = false,
        ColorEnabled = false,
        Color = Color3.fromRGB(255, 255, 255),
        MaterialEnabled = false,
        Material = "SmoothPlastic",
        NoArms = false,
    },
    AnimatedSkin = {
        Enabled = false,
        Id = "8312411650",
        Speed = 0.05,
        Textures = {},
        Data = {
            {Id = "8312411650", Name = "Moondrop"},
            {Id = "8187480486", Name = "Stars"},
            {Id = "6375155850", Name = "Pink Clouds"},
            {Id = "5758750207", Name = "Halloween Light"},
            {Id = "5758746263", Name = "Halloween Dark"},
            {Id = "10890492851", Name = "Coffin Y2K"},
            {Id = "8944709882", Name = "Black Kimono"},
            {Id = "5288532869", Name = "Coconut"},
            {Id = "8188960468", Name = "Gold Hearts"},
            {Id = "10017698997", Name = "Red Flowers"},
            {Id = "5013453655", Name = "Explosion"},
            {Id = "8282615832", Name = "Light Halo"}
        }
    },
    Doors = {
        Enabled = false,
        Transparency = 0,
        Color = Color3.fromRGB(255, 255, 255),
        MaterialEnabled = false,
        Material = "Plastic",
        Originals = {}
    },
    Ambience = {
        Enabled = false,
        Daytime = 12,
        Color = Color3.fromRGB(255, 255, 255),
        SkyColor = Color3.fromRGB(135, 206, 235),
        OriginalClock = Lighting.ClockTime,
        OriginalAmbient = Lighting.OutdoorAmbient,
        OriginalOutdoor = Lighting.OutdoorAmbient,
        OriginalColorShiftTop = Lighting.ColorShift_Top,
        OriginalColorShiftBottom = Lighting.ColorShift_Bottom,
        OriginalAmbientColor = Lighting.Ambient,
    },
    ColorCorrection = {
        Enabled = false,
        Contrast = 0,
        Saturation = 0,
        Brightness = 0,
    },
    FOV = {
        Enabled = false,
        Value = 90,
        Original = Camera.FieldOfView,
        ADSChange = true
    },
    Zoom = {
        Enabled = false,
        Key = Enum.KeyCode.C,
        TargetFOV = 40,
        Active = false
    },
    Aim = {
        Enabled = false,
        Smoothing = 20,
        Prediction = 0,
        Priority = "Head",
        FOV = 150,
        ShowFOV = true,
        VisibleCheck = false,
        CurrentTarget = nil,
        Mode = "Memory",
        DynamicFOV = false,
    },
    PlayerTargeting = {
        Enabled = false,
        Target = nil,
    },
    Ragebot = {
        Enabled = false,
        Key = Enum.KeyCode.X,
        ClickInterval = 0.1,
        LastClick = 0,
        MaxDistance = 500,
    },
    LowGraphics = {
        Enabled = false,
    },
    Shader = {
        Enabled = false,
    },
    AudioManip = {
        Enabled = false,
        Reverb = 0.5,
    },
    HitBeam = {
        Enabled = false,
        Color1 = Color3.fromRGB(33, 0, 71),
        Color2 = Color3.fromRGB(90, 20, 140),
    },
    Hitsound = {
        Enabled = false,
        HitVolume = 1,
        KillVolume = 1,
        HitId = "139452805868562",
        KillId = "124543461907751",
        HitData = {
            {Id = "139452805868562", Name = "Neverlose"},
            {Id = "140247876667835", Name = "Gamesense"},
            {Id = "77082587278347", Name = "CoD"},
            {Id = "135478009117226", Name = "Minecraft"},
            {Id = "140721035016341", Name = "Undertale"},
        },
        KillData = {
            {Id = "124543461907751", Name = "Among Us Sfx"},
            {Id = "18410060814", Name = "Overwatch Killsound"},
            {Id = "132390332380260", Name = "Fortnite Killsound"},
            {Id = "138901307926331", Name = "TF2 Killsound"},
            {Id = "133511054265823", Name = "Ding"},
        },
    },
    Killsound = {Enabled = false},
    GunVFX = {
        Enabled = false,
        Type = "None",
        Color = Color3.fromRGB(160, 92, 255),
    },
    CharacterVFX = {
        Enabled = false,
        Slot1 = "None",
        Slot2 = "None",
        Color1 = Color3.fromRGB(160, 92, 255),
        Color2 = Color3.fromRGB(255, 255, 255),
    },
    ThirdPerson = {
        Enabled = false,
        Active = false,
        Key = Enum.KeyCode.V,
        Distance = 8,
    },
    Penetration = {Enabled = false, MaxWalls = 2, Distance = 200},
    RaycastPrediction = {
        Enabled = false,
        Color = Color3.fromRGB(255, 50, 50),
        Size = 0.4,
        MaxDistance = 1000,
    },
    ESP = {
        HeadDot = {Enabled = false, Color = Color3.fromRGB(255, 255, 255), Size = 6},
        Box2D = {Enabled = false, Color = Color3.fromRGB(255, 255, 255), Thickness = 1},
        CornerBox = {Enabled = false, Color = Color3.fromRGB(255, 255, 255), Thickness = 1, AutoThickness = true},
        Tracer = {Enabled = false, Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Length = 15, AutoThickness = true},
        Box3D = {Enabled = false, Color = Color3.fromRGB(0, 255, 50)},
        Name = {Enabled = false, Color = Color3.fromRGB(255, 255, 255)},
        Distance = {Enabled = false, Color = Color3.fromRGB(200, 200, 200)},
        Body = {Enabled = false, Color = Color3.fromRGB(255, 100, 100)},
        Skeleton = {Enabled = false, Color = Color3.fromRGB(255, 255, 255), Thickness = 2, AutoThickness = true},
    },
    ContainerESP = {Enabled = false, Color = Color3.fromRGB(255, 200, 50)},
    PickupESP = {Enabled = false, Color = Color3.fromRGB(100, 255, 150)},
    Radar = {
        Enabled = false,
        Position = Vector2.new(200, 200),
        Radius = 100,
        Scale = 1,
        BackgroundColor = Color3.fromRGB(10, 10, 10),
        BorderColor = Color3.fromRGB(75, 75, 75),
        LocalColor = Color3.fromRGB(255, 255, 255),
        PlayerColor = Color3.fromRGB(60, 170, 255),
        TeamColor = Color3.fromRGB(0, 255, 0),
        EnemyColor = Color3.fromRGB(255, 0, 0),
        TeamCheck = true,
        HealthColor = true,
    },
    ViewDetection = {Enabled = false, Interval = 0.18, FOV = 80, LastUpdate = 0},
    TargetCrosshair = {
        Enabled = false,
        Color = Color3.fromRGB(255, 50, 50),
        Stroke = Color3.fromRGB(0, 0, 0),
        Size = 18,
        SpinSpeed = 3,
    },
    ChinaHat = {
        Enabled = false,
        Color = Color3.fromRGB(255, 100, 255),
    },
    Trail = {
        Enabled = false,
        Color1 = Color3.fromRGB(160, 92, 255),
        Color2 = Color3.fromRGB(255, 255, 255),
        Texture = "3186190770",
        TextureData = {
            {Id = "8089421301", Name = "Raindrop"},
            {Id = "446111271", Name = "Volts"},
            {Id = "3186190770", Name = "Default"},
        },
    },
    LocalCharacter = {
        Enabled = false,
        Material = "ForceField",
        Transparency = 0,
        ColorEnabled = false,
        Color = Color3.fromRGB(160, 92, 255),
    },
    Invisibility = {
        Enabled = false,
        Active = false,
        Key = Enum.KeyCode.X,
        Mode = "Toggle",
        Connection = nil,
        LastCFrame = nil,
    },
    ControlPeek = {
        Enabled = false,
        Active = false,
        Key = Enum.KeyCode.LeftAlt,
        Mode = "Hold",
        SavedCFrame = nil,
        ShowBeam = true,
        ShowGhost = true,
        BeamColor = Color3.fromRGB(160, 92, 255),
        GhostColor = Color3.fromRGB(160, 92, 255),
    },
    Fly = {
        Enabled = false,
        Active = false,
        Key = Enum.KeyCode.F,
        Speed = 100,
        BodyVelocity = nil,
        NoclipParts = {},
    },
    Menu = {Key = Enum.KeyCode.RightShift}
}

--------------------------------------------------
-- Anti-shove: full hygiene on inject / respawn / periodic
--------------------------------------------------

local function neutralizePart(part)
    if not part or not part:IsA("BasePart") then return end
    pcall(function()
        part.CanCollide = false
        part.CanTouch = false
        part.CanQuery = false
        part.Massless = true
        part.CastShadow = false
        part.AssemblyLinearVelocity = Vector3.zero
        part.AssemblyAngularVelocity = Vector3.zero
    end)
end

local FORCE_CLASSES = {
    BodyVelocity = true,
    BodyPosition = true,
    BodyAngularVelocity = true,
    BodyGyro = true,
    BodyForce = true,
    BodyThrust = true,
    LinearVelocity = true,
    AngularVelocity = true,
    AlignPosition = true,
    AlignOrientation = true,
    VectorForce = true,
    Torque = true,
    LineForce = true,
}

local function stripForces(character, aggressive)
    if not character then return end
    for _, inst in ipairs(character:GetDescendants()) do
        local className = inst.ClassName
        if FORCE_CLASSES[className] then
            -- Only remove movers we created (SoA in name) unless aggressive inject reset
            local name = tostring(inst.Name)
            if aggressive or name:find("SoA") then
                pcall(function() inst:Destroy() end)
            end
        elseif inst:IsA("BasePart") and tostring(inst.Name):find("SoA") then
            neutralizePart(inst)
            pcall(function() inst:Destroy() end)
        end
    end
    if aggressive then
        local root = character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart
        if root and not (Settings.Fly.Enabled and Settings.Fly.Active) then
            pcall(function()
                root.Anchored = false
            end)
        end
        local hum = character:FindFirstChildOfClass("Humanoid")
        if hum and not (Settings.Fly.Enabled and Settings.Fly.Active) then
            pcall(function()
                hum.PlatformStand = false
                hum.Sit = false
                hum.AutoRotate = true
            end)
        end
    end
end

local function antiShoveCleanup()
    -- Destroy or neutralize every SoA object in workspace
    for _, child in ipairs(workspace:GetChildren()) do
        local n = child.Name
        if typeof(n) == "string" and n:find("SoA") then
            if child:IsA("BasePart") then
                neutralizePart(child)
            else
                for _, d in ipairs(child:GetDescendants()) do
                    if d:IsA("BasePart") then
                        neutralizePart(d)
                    end
                end
            end
            -- Ghost / beams / hit beams should not linger as colliders
            if n == "SoA_ControlPeekGhost" or n == "SoA_ControlPeekBeam"
                or n == "SoA_HitBeam" or n:find("HitBeam") then
                if not Settings.ControlPeek.Active then
                    pcall(function() child:Destroy() end)
                else
                    for _, d in ipairs(child:GetDescendants()) do
                        if d:IsA("BasePart") then neutralizePart(d) end
                    end
                end
            end
        end
    end

    -- Prediction ball must never collide
    local ball = workspace:FindFirstChild("SoA_RaycastPrediction")
    if ball and ball:IsA("BasePart") then
        neutralizePart(ball)
        ball.Anchored = true
        if not Settings.RaycastPrediction.Enabled then
            ball.Parent = nil
        end
    end

    stripForces(LocalPlayer.Character, false)
end

local function hardCharacterReset()
    local char = LocalPlayer.Character
    if not char then return end
    stripForces(char, true)
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") and tostring(p.Name):find("SoA") then
            neutralizePart(p)
            pcall(function() p:Destroy() end)
        end
    end
    if not (Settings.Fly.Enabled and Settings.Fly.Active) then
        local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
        if root and root.Anchored then
            root.Anchored = false
        end
    end
end

-- Inject only (do NOT periodically zero velocity — that causes the shove)
antiShoveCleanup()
hardCharacterReset()
task.defer(function()
    antiShoveCleanup()
    hardCharacterReset()
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    task.defer(function()
        stripForces(char, true)
        antiShoveCleanup()
    end)
end)

-- Light pass: only neutralize SoA workspace junk, never touch player velocity
task.spawn(function()
    while true do
        task.wait(3)
        antiShoveCleanup()
    end
end)

local materials = {"ForceField", "Glass", "CrackedLava", "SmoothPlastic", "Neon"}
local doorMaterials = {"Plastic", "Wood", "Slate", "Concrete", "Metal", "ForceField", "Glass", "Neon"}

local AnimatedSkinNames, AnimatedSkinLookup = {}, {}
for _, d in ipairs(Settings.AnimatedSkin.Data) do
    table.insert(AnimatedSkinNames, d.Name)
    AnimatedSkinLookup[d.Name] = d.Id
end

local HitsoundHitNames, HitsoundHitLookup = {}, {}
for _, d in ipairs(Settings.Hitsound.HitData) do
    table.insert(HitsoundHitNames, d.Name)
    HitsoundHitLookup[d.Name] = d.Id
end

local HitsoundKillNames, HitsoundKillLookup = {}, {}
for _, d in ipairs(Settings.Hitsound.KillData) do
    table.insert(HitsoundKillNames, d.Name)
    HitsoundKillLookup[d.Name] = d.Id
end

local TrailTextureNames, TrailTextureLookup = {}, {}
for _, d in ipairs(Settings.Trail.TextureData) do
    table.insert(TrailTextureNames, d.Name)
    TrailTextureLookup[d.Name] = d.Id
end

--------------------------------------------------
-- Window
--------------------------------------------------

local Window = libary:new({
    name = "Chinese Overlay | SoA",
    accent = Color3.fromRGB(130, 210, 220),
    textsize = 13
})

--------------------------------------------------
-- Info List + Bind List
--------------------------------------------------

local sessionStart = os.clock()
local fpsValue = 0
local fpsFrames = 0
local fpsLast = os.clock()

local infoPanel = Window:panel({
    name = "info",
    width = 200,
    position = UDim2.new(1, -10, 0, 10),
    anchor = Vector2.new(1, 0),
})

local function keyName(k)
    if typeof(k) ~= "EnumItem" then return tostring(k) end
    local s = tostring(k)
    local parts = string.split(s, ".")
    return parts[#parts] or s
end

local function updateInfoPanel()
    local players = #Players:GetPlayers()
    local session = math.floor(os.clock() - sessionStart)
    local mins = math.floor(session / 60)
    local secs = session % 60
    local sessionStr = string.format("%dm %02ds", mins, secs)
    local serverStr = tostring(players) .. " players"
    pcall(function()
        infoPanel:setlines({
            "FPS  " .. tostring(fpsValue),
            "Server  " .. serverStr,
            "Session  " .. sessionStr,
        })
    end)
end

-- Standalone bind list (does not depend on library panel refresh quirks)
local bindGuiParent = (gethui and select(2, pcall(gethui))) or game:GetService("CoreGui")
pcall(function()
    local old = bindGuiParent:FindFirstChild("SoA_BindList")
    if old then old:Destroy() end
end)

local bindScreen = Instance.new("ScreenGui")
bindScreen.Name = "SoA_BindList"
bindScreen.ResetOnSpawn = false
bindScreen.IgnoreGuiInset = true
bindScreen.ZIndexBehavior = Enum.ZIndexBehavior.Global
bindScreen.Parent = bindGuiParent

local bindFrame = Instance.new("Frame")
bindFrame.Name = "Main"
bindFrame.Size = UDim2.new(0, 180, 0, 40)
bindFrame.Position = UDim2.new(0, 12, 0.35, 0)
bindFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
bindFrame.BorderSizePixel = 1
bindFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
bindFrame.Active = true
bindFrame.Draggable = true
bindFrame.Parent = bindScreen

local bindAccent = Instance.new("Frame")
bindAccent.Size = UDim2.new(1, 0, 0, 2)
bindAccent.BackgroundColor3 = Color3.fromRGB(130, 210, 220)
bindAccent.BorderSizePixel = 0
bindAccent.Parent = bindFrame

local bindTitle = Instance.new("TextLabel")
bindTitle.BackgroundTransparency = 1
bindTitle.Position = UDim2.new(0, 8, 0, 6)
bindTitle.Size = UDim2.new(1, -16, 0, 16)
bindTitle.Font = Enum.Font.SourceSans
bindTitle.TextSize = 13
bindTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
bindTitle.TextXAlignment = Enum.TextXAlignment.Left
bindTitle.Text = "binds"
bindTitle.Parent = bindFrame

local bindBody = Instance.new("TextLabel")
bindBody.BackgroundTransparency = 1
bindBody.Position = UDim2.new(0, 8, 0, 24)
bindBody.Size = UDim2.new(1, -16, 1, -30)
bindBody.Font = Enum.Font.SourceSans
bindBody.TextSize = 13
bindBody.TextColor3 = Color3.fromRGB(200, 200, 205)
bindBody.TextXAlignment = Enum.TextXAlignment.Left
bindBody.TextYAlignment = Enum.TextYAlignment.Top
bindBody.TextWrapped = true
bindBody.Text = "No active binds"
bindBody.Parent = bindFrame

local function updateBindPanel()
    local lines = {}
    local function add(name, enabled, key, active)
        if not key then return end
        if enabled or active then
            local suffix = active and " *" or ""
            table.insert(lines, keyName(key) .. "  " .. name .. suffix)
        end
    end
    add("Menu", true, Settings.Menu.Key, false)
    add("Ragebot", Settings.Ragebot.Enabled, Settings.Ragebot.Key, false)
    add("Zoom", Settings.Zoom.Enabled, Settings.Zoom.Key, Settings.Zoom.Active == true)
    add("Third Person", Settings.ThirdPerson.Enabled, Settings.ThirdPerson.Key, Settings.ThirdPerson.Active == true)
    add("Fly", Settings.Fly.Enabled, Settings.Fly.Key, Settings.Fly.Active == true)
    add("Invisibility", Settings.Invisibility.Enabled, Settings.Invisibility.Key, Settings.Invisibility.Active == true)
    add("Control Peek", Settings.ControlPeek.Enabled, Settings.ControlPeek.Key, Settings.ControlPeek.Active == true)

    if #lines == 0 then
        bindBody.Text = "No active binds"
    else
        bindBody.Text = table.concat(lines, "\n")
    end
    local lineCount = math.max(1, #lines)
    bindFrame.Size = UDim2.new(0, 180, 0, 28 + lineCount * 16)
end

_G.SoA_UpdateBindPanel = updateBindPanel

RunService.RenderStepped:Connect(function()
    fpsFrames = fpsFrames + 1
    local now = os.clock()
    if now - fpsLast >= 1 then
        fpsValue = fpsFrames
        fpsFrames = 0
        fpsLast = now
        updateInfoPanel()
    end
end)

task.spawn(function()
    while bindScreen.Parent do
        updateBindPanel()
        task.wait(0.2)
    end
end)

task.defer(updateBindPanel)
task.defer(updateInfoPanel)


local AimTab = Window:page({name = "Aim"})
local VisualsTab = Window:page({name = "Visuals"})
local ESPTab = Window:page({name = "ESP"})
local FunkyTab = Window:page({name = "Funky"})
local VFXTab = Window:page({name = "VFX"})
local SettingsTab = Window:page({name = "Settings"})

-- Aim
local aimSection = AimTab:section({name = "Aim", side = "left", size = 380})
local playerTargetSection = AimTab:section({name = "Player Targeting", side = "left", size = 110})
local ragebotSection = AimTab:section({name = "Ragebot", side = "right", size = 150})
local controlPeekSection = AimTab:section({name = "Control Peek", side = "right", size = 260})

-- Visuals
local viewmodelSection = VisualsTab:section({name = "Viewmodel", side = "left", size = 220})
local animatedSkinSection = VisualsTab:section({name = "Animated Skin", side = "left", size = 140})
local ambienceSection = VisualsTab:section({name = "Ambience", side = "right", size = 170})
local ccSection = VisualsTab:section({name = "Color Correction", side = "right", size = 150})
local penetrationSection = VisualsTab:section({name = "Penetration Check", side = "right", size = 90})
local raycastSection = VisualsTab:section({name = "Raycast Prediction", side = "right", size = 140})

-- ESP
local headDotSection = ESPTab:section({name = "Head Dot", side = "left", size = 120})
local boxSection = ESPTab:section({name = "2D Box", side = "left", size = 120})
local cornerBoxSection = ESPTab:section({name = "Corner Box", side = "left", size = 140})
local skeletonSection = ESPTab:section({name = "Skeleton ESP", side = "left", size = 140})
local tracerSection = ESPTab:section({name = "View Tracer", side = "right", size = 160})
local advancedESPSection = ESPTab:section({name = "Advanced ESP", side = "right", size = 180})
local bodyESPSection = ESPTab:section({name = "Body ESP", side = "right", size = 90})
local radarSection = ESPTab:section({name = "Radar", side = "left", size = 260})

-- Funky
local containerSection = FunkyTab:section({name = "Containers", side = "left", size = 200})
local pickupSection = FunkyTab:section({name = "PickUps", side = "right", size = 180})
local teleportSection = FunkyTab:section({name = "Teleport", side = "left", size = 140})
local thirdPersonSection = FunkyTab:section({name = "Third Person", side = "right", size = 140})
local fovSection = FunkyTab:section({name = "Fov Changer", side = "left", size = 140})
local zoomSection = FunkyTab:section({name = "Zoom", side = "right", size = 130})
local hitsoundSection = FunkyTab:section({name = "Hitsound", side = "right", size = 260})
local doorSection = FunkyTab:section({name = "Doors", side = "left", size = 200})

-- VFX
local gunVFXSection = VFXTab:section({name = "Gun VFX", side = "left", size = 140})
local charVFXSection = VFXTab:section({name = "Character VFX", side = "left", size = 180})
local chinaHatSection = VFXTab:section({name = "China Hat", side = "right", size = 100})
local trailSection = VFXTab:section({name = "Trail", side = "right", size = 130})
local targetXhairSection = VFXTab:section({name = "Target Crosshair", side = "left", size = 160})
local localCharSection = VFXTab:section({name = "Local Character", side = "right", size = 190})
local hitBeamSection = VFXTab:section({name = "Hit Beam", side = "left", size = 140})
local viewDetectionSection = VFXTab:section({name = "View Detection", side = "right", size = 70})
local invisibilitySection = VFXTab:section({name = "Invisibility", side = "left", size = 150})
local flySection = VFXTab:section({name = "Fly", side = "right", size = 120})

-- Settings
local menuSection = SettingsTab:section({name = "Menu", side = "left", size = 120})
local otherSection = SettingsTab:section({name = "Other", side = "left", size = 140})
local graphicsSection = SettingsTab:section({name = "Graphics", side = "right", size = 160})
local audioSection = SettingsTab:section({name = "Audio", side = "left", size = 100})
local configSection = SettingsTab:section({name = "Configs", side = "right", size = 320})

--------------------------------------------------
-- Screen Labels
--------------------------------------------------

local function createScreenLabel(name, yOffset)
    local guiParent = (gethui and select(2, pcall(gethui))) or game:GetService("CoreGui")
    local old = guiParent:FindFirstChild(name)
    if old then old:Destroy() end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.Parent = guiParent

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.BackgroundTransparency = 1
    label.AnchorPoint = Vector2.new(0.5, 0)
    label.Position = UDim2.new(0.5, 0, 0.5, yOffset)
    label.Size = UDim2.new(0, 400, 0, 22)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 16
    label.Text = ""
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0.25
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Visible = false
    label.Parent = screenGui

    return screenGui, label
end

local aimTargetGui, aimTargetLabel = createScreenLabel("SoA_AimTarget", 40)
local penetrationGui, penetrationLabel = createScreenLabel("SoA_Penetration", 62)
local viewDetectionGui, viewDetectionLabel = createScreenLabel("SoA_ViewDetection", 84)
local controlPeekGui, controlPeekLabel = createScreenLabel("SoA_ControlPeek", -80)
local invisStatusGui, invisStatusLabel = createScreenLabel("SoA_InvisStatus", -58)

--------------------------------------------------
-- Shared Helpers
--------------------------------------------------

local function forceRefreshDropdown(dropdown, names)
    if not dropdown then return end
    pcall(function()
        if type(dropdown.Refresh) == "function" then
            dropdown:Refresh(names)
        elseif getmetatable(dropdown) and getmetatable(dropdown).Refresh then
            dropdown:Refresh(names)
        elseif dropdown.options then
            dropdown.options = names
        end
    end)
end

local function getPlayerNamesList(includeNone)
    local names = includeNone and {"None"} or {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(names, p.Name) end
    end
    table.sort(names)
    return names
end

local function getModelNames(folder)
    local names = {"All"}
    local seen = {}
    for _, obj in ipairs(folder:GetChildren()) do
        if obj:IsA("Model") and not seen[obj.Name] then
            seen[obj.Name] = true
            table.insert(names, obj.Name)
        end
    end
    table.sort(names, function(a, b)
        if a == "All" then return true end
        if b == "All" then return false end
        return a < b
    end)
    return names
end

--------------------------------------------------
-- VFX Library
--------------------------------------------------

local function createNumberSequence(nodes)
    local keypoints = {}
    for _, n in ipairs(nodes) do
        table.insert(keypoints, NumberSequenceKeypoint.new(n.Time, n.Value, n.Envelope or 0))
    end
    return NumberSequence.new(keypoints)
end

local VFX = {}

function VFX.CreateDots(parent, color, isGun)
    local part = Instance.new("Part")
    part.Name = "SoA_Dots"
    part.Anchored = false
    part.CanCollide = false
    part.CanQuery = false
    part.CanTouch = false
    part.Massless = true
    part.Transparency = 1
    part.Size = Vector3.new(0.1, 0.1, 0.1)
    part.Parent = parent

    local emitter = Instance.new("ParticleEmitter")
    emitter.Brightness = isGun and 30 or 50
    emitter.Color = ColorSequence.new(color or Color3.fromRGB(160, 92, 255))
    emitter.LightEmission = 1
    emitter.LightInfluence = 0
    emitter.Orientation = Enum.ParticleOrientation.FacingCamera

    if isGun then
        emitter.Size = createNumberSequence({
            {Time = 0, Value = 0.04},
            {Time = 1, Value = 0.12}
        })
        emitter.Lifetime = NumberRange.new(0.56, 1.75)
        emitter.Speed = NumberRange.new(0.15, 0.9)
        emitter.Rate = 25
        emitter.ZOffset = 1.5
    else
        emitter.Size = createNumberSequence({
            {Time = 0, Value = 0.1},
            {Time = 1, Value = 0.4}
        })
        emitter.Lifetime = NumberRange.new(0.1, 1)
        emitter.Speed = NumberRange.new(1, 8)
        emitter.Rate = 40
        emitter.ZOffset = 0.1
    end

    emitter.Texture = "rbxassetid://14582794847"
    emitter.Transparency = createNumberSequence({
        {Time = 0, Value = 0},
        {Time = 1, Value = 0.65}
    })
    emitter.EmissionDirection = Enum.NormalId.Top
    emitter.Enabled = true
    emitter.Rotation = NumberRange.new(0)
    emitter.RotSpeed = NumberRange.new(0)
    emitter.SpreadAngle = Vector2.new(-360, 360)
    emitter.Shape = Enum.ParticleEmitterShape.Box
    emitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
    emitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
    emitter.LockedToPart = true
    emitter.Parent = part

    return part
end

function VFX.CreateSlash(parent, color, isGun)
    local part = Instance.new("Part")
    part.Name = "SoA_Slash"
    part.Anchored = false
    part.CanCollide = false
    part.CanQuery = false
    part.CanTouch = false
    part.Massless = true
    part.Transparency = 1
    part.Size = Vector3.new(0.1, 0.1, 0.1)
    part.Parent = parent

    local att = Instance.new("Attachment")
    att.Name = "Attachment"
    att.Parent = part

    local emitter = Instance.new("ParticleEmitter")
    emitter.Brightness = 15
    emitter.Color = ColorSequence.new(color or Color3.fromRGB(255, 255, 255))
    emitter.LightEmission = -5
    emitter.LightInfluence = 0
    emitter.Orientation = Enum.ParticleOrientation.FacingCamera

    if isGun then
        emitter.Size = NumberSequence.new(1.8)
        emitter.ZOffset = 2.5
        emitter.Rate = 4.5
        emitter.Lifetime = NumberRange.new(0.5)
        emitter.Speed = NumberRange.new(0.05, 0.15)
    else
        emitter.Size = NumberSequence.new(3)
        emitter.ZOffset = 0
        emitter.Rate = 2
        emitter.Lifetime = NumberRange.new(1)
        emitter.Speed = NumberRange.new(0)
    end

    emitter.Texture = "rbxassetid://11862032588"
    emitter.Transparency = createNumberSequence({
        {Time = 0, Value = 0},
        {Time = 1, Value = 1}
    })
    emitter.EmissionDirection = Enum.NormalId.Top
    emitter.Enabled = true
    emitter.Rotation = NumberRange.new(-1000, 1000)
    emitter.RotSpeed = NumberRange.new(-10, 10)
    emitter.SpreadAngle = Vector2.new(-1000, 1000)
    emitter.Shape = Enum.ParticleEmitterShape.Box
    emitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
    emitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
    emitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
    emitter.FlipbookBlendFrames = true
    emitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
    emitter.Drag = 1
    emitter.Parent = att

    return part
end

function VFX.CreateChainEffect(parent, color)
    local part = Instance.new("Part")
    part.Name = "SoA_ChainEffect"
    part.Anchored = false
    part.CanCollide = false
    part.CanQuery = false
    part.CanTouch = false
    part.Massless = true
    part.Transparency = 1
    part.Size = Vector3.new(0.5, 0.5, 0.5)
    part.Parent = parent

    local function makeOffset(name, pos, ori)
        local att = Instance.new("Attachment")
        att.Name = name
        att.Position = pos
        att.Orientation = ori
        att.Parent = part
        return att
    end

    local offsetA1 = makeOffset("OffsetA1", Vector3.new(0, 0, 1.8), Vector3.new(0, 0, -21.4))
    local offsetA2 = makeOffset("OffsetA2", Vector3.new(0, 0, -1.8), Vector3.new(0, 0, -21.4))
    local offsetB1 = makeOffset("OffsetB1", Vector3.new(0, 0, -1.9), Vector3.new(0, 0, 5.4))
    local offsetB2 = makeOffset("OffsetB2", Vector3.new(0, 0, 1.9), Vector3.new(0, 0, 5.4))

    local function makeChain(name, att0, att1, curve0, curve1)
        local beam = Instance.new("Beam")
        beam.Name = name
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.Color = ColorSequence.new(Color3.new(0, 0, 0))
        beam.Enabled = true
        beam.LightEmission = 0.5
        beam.LightInfluence = 1
        beam.Texture = "rbxassetid://12360706436"
        beam.TextureLength = 2
        beam.TextureMode = Enum.TextureMode.Static
        beam.TextureSpeed = 3
        beam.Transparency = NumberSequence.new(0)
        beam.FaceCamera = false
        beam.Segments = 100
        beam.Width0 = 1
        beam.Width1 = 1
        beam.CurveSize0 = curve0
        beam.CurveSize1 = curve1
        beam.Parent = part
        return beam
    end

    makeChain("ChainA", offsetA2, offsetA1, -2.5, 2.5)
    makeChain("ChainB", offsetB1, offsetB2, -3, 3)
    makeChain("ChainC", offsetB2, offsetB1, 3, -3)
    makeChain("ChainD", offsetA1, offsetA2, 2.5, -2.5)

    return part
end

--------------------------------------------------
-- Gun VFX System--------------------------------------------------
-- Gun VFX System
--------------------------------------------------

local currentGunVFX = nil

local function clearGunVFX()
    if currentGunVFX and currentGunVFX.Parent then
        currentGunVFX:Destroy()
    end
    currentGunVFX = nil
end

local function updateGunVFX()
    clearGunVFX()
    if not Settings.GunVFX.Enabled or Settings.GunVFX.Type == "None" then return end

    local rigs = getRigs()
    if not rigs then return end

    local activeRig
    for _, child in ipairs(rigs:GetChildren()) do
        if child:IsA("Model") then
            activeRig = child
            break
        end
    end
    if not activeRig then return end

    local essentials = activeRig:FindFirstChild("Essentials")
    if not essentials then return end

    local eject = essentials:FindFirstChild("Eject")
    if not eject then return end

    if Settings.GunVFX.Type == "Dots" then
        currentGunVFX = VFX.CreateDots(eject, Settings.GunVFX.Color, true)
    elseif Settings.GunVFX.Type == "Slash" then
        currentGunVFX = VFX.CreateSlash(eject, Settings.GunVFX.Color, true)
    end

    if currentGunVFX then
        currentGunVFX.CFrame = eject.CFrame
        currentGunVFX.Anchored = false
        currentGunVFX.Massless = true

        for _, v in ipairs(currentGunVFX:GetChildren()) do
            if v:IsA("WeldConstraint") or v:IsA("Weld") then
                v:Destroy()
            end
        end

        local weld = Instance.new("WeldConstraint")
        weld.Part0 = eject
        weld.Part1 = currentGunVFX
        weld.Parent = currentGunVFX
    end
end

gunVFXSection:toggle({
    name = "Enabled",
    def = false,
    callback = function(v)
        Settings.GunVFX.Enabled = v
        updateGunVFX()
    end
})

gunVFXSection:dropdown({
    name = "VFX Type",
    def = "None",
    max = 3,
    options = {"None", "Dots", "Slash"},
    callback = function(v)
        Settings.GunVFX.Type = v
        updateGunVFX()
    end
})

gunVFXSection:colorpicker({
    name = "Color",
    cpname = "",
    def = Settings.GunVFX.Color,
    callback = function(c)
        Settings.GunVFX.Color = c
        updateGunVFX()
    end
})

getRigs().ChildAdded:Connect(function()
    task.delay(0.3, updateGunVFX)
end)

--------------------------------------------------
-- Character VFX System
--------------------------------------------------

local charVFXObjects = {Slot1 = nil, Slot2 = nil}

local function clearCharVFX(slot)
    if charVFXObjects[slot] and charVFXObjects[slot].Parent then
        charVFXObjects[slot]:Destroy()
    end
    charVFXObjects[slot] = nil
end

local function updateCharacterVFX()
    clearCharVFX("Slot1")
    clearCharVFX("Slot2")

    if not Settings.CharacterVFX.Enabled then return end

    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Base")
    if not root then return end

    local vfxFolder = workspace:FindFirstChild("SoA_CharVFX")
    if not vfxFolder then
        vfxFolder = Instance.new("Folder")
        vfxFolder.Name = "SoA_CharVFX"
        vfxFolder.Parent = workspace
    end

    local function applySlot(slotName, vfxType, color)
        if vfxType == "None" then return end

        local obj
        if vfxType == "Dots" then
            obj = VFX.CreateDots(vfxFolder, color, false)
        elseif vfxType == "ChainEffect" then
            obj = VFX.CreateChainEffect(vfxFolder, color)
        end

        if obj then
            -- Fully non-physical so it can never shake the character
            obj.Anchored = true
            obj.Massless = true
            obj.CanCollide = false
            obj.CanQuery = false
            obj.CanTouch = false
            obj.CastShadow = false
            obj.CFrame = root.CFrame * CFrame.new(0, 0.2, 0)
            charVFXObjects[slotName] = obj
        end
    end

    applySlot("Slot1", Settings.CharacterVFX.Slot1, Settings.CharacterVFX.Color1)
    applySlot("Slot2", Settings.CharacterVFX.Slot2, Settings.CharacterVFX.Color2)
end

local function followCharacterVFX()
    if not Settings.CharacterVFX.Enabled then return end
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Base")
    if not root then return end
    local cf = root.CFrame * CFrame.new(0, 0.2, 0)
    for _, obj in pairs(charVFXObjects) do
        if obj and obj.Parent then
            obj.CFrame = cf
        end
    end
end

_G.SoA_FollowCharVFX = followCharacterVFX

charVFXSection:toggle({
    name = "Enabled",
    def = false,
    callback = function(v)
        Settings.CharacterVFX.Enabled = v
        updateCharacterVFX()
    end
})

charVFXSection:dropdown({
    name = "Slot 1",
    def = "None",
    max = 3,
    options = {"None", "Dots", "ChainEffect"},
    callback = function(v)
        Settings.CharacterVFX.Slot1 = v
        updateCharacterVFX()
    end
})

charVFXSection:colorpicker({
    name = "Slot 1 Color",
    cpname = "",
    def = Settings.CharacterVFX.Color1,
    callback = function(c)
        Settings.CharacterVFX.Color1 = c
        updateCharacterVFX()
    end
})

charVFXSection:dropdown({
    name = "Slot 2",
    def = "None",
    max = 3,
    options = {"None", "Dots", "ChainEffect"},
    callback = function(v)
        Settings.CharacterVFX.Slot2 = v
        updateCharacterVFX()
    end
})

charVFXSection:colorpicker({
    name = "Slot 2 Color",
    cpname = "",
    def = Settings.CharacterVFX.Color2,
    callback = function(c)
        Settings.CharacterVFX.Color2 = c
        updateCharacterVFX()
    end
})

LocalPlayer.CharacterAdded:Connect(function()
    task.delay(0.8, function()
        if Settings.CharacterVFX.Enabled then
            updateCharacterVFX()
        end
    end)
end)

--------------------------------------------------
-- Third Person (Fixed - shows full character)
--------------------------------------------------

local thirdPersonWasActive = false
local lastBodyVisible = nil

local function setCharacterVisible(state)
    local character = LocalPlayer.Character
    if not character then return end
    -- Skip work if state unchanged (reduces fight with game body/hit nodes)
    if lastBodyVisible == state then return end
    lastBodyVisible = state

    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            -- Never touch collision — only local visual hide for 1st person
            part.LocalTransparencyModifier = state and 0 or 1
        end
    end
end

local function updateThirdPerson()
    local character = LocalPlayer.Character
    if not character then return end
    local root = character:FindFirstChild("HumanoidRootPart")

    local active = Settings.ThirdPerson.Enabled and Settings.ThirdPerson.Active

    if not active then
        if Camera.CameraType == Enum.CameraType.Scriptable then
            Camera.CameraType = Enum.CameraType.Custom
        end
        if thirdPersonWasActive then
            thirdPersonWasActive = false
            lastBodyVisible = nil
            setCharacterVisible(false)
        end
        return
    end

    if not root then return end

    thirdPersonWasActive = true
    setCharacterVisible(true)

    Camera.CameraType = Enum.CameraType.Scriptable

    local distance = Settings.ThirdPerson.Distance
    local height = 2

    local camPos = root.Position - (root.CFrame.LookVector * distance) + Vector3.new(0, height, 0)
    local lookAt = root.Position + Vector3.new(0, 1.5, 0)

    Camera.CFrame = CFrame.lookAt(camPos, lookAt)
end

thirdPersonSection:toggle({
    name = "Enabled",
    def = false,
    callback = function(v)
        Settings.ThirdPerson.Enabled = v
        if not v then
            Settings.ThirdPerson.Active = false
            Camera.CameraType = Enum.CameraType.Custom
        end
    end
})

thirdPersonSection:keybind({
    name = "Toggle Key",
    def = Enum.KeyCode.V,
    callback = function(k)
        Settings.ThirdPerson.Key = k
    end
})

thirdPersonSection:slider({
    name = "Distance",
    def = 8,
    max = 20,
    min = 3,
    rounding = true,
    callback = function(v)
        Settings.ThirdPerson.Distance = v
    end
})

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if not Settings.ThirdPerson.Enabled then return end
    if input.KeyCode == Settings.ThirdPerson.Key then
        Settings.ThirdPerson.Active = not Settings.ThirdPerson.Active
        if not Settings.ThirdPerson.Active then
            Camera.CameraType = Enum.CameraType.Custom
        end
        task.delay(0.15, function()
            if Settings.CharacterVFX.Enabled then
                updateCharacterVFX()
            end
        end)
    end
end)

--------------------------------------------------
-- Viewmodel + Animated Skin
--------------------------------------------------

do
    local lastUpdate = 0
    local SKIP = {Reticle = true, Glass = true, AimPart = true}

    local function clearTextures()
        for _, tex in pairs(Settings.AnimatedSkin.Textures) do
            if tex and tex.Parent then tex:Destroy() end
        end
        table.clear(Settings.AnimatedSkin.Textures)
    end

    local function shouldSkip(obj, rigs)
        if SKIP[obj.Name] then return true end
        local p = obj.Parent
        while p and p ~= rigs do
            if p.Name == "Arms" or p.Name == "Essentials" then return true end
            p = p.Parent
        end
        return false
    end

    local function applySkin()
        clearTextures()
        if not Settings.AnimatedSkin.Enabled then return end
        local rigs = getRigs()
        if not rigs then return end
        local faces = {Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Left, Enum.NormalId.Right, Enum.NormalId.Top, Enum.NormalId.Bottom}
        for _, obj in ipairs(rigs:GetDescendants()) do
            if obj:IsA("BasePart") and not shouldSkip(obj, rigs) then
                for _, face in ipairs(faces) do
                    local tex = Instance.new("Texture")
                    tex.Name = "SoA_AnimatedSkin"
                    tex.Texture = "rbxassetid://" .. Settings.AnimatedSkin.Id
                    tex.Face = face
                    tex.StudsPerTileU = 2
                    tex.StudsPerTileV = 2
                    tex.Parent = obj
                    table.insert(Settings.AnimatedSkin.Textures, tex)
                end
            end
        end
    end

    local function updateViewmodel(force)
        if not force then
            local now = os.clock()
            if now - lastUpdate < 0.35 then return end
            lastUpdate = now
        end
        local rigs = getRigs()
        if not rigs then return end

        for _, obj in ipairs(rigs:GetDescendants()) do
            local isArm = false
            local p = obj.Parent
            while p and p ~= rigs do
                if p.Name == "Arms" then isArm = true break end
                p = p.Parent
            end

            if obj:IsA("BasePart") or obj:IsA("Texture") or obj:IsA("Decal") then
                if obj:GetAttribute("OriginalTransparency") == nil then
                    obj:SetAttribute("OriginalTransparency", obj.Transparency)
                end
                if Settings.Viewmodel.NoArms and isArm then
                    obj.Transparency = 1
                elseif Settings.Viewmodel.Invisible then
                    obj.Transparency = 1
                elseif Settings.Viewmodel.MaterialEnabled and (obj:IsA("Texture") or obj:IsA("Decal")) then
                    obj.Transparency = 1
                else
                    obj.Transparency = obj:GetAttribute("OriginalTransparency") or 0
                end
            end

            if obj:IsA("BasePart") and not (Settings.Viewmodel.NoArms and isArm) then
                if obj:GetAttribute("OriginalColor") == nil then obj:SetAttribute("OriginalColor", obj.Color) end
                if obj:GetAttribute("OriginalMaterial") == nil then obj:SetAttribute("OriginalMaterial", obj.Material.Name) end

                if Settings.Viewmodel.ColorEnabled then
                    obj.Color = Settings.Viewmodel.Color
                else
                    local orig = obj:GetAttribute("OriginalColor")
                    if orig then obj.Color = orig end
                end

                if Settings.Viewmodel.MaterialEnabled then
                    local mat = Enum.Material[Settings.Viewmodel.Material]
                    if mat then obj.Material = mat end
                else
                    local origMat = obj:GetAttribute("OriginalMaterial")
                    if origMat and Enum.Material[origMat] then obj.Material = Enum.Material[origMat] end
                end
            end
        end
        if Settings.AnimatedSkin.Enabled then applySkin() end
    end

    viewmodelSection:toggle({name = "Invisible", def = false, callback = function(v) Settings.Viewmodel.Invisible = v updateViewmodel(true) end})
    viewmodelSection:toggle({name = "Color Enabled", def = false, callback = function(v) Settings.Viewmodel.ColorEnabled = v updateViewmodel(true) end})
    viewmodelSection:colorpicker({name = "Color", cpname = "", def = Settings.Viewmodel.Color, callback = function(c) Settings.Viewmodel.Color = c updateViewmodel(true) end})
    viewmodelSection:toggle({name = "Material Enabled", def = false, callback = function(v) Settings.Viewmodel.MaterialEnabled = v updateViewmodel(true) end})
    viewmodelSection:dropdown({name = "Material", def = Settings.Viewmodel.Material, max = 5, options = materials, callback = function(v) Settings.Viewmodel.Material = v updateViewmodel(true) end})
    viewmodelSection:toggle({name = "No Arms", def = false, callback = function(v) Settings.Viewmodel.NoArms = v updateViewmodel(true) end})

    animatedSkinSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.AnimatedSkin.Enabled = v applySkin() end})
    animatedSkinSection:dropdown({name = "Texture", def = "Moondrop", max = 6, options = AnimatedSkinNames, callback = function(v)
        Settings.AnimatedSkin.Id = AnimatedSkinLookup[v] or Settings.AnimatedSkin.Id
        if Settings.AnimatedSkin.Enabled then applySkin() end
    end})
    animatedSkinSection:slider({name = "Speed", def = 5, max = 10, min = 1, rounding = true, callback = function(v) Settings.AnimatedSkin.Speed = v / 100 end})

    getRigs().DescendantAdded:Connect(function() task.delay(0.1, function() updateViewmodel(false) end) end)
    updateViewmodel(true)

    _G.SoA_ClearTextures = clearTextures
end

--------------------------------------------------
-- Doors + Ambience
--------------------------------------------------

do
    local function storeOriginals()
        for _, obj in ipairs(getDoors():GetDescendants()) do
            if obj:IsA("BasePart") and not Settings.Doors.Originals[obj] then
                Settings.Doors.Originals[obj] = {
                    Transparency = obj.Transparency,
                    Color = obj.Color,
                    Material = obj.Material,
                    CanCollide = obj.CanCollide
                }
            end
        end
    end

    local function restore()
        for obj, data in pairs(Settings.Doors.Originals) do
            if obj and obj.Parent then
                obj.Transparency = data.Transparency
                obj.Color = data.Color
                obj.Material = data.Material
                obj.CanCollide = data.CanCollide
            end
        end
    end

    local function updateDoors()
        if not Settings.Doors.Enabled then restore() return end
        storeOriginals()
        for _, obj in ipairs(getDoors():GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.Transparency = Settings.Doors.Transparency
                obj.Color = Settings.Doors.Color
                obj.CanCollide = false
                if Settings.Doors.MaterialEnabled then
                    local mat = Enum.Material[Settings.Doors.Material]
                    if mat then obj.Material = mat end
                end
            end
        end
    end

    doorSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.Doors.Enabled = v updateDoors() end})
    doorSection:slider({name = "Transparency", def = 0, max = 100, min = 0, rounding = true, callback = function(v) Settings.Doors.Transparency = v / 100 if Settings.Doors.Enabled then updateDoors() end end})
    doorSection:colorpicker({name = "Color", cpname = "", def = Settings.Doors.Color, callback = function(c) Settings.Doors.Color = c if Settings.Doors.Enabled then updateDoors() end end})
    doorSection:toggle({name = "Material Enabled", def = false, callback = function(v) Settings.Doors.MaterialEnabled = v if Settings.Doors.Enabled then updateDoors() end end})
    doorSection:dropdown({name = "Material", def = Settings.Doors.Material, max = 8, options = doorMaterials, callback = function(v) Settings.Doors.Material = v if Settings.Doors.Enabled then updateDoors() end end})

    getDoors().DescendantAdded:Connect(function() if Settings.Doors.Enabled then task.defer(updateDoors) end end)

    local function updateAmbience()
        if Settings.Ambience.Enabled then
            Lighting.ClockTime = Settings.Ambience.Daytime
            Lighting.OutdoorAmbient = Settings.Ambience.Color
            Lighting.Ambient = Settings.Ambience.Color
            Lighting.ColorShift_Top = Settings.Ambience.SkyColor
            Lighting.ColorShift_Bottom = Settings.Ambience.SkyColor
        else
            Lighting.ClockTime = Settings.Ambience.OriginalClock
            Lighting.OutdoorAmbient = Settings.Ambience.OriginalOutdoor
            Lighting.Ambient = Settings.Ambience.OriginalAmbientColor
            Lighting.ColorShift_Top = Settings.Ambience.OriginalColorShiftTop
            Lighting.ColorShift_Bottom = Settings.Ambience.OriginalColorShiftBottom
        end
    end

    _G.SoA_UpdateAmbience = updateAmbience

    ambienceSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.Ambience.Enabled = v updateAmbience() end})
    ambienceSection:slider({name = "Daytime", def = 12, max = 24, min = 0, rounding = true, callback = function(v) Settings.Ambience.Daytime = v if Settings.Ambience.Enabled then updateAmbience() end end})
    ambienceSection:colorpicker({name = "Ambient Color", cpname = "", def = Settings.Ambience.Color, callback = function(c) Settings.Ambience.Color = c if Settings.Ambience.Enabled then updateAmbience() end end})
    ambienceSection:colorpicker({name = "Sky Color", cpname = "", def = Settings.Ambience.SkyColor, callback = function(c) Settings.Ambience.SkyColor = c if Settings.Ambience.Enabled then updateAmbience() end end})
end

--------------------------------------------------
-- Color Correction
--------------------------------------------------

do
    local ccEffect = Lighting:FindFirstChild("SoA_ColorCorrection")
    if not ccEffect then
        ccEffect = Instance.new("ColorCorrectionEffect")
        ccEffect.Name = "SoA_ColorCorrection"
        ccEffect.Enabled = false
        ccEffect.Parent = Lighting
    end

    local function updateColorCorrection()
        if not ccEffect then return end
        ccEffect.Enabled = Settings.ColorCorrection.Enabled
        ccEffect.Contrast = Settings.ColorCorrection.Contrast
        ccEffect.Saturation = Settings.ColorCorrection.Saturation
        ccEffect.Brightness = Settings.ColorCorrection.Brightness
    end

    _G.SoA_UpdateColorCorrection = updateColorCorrection

    ccSection:toggle({name = "Enabled", def = false, callback = function(v)
        Settings.ColorCorrection.Enabled = v
        updateColorCorrection()
    end})
    ccSection:slider({
        name = "Contrast",
        def = 0,
        max = 100,
        min = -100,
        rounding = true,
        callback = function(v)
            Settings.ColorCorrection.Contrast = v / 100
            updateColorCorrection()
        end
    })
    ccSection:slider({
        name = "Saturation",
        def = 0,
        max = 100,
        min = -100,
        rounding = true,
        callback = function(v)
            Settings.ColorCorrection.Saturation = v / 100
            updateColorCorrection()
        end
    })
    ccSection:slider({
        name = "Brightness",
        def = 0,
        max = 100,
        min = -100,
        rounding = true,
        callback = function(v)
            Settings.ColorCorrection.Brightness = v / 100
            updateColorCorrection()
        end
    })
end

--------------------------------------------------
-- FOV + Zoom
--------------------------------------------------

fovSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.FOV.Enabled = v end})
fovSection:slider({name = "FOV", def = 90, max = 120, min = 70, rounding = true, callback = function(v) Settings.FOV.Value = v end})
fovSection:toggle({name = "ADS FOV Change", def = true, callback = function(v) Settings.FOV.ADSChange = v end})

zoomSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.Zoom.Enabled = v if not v then Settings.Zoom.Active = false end end})
zoomSection:keybind({name = "Zoom Key", def = Enum.KeyCode.C, callback = function(k) Settings.Zoom.Key = k end})
zoomSection:slider({name = "Zoom FOV", def = 40, max = 70, min = 20, rounding = true, callback = function(v) Settings.Zoom.TargetFOV = v end})

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if Settings.Zoom.Enabled and input.KeyCode == Settings.Zoom.Key then
        Settings.Zoom.Active = true
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Settings.Zoom.Key then Settings.Zoom.Active = false end
end)

--------------------------------------------------
-- Aim System + Death Fix
--------------------------------------------------

local PlayerModels = workspace:WaitForChild("Players")
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1.5
fovCircle.NumSides = 64
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Transparency = 1
fovCircle.Visible = false

local shootNodeOriginals = {}

local cachedShoot, cachedShootPos = nil, nil

local function invalidateShootCache()
    cachedShoot, cachedShootPos = nil, nil
    table.clear(shootNodeOriginals)
end

local function getShootNodes()
    -- Return cache if still valid
    if cachedShoot and cachedShoot.Parent and cachedShoot:IsDescendantOf(workspace)
        and cachedShootPos and cachedShootPos.Parent and cachedShootPos:IsDescendantOf(workspace) then
        return cachedShoot, cachedShootPos
    end

    cachedShoot, cachedShootPos = nil, nil

    local rigs = getRigs()
    if not rigs then return nil, nil end

    -- Prefer the most recently added model (current viewmodel)
    local activeRig = nil
    for _, child in ipairs(rigs:GetChildren()) do
        if child:IsA("Model") then
            activeRig = child
        end
    end
    if not activeRig then return nil, nil end

    local essentials = activeRig:FindFirstChild("Essentials")
    if not essentials then return nil, nil end

    local shoot = essentials:FindFirstChild("Shoot")
    local shootPos = essentials:FindFirstChild("shootPosition1")

    if shoot and shoot.Parent and shoot:IsDescendantOf(workspace) then
        cachedShoot = shoot
    end
    if shootPos and shootPos.Parent and shootPos:IsDescendantOf(workspace) then
        cachedShootPos = shootPos
    end

    return cachedShoot, cachedShootPos
end

local function forceNodeVisual(node)
    if not node or not node.Parent or not node:IsA("BasePart") then return end

    if not shootNodeOriginals[node] then
        shootNodeOriginals[node] = {
            Color = node.Color,
            Material = node.Material,
            Transparency = node.Transparency
        }
    end

    node.Color = Color3.new(0, 0, 0)
    node.Material = Enum.Material.Neon
    node.Transparency = 0
end

local function restoreNodeVisuals()
    for node, data in pairs(shootNodeOriginals) do
        if node and node.Parent then
            node.Color = data.Color
            node.Material = data.Material
            node.Transparency = data.Transparency
        end
    end
    table.clear(shootNodeOriginals)
end

-- Fully reset node cache on death / respawn
LocalPlayer.CharacterRemoving:Connect(function()
    invalidateShootCache()
    Settings.ThirdPerson.Active = false
    thirdPersonWasActive = false
    Camera.CameraType = Enum.CameraType.Custom
    clearCharVFX("Slot1")
    clearCharVFX("Slot2")
end)

LocalPlayer.CharacterAdded:Connect(function()
    invalidateShootCache()
    Settings.ThirdPerson.Active = false
    Camera.CameraType = Enum.CameraType.Custom

    task.delay(0.1, function()
        if not Settings.FOV.Enabled and not (Settings.Zoom.Enabled and Settings.Zoom.Active) then
            Camera.FieldOfView = Settings.FOV.Original
        end
        -- Force first-person body hide after respawn
        setCharacterVisible(false)
    end)

    task.delay(0.5, function()
        invalidateShootCache()
        setCharacterVisible(false)
    end)
    task.delay(1.2, invalidateShootCache)
    task.delay(2.0, invalidateShootCache)
end)

-- Also re-grab whenever a new model is added to Rigs (new viewmodel / weapon)
task.spawn(function()
    local rigs = getRigs()
    if rigs then
        rigs.ChildAdded:Connect(function(child)
            if child:IsA("Model") then
                invalidateShootCache()
            end
        end)
        rigs.ChildRemoved:Connect(function(child)
            if child:IsA("Model") then
                invalidateShootCache()
            end
        end)
    end
end)

local function canSee(part)
    if not Settings.Aim.VisibleCheck then return true end
    if not part then return false end
    local origin = Camera.CFrame.Position
    local dir = part.Position - origin
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.IgnoreWater = true
    local hit = workspace:Raycast(origin, dir, params)
    if not hit then return true end
    return hit.Instance:IsDescendantOf(part.Parent)
end

local function predict(part)
    if not part then return part.Position end
    local root = part.Parent and (part.Parent:FindFirstChild("Base") or part.Parent:FindFirstChild("HumanoidRootPart")) or part
    local vel = root.AssemblyLinearVelocity or Vector3.zero
    return part.Position + (vel * (Settings.Aim.Prediction / 50))
end

local function getTarget()
    if Settings.PlayerTargeting.Enabled and Settings.PlayerTargeting.Target then
        local targetPlayer = Players:FindFirstChild(Settings.PlayerTargeting.Target)
        if targetPlayer and targetPlayer ~= LocalPlayer then
            local model = PlayerModels:FindFirstChild(targetPlayer.Name)
            if model then
                local part = model:FindFirstChild(Settings.Aim.Priority)
                if part and part:IsA("BasePart") and (canSee(part) or not Settings.Aim.VisibleCheck) then
                    Settings.Aim.CurrentTarget = targetPlayer
                    return part
                end
            end
        end
        Settings.Aim.CurrentTarget = nil
        return nil
    end

    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local best, closest = nil, Settings.Aim.FOV

    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local model = PlayerModels:FindFirstChild(player.Name)
        if not model then continue end
        local part = model:FindFirstChild(Settings.Aim.Priority)
        if not part or not part:IsA("BasePart") then continue end

        local pos = predict(part)
        local screen, onScreen = Camera:WorldToViewportPoint(pos)
        if not onScreen or screen.Z <= 0 then continue end

        local dist2d = (Vector2.new(screen.X, screen.Y) - center).Magnitude
        if dist2d > Settings.Aim.FOV then continue end
        if not canSee(part) then continue end

        if dist2d < closest then
            closest = dist2d
            best = part
            Settings.Aim.CurrentTarget = player
        end
    end

    if not best then Settings.Aim.CurrentTarget = nil end
    return best
end

local function applyRotationSilent(targetPart)
    local shoot, shootPos = getShootNodes()
    if not shoot or not shootPos then return end
    local targetPos = predict(targetPart)
    shoot.CFrame = CFrame.lookAt(shoot.Position, targetPos)
    shootPos.CFrame = CFrame.lookAt(shootPos.Position, targetPos)
    forceNodeVisual(shoot)
    forceNodeVisual(shootPos)
end

local function applyManipulationSilent(targetPart)
    local shoot, shootPos = getShootNodes()
    if not shoot or not shootPos then return end
    local targetPos = predict(targetPart)
    local dir = (Camera.CFrame.Position - targetPos).Unit
    local placePos = targetPos + dir * 0.5
    shoot.CFrame = CFrame.lookAt(placePos, targetPos)
    shootPos.CFrame = CFrame.lookAt(placePos, targetPos)
    forceNodeVisual(shoot)
    forceNodeVisual(shootPos)
end

local function applySilentAim()
    if not Settings.Aim.Enabled then
        restoreNodeVisuals()
        Settings.Aim.CurrentTarget = nil
        return
    end

    if Settings.Ragebot.Enabled and UserInputService:IsKeyDown(Settings.Ragebot.Key) then
        return
    end

    local shoot, shootPos = getShootNodes()
    if shoot then forceNodeVisual(shoot) end
    if shootPos then forceNodeVisual(shootPos) end

    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        Settings.Aim.CurrentTarget = nil
        return
    end

    local target = getTarget()
    if not target then return end

    if Settings.Aim.Mode == "Memory" then
        local pos = predict(target)
        local screen = Camera:WorldToViewportPoint(pos)
        local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        local delta = Vector2.new(screen.X, screen.Y) - center
        local div = (Settings.Aim.Smoothing <= 0) and 1 or (Settings.Aim.Smoothing / 5)
        pcall(function() mousemoverel(delta.X / div, delta.Y / div) end)
    elseif Settings.Aim.Mode == "Rotation" then
        applyRotationSilent(target)
    elseif Settings.Aim.Mode == "Manipulation" then
        applyManipulationSilent(target)
    end
end

RunService:BindToRenderStep("SoA_SilentAim", 300, applySilentAim)

aimSection:toggle({name = "Enabled", def = false, callback = function(v)
    Settings.Aim.Enabled = v
    if not v then restoreNodeVisuals() end
end})
aimSection:dropdown({name = "Aim Mode", def = "Memory", max = 3, options = {"Memory", "Rotation", "Manipulation"}, callback = function(v) Settings.Aim.Mode = v end})
aimSection:dropdown({name = "Priority", def = "Head", max = 2, options = {"Head", "Base"}, callback = function(v) Settings.Aim.Priority = v end})
aimSection:slider({name = "Smoothing", def = 20, max = 100, min = 0, rounding = true, callback = function(v) Settings.Aim.Smoothing = v end})
aimSection:slider({name = "Prediction", def = 0, max = 100, min = 0, rounding = true, callback = function(v) Settings.Aim.Prediction = v end})
aimSection:toggle({name = "Show FOV Circle", def = true, callback = function(v) Settings.Aim.ShowFOV = v end})
aimSection:slider({name = "FOV Size", def = 150, max = 500, min = 50, rounding = true, callback = function(v) Settings.Aim.FOV = v end})
aimSection:toggle({name = "Visible Check", def = false, callback = function(v) Settings.Aim.VisibleCheck = v end})
aimSection:toggle({name = "Dynamic FOV", def = false, callback = function(v) Settings.Aim.DynamicFOV = v end})

--------------------------------------------------
-- Player Targeting
--------------------------------------------------

playerTargetSection:toggle({
    name = "Enabled",
    def = false,
    callback = function(v)
        Settings.PlayerTargeting.Enabled = v
        if not v then Settings.PlayerTargeting.Target = nil end
    end
})

local playerTargetDropdown = playerTargetSection:dropdown({
    name = "Target Player",
    def = "None",
    max = 20,
    options = getPlayerNamesList(true),
    callback = function(v)
        Settings.PlayerTargeting.Target = (v == "None") and nil or v
    end
})

local function refreshPlayerTargetDropdown()
    forceRefreshDropdown(playerTargetDropdown, getPlayerNamesList(true))
end

Players.PlayerAdded:Connect(function() task.defer(refreshPlayerTargetDropdown) end)
Players.PlayerRemoving:Connect(function() task.defer(refreshPlayerTargetDropdown) end)

--------------------------------------------------
-- Ragebot
--------------------------------------------------

local function getRagebotTarget()
    local closest, closestDist = nil, math.huge
    local origin = Camera.CFrame.Position
    local maxDist = Settings.Ragebot.MaxDistance or 500

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local model = PlayerModels:FindFirstChild(player.Name)
            if model then
                local part = model:FindFirstChild(Settings.Aim.Priority) or model:FindFirstChild("Head") or model:FindFirstChild("Base")
                if part and part:IsA("BasePart") then
                    local dist = (part.Position - origin).Magnitude
                    if dist <= maxDist and dist < closestDist then
                        closestDist = dist
                        closest = part
                        Settings.Aim.CurrentTarget = player
                    end
                end
            end
        end
    end
    return closest
end

ragebotSection:toggle({
    name = "Enabled",
    def = false,
    callback = function(v)
        Settings.Ragebot.Enabled = v
    end
})

ragebotSection:keybind({
    name = "Ragebot Key (Hold)",
    def = Enum.KeyCode.X,
    callback = function(k)
        Settings.Ragebot.Key = k
    end
})
ragebotSection:slider({
    name = "Max Distance",
    def = 500,
    max = 2000,
    min = 50,
    rounding = true,
    callback = function(v)
        Settings.Ragebot.MaxDistance = v
    end
})

--------------------------------------------------
-- Hit Beam
--------------------------------------------------

local function createHitBeam(fromPos, toPos)
    if not Settings.HitBeam.Enabled then return end
    if not fromPos or not toPos then return end

    local model = Instance.new("Model")
    model.Name = "SoA_HitBeam"
    model.Parent = workspace

    local part1 = Instance.new("Part")
    part1.Name = "BeamPart1"
    part1.Anchored = true
    part1.CanCollide = false
    part1.CanQuery = false
    part1.CanTouch = false
    part1.Transparency = 1
    part1.Size = Vector3.new(0.1, 0.1, 0.1)
    part1.CFrame = CFrame.new(fromPos)
    part1.Parent = model

    local att0 = Instance.new("Attachment")
    att0.Parent = part1

    local part2 = Instance.new("Part")
    part2.Name = "BeamPart2"
    part2.Anchored = true
    part2.CanCollide = false
    part2.CanQuery = false
    part2.CanTouch = false
    part2.Transparency = 1
    part2.Size = Vector3.new(0.1, 0.1, 0.1)
    part2.CFrame = CFrame.new(toPos)
    part2.Parent = model

    local att1 = Instance.new("Attachment")
    att1.Parent = part2

    local transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0.00, 0.25),
        NumberSequenceKeypoint.new(0.20, 0.05),
        NumberSequenceKeypoint.new(0.80, 0.05),
        NumberSequenceKeypoint.new(1.00, 0.9)
    })

    local beam1 = Instance.new("Beam")
    beam1.Attachment0 = att0
    beam1.Attachment1 = att1
    beam1.Texture = "rbxassetid://12781800668"
    beam1.TextureSpeed = 4
    beam1.TextureLength = 1
    beam1.LightEmission = 1
    beam1.LightInfluence = 0
    beam1.Brightness = 15
    beam1.Color = ColorSequence.new(Settings.HitBeam.Color1)
    beam1.Transparency = transparency
    beam1.Width0 = 0.7
    beam1.Width1 = 0.7
    beam1.FaceCamera = true
    beam1.Segments = 15
    beam1.Parent = part1

    local beam2 = Instance.new("Beam")
    beam2.Attachment0 = att0
    beam2.Attachment1 = att1
    beam2.Texture = "rbxassetid://12781800668"
    beam2.TextureSpeed = 2.5
    beam2.TextureLength = 1
    beam2.TextureMode = Enum.TextureMode.Stretch
    beam2.LightEmission = 1
    beam2.LightInfluence = 0
    beam2.Brightness = 22
    beam2.Color = ColorSequence.new(Settings.HitBeam.Color2)
    beam2.Transparency = transparency
    beam2.Width0 = 1.3
    beam2.Width1 = 1.3
    beam2.FaceCamera = true
    beam2.Segments = 15
    beam2.Parent = part1

    task.delay(1.3, function()
        if model and model.Parent then model:Destroy() end
    end)
end

hitBeamSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.HitBeam.Enabled = v end})
hitBeamSection:colorpicker({name = "Beam 1 Color", cpname = "", def = Settings.HitBeam.Color1, callback = function(c) Settings.HitBeam.Color1 = c end})
hitBeamSection:colorpicker({name = "Beam 2 Color", cpname = "", def = Settings.HitBeam.Color2, callback = function(c) Settings.HitBeam.Color2 = c end})

--------------------------------------------------
-- Hitsound + Killsound
--------------------------------------------------

local recentHits = {}

local function playSound(id, volume)
    if not id or id == "" then return end
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. tostring(id)
    sound.Volume = math.clamp(volume or 1, 0, 3)
    sound.PlayOnRemove = true
    sound.Parent = Camera
    sound:Destroy()
end

LogService.MessageOut:Connect(function(message)
    if typeof(message) ~= "string" then return end

    local lower = string.lower(message)
    local isOurHit = false
    local victimName = nil

    if (lower:find("attacker") and lower:find(string.lower(LocalPlayer.Name)))
    or lower:find("you hit")
    or lower:find("you damaged")
    or (message:find(LocalPlayer.Name) and (lower:find("hit") or lower:find("damage"))) then
        isOurHit = true
        victimName = message:match("Victim:%s*(%w+)")
            or message:match("Target:%s*(%w+)")
            or message:match("Hit:%s*(%w+)")
            or message:match("damaged%s+(%w+)")
    end

    if not isOurHit then return end

    if Settings.Hitsound.Enabled then
        playSound(Settings.Hitsound.HitId, Settings.Hitsound.HitVolume)
    end

    if victimName and victimName ~= LocalPlayer.Name then
        recentHits[victimName] = os.clock()
    elseif Settings.Aim.CurrentTarget then
        recentHits[Settings.Aim.CurrentTarget.Name] = os.clock()
    end

    if Settings.HitBeam.Enabled then
        local fromPos
        local char = LocalPlayer.Character
        if char then
            local base = char:FindFirstChild("Base") or char:FindFirstChild("HumanoidRootPart")
            if base then fromPos = base.Position end
        end

        local toPos
        if Settings.Aim.CurrentTarget and Settings.Aim.CurrentTarget.Character then
            local head = Settings.Aim.CurrentTarget.Character:FindFirstChild("Head")
                or Settings.Aim.CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
            if head then toPos = head.Position end
        end

        if fromPos and toPos then
            createHitBeam(fromPos, toPos)
        end
    end
end)

local function onPlayerDied(player)
    if player == LocalPlayer then return end
    if not Settings.Killsound.Enabled then return end

    local hitTime = recentHits[player.Name]
    if hitTime and (os.clock() - hitTime) < 3.5 then
        playSound(Settings.Hitsound.KillId, Settings.Hitsound.KillVolume)
        recentHits[player.Name] = nil
    end
end

local function hookCharacter(player)
    if player == LocalPlayer then return end

    local function connectHumanoid(character)
        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.Died:Connect(function()
                onPlayerDied(player)
            end)
        end
    end

    if player.Character then
        connectHumanoid(player.Character)
    end
    player.CharacterAdded:Connect(connectHumanoid)
end

for _, player in ipairs(Players:GetPlayers()) do
    hookCharacter(player)
end
Players.PlayerAdded:Connect(hookCharacter)

task.spawn(function()
    while true do
        task.wait(5)
        local now = os.clock()
        for name, time in pairs(recentHits) do
            if now - time > 6 then
                recentHits[name] = nil
            end
        end
    end
end)

hitsoundSection:toggle({name = "Hitsound Enabled", def = false, callback = function(v) Settings.Hitsound.Enabled = v end})
hitsoundSection:dropdown({name = "Hit Sound", def = "Neverlose", max = 8, options = HitsoundHitNames, callback = function(v)
    Settings.Hitsound.HitId = HitsoundHitLookup[v] or Settings.Hitsound.HitId
end})
hitsoundSection:slider({name = "Hit Volume", def = 100, max = 300, min = 0, rounding = true, callback = function(v) Settings.Hitsound.HitVolume = v / 100 end})
hitsoundSection:toggle({name = "Killsound Enabled", def = false, callback = function(v) Settings.Killsound.Enabled = v end})
hitsoundSection:dropdown({name = "Kill Sound", def = "Among Us Sfx", max = 8, options = HitsoundKillNames, callback = function(v)
    Settings.Hitsound.KillId = HitsoundKillLookup[v] or Settings.Hitsound.KillId
end})
hitsoundSection:slider({name = "Kill Volume", def = 100, max = 300, min = 0, rounding = true, callback = function(v) Settings.Hitsound.KillVolume = v / 100 end})

--------------------------------------------------
-- Penetration + Raycast Prediction
--------------------------------------------------

local function updatePenetration()
    if not Settings.Penetration.Enabled then
        penetrationLabel.Visible = false
        return
    end

    local origin = Camera.CFrame.Position
    local direction = Camera.CFrame.LookVector
    local remaining = Settings.Penetration.Distance
    local wallsHit = 0
    local filter = {LocalPlayer.Character}
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.IgnoreWater = true

    local foundPlayer, foundDist

    for i = 1, 8 do
        if remaining <= 0 then break end
        params.FilterDescendantsInstances = filter
        local result = workspace:Raycast(origin, direction * remaining, params)
        if not result then break end

        local hit = result.Instance
        local dist = (result.Position - origin).Magnitude
        remaining = remaining - dist

        local model = hit:FindFirstAncestorOfClass("Model")
        if model and model.Parent == PlayerModels then
            foundPlayer = model.Name
            foundDist = (Camera.CFrame.Position - result.Position).Magnitude
            break
        end

        wallsHit = wallsHit + 1
        if wallsHit > Settings.Penetration.MaxWalls then break end
        table.insert(filter, hit)
        origin = result.Position + direction * 0.05
    end

    if foundPlayer then
        penetrationLabel.Text = string.format("Penetration : %s / %.0f", foundPlayer, foundDist)
        penetrationLabel.Visible = true
    else
        penetrationLabel.Visible = false
    end
end

penetrationSection:toggle({name = "Enabled", def = false, callback = function(v)
    Settings.Penetration.Enabled = v
    if not v then penetrationLabel.Visible = false end
end})

local predictionBall = Instance.new("Part")
predictionBall.Name = "SoA_RaycastPrediction"
predictionBall.Shape = Enum.PartType.Ball
predictionBall.Material = Enum.Material.Neon
predictionBall.Size = Vector3.new(0.4, 0.4, 0.4)
predictionBall.Color = Settings.RaycastPrediction.Color
predictionBall.Anchored = true
predictionBall.CanCollide = false
predictionBall.CanQuery = false
predictionBall.CanTouch = false
predictionBall.CastShadow = false
predictionBall.Massless = true
predictionBall.Transparency = 0.15
predictionBall.Parent = nil

raycastSection:toggle({name = "Enabled", def = false, callback = function(v)
    Settings.RaycastPrediction.Enabled = v
    if not v then predictionBall.Parent = nil end
end})
raycastSection:colorpicker({name = "Color", cpname = "", def = Settings.RaycastPrediction.Color, callback = function(c)
    Settings.RaycastPrediction.Color = c
    predictionBall.Color = c
end})
raycastSection:slider({name = "Size", def = 4, max = 20, min = 1, rounding = true, callback = function(v)
    Settings.RaycastPrediction.Size = v / 10
    predictionBall.Size = Vector3.new(v/10, v/10, v/10)
end})

local function updateRaycastPrediction()
    if not Settings.RaycastPrediction.Enabled then
        predictionBall.Parent = nil
        return
    end
    local shoot = select(1, getShootNodes())
    if not shoot then
        predictionBall.Parent = nil
        return
    end
    local origin = shoot.Position
    local direction = shoot.CFrame.LookVector * Settings.RaycastPrediction.MaxDistance
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {LocalPlayer.Character, getRigs(), predictionBall}
    params.IgnoreWater = true
    local result = workspace:Raycast(origin, direction, params)
    predictionBall.CFrame = CFrame.new(result and result.Position or (origin + direction))
    predictionBall.Color = Settings.RaycastPrediction.Color
    predictionBall.Size = Vector3.new(Settings.RaycastPrediction.Size, Settings.RaycastPrediction.Size, Settings.RaycastPrediction.Size)
    predictionBall.CanCollide = false
    predictionBall.CanTouch = false
    predictionBall.CanQuery = false
    predictionBall.Massless = true
    predictionBall.Anchored = true
    predictionBall.Parent = workspace
end

--------------------------------------------------
-- ESP System (scoped)
--------------------------------------------------

;(function()
    local headDots, boxes, cornerBoxes, tracers = {}, {}, {}, {}
    local box3DCache, nameDistanceCache, bodyESPCache, playerSkeletons, radarDots = {}, {}, {}, {}, {}
    local containerESPCache, pickupESPCache = {}, {}
    local playerCache = {}

    local ARM_BASE_OFFSET = Vector3.new(0, 0.7, 0)
    local LEG_BASE_OFFSET = Vector3.new(0, 0, 0)
    local HEAD_BASE_OFFSET = Vector3.new(0, 0, 0)

    local function getPlayerData(player)
        local data = playerCache[player]
        if not data then data = {} playerCache[player] = data end
        local character = player.Character
        data.character = character
        data.valid = false
        if not character then return data end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local root = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")
        if not humanoid or humanoid.Health <= 0 or not root or not head then return data end
        data.humanoid = humanoid
        data.root = root
        data.head = head
        data.distance = (Camera.CFrame.Position - head.Position).Magnitude
        data.valid = true
        return data
    end

    local function createHeadDot(player)
        if player == LocalPlayer or headDots[player] then return end
        local dot = Drawing.new("Circle")
        dot.Filled = true
        dot.NumSides = 20
        dot.Thickness = 1
        setVisible(dot, false)
        headDots[player] = dot
    end
    local function removeHeadDot(player)
        if headDots[player] then headDots[player]:Remove() headDots[player] = nil end
    end
    local function updateHeadDot(player, data)
        local dot = headDots[player]
        if not dot then return end
        if not Settings.ESP.HeadDot.Enabled or not data.valid then setVisible(dot, false) return end
        local position, visible = Camera:WorldToViewportPoint(data.head.Position)
        if not visible or position.Z <= 0 then setVisible(dot, false) return end
        local scale = math.clamp((Settings.ESP.HeadDot.Size * 20) / math.max(data.distance, 5), 1.5, Settings.ESP.HeadDot.Size)
        dot.Position = Vector2.new(position.X, position.Y)
        dot.Radius = scale
        dot.Color = Settings.ESP.HeadDot.Color
        setVisible(dot, true)
    end

    headDotSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.ESP.HeadDot.Enabled = v end})
    headDotSection:colorpicker({name = "Color", cpname = "", def = Settings.ESP.HeadDot.Color, callback = function(c) Settings.ESP.HeadDot.Color = c end})
    headDotSection:slider({name = "Size", def = 6, max = 15, min = 2, rounding = true, callback = function(v) Settings.ESP.HeadDot.Size = v end})

    local function create2DBox(player)
        if player == LocalPlayer or boxes[player] then return end
        local box = Drawing.new("Square")
        box.Filled = false
        setVisible(box, false)
        boxes[player] = box
    end
    local function remove2DBox(player)
        if boxes[player] then boxes[player]:Remove() boxes[player] = nil end
    end
    local function update2DBox(player, data)
        local box = boxes[player]
        if not box then return end
        if not Settings.ESP.Box2D.Enabled or not data.valid then setVisible(box, false) return end
        local top = Camera:WorldToViewportPoint(data.head.Position + Vector3.new(0, 0.5, 0))
        local bottom = Camera:WorldToViewportPoint(data.root.Position - Vector3.new(0, 3, 0))
        if top.Z <= 0 or bottom.Z <= 0 then setVisible(box, false) return end
        local height = math.abs(bottom.Y - top.Y)
        if height < 2 then setVisible(box, false) return end
        local width = height * 0.55
        local centerX = (top.X + bottom.X) / 2
        box.Size = Vector2.new(width, height)
        box.Position = Vector2.new(centerX - width / 2, top.Y)
        box.Color = Settings.ESP.Box2D.Color
        box.Thickness = Settings.ESP.Box2D.Thickness
        setVisible(box, true)
    end

    boxSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.ESP.Box2D.Enabled = v end})
    boxSection:colorpicker({name = "Color", cpname = "", def = Settings.ESP.Box2D.Color, callback = function(c) Settings.ESP.Box2D.Color = c end})
    boxSection:slider({name = "Thickness", def = 1, max = 5, min = 1, rounding = true, callback = function(v) Settings.ESP.Box2D.Thickness = v end})

    local function newCornerLine()
        local line = Drawing.new("Line")
        line.Transparency = 1
        setVisible(line, false)
        return line
    end
    local function createCornerBox(player)
        if player == LocalPlayer or cornerBoxes[player] then return end
        cornerBoxes[player] = {
            TL1 = newCornerLine(), TL2 = newCornerLine(),
            TR1 = newCornerLine(), TR2 = newCornerLine(),
            BL1 = newCornerLine(), BL2 = newCornerLine(),
            BR1 = newCornerLine(), BR2 = newCornerLine()
        }
    end
    local function removeCornerBox(player)
        if cornerBoxes[player] then
            for _, line in pairs(cornerBoxes[player]) do line:Remove() end
            cornerBoxes[player] = nil
        end
    end
    local function updateCornerBox(player, data)
        local lines = cornerBoxes[player]
        if not lines then return end
        if not Settings.ESP.CornerBox.Enabled or not data.valid then
            for _, line in pairs(lines) do setVisible(line, false) end
            return
        end
        local top = Camera:WorldToViewportPoint(data.head.Position + Vector3.new(0, 0.5, 0))
        local bottom = Camera:WorldToViewportPoint(data.root.Position - Vector3.new(0, 3, 0))
        if top.Z <= 0 or bottom.Z <= 0 then
            for _, line in pairs(lines) do setVisible(line, false) end
            return
        end
        local height = math.abs(bottom.Y - top.Y)
        if height < 2 then
            for _, line in pairs(lines) do setVisible(line, false) end
            return
        end
        local width = height * 0.55
        local centerX = (top.X + bottom.X) / 2
        local left, right = centerX - width / 2, centerX + width / 2
        local topY, bottomY = top.Y, bottom.Y
        local cornerLength = math.clamp(math.min(width, height) * 0.25, 5, 60)

        local TL = Vector2.new(left, topY)
        local TR = Vector2.new(right, topY)
        local BL = Vector2.new(left, bottomY)
        local BR = Vector2.new(right, bottomY)

        lines.TL1.From = TL lines.TL1.To = TL + Vector2.new(cornerLength, 0)
        lines.TL2.From = TL lines.TL2.To = TL + Vector2.new(0, cornerLength)
        lines.TR1.From = TR lines.TR1.To = TR - Vector2.new(cornerLength, 0)
        lines.TR2.From = TR lines.TR2.To = TR + Vector2.new(0, cornerLength)
        lines.BL1.From = BL lines.BL1.To = BL + Vector2.new(cornerLength, 0)
        lines.BL2.From = BL lines.BL2.To = BL - Vector2.new(0, cornerLength)
        lines.BR1.From = BR lines.BR1.To = BR - Vector2.new(cornerLength, 0)
        lines.BR2.From = BR lines.BR2.To = BR - Vector2.new(0, cornerLength)

        local thickness = Settings.ESP.CornerBox.Thickness
        if Settings.ESP.CornerBox.AutoThickness then
            thickness = math.clamp(100 / math.max(data.distance, 1), 1, 4)
        end
        for _, line in pairs(lines) do
            line.Color = Settings.ESP.CornerBox.Color
            line.Thickness = thickness
            setVisible(line, true)
        end
    end

    cornerBoxSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.ESP.CornerBox.Enabled = v end})
    cornerBoxSection:colorpicker({name = "Color", cpname = "", def = Settings.ESP.CornerBox.Color, callback = function(c) Settings.ESP.CornerBox.Color = c end})
    cornerBoxSection:slider({name = "Thickness", def = 1, max = 5, min = 1, rounding = true, callback = function(v) Settings.ESP.CornerBox.Thickness = v end})
    cornerBoxSection:toggle({name = "Auto Thickness", def = true, callback = function(v) Settings.ESP.CornerBox.AutoThickness = v end})

    local function createTracer(player)
        if player == LocalPlayer or tracers[player] then return end
        local line = Drawing.new("Line")
        line.Transparency = 1
        setVisible(line, false)
        tracers[player] = line
    end
    local function removeTracer(player)
        if tracers[player] then tracers[player]:Remove() tracers[player] = nil end
    end
    local function updateTracer(player, data)
        local line = tracers[player]
        if not line then return end
        if not Settings.ESP.Tracer.Enabled or not data.valid then setVisible(line, false) return end
        local headPosition, visible = Camera:WorldToViewportPoint(data.head.Position)
        if not visible or headPosition.Z <= 0 then setVisible(line, false) return end
        line.From = Vector2.new(headPosition.X, headPosition.Y)
        local thickness = Settings.ESP.Tracer.Thickness
        if Settings.ESP.Tracer.AutoThickness then
            thickness = math.clamp(100 / math.max(data.distance, 1), 0.1, 3)
        end
        line.Thickness = thickness
        line.Color = Settings.ESP.Tracer.Color
        local target = data.head.CFrame * CFrame.new(0, 0, -Settings.ESP.Tracer.Length)
        local targetPosition, targetVisible = Camera:WorldToViewportPoint(target.Position)
        if not targetVisible then
            local direction = (target.Position - Camera.CFrame.Position).Unit
            targetPosition = Camera:WorldToViewportPoint(Camera.CFrame.Position + direction * 5000)
        end
        line.To = Vector2.new(targetPosition.X, targetPosition.Y)
        setVisible(line, true)
    end

    tracerSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.ESP.Tracer.Enabled = v end})
    tracerSection:colorpicker({name = "Color", cpname = "", def = Settings.ESP.Tracer.Color, callback = function(c) Settings.ESP.Tracer.Color = c end})
    tracerSection:slider({name = "Length", def = 15, max = 100, min = 5, rounding = true, callback = function(v) Settings.ESP.Tracer.Length = v end})
    tracerSection:slider({name = "Thickness", def = 1, max = 5, min = 1, rounding = true, callback = function(v) Settings.ESP.Tracer.Thickness = v end})
    tracerSection:toggle({name = "Auto Thickness", def = true, callback = function(v) Settings.ESP.Tracer.AutoThickness = v end})

    local function new3DLine()
        local line = Drawing.new("Line")
        line.Visible = false
        line.Thickness = 1.4
        line.Transparency = 1
        return line
    end
    local function create3DBox(player)
        if player == LocalPlayer or box3DCache[player] then return end
        local lines = {}
        for i = 1, 12 do lines[i] = new3DLine() end
        box3DCache[player] = lines
    end
    local function remove3DBox(player)
        if box3DCache[player] then
            for _, line in pairs(box3DCache[player]) do line:Remove() end
            box3DCache[player] = nil
        end
    end
    local function update3DBox(player, data)
        local lines = box3DCache[player]
        if not lines then return end
        if not Settings.ESP.Box3D.Enabled or not data.valid then
            for _, line in pairs(lines) do line.Visible = false end
            return
        end
        local pos, vis = Camera:WorldToViewportPoint(data.root.Position)
        if not vis then
            for _, line in pairs(lines) do line.Visible = false end
            return
        end
        local scale = data.head.Size.Y / 2
        local size = Vector3.new(2, 3, 1.5) * (scale * 2)
        local cf = data.root.CFrame
        local points = {
            Camera:WorldToViewportPoint((cf * CFrame.new(-size.X, size.Y, -size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(-size.X, size.Y, size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(size.X, size.Y, size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(size.X, size.Y, -size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(-size.X, -size.Y, -size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(-size.X, -size.Y, size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(size.X, -size.Y, size.Z)).Position),
            Camera:WorldToViewportPoint((cf * CFrame.new(size.X, -size.Y, -size.Z)).Position)
        }
        local connections = {{1,2},{2,3},{3,4},{4,1},{5,6},{6,7},{7,8},{8,5},{1,5},{2,6},{3,7},{4,8}}
        for i, conn in ipairs(connections) do
            local p1, p2 = points[conn[1]], points[conn[2]]
            lines[i].From = Vector2.new(p1.X, p1.Y)
            lines[i].To = Vector2.new(p2.X, p2.Y)
            lines[i].Color = Settings.ESP.Box3D.Color
            lines[i].Visible = true
        end
    end

    local function createNameDistance(player)
        if player == LocalPlayer or nameDistanceCache[player] then return end
        local name = Drawing.new("Text")
        name.Size = 14
        name.Center = true
        name.Outline = true
        name.Visible = false
        local dist = Drawing.new("Text")
        dist.Size = 12
        dist.Center = true
        dist.Outline = true
        dist.Visible = false
        nameDistanceCache[player] = {name = name, dist = dist}
    end
    local function removeNameDistance(player)
        if nameDistanceCache[player] then
            nameDistanceCache[player].name:Remove()
            nameDistanceCache[player].dist:Remove()
            nameDistanceCache[player] = nil
        end
    end
    local function updateNameDistance(player, data)
        local cache = nameDistanceCache[player]
        if not cache then return end
        if not data.valid then
            cache.name.Visible = false
            cache.dist.Visible = false
            return
        end
        local pos, vis = Camera:WorldToViewportPoint(data.head.Position + Vector3.new(0, 0.8, 0))
        if not vis or pos.Z <= 0 then
            cache.name.Visible = false
            cache.dist.Visible = false
            return
        end
        if Settings.ESP.Name.Enabled then
            cache.name.Text = player.Name
            cache.name.Position = Vector2.new(pos.X, pos.Y - 18)
            cache.name.Color = Settings.ESP.Name.Color
            cache.name.Visible = true
        else
            cache.name.Visible = false
        end
        if Settings.ESP.Distance.Enabled then
            cache.dist.Text = string.format("%.0f studs", data.distance)
            cache.dist.Position = Vector2.new(pos.X, pos.Y - 4)
            cache.dist.Color = Settings.ESP.Distance.Color
            cache.dist.Visible = true
        else
            cache.dist.Visible = false
        end
    end

    advancedESPSection:toggle({name = "3D Box ESP", def = false, callback = function(v)
        Settings.ESP.Box3D.Enabled = v
        if not v then for _, lines in pairs(box3DCache) do for _, line in pairs(lines) do line.Visible = false end end end
    end})
    advancedESPSection:colorpicker({name = "3D Box Color", cpname = "", def = Settings.ESP.Box3D.Color, callback = function(c) Settings.ESP.Box3D.Color = c end})
    advancedESPSection:toggle({name = "Name ESP", def = false, callback = function(v) Settings.ESP.Name.Enabled = v end})
    advancedESPSection:colorpicker({name = "Name Color", cpname = "", def = Settings.ESP.Name.Color, callback = function(c) Settings.ESP.Name.Color = c end})
    advancedESPSection:toggle({name = "Distance ESP", def = false, callback = function(v) Settings.ESP.Distance.Enabled = v end})
    advancedESPSection:colorpicker({name = "Distance Color", cpname = "", def = Settings.ESP.Distance.Color, callback = function(c) Settings.ESP.Distance.Color = c end})

    local lastBodyESPScan = 0
    local function updateBodyESP()
        if not Settings.ESP.Body.Enabled then
            for _, data in pairs(bodyESPCache) do data.text.Visible = false end
            return
        end
        local now = os.clock()
        if now - lastBodyESPScan >= 0.5 then
            lastBodyESPScan = now
            local interactable = workspace:FindFirstChild("Interactable")
            if interactable then
                local found = {}
                for _, obj in ipairs(interactable:GetDescendants()) do
                    if obj:IsA("Model") and string.find(string.lower(obj.Name), "corpse") then
                        found[obj] = true
                        if not bodyESPCache[obj] then
                            local text = Drawing.new("Text")
                            text.Size = 14
                            text.Center = true
                            text.Outline = true
                            text.Color = Settings.ESP.Body.Color
                            text.Text = obj.Name
                            text.Visible = false
                            bodyESPCache[obj] = {text = text}
                        end
                    end
                end
                for obj, data in pairs(bodyESPCache) do
                    if not found[obj] then data.text:Remove() bodyESPCache[obj] = nil end
                end
            end
        end
        for obj, data in pairs(bodyESPCache) do
            if obj and obj.Parent then
                local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if primary then
                    local pos, vis = Camera:WorldToViewportPoint(primary.Position + Vector3.new(0, 2, 0))
                    if vis and pos.Z > 0 then
                        data.text.Position = Vector2.new(pos.X, pos.Y)
                        data.text.Color = Settings.ESP.Body.Color
                        data.text.Text = obj.Name
                        data.text.Visible = true
                    else
                        data.text.Visible = false
                    end
                else
                    data.text.Visible = false
                end
            else
                if data then data.text:Remove() bodyESPCache[obj] = nil end
            end
        end
    end

    bodyESPSection:toggle({name = "Body ESP", def = false, callback = function(v)
        Settings.ESP.Body.Enabled = v
        if not v then for _, data in pairs(bodyESPCache) do data.text.Visible = false end end
    end})
    bodyESPSection:colorpicker({name = "Color", cpname = "", def = Settings.ESP.Body.Color, callback = function(c) Settings.ESP.Body.Color = c end})

    local lastContainerScan, lastPickupScan = 0, 0
    local function updateContainerESP()
        if not Settings.ContainerESP.Enabled then
            for _, data in pairs(containerESPCache) do data.text.Visible = false end
            return
        end
        local now = os.clock()
        if now - lastContainerScan >= 0.6 then
            lastContainerScan = now
            local folder = getContainers()
            if folder then
                local found = {}
                for _, obj in ipairs(folder:GetChildren()) do
                    if obj:IsA("Model") then
                        found[obj] = true
                        if not containerESPCache[obj] then
                            local text = Drawing.new("Text")
                            text.Size = 14
                            text.Center = true
                            text.Outline = true
                            text.Color = Settings.ContainerESP.Color
                            text.Text = obj.Name
                            text.Visible = false
                            containerESPCache[obj] = {text = text}
                        end
                    end
                end
                for obj, data in pairs(containerESPCache) do
                    if not found[obj] then data.text:Remove() containerESPCache[obj] = nil end
                end
            end
        end
        for obj, data in pairs(containerESPCache) do
            if obj and obj.Parent then
                local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if primary then
                    local pos, vis = Camera:WorldToViewportPoint(primary.Position + Vector3.new(0, 2, 0))
                    if vis and pos.Z > 0 then
                        data.text.Position = Vector2.new(pos.X, pos.Y)
                        data.text.Color = Settings.ContainerESP.Color
                        data.text.Text = obj.Name
                        data.text.Visible = true
                    else
                        data.text.Visible = false
                    end
                else
                    data.text.Visible = false
                end
            else
                if data then data.text:Remove() containerESPCache[obj] = nil end
            end
        end
    end

    local function updatePickupESP()
        if not Settings.PickupESP.Enabled then
            for _, data in pairs(pickupESPCache) do data.text.Visible = false end
            return
        end
        local now = os.clock()
        if now - lastPickupScan >= 0.6 then
            lastPickupScan = now
            local folder = getPickUps()
            if folder then
                local found = {}
                for _, obj in ipairs(folder:GetChildren()) do
                    if obj:IsA("Model") then
                        found[obj] = true
                        if not pickupESPCache[obj] then
                            local text = Drawing.new("Text")
                            text.Size = 14
                            text.Center = true
                            text.Outline = true
                            text.Color = Settings.PickupESP.Color
                            text.Text = obj.Name
                            text.Visible = false
                            pickupESPCache[obj] = {text = text}
                        end
                    end
                end
                for obj, data in pairs(pickupESPCache) do
                    if not found[obj] then data.text:Remove() pickupESPCache[obj] = nil end
                end
            end
        end
        for obj, data in pairs(pickupESPCache) do
            if obj and obj.Parent then
                local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if primary then
                    local pos, vis = Camera:WorldToViewportPoint(primary.Position + Vector3.new(0, 2, 0))
                    if vis and pos.Z > 0 then
                        data.text.Position = Vector2.new(pos.X, pos.Y)
                        data.text.Color = Settings.PickupESP.Color
                        data.text.Text = obj.Name
                        data.text.Visible = true
                    else
                        data.text.Visible = false
                    end
                else
                    data.text.Visible = false
                end
            else
                if data then data.text:Remove() pickupESPCache[obj] = nil end
            end
        end
    end

    local function createSkeletonLine()
        local line = Drawing.new("Line")
        line.Transparency = 1
        line.Visible = false
        return line
    end
    local function createSkeleton(player)
        if player == LocalPlayer or playerSkeletons[player] then return end
        playerSkeletons[player] = {
            lines = {
                HeadToBase = createSkeletonLine(),
                BaseToRightArmUpper = createSkeletonLine(), RightArmUpperToMid = createSkeletonLine(), RightArmMidToLower = createSkeletonLine(),
                BaseToLeftArmUpper = createSkeletonLine(), LeftArmUpperToMid = createSkeletonLine(), LeftArmMidToLower = createSkeletonLine(),
                BaseToLeftLegUpper = createSkeletonLine(), LeftLegUpperToMid = createSkeletonLine(), LeftLegMidToLower = createSkeletonLine(),
                BaseToRightLegUpper = createSkeletonLine(), RightLegUpperToMid = createSkeletonLine(), RightLegMidToLower = createSkeletonLine()
            },
            parts = nil, lastModel = nil
        }
    end
    local function removeSkeleton(player)
        local data = playerSkeletons[player]
        if not data then return end
        for _, line in pairs(data.lines) do line:Remove() end
        playerSkeletons[player] = nil
    end
    local function getPlayerModel(player) return PlayerModels:FindFirstChild(player.Name) end
    local function cacheParts(playerModel)
        if not playerModel then return nil end
        local head = playerModel:FindFirstChild("Head")
        local base = playerModel:FindFirstChild("Base")
        if not head or not base then return nil end
        local rightArm = playerModel:FindFirstChild("RightArm")
        local leftArm = playerModel:FindFirstChild("LeftArm")
        local leftLeg = playerModel:FindFirstChild("LeftLeg")
        local rightLeg = playerModel:FindFirstChild("RightLeg")
        return {
            head = head, base = base,
            rightArmUpper = rightArm and rightArm:FindFirstChild("RightArmUpper"),
            rightArmMid = rightArm and rightArm:FindFirstChild("RightArmMid"),
            rightArmLower = rightArm and rightArm:FindFirstChild("RightArmLower"),
            leftArmUpper = leftArm and leftArm:FindFirstChild("LeftArmUpper"),
            leftArmMid = leftArm and leftArm:FindFirstChild("LeftArmMid"),
            leftArmLower = leftArm and leftArm:FindFirstChild("LeftArmLower"),
            leftLegUpper = leftLeg and leftLeg:FindFirstChild("LeftLegUpper"),
            leftLegMid = leftLeg and leftLeg:FindFirstChild("LeftLegMid"),
            leftLegLower = leftLeg and leftLeg:FindFirstChild("LeftLegLower"),
            rightLegUpper = rightLeg and rightLeg:FindFirstChild("RightLegUpper"),
            rightLegMid = rightLeg and rightLeg:FindFirstChild("RightLegMid"),
            rightLegLower = rightLeg and rightLeg:FindFirstChild("RightLegLower")
        }
    end
    local function isValidParts(parts)
        return parts and parts.head and parts.head.Parent and parts.base and parts.base.Parent
    end
    local function worldToScreen(position)
        local screenPosition, onScreen = Camera:WorldToViewportPoint(position)
        return Vector2.new(screenPosition.X, screenPosition.Y), onScreen and screenPosition.Z > 0
    end
    local function updateSkeletonLine(line, pos1, pos2, thickness)
        if not pos1 or not pos2 then line.Visible = false return end
        local s1, v1 = worldToScreen(pos1)
        local s2, v2 = worldToScreen(pos2)
        if v1 and v2 then
            line.From = s1
            line.To = s2
            line.Color = Settings.ESP.Skeleton.Color
            line.Thickness = thickness
            line.Visible = true
        else
            line.Visible = false
        end
    end
    local function hideSkeleton(data)
        for _, line in pairs(data.lines) do line.Visible = false end
    end
    local function updateSkeletons()
        if not Settings.ESP.Skeleton.Enabled then
            for _, data in pairs(playerSkeletons) do hideSkeleton(data) end
            return
        end
        local localRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        for player, data in pairs(playerSkeletons) do
            if player == LocalPlayer then hideSkeleton(data) continue end
            local playerModel = getPlayerModel(player)
            if not playerModel then
                data.parts = nil
                data.lastModel = nil
                hideSkeleton(data)
                continue
            end
            if data.lastModel ~= playerModel or not isValidParts(data.parts) then
                data.parts = cacheParts(playerModel)
                data.lastModel = playerModel
            end
            local parts = data.parts
            if not isValidParts(parts) then hideSkeleton(data) continue end
            local thickness = Settings.ESP.Skeleton.Thickness
            if Settings.ESP.Skeleton.AutoThickness and localRoot then
                thickness = math.clamp(120 / math.max((localRoot.Position - parts.base.Position).Magnitude, 1), 0.6, Settings.ESP.Skeleton.Thickness)
            end
            local basePos = parts.base.Position
            local armBase = basePos + ARM_BASE_OFFSET
            local legBase = basePos + LEG_BASE_OFFSET
            local headBase = basePos + HEAD_BASE_OFFSET
            local lines = data.lines
            updateSkeletonLine(lines.HeadToBase, parts.head.Position, headBase, thickness)
            updateSkeletonLine(lines.BaseToRightArmUpper, armBase, parts.rightArmUpper and parts.rightArmUpper.Position, thickness)
            updateSkeletonLine(lines.RightArmUpperToMid, parts.rightArmUpper and parts.rightArmUpper.Position, parts.rightArmMid and parts.rightArmMid.Position, thickness)
            updateSkeletonLine(lines.RightArmMidToLower, parts.rightArmMid and parts.rightArmMid.Position, parts.rightArmLower and parts.rightArmLower.Position, thickness)
            updateSkeletonLine(lines.BaseToLeftArmUpper, armBase, parts.leftArmUpper and parts.leftArmUpper.Position, thickness)
            updateSkeletonLine(lines.LeftArmUpperToMid, parts.leftArmUpper and parts.leftArmUpper.Position, parts.leftArmMid and parts.leftArmMid.Position, thickness)
            updateSkeletonLine(lines.LeftArmMidToLower, parts.leftArmMid and parts.leftArmMid.Position, parts.leftArmLower and parts.leftArmLower.Position, thickness)
            updateSkeletonLine(lines.BaseToLeftLegUpper, legBase, parts.leftLegUpper and parts.leftLegUpper.Position, thickness)
            updateSkeletonLine(lines.LeftLegUpperToMid, parts.leftLegUpper and parts.leftLegUpper.Position, parts.leftLegMid and parts.leftLegMid.Position, thickness)
            updateSkeletonLine(lines.LeftLegMidToLower, parts.leftLegMid and parts.leftLegMid.Position, parts.leftLegLower and parts.leftLegLower.Position, thickness)
            updateSkeletonLine(lines.BaseToRightLegUpper, legBase, parts.rightLegUpper and parts.rightLegUpper.Position, thickness)
            updateSkeletonLine(lines.RightLegUpperToMid, parts.rightLegUpper and parts.rightLegUpper.Position, parts.rightLegMid and parts.rightLegMid.Position, thickness)
            updateSkeletonLine(lines.RightLegMidToLower, parts.rightLegMid and parts.rightLegMid.Position, parts.rightLegLower and parts.rightLegLower.Position, thickness)
        end
    end

    skeletonSection:toggle({name = "Enabled", def = false, callback = function(v)
        Settings.ESP.Skeleton.Enabled = v
        if not v then for _, data in pairs(playerSkeletons) do hideSkeleton(data) end end
    end})
    skeletonSection:colorpicker({name = "Color", cpname = "", def = Settings.ESP.Skeleton.Color, callback = function(c) Settings.ESP.Skeleton.Color = c end})
    skeletonSection:slider({name = "Thickness", def = 2, max = 5, min = 1, rounding = true, callback = function(v) Settings.ESP.Skeleton.Thickness = v end})
    skeletonSection:toggle({name = "Auto Thickness", def = true, callback = function(v) Settings.ESP.Skeleton.AutoThickness = v end})

    local radarBackground = Drawing.new("Circle")
    radarBackground.Filled = true
    radarBackground.NumSides = 75
    radarBackground.Transparency = 0.9
    setVisible(radarBackground, false)

    local radarBorder = Drawing.new("Circle")
    radarBorder.Filled = false
    radarBorder.NumSides = 75
    radarBorder.Transparency = 0.75
    radarBorder.Thickness = 3
    setVisible(radarBorder, false)

    local radarLocalDot = Drawing.new("Triangle")
    radarLocalDot.Filled = true
    radarLocalDot.Thickness = 1
    setVisible(radarLocalDot, false)

    local function createRadarDot(player)
        if player == LocalPlayer or radarDots[player] then return end
        local dot = Drawing.new("Circle")
        dot.Filled = true
        dot.NumSides = 20
        dot.Radius = 3
        dot.Thickness = 1
        setVisible(dot, false)
        radarDots[player] = dot
    end
    local function removeRadarDot(player)
        if radarDots[player] then radarDots[player]:Remove() radarDots[player] = nil end
    end
    local function getRadarRelative(position)
        local character = LocalPlayer.Character
        if not character then return 0, 0 end
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return 0, 0 end
        local look = root.CFrame.LookVector
        local flatLook = Vector3.new(look.X, 0, look.Z)
        if flatLook.Magnitude < 0.05 then flatLook = Vector3.new(0, 0, -1) else flatLook = flatLook.Unit end
        local right = Vector3.new(-flatLook.Z, 0, flatLook.X)
        local offset = position - root.Position
        return -offset:Dot(right), offset:Dot(flatLook)
    end
    local function healthColor(ratio)
        ratio = math.clamp(ratio, 0, 1)
        return Color3.new(1 - ratio, ratio, 0)
    end
    local function updateRadarDot(player, data)
        local dot = radarDots[player]
        if not dot then return end
        if not Settings.Radar.Enabled or not data.valid then setVisible(dot, false) return end
        local relX, relZ = getRadarRelative(data.root.Position)
        local position = Settings.Radar.Position - Vector2.new(relX * Settings.Radar.Scale, relZ * Settings.Radar.Scale)
        local offset = position - Settings.Radar.Position
        local distance = offset.Magnitude
        if distance > Settings.Radar.Radius - 2 then
            if distance <= 0 then setVisible(dot, false) return end
            position = Settings.Radar.Position + offset.Unit * (Settings.Radar.Radius - 3)
            dot.Radius = 2
        else
            dot.Radius = 3
        end
        dot.Position = position
        if Settings.Radar.HealthColor then
            dot.Color = healthColor(data.humanoid.Health / math.max(data.humanoid.MaxHealth, 1))
        elseif Settings.Radar.TeamCheck then
            dot.Color = (player.TeamColor == LocalPlayer.TeamColor) and Settings.Radar.TeamColor or Settings.Radar.EnemyColor
        else
            dot.Color = Settings.Radar.PlayerColor
        end
        setVisible(dot, true)
    end

    radarSection:toggle({name = "Enabled", def = false, callback = function(v)
        Settings.Radar.Enabled = v
        setVisible(radarBackground, v)
        setVisible(radarBorder, v)
        setVisible(radarLocalDot, v)
    end})
    radarSection:slider({name = "Radius", def = 100, max = 250, min = 50, rounding = true, callback = function(v) Settings.Radar.Radius = v end})
    radarSection:slider({name = "Scale", def = 10, max = 50, min = 1, rounding = true, callback = function(v) Settings.Radar.Scale = v / 10 end})
    radarSection:colorpicker({name = "Background", cpname = "", def = Settings.Radar.BackgroundColor, callback = function(c) Settings.Radar.BackgroundColor = c end})
    radarSection:colorpicker({name = "Border", cpname = "", def = Settings.Radar.BorderColor, callback = function(c) Settings.Radar.BorderColor = c end})
    radarSection:colorpicker({name = "Local Player", cpname = "", def = Settings.Radar.LocalColor, callback = function(c) Settings.Radar.LocalColor = c end})
    radarSection:colorpicker({name = "Player", cpname = "", def = Settings.Radar.PlayerColor, callback = function(c) Settings.Radar.PlayerColor = c end})
    radarSection:colorpicker({name = "Team", cpname = "", def = Settings.Radar.TeamColor, callback = function(c) Settings.Radar.TeamColor = c end})
    radarSection:colorpicker({name = "Enemy", cpname = "", def = Settings.Radar.EnemyColor, callback = function(c) Settings.Radar.EnemyColor = c end})
    radarSection:toggle({name = "Team Check", def = true, callback = function(v) Settings.Radar.TeamCheck = v end})
    radarSection:toggle({name = "Health Color", def = true, callback = function(v) Settings.Radar.HealthColor = v end})

    local function updateViewDetection()
        if not Settings.ViewDetection.Enabled then
            viewDetectionLabel.Visible = false
            return
        end
        local character = LocalPlayer.Character
        if not character then viewDetectionLabel.Visible = false return end
        local localRoot = character:FindFirstChild("HumanoidRootPart")
        local localHumanoid = character:FindFirstChildOfClass("Humanoid")
        if not localRoot or not localHumanoid or localHumanoid.Health <= 0 then
            viewDetectionLabel.Visible = false
            return
        end
        local bestPlayer, bestPercentage = nil, 0
        local halfFOV = math.rad(Settings.ViewDetection.FOV / 2)
        local minimumDot = math.cos(halfFOV)
        local rayParams = RaycastParams.new()
        rayParams.FilterType = Enum.RaycastFilterType.Exclude
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local targetCharacter = player.Character
                if targetCharacter then
                    local head = targetCharacter:FindFirstChild("Head")
                    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
                    if head and humanoid and humanoid.Health > 0 then
                        local offset = localRoot.Position - head.Position
                        local distance = offset.Magnitude
                        if distance > 0 then
                            local direction = offset.Unit
                            local lookVector = head.CFrame.LookVector
                            local dot = lookVector:Dot(direction)
                            if dot >= minimumDot then
                                rayParams.FilterDescendantsInstances = {character, targetCharacter}
                                local rayResult = workspace:Raycast(head.Position, offset, rayParams)
                                if not rayResult then
                                    local angle = math.acos(math.clamp(dot, -1, 1))
                                    local percentage = math.clamp(1 - (angle / halfFOV), 0, 1) * 100
                                    if percentage > bestPercentage then
                                        bestPercentage = percentage
                                        bestPlayer = player
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if bestPlayer then
            viewDetectionLabel.Text = bestPlayer.Name .. " is looking at you (" .. math.floor(bestPercentage + 0.5) .. "%)"
            viewDetectionLabel.Visible = true
        else
            viewDetectionLabel.Visible = false
        end
    end

    viewDetectionSection:toggle({name = "Enabled", def = false, callback = function(v)
        Settings.ViewDetection.Enabled = v
        if not v then viewDetectionLabel.Visible = false end
    end})

    local function setupPlayer(player)
        if player == LocalPlayer then return end
        createHeadDot(player)
        create2DBox(player)
        createCornerBox(player)
        createTracer(player)
        createRadarDot(player)
        create3DBox(player)
        createNameDistance(player)
        createSkeleton(player)
    end
    local function cleanupPlayer(player)
        removeHeadDot(player)
        remove2DBox(player)
        removeCornerBox(player)
        removeTracer(player)
        removeRadarDot(player)
        remove3DBox(player)
        removeNameDistance(player)
        removeSkeleton(player)
        playerCache[player] = nil
    end

    for _, player in ipairs(Players:GetPlayers()) do setupPlayer(player) end
    Players.PlayerAdded:Connect(setupPlayer)
    Players.PlayerRemoving:Connect(cleanupPlayer)

    local draggingRadar = false
    local radarDragOffset = Vector2.new(0, 0)
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local position = Vector2.new(Mouse.X, Mouse.Y)
            if (position - Settings.Radar.Position).Magnitude <= Settings.Radar.Radius then
                radarDragOffset = Settings.Radar.Position - position
                draggingRadar = true
            end
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingRadar = false end
    end)

    _G.SoA_UpdateESP = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local data = getPlayerData(player)
                updateHeadDot(player, data)
                update2DBox(player, data)
                updateCornerBox(player, data)
                updateTracer(player, data)
                update3DBox(player, data)
                updateNameDistance(player, data)
                updateRadarDot(player, data)
            end
        end
        updateBodyESP()
        updateContainerESP()
        updatePickupESP()
        updateSkeletons()
    end

    _G.SoA_UpdateRadarVisuals = function()
        radarBackground.Position = Settings.Radar.Position
        radarBackground.Radius = Settings.Radar.Radius
        radarBackground.Color = Settings.Radar.BackgroundColor
        radarBorder.Position = Settings.Radar.Position
        radarBorder.Radius = Settings.Radar.Radius
        radarBorder.Color = Settings.Radar.BorderColor
        setVisible(radarBackground, Settings.Radar.Enabled)
        setVisible(radarBorder, Settings.Radar.Enabled)
        if Settings.Radar.Enabled then
            radarLocalDot.Color = Settings.Radar.LocalColor
            radarLocalDot.PointA = Settings.Radar.Position + Vector2.new(0, -6)
            radarLocalDot.PointB = Settings.Radar.Position + Vector2.new(-3, 6)
            radarLocalDot.PointC = Settings.Radar.Position + Vector2.new(3, 6)
            setVisible(radarLocalDot, true)
        else
            setVisible(radarLocalDot, false)
        end
        if draggingRadar then
            Settings.Radar.Position = Vector2.new(Mouse.X, Mouse.Y) + radarDragOffset
        end
    end

    _G.SoA_UpdateViewDetection = updateViewDetection
end)()

--------------------------------------------------
-- Funky
--------------------------------------------------

;(function()
    local selectedContainer, selectedPickup = "All", "All"
    local selectedTeleportPlayer = nil
    local funkyHighlightColor = Color3.fromRGB(255, 255, 255)

    local function highlightModel(model)
        if not model or not model.Parent then return end
        local old = model:FindFirstChild("SoA_FunkyHighlight")
        if old then old:Destroy() end
        local highlight = Instance.new("Highlight")
        highlight.Name = "SoA_FunkyHighlight"
        highlight.Adornee = model
        highlight.Parent = model
        highlight.FillColor = funkyHighlightColor
        highlight.OutlineColor = funkyHighlightColor
        highlight.FillTransparency = 0.35
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        task.delay(15, function() if highlight and highlight.Parent then highlight:Destroy() end end)
    end

    local function makeVisible(model)
        for _, obj in ipairs(model:GetDescendants()) do
            if obj:IsA("BasePart") then obj.Transparency = 0 end
        end
    end

    local function bringModels(folder, selection)
        local character = LocalPlayer.Character
        if not character then return end
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local selected = {}
        for _, object in ipairs(folder:GetChildren()) do
            if object:IsA("Model") and (selection == "All" or object.Name == selection) then
                table.insert(selected, object)
            end
        end
        if #selected == 0 then return end
        local spacing = 5
        local columns = math.max(1, math.ceil(math.sqrt(#selected)))
        local basePosition = root.Position + root.CFrame.LookVector * 8
        for index, model in ipairs(selected) do
            local row = math.floor((index - 1) / columns)
            local column = (index - 1) % columns
            local offsetX = (column - (columns - 1) / 2) * spacing
            local offsetZ = row * spacing
            local targetPosition = basePosition + root.CFrame.RightVector * offsetX + root.CFrame.LookVector * offsetZ
            local pivot = model:GetPivot()
            model:PivotTo(CFrame.new(targetPosition) * (pivot - pivot.Position))
            makeVisible(model)
            highlightModel(model)
        end
    end

    local containerDropdown = containerSection:dropdown({
        name = "Selection", def = "All", max = 120,
        options = getModelNames(getContainers()),
        callback = function(v) selectedContainer = v end
    })
    local pickupDropdown = pickupSection:dropdown({
        name = "Selection", def = "All", max = 20,
        options = getModelNames(getPickUps()),
        callback = function(v) selectedPickup = v end
    })
    local playerTeleportDropdown = teleportSection:dropdown({
        name = "Player", def = "", max = 20,
        options = getPlayerNamesList(false),
        callback = function(v) selectedTeleportPlayer = v end
    })

    local function refreshContainerDropdown() forceRefreshDropdown(containerDropdown, getModelNames(getContainers())) end
    local function refreshPickupDropdown() forceRefreshDropdown(pickupDropdown, getModelNames(getPickUps())) end
    local function refreshPlayerDropdown() forceRefreshDropdown(playerTeleportDropdown, getPlayerNamesList(false)) end

    getContainers().ChildAdded:Connect(function() task.defer(refreshContainerDropdown) end)
    getContainers().ChildRemoved:Connect(function() task.defer(refreshContainerDropdown) end)
    getPickUps().ChildAdded:Connect(function() task.defer(refreshPickupDropdown) end)
    getPickUps().ChildRemoved:Connect(function() task.defer(refreshPickupDropdown) end)
    Players.PlayerAdded:Connect(function() task.defer(refreshPlayerDropdown) end)
    Players.PlayerRemoving:Connect(function() task.defer(refreshPlayerDropdown) end)

    task.spawn(function()
        while true do
            task.wait(3)
            pcall(refreshContainerDropdown)
            pcall(refreshPickupDropdown)
            pcall(refreshPlayerDropdown)
        end
    end)

    containerSection:button({name = "Bring Containers", callback = function() bringModels(getContainers(), selectedContainer) end})
    containerSection:button({name = "Refresh List", callback = refreshContainerDropdown})
    containerSection:colorpicker({name = "Highlight Color", cpname = "", def = funkyHighlightColor, callback = function(c) funkyHighlightColor = c end})
    containerSection:toggle({name = "Container ESP", def = false, callback = function(v) Settings.ContainerESP.Enabled = v end})
    containerSection:colorpicker({name = "ESP Color", cpname = "", def = Settings.ContainerESP.Color, callback = function(c) Settings.ContainerESP.Color = c end})

    pickupSection:button({name = "Bring PickUps", callback = function() bringModels(getPickUps(), selectedPickup) end})
    pickupSection:button({name = "Refresh List", callback = refreshPickupDropdown})
    pickupSection:colorpicker({name = "Highlight Color", cpname = "", def = funkyHighlightColor, callback = function(c) funkyHighlightColor = c end})
    pickupSection:toggle({name = "Pickup ESP", def = false, callback = function(v) Settings.PickupESP.Enabled = v end})
    pickupSection:colorpicker({name = "ESP Color", cpname = "", def = Settings.PickupESP.Color, callback = function(c) Settings.PickupESP.Color = c end})

    teleportSection:button({
        name = "Teleport to Player",
        callback = function()
            if not selectedTeleportPlayer then return end
            local targetPlayer = Players:FindFirstChild(selectedTeleportPlayer)
            if not targetPlayer then return end
            local character = LocalPlayer.Character
            local targetChar = targetPlayer.Character
            if not character or not targetChar then return end
            local root = character:FindFirstChild("HumanoidRootPart")
            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart") or targetChar:FindFirstChild("Base")
            if not root or not targetRoot then return end
            root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3)
        end
    })
    teleportSection:button({name = "Refresh Players", callback = refreshPlayerDropdown})
end)()

--------------------------------------------------
-- Invisibility + Fly
--------------------------------------------------

;(function()
    local invisHeartbeat = nil
    local invisSavedCF = nil
    local invisSavedVel = nil
    local invisSavedRot = nil

    local function stopInvisibility()
        if invisHeartbeat then
            invisHeartbeat:Disconnect()
            invisHeartbeat = nil
        end
        if Settings.Invisibility.Connection then
            Settings.Invisibility.Connection:Disconnect()
            Settings.Invisibility.Connection = nil
        end
        pcall(function() RunService:UnbindFromRenderStep("SoA_InvisRestore") end)

        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
            if hrp and (invisSavedCF or Settings.Invisibility.LastCFrame) then
                hrp.CFrame = invisSavedCF or Settings.Invisibility.LastCFrame
                if invisSavedVel then hrp.AssemblyLinearVelocity = invisSavedVel end
                if invisSavedRot then hrp.AssemblyAngularVelocity = invisSavedRot end
            end
        end
        invisSavedCF, invisSavedVel, invisSavedRot = nil, nil, nil
        Settings.Invisibility.LastCFrame = nil
    end

    local function startInvisibility()
        stopInvisibility()

        -- Desync on Heartbeat (what others/server can see)
        invisHeartbeat = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
            if not hrp then return end

            invisSavedCF = hrp.CFrame
            invisSavedVel = hrp.AssemblyLinearVelocity
            invisSavedRot = hrp.AssemblyAngularVelocity
            Settings.Invisibility.LastCFrame = invisSavedCF

            hrp.CFrame = invisSavedCF * CFrame.new(
                math.random(1, 150),
                math.random(1, 150),
                math.random(1, 150)
            )
        end)

        -- Restore BEFORE camera/render so YOU never see the teleport
        -- Single persistent bind (not bind/unbind every frame)
        RunService:BindToRenderStep("SoA_InvisRestore", Enum.RenderPriority.Camera.Value - 1, function()
            if not invisSavedCF then return end
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
            if not hrp then return end

            hrp.CFrame = invisSavedCF
            hrp.AssemblyLinearVelocity = invisSavedVel or Vector3.zero
            hrp.AssemblyAngularVelocity = invisSavedRot or Vector3.zero
        end)

        Settings.Invisibility.Connection = invisHeartbeat
    end

    local function setInvisibilityActive(state)
        Settings.Invisibility.Active = state
        if state then
            startInvisibility()
        else
            stopInvisibility()
        end
    end

    invisibilitySection:toggle({
        name = "Enabled",
        def = false,
        callback = function(v)
            Settings.Invisibility.Enabled = v
            if not v then
                setInvisibilityActive(false)
            end
        end
    })
    invisibilitySection:dropdown({
        name = "Mode",
        def = "Toggle",
        max = 2,
        options = {"Toggle", "Hold"},
        callback = function(v)
            Settings.Invisibility.Mode = v
            if Settings.Invisibility.Active then
                setInvisibilityActive(false)
            end
        end
    })
    invisibilitySection:keybind({
        name = "Key",
        def = Enum.KeyCode.X,
        callback = function(k)
            Settings.Invisibility.Key = k
        end
    })

    --------------------------------------------------
    -- Control Peek
    --------------------------------------------------

    local peekBeamModel, peekPart0, peekPart1 = nil, nil, nil
    local peekGhost = nil

    local function destroyPeekBeam()
        if peekBeamModel and peekBeamModel.Parent then
            peekBeamModel:Destroy()
        end
        peekBeamModel, peekPart0, peekPart1 = nil, nil, nil
    end

    local function destroyPeekGhost()
        if peekGhost and peekGhost.Parent then
            peekGhost:Destroy()
        end
        peekGhost = nil
    end

    local function ensurePeekBeam()
        if not Settings.ControlPeek.ShowBeam then
            destroyPeekBeam()
            return
        end
        if peekBeamModel and peekBeamModel.Parent and peekPart0 and peekPart1 then
            return
        end
        destroyPeekBeam()

        local model = Instance.new("Model")
        model.Name = "SoA_ControlPeekBeam"
        model.Parent = workspace

        local part1 = Instance.new("Part")
        part1.Name = "BeamPart1"
        part1.Anchored = true
        part1.CanCollide = false
        part1.CanQuery = false
        part1.CanTouch = false
        part1.Transparency = 1
        part1.Size = Vector3.new(0.1, 0.1, 0.1)
        part1.Parent = model

        local att0 = Instance.new("Attachment")
        att0.Parent = part1

        local part2 = Instance.new("Part")
        part2.Name = "BeamPart2"
        part2.Anchored = true
        part2.CanCollide = false
        part2.CanQuery = false
        part2.CanTouch = false
        part2.Transparency = 1
        part2.Size = Vector3.new(0.1, 0.1, 0.1)
        part2.Parent = model

        local att1 = Instance.new("Attachment")
        att1.Parent = part2

        local transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0.00, 0.15),
            NumberSequenceKeypoint.new(0.15, 0.00),
            NumberSequenceKeypoint.new(0.85, 0.00),
            NumberSequenceKeypoint.new(1.00, 0.85)
        })

        local beam1 = Instance.new("Beam")
        beam1.Attachment0 = att0
        beam1.Attachment1 = att1
        beam1.Texture = "rbxassetid://446111271"
        beam1.TextureSpeed = 3
        beam1.TextureLength = 1
        beam1.LightEmission = 1
        beam1.LightInfluence = 0
        beam1.Brightness = 12
        beam1.Color = ColorSequence.new(Settings.ControlPeek.BeamColor)
        beam1.Transparency = transparency
        beam1.Width0 = 0.55
        beam1.Width1 = 0.55
        beam1.FaceCamera = true
        beam1.Segments = 12
        beam1.Parent = part1

        local beam2 = Instance.new("Beam")
        beam2.Attachment0 = att0
        beam2.Attachment1 = att1
        beam2.Texture = "rbxassetid://446111271"
        beam2.TextureSpeed = 1.8
        beam2.TextureLength = 1
        beam2.TextureMode = Enum.TextureMode.Stretch
        beam2.LightEmission = 1
        beam2.LightInfluence = 0
        beam2.Brightness = 18
        beam2.Color = ColorSequence.new(Settings.ControlPeek.BeamColor)
        beam2.Transparency = transparency
        beam2.Width0 = 1.05
        beam2.Width1 = 1.05
        beam2.FaceCamera = true
        beam2.Segments = 12
        beam2.Parent = part1

        peekBeamModel = model
        peekPart0 = part1
        peekPart1 = part2
    end

    local function ensurePeekGhost(atCF)
        if not Settings.ControlPeek.ShowGhost then
            destroyPeekGhost()
            return
        end
        if peekGhost and peekGhost.Parent then
            pcall(function() peekGhost:PivotTo(atCF) end)
            for _, d in ipairs(peekGhost:GetDescendants()) do
                if d:IsA("BasePart") then
                    d.Color = Settings.ControlPeek.GhostColor
                    d.Material = Enum.Material.ForceField
                end
            end
            return
        end

        local char = LocalPlayer.Character
        if not char then return end

        local ok, ghost = pcall(function()
            return char:Clone()
        end)
        if not ok or not ghost then return end

        ghost.Name = "SoA_ControlPeekGhost"

        for _, d in ipairs(ghost:GetDescendants()) do
            if d:IsA("BasePart") then
                d.Anchored = true
                d.CanCollide = false
                d.CanQuery = false
                d.CanTouch = false
                d.CastShadow = false
                d.Material = Enum.Material.ForceField
                d.Color = Settings.ControlPeek.GhostColor
                if d.Transparency < 0.25 then
                    d.Transparency = 0.25
                end
            elseif d:IsA("Script") or d:IsA("LocalScript") or d:IsA("Tool")
                or d:IsA("Sound") or d:IsA("ParticleEmitter") or d:IsA("Fire")
                or d:IsA("Smoke") or d:IsA("Sparkles") or d:IsA("Highlight") then
                d:Destroy()
            elseif d:IsA("Decal") or d:IsA("Texture") then
                d.Transparency = 0.4
            end
        end

        local hum = ghost:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            hum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
            pcall(function()
                hum:ChangeState(Enum.HumanoidStateType.Physics)
            end)
        end

        for _, child in ipairs(ghost:GetChildren()) do
            if child:IsA("LocalScript") or child:IsA("Script") or child.Name == "Animate" then
                child:Destroy()
            end
        end

        ghost.Parent = workspace
        pcall(function() ghost:PivotTo(atCF) end)
        peekGhost = ghost
    end

    local function updateControlPeekVisuals()
        if Settings.ControlPeek.Active and Settings.ControlPeek.SavedCFrame then
            local char = LocalPlayer.Character
            local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart)
            if hrp then
                if Settings.ControlPeek.ShowBeam then
                    ensurePeekBeam()
                    if peekPart0 and peekPart1 then
                        peekPart0.CFrame = CFrame.new(Settings.ControlPeek.SavedCFrame.Position)
                        peekPart1.CFrame = CFrame.new(hrp.Position)
                        if peekBeamModel then
                            for _, d in ipairs(peekBeamModel:GetDescendants()) do
                                if d:IsA("Beam") then
                                    d.Color = ColorSequence.new(Settings.ControlPeek.BeamColor)
                                end
                            end
                        end
                    end
                else
                    destroyPeekBeam()
                end

                if Settings.ControlPeek.ShowGhost then
                    ensurePeekGhost(Settings.ControlPeek.SavedCFrame)
                else
                    destroyPeekGhost()
                end

                controlPeekLabel.Text = "Control Peek"
                controlPeekLabel.Visible = true
            end
        else
            destroyPeekBeam()
            destroyPeekGhost()
            controlPeekLabel.Visible = false
        end
    end

    local function updateInvisStatusVisual()
        if Settings.Invisibility.Active then
            invisStatusLabel.Text = "Invisibility"
            invisStatusLabel.Visible = true
        else
            invisStatusLabel.Visible = false
        end
    end

    _G.SoA_UpdateStatusVisuals = function()
        updateControlPeekVisuals()
        updateInvisStatusVisual()
    end

    local function beginControlPeek()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
        if not hrp then return end
        Settings.ControlPeek.SavedCFrame = hrp.CFrame
        Settings.ControlPeek.Active = true
        updateControlPeekVisuals()
    end

    local function endControlPeek()
        if not Settings.ControlPeek.Active then return end
        Settings.ControlPeek.Active = false
        local saved = Settings.ControlPeek.SavedCFrame
        Settings.ControlPeek.SavedCFrame = nil
        destroyPeekBeam()
        destroyPeekGhost()
        controlPeekLabel.Visible = false
        if not saved then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
        if not hrp then return end
        hrp.CFrame = saved
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end

    controlPeekSection:toggle({
        name = "Enabled",
        def = false,
        callback = function(v)
            Settings.ControlPeek.Enabled = v
            if not v then
                endControlPeek()
            end
        end
    })
    controlPeekSection:dropdown({
        name = "Mode",
        def = "Hold",
        max = 2,
        options = {"Hold", "Toggle"},
        callback = function(v)
            Settings.ControlPeek.Mode = v
            if Settings.ControlPeek.Active then
                endControlPeek()
            end
        end
    })
    controlPeekSection:keybind({
        name = "Key",
        def = Enum.KeyCode.LeftAlt,
        callback = function(k)
            Settings.ControlPeek.Key = k
        end
    })
    controlPeekSection:toggle({
        name = "Show Beam",
        def = true,
        callback = function(v)
            Settings.ControlPeek.ShowBeam = v
            if not v then
                destroyPeekBeam()
            end
        end
    })
    controlPeekSection:colorpicker({
        name = "Beam Color",
        cpname = "",
        def = Color3.fromRGB(160, 92, 255),
        callback = function(c)
            Settings.ControlPeek.BeamColor = c
        end
    })
    controlPeekSection:toggle({
        name = "Show Ghost",
        def = true,
        callback = function(v)
            Settings.ControlPeek.ShowGhost = v
            if not v then
                destroyPeekGhost()
            end
        end
    })
    controlPeekSection:colorpicker({
        name = "Ghost Color",
        cpname = "",
        def = Color3.fromRGB(160, 92, 255),
        callback = function(c)
            Settings.ControlPeek.GhostColor = c
            if peekGhost and peekGhost.Parent then
                for _, d in ipairs(peekGhost:GetDescendants()) do
                    if d:IsA("BasePart") then
                        d.Color = c
                        d.Material = Enum.Material.ForceField
                    end
                end
            end
        end
    })

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

        if Settings.Invisibility.Enabled and input.KeyCode == Settings.Invisibility.Key then
            if Settings.Invisibility.Mode == "Hold" then
                setInvisibilityActive(true)
            else
                setInvisibilityActive(not Settings.Invisibility.Active)
            end
        end

        if Settings.ControlPeek.Enabled and input.KeyCode == Settings.ControlPeek.Key then
            if Settings.ControlPeek.Mode == "Hold" then
                if not Settings.ControlPeek.Active then
                    beginControlPeek()
                end
            else
                if Settings.ControlPeek.Active then
                    endControlPeek()
                else
                    beginControlPeek()
                end
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

        if Settings.Invisibility.Enabled
            and Settings.Invisibility.Mode == "Hold"
            and input.KeyCode == Settings.Invisibility.Key then
            setInvisibilityActive(false)
        end

        if Settings.ControlPeek.Enabled
            and Settings.ControlPeek.Mode == "Hold"
            and input.KeyCode == Settings.ControlPeek.Key then
            endControlPeek()
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        setInvisibilityActive(false)
        Settings.ControlPeek.Active = false
        Settings.ControlPeek.SavedCFrame = nil
    end)

    local function stopFly()
        Settings.Fly.Active = false
        if Settings.Fly.BodyVelocity then
            pcall(function() Settings.Fly.BodyVelocity:Destroy() end)
            Settings.Fly.BodyVelocity = nil
        end

        local char = LocalPlayer.Character
        if not char then return end
        local root = char.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
        if root then
            root.Anchored = false
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end
    end

    local function updateFly(dt)
        local character = LocalPlayer.Character
        if not character then return end
        local root = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if not Settings.Fly.Enabled or not Settings.Fly.Active then
            if root.Anchored then
                root.Anchored = false
            end
            return
        end

        dt = typeof(dt) == "number" and dt or 0.016
        if dt > 0.05 then dt = 0.05 end

        local speed = Settings.Fly.Speed
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            speed = speed * 3.5
        end

        local movementVector = Vector3.zero
        local look = Camera.CFrame.LookVector
        local direction = Vector3.new(look.X, 0, look.Z)
        if direction.Magnitude > 0 then
            direction = direction.Unit
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            movementVector = movementVector + direction
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            movementVector = movementVector - direction
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            movementVector = movementVector + Vector3.new(-direction.Z, 0, direction.X)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            movementVector = movementVector + Vector3.new(direction.Z, 0, -direction.X)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.E) or UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            movementVector = movementVector + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) or UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            movementVector = movementVector + Vector3.new(0, -1, 0)
        end

        root.Anchored = true

        if movementVector.Magnitude > 0 then
            root.CFrame = root.CFrame + (movementVector.Unit * speed * dt)
        end
    end

    flySection:toggle({
        name = "Enabled",
        def = false,
        callback = function(v)
            Settings.Fly.Enabled = v
            if not v then stopFly() end
        end
    })
    flySection:keybind({name = "Fly Key (Toggle)", def = Enum.KeyCode.F, callback = function(k) Settings.Fly.Key = k end})
    flySection:slider({name = "Speed", def = 100, max = 500, min = 10, rounding = true, callback = function(v) Settings.Fly.Speed = v end})

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if not Settings.Fly.Enabled then return end
        if input.KeyCode == Settings.Fly.Key then
            if Settings.Fly.Active then
                stopFly()
            else
                Settings.Fly.Active = true
            end
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        stopFly()
        table.clear(Settings.Fly.NoclipParts)
    end)

    RunService.RenderStepped:Connect(function(delta)
        updateFly(delta)
    end)

    _G.SoA_UpdateFly = function() end
    _G.SoA_StopInvisibility = stopInvisibility
end)()

--------------------------------------------------
-- Low Graphics + Shader + Audio
--------------------------------------------------

;(function()
    local savedTextures = {}
    local savedMaterials = {}

    local function applyLowGraphics(state)
        if state then
            table.clear(savedTextures)
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("Texture") or obj:IsA("Decal") then
                    savedTextures[obj] = obj.Transparency
                    obj.Transparency = 1
                end
            end
        else
            for obj, transp in pairs(savedTextures) do
                if obj and obj.Parent then
                    obj.Transparency = transp
                end
            end
            table.clear(savedTextures)
        end
    end

    local function applyShader(state)
        if state then
            table.clear(savedMaterials)
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character or workspace) then
                    -- skip character-ish dynamic stuff lightly
                    if not savedMaterials[obj] then
                        savedMaterials[obj] = obj.Material
                    end
                    obj.Material = Enum.Material.Glass
                    obj.Reflectance = 0.6
                end
            end
            -- also force lighting for shiny look
            Lighting.Technology = Enum.Technology.Future
            Lighting.EnvironmentDiffuseScale = 1
            Lighting.EnvironmentSpecularScale = 1
        else
            for obj, mat in pairs(savedMaterials) do
                if obj and obj.Parent then
                    obj.Material = mat
                    obj.Reflectance = 0
                end
            end
            table.clear(savedMaterials)
        end
    end

    local reverbEffect = nil

    local function applyAudioManip(state)
        local soundService = game:GetService("SoundService")
        if state then
            if not reverbEffect or not reverbEffect.Parent then
                reverbEffect = Instance.new("ReverbSoundEffect")
                reverbEffect.Name = "SoA_Reverb"
                reverbEffect.DryLevel = -5
                reverbEffect.WetLevel = math.clamp((Settings.AudioManip.Reverb or 0.5) * 10, 0, 20)
                reverbEffect.DecayTime = 1.5 + (Settings.AudioManip.Reverb or 0.5) * 2
                reverbEffect.Density = 0.5
                reverbEffect.Diffusion = 0.8
                reverbEffect.Parent = soundService
            else
                reverbEffect.WetLevel = math.clamp((Settings.AudioManip.Reverb or 0.5) * 10, 0, 20)
                reverbEffect.DecayTime = 1.5 + (Settings.AudioManip.Reverb or 0.5) * 2
            end
        else
            if reverbEffect and reverbEffect.Parent then
                reverbEffect:Destroy()
            end
            reverbEffect = nil
        end
    end

    graphicsSection:toggle({
        name = "Low Graphics Mode",
        def = false,
        callback = function(v)
            Settings.LowGraphics.Enabled = v
            applyLowGraphics(v)
        end
    })

    graphicsSection:toggle({
        name = "Shader (Reflective)",
        def = false,
        callback = function(v)
            Settings.Shader.Enabled = v
            applyShader(v)
        end
    })

    audioSection:toggle({
        name = "Audio Manip",
        def = false,
        callback = function(v)
            Settings.AudioManip.Enabled = v
            applyAudioManip(v)
        end
    })

    audioSection:slider({
        name = "Reverb",
        def = 50,
        max = 100,
        min = 0,
        rounding = true,
        callback = function(v)
            Settings.AudioManip.Reverb = v / 100
            if Settings.AudioManip.Enabled then
                applyAudioManip(true)
            end
        end
    })
end)()

--------------------------------------------------
-- Target Crosshair / Offscreen / China Hat / Trail
--------------------------------------------------

;(function()
    -- Target Crosshair (spinning Drawing lines)
    local xhairLines = {}
    for i = 1, 4 do
        local stroke = Drawing.new("Line")
        stroke.Thickness = 3
        stroke.Visible = false
        local main = Drawing.new("Line")
        main.Thickness = 1.5
        main.Visible = false
        xhairLines[i] = {stroke = stroke, main = main}
    end
    local xhairAngle = 0

    local function updateTargetCrosshair()
        local show = false
        local sx, sy = 0, 0

        if Settings.TargetCrosshair.Enabled and Settings.Aim.Enabled and Settings.Aim.CurrentTarget then
            local model = PlayerModels:FindFirstChild(Settings.Aim.CurrentTarget.Name)
            if model then
                local part = model:FindFirstChild(Settings.Aim.Priority) or model:FindFirstChild("Head") or model:FindFirstChild("Base")
                if part then
                    local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen and pos.Z > 0 then
                        show = true
                        sx, sy = pos.X, pos.Y
                    end
                end
            end
        end

        if not show then
            for i = 1, 4 do
                pcall(function()
                    xhairLines[i].stroke.Visible = false
                    xhairLines[i].main.Visible = false
                end)
            end
            return
        end

        xhairAngle = xhairAngle + Settings.TargetCrosshair.SpinSpeed * 0.04
        local size = Settings.TargetCrosshair.Size
        local gap = size * 0.35

        for i = 1, 4 do
            local ang = xhairAngle + (i - 1) * (math.pi / 2)
            local c, s = math.cos(ang), math.sin(ang)
            local x1 = sx + c * gap
            local y1 = sy + s * gap
            local x2 = sx + c * size
            local y2 = sy + s * size

            local stroke = xhairLines[i].stroke
            stroke.From = Vector2.new(x1, y1)
            stroke.To = Vector2.new(x2, y2)
            pcall(function()
                stroke.From = Vector2.new(x1, y1)
                stroke.To = Vector2.new(x2, y2)
                stroke.Color = Settings.TargetCrosshair.Stroke
                stroke.Visible = true

                local main = xhairLines[i].main
                main.From = Vector2.new(x1, y1)
                main.To = Vector2.new(x2, y2)
                main.Color = Settings.TargetCrosshair.Color
                main.Visible = true
            end)
        end
    end

    targetXhairSection:toggle({name = "Enabled", def = false, callback = function(v) Settings.TargetCrosshair.Enabled = v end})
    targetXhairSection:colorpicker({name = "Color", cpname = "", def = Settings.TargetCrosshair.Color, callback = function(c) Settings.TargetCrosshair.Color = c end})
    targetXhairSection:colorpicker({name = "Stroke", cpname = "", def = Settings.TargetCrosshair.Stroke, callback = function(c) Settings.TargetCrosshair.Stroke = c end})
    targetXhairSection:slider({name = "Spin Speed", def = 3, max = 15, min = 0, rounding = true, callback = function(v) Settings.TargetCrosshair.SpinSpeed = v end})

    -- China Hat (neon cone above heads)
    local chinaHats = {}

    local function createChinaHat(player)
        if chinaHats[player] then return end

        local part = Instance.new("Part")
        part.Name = "SoA_ChinaHat"
        part.Anchored = true
        part.CanCollide = false
        part.CanQuery = false
        part.CanTouch = false
        part.Massless = true
        part.CastShadow = false
        part.Material = Enum.Material.Neon
        part.Color = Settings.ChinaHat.Color
        part.Size = Vector3.new(0.05, 0.05, 0.05)
        part.Transparency = 0
        part.Parent = workspace

        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.MeshId = "rbxassetid://1033714"
        mesh.Scale = Vector3.new(1.8, 1.2, 1.8)
        mesh.Parent = part

        chinaHats[player] = part
    end

    local function removeChinaHat(player)
        if chinaHats[player] then
            chinaHats[player]:Destroy()
            chinaHats[player] = nil
        end
    end

    local function updateChinaHats()
        if not Settings.ChinaHat.Enabled then
            for _, hat in pairs(chinaHats) do
                if hat then hat.Transparency = 1 end
            end
            return
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if not chinaHats[player] then createChinaHat(player) end
            local hat = chinaHats[player]
            if not hat then continue end

            local head
            if player == LocalPlayer then
                local char = LocalPlayer.Character
                if char then
                    head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
                end
            else
                local model = PlayerModels:FindFirstChild(player.Name)
                if model then
                    head = model:FindFirstChild("Head") or model:FindFirstChild("Base")
                end
            end

            if not head then
                hat.Transparency = 1
                continue
            end

            hat.Color = Settings.ChinaHat.Color
            hat.Transparency = 0
            hat.CFrame = CFrame.new(head.Position + Vector3.new(0, 1.35, 0))
        end
    end

    Players.PlayerAdded:Connect(function(player)
        task.defer(function() if Settings.ChinaHat.Enabled then createChinaHat(player) end end)
    end)
    Players.PlayerRemoving:Connect(removeChinaHat)

    chinaHatSection:toggle({name = "Enabled", def = false, callback = function(v)
        Settings.ChinaHat.Enabled = v
        if v then
            for _, p in ipairs(Players:GetPlayers()) do createChinaHat(p) end
        else
            for p, _ in pairs(chinaHats) do removeChinaHat(p) end
        end
    end})
    chinaHatSection:colorpicker({name = "Color", cpname = "", def = Settings.ChinaHat.Color, callback = function(c)
        Settings.ChinaHat.Color = c
        for _, hat in pairs(chinaHats) do if hat then hat.Color = c end end
    end})

    -- Local Player Trail (Slash VFX, offset -2 studs, high rate)
    local trailSlash = nil

    local function destroyTrail()
        if trailSlash and trailSlash.Parent then
            trailSlash:Destroy()
        end
        trailSlash = nil
    end

    local function ensureTrail()
        if trailSlash and trailSlash.Parent then return end
        destroyTrail()

        local folder = workspace:FindFirstChild("SoA_Trail")
        if not folder then
            folder = Instance.new("Folder")
            folder.Name = "SoA_Trail"
            folder.Parent = workspace
        end

        -- Same slash as gun VFX, but 10x rate (~45) and slightly larger
        trailSlash = VFX.CreateSlash(folder, Settings.Trail.Color1, true)
        trailSlash.Anchored = true
        trailSlash.CanCollide = false
        trailSlash.CanQuery = false
        trailSlash.Massless = true

        for _, inst in ipairs(trailSlash:GetDescendants()) do
            if inst:IsA("ParticleEmitter") then
                inst.Rate = 30
                inst.Size = NumberSequence.new(2.4)
                inst.Lifetime = NumberRange.new(0.45, 0.7)
                inst.Speed = NumberRange.new(0.05, 0.25)
                inst.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Settings.Trail.Color1),
                    ColorSequenceKeypoint.new(1, Settings.Trail.Color2),
                })
                inst.Enabled = true
            end
        end
    end

    local function updateTrail()
        if not Settings.Trail.Enabled then
            destroyTrail()
            return
        end

        local char = LocalPlayer.Character
        if not char then destroyTrail() return end
        local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Base")
        if not root then destroyTrail() return end

        ensureTrail()

        -- Offset -2 studs on Y under the character
        trailSlash.CFrame = root.CFrame * CFrame.new(0, -2, 0)

        for _, inst in ipairs(trailSlash:GetDescendants()) do
            if inst:IsA("ParticleEmitter") then
                inst.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Settings.Trail.Color1),
                    ColorSequenceKeypoint.new(1, Settings.Trail.Color2),
                })
                inst.Rate = 30
                inst.Enabled = true
            end
        end
    end

    LocalPlayer.CharacterAdded:Connect(function()
        destroyTrail()
    end)

    trailSection:toggle({name = "Enabled", def = false, callback = function(v)
        Settings.Trail.Enabled = v
        if not v then destroyTrail() end
    end})
    trailSection:colorpicker({name = "Color 1", cpname = "", def = Settings.Trail.Color1, callback = function(c) Settings.Trail.Color1 = c end})
    trailSection:colorpicker({name = "Color 2", cpname = "", def = Settings.Trail.Color2, callback = function(c) Settings.Trail.Color2 = c end})

    -- Local Character material / transparency
    local localCharOriginals = {}

    local function applyLocalCharacter()
        local char = LocalPlayer.Character
        if not char then return end

        if not Settings.LocalCharacter.Enabled then
            for part, data in pairs(localCharOriginals) do
                if part and part.Parent then
                    part.Material = data.Material
                    part.Transparency = data.Transparency
                    if data.Color then part.Color = data.Color end
                end
            end
            table.clear(localCharOriginals)
            return
        end

        local mat = Enum.Material[Settings.LocalCharacter.Material]
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                if not localCharOriginals[part] then
                    localCharOriginals[part] = {
                        Material = part.Material,
                        Transparency = part.Transparency,
                        Color = part.Color,
                    }
                end
                if mat then part.Material = mat end
                part.Transparency = Settings.LocalCharacter.Transparency
                if Settings.LocalCharacter.ColorEnabled then
                    part.Color = Settings.LocalCharacter.Color
                end
            end
        end
    end

    localCharSection:toggle({
        name = "Enabled",
        def = false,
        callback = function(v)
            Settings.LocalCharacter.Enabled = v
            applyLocalCharacter()
        end
    })
    localCharSection:dropdown({
        name = "Material",
        def = "ForceField",
        max = 5,
        options = materials,
        callback = function(v)
            Settings.LocalCharacter.Material = v
            if Settings.LocalCharacter.Enabled then applyLocalCharacter() end
        end
    })
    localCharSection:toggle({
        name = "Color Enabled",
        def = false,
        callback = function(v)
            Settings.LocalCharacter.ColorEnabled = v
            if Settings.LocalCharacter.Enabled then applyLocalCharacter() end
        end
    })
    localCharSection:colorpicker({
        name = "Color",
        cpname = "",
        def = Settings.LocalCharacter.Color,
        callback = function(c)
            Settings.LocalCharacter.Color = c
            if Settings.LocalCharacter.Enabled then applyLocalCharacter() end
        end
    })
    localCharSection:slider({
        name = "Transparency",
        def = 0,
        max = 100,
        min = 0,
        rounding = true,
        callback = function(v)
            Settings.LocalCharacter.Transparency = v / 100
            if Settings.LocalCharacter.Enabled then applyLocalCharacter() end
        end
    })

    LocalPlayer.CharacterAdded:Connect(function()
        table.clear(localCharOriginals)
        task.delay(0.6, function()
            if Settings.LocalCharacter.Enabled then applyLocalCharacter() end
        end)
    end)

    _G.SoA_UpdateExtraVisuals = function()
        updateTargetCrosshair()
        updateChinaHats()
        updateTrail()
    end
end)()

--------------------------------------------------
-- Menu
--------------------------------------------------

menuSection:keybind({name = "Menu Toggle", def = Enum.KeyCode.RightShift, callback = function(k) Settings.Menu.Key = k end})
menuSection:button({name = "Unload", callback = function()
    Settings.ViewDetection.Enabled = false
    if _G.SoA_StopInvisibility then _G.SoA_StopInvisibility() end
    if _G.SoA_ClearTextures then _G.SoA_ClearTextures() end
    restoreNodeVisuals()
    clearGunVFX()
    clearCharVFX("Slot1")
    clearCharVFX("Slot2")
    pcall(function() RunService:UnbindFromRenderStep("SoA_SilentAim") end)
    Settings.Fly.Enabled = false
    Settings.Fly.Active = false
    if Settings.Fly.BodyVelocity then Settings.Fly.BodyVelocity:Destroy() end
    Settings.ThirdPerson.Active = false
    Camera.CameraType = Enum.CameraType.Custom
    if viewDetectionGui then viewDetectionGui:Destroy() end
    if aimTargetGui then aimTargetGui:Destroy() end
    if penetrationGui then penetrationGui:Destroy() end
    if controlPeekGui then controlPeekGui:Destroy() end
    if invisStatusGui then invisStatusGui:Destroy() end
    local peekModel = workspace:FindFirstChild("SoA_ControlPeekBeam")
    if peekModel then peekModel:Destroy() end
    local peekGhostModel = workspace:FindFirstChild("SoA_ControlPeekGhost")
    if peekGhostModel then peekGhostModel:Destroy() end
    UserInputService.MouseIconEnabled = true
    Camera.FieldOfView = Settings.FOV.Original
    if fovCircle then fovCircle:Remove() end
    if predictionBall then predictionBall:Destroy() end
    pcall(function() Window:unload() end)
end})

otherSection:button({name = "Copy JobId", callback = function() if setclipboard then setclipboard(game.JobId) end end})
otherSection:button({name = "Copy GameID", callback = function() if setclipboard then setclipboard(tostring(game.GameId)) end end})
otherSection:button({name = "Copy PlaceID", callback = function() if setclipboard then setclipboard(tostring(game.PlaceId)) end end})
otherSection:button({name = "Rejoin", callback = function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end})

--------------------------------------------------
-- Config System (named cloud library, no local files)
--------------------------------------------------

;(function()
    local HttpService = game:GetService("HttpService")
    local libraryKey = nil
    local libraryData = { version = 1, configs = {} }
    local selectedName = nil
    local configDropdown = nil

    local function getRequest()
        return (syn and syn.request)
            or (http and http.request)
            or http_request
            or (fluxus and fluxus.request)
            or request
    end

    local SKIP = {
        CurrentTarget = true, Connection = true, BodyVelocity = true,
        NoclipParts = true, LastCFrame = true, LastClick = true,
        LastUpdate = true, Active = true, Textures = true, Originals = true,
        OriginalClock = true, OriginalAmbient = true, OriginalOutdoor = true,
        OriginalColorShiftTop = true, OriginalColorShiftBottom = true,
        OriginalAmbientColor = true, Original = true,
    }

    local function serialize(value)
        local t = typeof(value)
        if t == "Color3" then
            return {__type = "Color3", R = value.R, G = value.G, B = value.B}
        elseif t == "EnumItem" then
            return {__type = "EnumItem", EnumType = tostring(value.EnumType), Name = value.Name}
        elseif t == "Vector2" then
            return {__type = "Vector2", X = value.X, Y = value.Y}
        elseif t == "Vector3" then
            return {__type = "Vector3", X = value.X, Y = value.Y, Z = value.Z}
        elseif t == "table" then
            local out = {}
            for k, v in pairs(value) do
                if typeof(k) == "string" or typeof(k) == "number" then
                    out[k] = serialize(v)
                end
            end
            return out
        elseif t == "string" or t == "number" or t == "boolean" or t == "nil" then
            return value
        end
        return nil
    end

    local function deserialize(value)
        if typeof(value) ~= "table" then return value end
        if value.__type == "Color3" then
            return Color3.new(value.R, value.G, value.B)
        elseif value.__type == "EnumItem" then
            local ok, result = pcall(function() return Enum[value.EnumType][value.Name] end)
            if ok then return result end
            return nil
        elseif value.__type == "Vector2" then
            return Vector2.new(value.X, value.Y)
        elseif value.__type == "Vector3" then
            return Vector3.new(value.X, value.Y, value.Z)
        end
        local out = {}
        for k, v in pairs(value) do out[k] = deserialize(v) end
        return out
    end

    local function exportSettings()
        local data = {}
        for key, section in pairs(Settings) do
            if typeof(section) == "table" then
                local copy = {}
                for k, v in pairs(section) do
                    if not SKIP[k] then
                        local sv = serialize(v)
                        if sv ~= nil then copy[k] = sv end
                    end
                end
                data[key] = copy
            end
        end
        return data
    end

    local function importSettings(data)
        if typeof(data) ~= "table" then return end
        for key, section in pairs(data) do
            if Settings[key] and typeof(section) == "table" and typeof(Settings[key]) == "table" then
                for k, v in pairs(section) do
                    if not SKIP[k] then
                        local dv = deserialize(v)
                        if dv ~= nil then Settings[key][k] = dv end
                    end
                end
            end
        end
        if _G.SoA_UpdateAmbience and Settings.Ambience.Enabled then _G.SoA_UpdateAmbience() end
        if _G.SoA_UpdateColorCorrection then _G.SoA_UpdateColorCorrection() end
    end

    local function getConfigNames()
        local names = {}
        if libraryData and typeof(libraryData.configs) == "table" then
            for name in pairs(libraryData.configs) do
                table.insert(names, name)
            end
        end
        table.sort(names)
        if #names == 0 then names = {"(empty)"} end
        return names
    end

    local function refreshDropdown()
        local names = getConfigNames()
        forceRefreshDropdown(configDropdown, names)
        if selectedName and libraryData.configs and libraryData.configs[selectedName] then
            -- keep selection
        else
            selectedName = names[1] ~= "(empty)" and names[1] or nil
        end
    end

    local function httpPost(body)
        local req = getRequest()
        if not req then return nil, "no request" end
        local ok, res = pcall(function()
            return req({
                Url = "https://bytebin.lucko.me/post",
                Method = "POST",
                Headers = {["Content-Type"] = "application/json", ["User-Agent"] = "SoA-Config"},
                Body = body,
            })
        end)
        if not ok or not res then return nil, "request failed" end
        local bodyRes = res.Body or res.body or ""
        local dok, decoded = pcall(function() return HttpService:JSONDecode(bodyRes) end)
        if dok and typeof(decoded) == "table" and decoded.key then
            return tostring(decoded.key), nil
        end
        local key = tostring(bodyRes):gsub("%s", "")
        if key ~= "" then return key, nil end
        return nil, "no key"
    end

    local function httpGet(key)
        local req = getRequest()
        if not req then return nil, "no request" end
        local ok, res = pcall(function()
            return req({
                Url = "https://bytebin.lucko.me/" .. key,
                Method = "GET",
                Headers = {["User-Agent"] = "SoA-Config"},
            })
        end)
        if not ok or not res then return nil, "request failed" end
        local status = res.StatusCode or res.Status or res.status_code or 200
        if status ~= 0 and status ~= 200 then return nil, "http " .. tostring(status) end
        return res.Body or res.body or "", nil
    end

    local function uploadLibrary()
        local ok, encoded = pcall(function() return HttpService:JSONEncode(libraryData) end)
        if not ok then
            Notify({Title = "Config", Content = "Encode failed", Duration = 3})
            return false
        end
        local key, err = httpPost(encoded)
        if not key then
            Notify({Title = "Config", Content = "Cloud upload failed: " .. tostring(err), Duration = 3})
            return false
        end
        libraryKey = key
        if setclipboard then pcall(setclipboard, key) end
        print("[SoA Config] Library key: " .. key)
        return true
    end

    local function downloadLibrary(key)
        key = tostring(key or ""):gsub("%s", "")
        if key == "" then return false end
        local body, err = httpGet(key)
        if not body then
            Notify({Title = "Config", Content = "Download failed: " .. tostring(err), Duration = 3})
            return false
        end
        local dok, data = pcall(function() return HttpService:JSONDecode(body) end)
        if not dok or typeof(data) ~= "table" then
            Notify({Title = "Config", Content = "Invalid library JSON", Duration = 3})
            return false
        end
        if typeof(data.configs) ~= "table" then
            -- legacy single-config paste: wrap as "default"
            libraryData = { version = 1, configs = { default = data } }
        else
            libraryData = data
            if not libraryData.configs then libraryData.configs = {} end
        end
        libraryKey = key
        refreshDropdown()
        return true
    end

    local function readClipboard()
        if not getclipboard then return nil end
        local ok, clip = pcall(getclipboard)
        if ok and clip then return tostring(clip) end
        return nil
    end

    local function sanitizeName(name)
        name = tostring(name or ""):gsub("^%s+", ""):gsub("%s+$", "")
        name = name:gsub("[^%w%-%_ ]", "")
        if #name > 32 then name = name:sub(1, 32) end
        return name
    end

    -- UI
    configSection:button({name = "Load Library (key on clipboard)", callback = function()
        local key = readClipboard()
        if not key or key == "" then
            Notify({Title = "Config", Content = "Copy your library key first", Duration = 3})
            return
        end
        -- if clipboard has huge JSON, try as library body
        if #key > 80 and key:find("{") then
            local dok, data = pcall(function() return HttpService:JSONDecode(key) end)
            if dok and typeof(data) == "table" then
                if typeof(data.configs) == "table" then
                    libraryData = data
                else
                    libraryData = { version = 1, configs = { default = data } }
                end
                refreshDropdown()
                Notify({Title = "Config", Content = "Loaded library from clipboard JSON", Duration = 3})
                return
            end
        end
        key = key:gsub("%s", "")
        if downloadLibrary(key) then
            Notify({Title = "Config", Content = "Library loaded", Duration = 3})
        end
    end})

    configDropdown = configSection:dropdown({
        name = "Configs",
        def = "(empty)",
        max = 20,
        options = getConfigNames(),
        callback = function(v)
            if v and v ~= "(empty)" then selectedName = v end
        end
    })

    configSection:button({name = "Load Selected", callback = function()
        if not selectedName or not libraryData.configs or not libraryData.configs[selectedName] then
            Notify({Title = "Config", Content = "Select a config first", Duration = 3})
            return
        end
        importSettings(libraryData.configs[selectedName])
        Notify({Title = "Config", Content = "Loaded: " .. selectedName, Duration = 3})
    end})

    configSection:button({name = "Save / Overwrite Selected", callback = function()
        local name = selectedName
        if not name or name == "(empty)" then name = "default" end
        if not libraryData.configs then libraryData.configs = {} end
        libraryData.configs[name] = exportSettings()
        selectedName = name
        if uploadLibrary() then
            refreshDropdown()
            Notify({Title = "Config", Content = "Saved '" .. name .. "' — library key copied", Duration = 5})
        end
    end})

    configSection:button({name = "Create New (name on clipboard)", callback = function()
        local name = sanitizeName(readClipboard())
        if not name or name == "" then
            Notify({Title = "Config", Content = "Copy a name to clipboard first (e.g. rage)", Duration = 4})
            return
        end
        if not libraryData.configs then libraryData.configs = {} end
        libraryData.configs[name] = exportSettings()
        selectedName = name
        if uploadLibrary() then
            refreshDropdown()
            Notify({Title = "Config", Content = "Created '" .. name .. "' — key copied", Duration = 5})
        end
    end})

    configSection:button({name = "Delete Selected", callback = function()
        if not selectedName or not libraryData.configs or not libraryData.configs[selectedName] then
            Notify({Title = "Config", Content = "Nothing to delete", Duration = 3})
            return
        end
        libraryData.configs[selectedName] = nil
        selectedName = nil
        if uploadLibrary() then
            refreshDropdown()
            Notify({Title = "Config", Content = "Deleted — new key copied", Duration = 4})
        end
    end})

    configSection:button({name = "Copy Library Key", callback = function()
        if not libraryKey then
            Notify({Title = "Config", Content = "No library key yet — save something first", Duration = 3})
            return
        end
        if setclipboard then
            setclipboard(libraryKey)
            Notify({Title = "Config", Content = "Key copied: " .. libraryKey, Duration = 4})
        else
            print("[SoA Config] Library key: " .. libraryKey)
            Notify({Title = "Config", Content = "Key printed to F9 console", Duration = 3})
        end
    end})

    refreshDropdown()
end)()

--------------------------------------------------
-- Main Loops
--------------------------------------------------

RunService.Heartbeat:Connect(function(dt)
    if _G.SoA_UpdateFly then _G.SoA_UpdateFly(dt) end

    local ragebotHeld = Settings.Ragebot.Enabled and UserInputService:IsKeyDown(Settings.Ragebot.Key)
    local aimRmb = Settings.Aim.Enabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)

    -- Normal Aim (Rotation / Manipulation) on Heartbeat - same path as Ragebot so it survives death
    if aimRmb and not ragebotHeld then
        local target = getTarget()
        if target then
            if Settings.Aim.Mode == "Rotation" then
                applyRotationSilent(target)
            elseif Settings.Aim.Mode == "Manipulation" then
                applyManipulationSilent(target)
            end
        end
    end

    -- Ragebot
    if ragebotHeld then
        local target = getRagebotTarget()
        if target then
            if Settings.Aim.Mode == "Memory" then
                local pos = predict(target)
                local screen = Camera:WorldToViewportPoint(pos)
                local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                local delta = Vector2.new(screen.X, screen.Y) - center
                local div = (Settings.Aim.Smoothing <= 0) and 1 or (Settings.Aim.Smoothing / 5)
                pcall(function() mousemoverel(delta.X / div, delta.Y / div) end)
            elseif Settings.Aim.Mode == "Rotation" then
                applyRotationSilent(target)
            elseif Settings.Aim.Mode == "Manipulation" then
                applyManipulationSilent(target)
            end
        end

        local now = os.clock()
        if now - Settings.Ragebot.LastClick >= Settings.Ragebot.ClickInterval then
            Settings.Ragebot.LastClick = now
            pcall(function()
                mouse1click()
            end)
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local rmbHeld = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)

    if Settings.Zoom.Enabled and Settings.Zoom.Active then
        Camera.FieldOfView = Settings.Zoom.TargetFOV
    elseif Settings.FOV.Enabled then
        if Settings.FOV.ADSChange or not rmbHeld then
            Camera.FieldOfView = Settings.FOV.Value
        end
    end

    -- Force ambience every frame so game day/night cycle cannot override it
    if Settings.Ambience.Enabled and _G.SoA_UpdateAmbience then
        _G.SoA_UpdateAmbience()
    end

    updateThirdPerson()
    if _G.SoA_FollowCharVFX then _G.SoA_FollowCharVFX() end
    if _G.SoA_UpdateExtraVisuals then _G.SoA_UpdateExtraVisuals() end
    updateRaycastPrediction()
    updatePenetration()

    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local circleRadius = Settings.Aim.FOV
    if Settings.Aim.DynamicFOV then
        circleRadius = Settings.Aim.FOV * (70 / math.max(Camera.FieldOfView, 1))
    end
    fovCircle.Position = screenCenter
    fovCircle.Radius = circleRadius
    fovCircle.Visible = Settings.Aim.Enabled and Settings.Aim.ShowFOV

    local labelY = screenCenter.Y + circleRadius + 8
    aimTargetLabel.Position = UDim2.new(0.5, 0, 0, labelY)
    if Settings.Aim.Enabled and Settings.Aim.CurrentTarget then
        aimTargetLabel.Text = Settings.Aim.CurrentTarget.Name
        aimTargetLabel.Visible = true
    else
        aimTargetLabel.Visible = false
    end
    penetrationLabel.Position = UDim2.new(0.5, 0, 0, labelY + 20)
    viewDetectionLabel.Position = UDim2.new(0.5, 0, 0, labelY + 40)
    controlPeekLabel.Position = UDim2.new(0.5, 0, 0, labelY + 60)
    invisStatusLabel.Position = UDim2.new(0.5, 0, 0, labelY + 80)

    if _G.SoA_UpdateStatusVisuals then
        _G.SoA_UpdateStatusVisuals()
    end

    if _G.SoA_UpdateESP then _G.SoA_UpdateESP() end
    if _G.SoA_UpdateRadarVisuals then _G.SoA_UpdateRadarVisuals() end

    if Settings.AnimatedSkin.Enabled then
        for _, tex in pairs(Settings.AnimatedSkin.Textures) do
            if tex and tex.Parent then
                tex.OffsetStudsU = (tex.OffsetStudsU + Settings.AnimatedSkin.Speed * 0.016) % 10
            end
        end
    end

    if Settings.ViewDetection.Enabled then
        local now = os.clock()
        if now - Settings.ViewDetection.LastUpdate >= Settings.ViewDetection.Interval then
            Settings.ViewDetection.LastUpdate = now
            if _G.SoA_UpdateViewDetection then _G.SoA_UpdateViewDetection() end
        end
    end
end)

AimTab:openpage()
