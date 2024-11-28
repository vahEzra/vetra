--[[
  KeyGuardLibrary.validateDefaultKey(key) - Validate key
  KeyGuardLibrary.validatePremiumKey(key) - Validate premium key
  KeyGuardLibrary.getService() - Get service
  KeyGuardLibrary.getLink() - Get link
]]

game.Players.LocalPlayer:Kick("we are currently fixing this! | vetra)

local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "467006a9964c441b8b8301b5d41657b4"
local falseData = "a71db7d41c8d42f88ab1fb2dcdd9f832"

KeyGuardLibrary.Set({
	publicToken = "bfb5bd54f9f54127871af5673a4fbe9c",
	privateToken = "9db03324af0b40a2880ab1f6a17416dc",
	trueData = trueData,
	falseData = falseData,
})

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local key = "test"

local Window = Fluent:CreateWindow({
	Title = "Key System",
	SubTitle = "vetra",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 340),
	Acrylic = false,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
	KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

local Entkey = Tabs.KeySys:AddInput("Input", {
	Title = "Enter Key",
	Description = "Enter Key Here",
	Default = "",
	Placeholder = "Enter key…",
	Numeric = false,
	Finished = false,
	Callback = function(Value)
		key = Value
	end
})

local Checkkey = Tabs.KeySys:AddButton({
	Title = "Check Key",
	Description = "Enter Key before pressing this button",
	Callback = function()
		local response = KeyGuardLibrary.validateDefaultKey(key)
		if response == trueData then
			loadstring(game:HttpGet('https://raw.githubusercontent.com/vahEzra/rayfield/refs/heads/main/main/source2.lua'))()
		else
			warn("Invalid Key!")
		end
	end
})

local Getkey = Tabs.KeySys:AddButton({
	Title = "Get Key",
	Description = "Get Key here",
	Callback = function()
		setclipboard(KeyGuardLibrary.getLink())
		print("Key link copied to clipboard.")
	end
})

Window:SelectTab(1)
