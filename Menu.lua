-- Menu.lua (LocalScript วางใน StarterPlayerScripts)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- RemoteEvent สำหรับเชื่อมไปยัง server.lua
local remote = ReplicatedStorage:WaitForChild("ToggleFeature")

-- สร้าง GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "ProModernMenu"
screenGui.ResetOnSpawn = false

-- สร้าง Frame หลัก (เมนู)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 240)
frame.Position = UDim2.new(0, 50, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.05
frame.Active = true
frame.Draggable = true
frame.AnchorPoint = Vector2.new(0, 0)
frame.Parent = screenGui

-- เงา
local shadow = Instance.new("UICorner", frame)
shadow.CornerRadius = UDim.new(0, 12)

local uiStroke = Instance.new("UIStroke", frame)
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(60, 60, 60)
uiStroke.Transparency = 0.2

-- ชื่อหัวเมนู
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 PRO MENU"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Parent = frame

-- Layout ปุ่ม
local layout = Instance.new("UIListLayout", frame)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 10)
title.LayoutOrder = 0

-- ฟังก์ชันสร้างปุ่ม
local function createButton(text, command)
	local button = Instance.new("TextButton")
    	button.Size = UDim2.new(1, -30, 0, 35)
        	button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            	button.TextColor3 = Color3.fromRGB(255, 255, 255)
                	button.Font = Enum.Font.GothamSemibold
                    	button.TextSize = 16
                        	button.Text = text
                            	button.BorderSizePixel = 0
                                	button.AutoButtonColor = false

                                    	local corner = Instance.new("UICorner", button)
                                        	corner.CornerRadius = UDim.new(0, 8)

                                            	local stroke = Instance.new("UIStroke", button)
                                                	stroke.Color = Color3.fromRGB(80, 80, 80)
                                                    	stroke.Thickness = 1.2
                                                        	stroke.Transparency = 0.4

                                                            	button.MouseEnter:Connect(function()
                                                                		button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                                                                        	end)
                                                                            	button.MouseLeave:Connect(function()
                                                                                		button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                                                                                        	end)

                                                                                            	button.MouseButton1Click:Connect(function()
                                                                                                		remote:FireServer(command)
                                                                                                        	end)

                                                                                                            	button.Parent = frame
                                                                                                                end

                                                                                                                -- เพิ่มปุ่มต่าง ๆ
                                                                                                                createButton("🟩 Toggle ESP", "esp")
                                                                                                                createButton("🏃 Boost Speed", "speed")
                                                                                                                createButton("🎯 Activate Aimbot", "aimbot")
                                                                                                                createButton("🪂 Super Jump", "jump")