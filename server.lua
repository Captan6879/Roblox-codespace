-- server.lua (Script วางใน ServerScriptService)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- RemoteEvent สำหรับรับคำสั่ง
local remote = ReplicatedStorage:FindFirstChild("ToggleFeature") or Instance.new("RemoteEvent")
remote.Name = "ToggleFeature"
remote.Parent = ReplicatedStorage

-- ระบบ
remote.OnServerEvent:Connect(function(player, command)
	local char = player.Character
    	if not char then return end

        	if command == "esp" then
            		local hrp = char:FindFirstChild("HumanoidRootPart")
                    		if hrp then
                            			local existing = hrp:FindFirstChild("BoxESP")
                                        			if existing then
                                                    				existing:Destroy()
                                                                    			else
                                                                                				local box = Instance.new("BoxHandleAdornment")
                                                                                                				box.Name = "BoxESP"
                                                                                                                				box.Adornee = hrp
                                                                                                                                				box.Size = Vector3.new(4, 6, 2)
                                                                                                                                                				box.Color3 = Color3.new(0, 1, 0)
                                                                                                                                                                				box.AlwaysOnTop = true
                                                                                                                                                                                				box.ZIndex = 10
                                                                                                                                                                                                				box.Parent = hrp
                                                                                                                                                                                                                			end
                                                                                                                                                                                                                            		end

                                                                                                                                                                                                                                    	elseif command == "speed" then
                                                                                                                                                                                                                                        		local hum = char:FindFirstChildOfClass("Humanoid")
                                                                                                                                                                                                                                                		if hum then
                                                                                                                                                                                                                                                        			hum.WalkSpeed = hum.WalkSpeed == 16 and 50 or 16
                                                                                                                                                                                                                                                                    		end

                                                                                                                                                                                                                                                                            	elseif command == "aimbot" then
                                                                                                                                                                                                                                                                                		print("📌 Aimbot Activated! (คุณสามารถเพิ่มระบบ Lock-on ที่ client ได้)")

                                                                                                                                                                                                                                                                                        	elseif command == "jump" then
                                                                                                                                                                                                                                                                                            		local hum = char:FindFirstChildOfClass("Humanoid")
                                                                                                                                                                                                                                                                                                    		if hum then
                                                                                                                                                                                                                                                                                                            			hum.JumpPower = hum.JumpPower == 50 and 120 or 50
                                                                                                                                                                                                                                                                                                                        		end
                                                                                                                                                                                                                                                                                                                                	end
                                                                                                                                                                                                                                                                                                                                    end)