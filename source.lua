local players = game:GetService("Players")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local listUrl = "https://raw.githubusercontent.com/yooqa6Xi/soa/refs/heads/main/list.txt"
local watchlist = {}
local menuVisible = true
local lastRefreshTime = os.clock()
local autoRefreshInterval = 5

local function getRequest()
    return (syn and syn.request)
        or (http and http.request)
        or http_request
        or (fluxus and fluxus.request)
        or request
end

local function fetchWatchlist()
    local body
    local requestFunc = getRequest()

    if requestFunc then
        local success, response = pcall(function()
            return requestFunc({
                Url = listUrl,
                Method = "GET",
                Headers = {["User-Agent"] = "Watchlist"},
            })
        end)
        if success and response then
            body = response.Body or response.body
        end
    end

    if not body then
        local success, data = pcall(game.HttpGet, game, listUrl)
        if success then
            body = data
        end
    end

    if not body then
        return false, "request failed"
    end

    local success, data = pcall(function()
        return httpService:JSONDecode(body)
    end)
    if not success or typeof(data) ~= "table" then
        return false, "invalid json"
    end

    local names = data.usernames or data
    if typeof(names) ~= "table" then
        return false, "missing usernames"
    end

    watchlist = {}
    for _, name in ipairs(names) do
        if typeof(name) == "string" and name ~= "" then
            table.insert(watchlist, name)
        end
    end

    return true
end

local function getFoundPlayers()
    local found = {}
    local online = {}

    for _, player in ipairs(players:GetPlayers()) do
        online[string.lower(player.Name)] = player.Name
    end

    for _, name in ipairs(watchlist) do
        local match = online[string.lower(name)]
        if match then
            table.insert(found, match)
        end
    end

    table.sort(found)
    return found
end

local guiParent = (gethui and select(2, pcall(gethui))) or game:GetService("CoreGui")
local oldGui = guiParent:FindFirstChild("WatchlistMenu")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WatchlistMenu"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.Parent = guiParent

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 260, 0, 230)
main.Position = UDim2.new(0, 36, 0.5, -115)
main.BackgroundColor3 = Color3.fromRGB(9, 9, 11)
main.BorderSizePixel = 1
main.BorderColor3 = Color3.fromRGB(0, 0, 0)
main.Active = true
main.Draggable = true
main.Parent = screenGui

local accent = Instance.new("Frame")
accent.Size = UDim2.new(1, 0, 0, 2)
accent.BackgroundColor3 = Color3.fromRGB(200, 120, 20)
accent.BorderSizePixel = 0
accent.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 22)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSans
title.TextSize = 15
title.TextColor3 = Color3.fromRGB(220, 220, 220)
title.TextStrokeTransparency = 0.4
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Text = "watchlist"
title.Parent = main

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -20, 0, 1)
divider.Position = UDim2.new(0, 10, 0, 36)
divider.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
divider.BorderSizePixel = 0
divider.Parent = main

local sectionLabel = Instance.new("TextLabel")
sectionLabel.Size = UDim2.new(1, -20, 0, 16)
sectionLabel.Position = UDim2.new(0, 10, 0, 44)
sectionLabel.BackgroundTransparency = 1
sectionLabel.Font = Enum.Font.SourceSans
sectionLabel.TextSize = 12
sectionLabel.TextColor3 = Color3.fromRGB(110, 110, 120)
sectionLabel.TextStrokeTransparency = 0.5
sectionLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
sectionLabel.TextXAlignment = Enum.TextXAlignment.Left
sectionLabel.Text = "in server - auto refreshed 0s ago"
sectionLabel.Parent = main

local textBoxBg = Instance.new("Frame")
textBoxBg.Size = UDim2.new(1, -20, 0, 100)
textBoxBg.Position = UDim2.new(0, 10, 0, 64)
textBoxBg.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
textBoxBg.BorderSizePixel = 1
textBoxBg.BorderColor3 = Color3.fromRGB(0, 0, 0)
textBoxBg.Parent = main

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -12, 1, -12)
statusText.Position = UDim2.new(0, 6, 0, 6)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.SourceSans
statusText.TextSize = 14
statusText.TextColor3 = Color3.fromRGB(210, 210, 215)
statusText.TextStrokeTransparency = 0.35
statusText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.TextYAlignment = Enum.TextYAlignment.Top
statusText.TextWrapped = true
statusText.Text = "None"
statusText.Parent = textBoxBg

local function makeButton(name, y, bg, fg)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 24)
    button.Position = UDim2.new(0, 10, 0, y)
    button.BackgroundColor3 = bg
    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 13
    button.TextColor3 = fg
    button.TextStrokeTransparency = 0.4
    button.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    button.Text = name
    button.AutoButtonColor = true
    button.Parent = main
    return button
end

local refreshButton = makeButton("refresh", 172, Color3.fromRGB(20, 20, 24), Color3.fromRGB(200, 200, 205))
local reloadButton = makeButton("reload list", 200, Color3.fromRGB(28, 22, 12), Color3.fromRGB(220, 160, 60))

local function updateSectionLabel()
    local ago = math.floor(os.clock() - lastRefreshTime)
    if ago < 0 then ago = 0 end
    sectionLabel.Text = "in server - auto refreshed " .. ago .. "s ago"
end

local function refresh()
    local found = getFoundPlayers()
    lastRefreshTime = os.clock()
    updateSectionLabel()

    if #found == 0 then
        statusText.Text = "None"
    else
        statusText.Text = table.concat(found, "\n")
    end
end

local function reloadList()
    local success, err = fetchWatchlist()
    if success then
        refresh()
    else
        statusText.Text = "Failed to load list"
    end
end

refreshButton.MouseButton1Click:Connect(refresh)
reloadButton.MouseButton1Click:Connect(reloadList)

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        menuVisible = not menuVisible
        main.Visible = menuVisible
    end
end)

players.PlayerAdded:Connect(function(player)
    task.defer(refresh)
end)

players.PlayerRemoving:Connect(function(player)
    task.defer(refresh)
end)

task.spawn(function()
    while screenGui.Parent do
        updateSectionLabel()
        local elapsed = os.clock() - lastRefreshTime
        if elapsed >= autoRefreshInterval then
            refresh()
        end
        task.wait(1)
    end
end)

reloadList()
