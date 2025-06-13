local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local crops = {
    carrot=true, strawberry=true, tomato=true, corn=true, watermelon=true,
    pumpkin=true, apple=true, bamboo=true, grape=true, mushroom=true,
    pepper=true, cacao=true, coconut=true, cactus=true, dragonfruit=true,
    honeysuckle=true, mango=true, nectarine=true, peach=true, pineapple=true,
}
local function part(m)
    return m.PrimaryPart or m:FindFirstChildWhichIsA("BasePart")
end
task.spawn(function()
    while true do
        local c = lp.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if r then
            for _,m in ipairs(workspace:GetDescendants()) do
                if m:IsA("Model") and crops[m.Name:lower()] then
                    local p = part(m)
                    if p and (p.Position-r.Position).Magnitude<=15 then
                        local e = rs:FindFirstChild("WaterPlant")
                        if e and e:IsA("RemoteEvent") then
                            e:FireServer(m)
                        end
                    end
                end
            end
        end
        task.wait(3)
    end
end)
