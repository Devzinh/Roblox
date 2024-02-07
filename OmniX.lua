    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    
    OrionLib:MakeNotification({
        Name = "Loading!",
        Content = "Please wait 3 seconds",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    
    wait (3)

    local Window = OrionLib:MakeWindow({Name = "Dev'sHub | discord.gg/DxSxqnWe", HidePremium = false, SaveConfig = true, ConfigFolder = "devscfg", IntroEnabled = true, IntroText = "Dev'sHub"})

    local Tp = Window:MakeTab({
        Name = "Teleport",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    Tp:AddButton({
        Name = "GET Omnitrix",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(60, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-387.6155700683594, -42.443519592285156, -4355.9755859375)}):Play()
            
            wait(3)

            fireproximityprompt(game.Workspace.Map.ScriptsParts.OMCAPSULE.Interact.ProximityPrompt, 1, false)
        end    
    })

    Tp:AddButton({
        Name = "JOIN RAID",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(60, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(2454.29638671875, 299.6047058105469, -6982.96728515625)}):Play()
            
            wait(3)

            fireproximityprompt(game.Workspace.Map.Montanha.Castle.Teleport.Interact.ProximityPrompt, 1, false)
        end    
    })

    Tp:AddButton({
        Name = "RECALIBRATE",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(60, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(417.9433288574219, 35290.390625, 239.38909912109375)}):Play()

            wait(3)

            fireproximityprompt(game.workspace.SpaceStar.RECALIBRATE.ProximityPrompt, 1, false)
          end    
    })

    Tp:AddButton({
        Name = "RESET",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(60, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(412.9422912597656, 35290.390625, 239.38858032226562)}):Play()

            wait(3)

            fireproximityprompt(game.workspace.SpaceStar.RESET.ProximityPrompt, 1, false)
          end    
    })

    Tp:AddButton({
        Name = "ANODITE",
        Callback = function()
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(60, Enum.EasingStyle.Linear)
            tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(360.8636474609375, 35290.40234375, 303.99591064453125)}):Play()

            wait(3)

            fireproximityprompt(game.workspace.SpaceStar.anodite.ProximityPrompt, 1, false)
          end    
    })

    local Misc = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    Misc:AddButton({
        Name = "Auto-Save",
        Callback = function()
            while true do
                local args = {
                    [1] = "/save",
                    [2] = "All"
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
                wait(180)
            end
        end
    })

    Misc:AddButton({
        Name = "Optimize FPS",
        Callback = function()
    _G.Settings = {
        Players = {
            ["Ignore Me"] = true, -- Ignore your Character
            ["Ignore Others"] = true -- Ignore other Characters
        },
        Meshes = {
            Destroy = false, -- Destroy Meshes
            LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
        },
        Images = {
            Invisible = true, -- Invisible Images
            LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
            Destroy = false, -- Destroy Images
        },
        Other = {
            ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
            ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
            ["No Explosions"] = true, -- Makes Explosion's invisible
            ["No Clothes"] = true, -- Removes Clothing from the game
            ["Low Water Graphics"] = true, -- Removes Water Quality
            ["No Shadows"] = true, -- Remove Shadows
            ["Low Rendering"] = true, -- Lower Rendering
            ["Low Quality Parts"] = true -- Lower quality parts
        }
    }
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LookP/Roblox/main/FpsBoost.lua"))()
        end    
    })

    Misc:AddButton({
        Name = "ServerHop OmniX",
        Callback = function()
            loadstring(game:HttpGet(("https://pastebin.com/raw/n8nzV2Fp")))()
        end    
    })

    Misc:AddButton({
        Name = "Rejoin OmniX",
        Callback = function()
            loadstring(game:HttpGet(("https://pastebin.com/raw/fvYK9VFN")))()
        end    
    })

    Misc:AddSlider({
        Name = "WalkSpeed",
        Min = 0,
        Max = 200,
        Default = 16,
        Color = Color3.fromRGB(0,255,255),
        Increment = 1,
        ValueName = "WalkSpeed",
        Callback = function(Value)
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local Hum = char.Humanoid
    
        Hum.WalkSpeed = Value
        end    
    })

    OrionLib:Init()
