local infiniteSprinklerEnabled = false

local function sprinklerAction()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local range = 15
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and cropSet[model.Name:lower()] then
            local pp = getPP(model)
            if pp then
                local dist = (pp.Position - root.Position).Magnitude
                if dist <= range then
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
                    local WaterEvent = ReplicatedStorage:FindFirstChild("WaterPlant")
                    if WaterEvent and WaterEvent:IsA("RemoteEvent") then
                        WaterEvent:FireServer(model)
                    end
                end
            end
        end
    end
end

function SetSprinklerEnabled(state)
    infiniteSprinklerEnabled = state
end

spawn(function()
    while true do
        if infiniteSprinklerEnabled then
            sprinklerAction()
        end
        wait(3)
    end
end)

spawn(function()
    while true do
        update()
        wait(1)
    end
end)
