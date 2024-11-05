local playerActivity = {}
local AFKTimer = {}

-- Initialize player data on connect
AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local playerId = source
    playerActivity[playerId] = os.time()
    AFKTimer[playerId] = Config.AFKTimeout
end)

-- Detect player actions
local function resetActivity(playerId)
    playerActivity[playerId] = os.time()
end

-- Reset on keypress
RegisterNetEvent("anti_afk:resetActivity")
AddEventHandler("anti_afk:resetActivity", function()
    local playerId = source
    resetActivity(playerId)
end)

-- Monitor AFK status
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Check every second

        for _, playerId in ipairs(GetPlayers()) do
            local playerName = GetPlayerName(playerId)
            local elapsed = os.time() - (playerActivity[playerId] or 0)

            -- Skip exempt roles
            if isExempt(playerId) then
                AFKTimer[playerId] = Config.AFKTimeout
                goto continue
            end

            -- Warn and kick if necessary
            if elapsed >= Config.WarnTime and AFKTimer[playerId] > 0 then
                sendWarning(playerId, AFKTimer[playerId])
                AFKTimer[playerId] = AFKTimer[playerId] - Config.NotifyInterval
            elseif elapsed >= Config.AFKTimeout then
                kickForAFK(playerId)
            end

            ::continue::
        end
    end
end)

-- Check for exemption
function isExempt(playerId)
    for _, role in ipairs(Config.ExemptRoles) do
        if IsPlayerAceAllowed(playerId, role) then
            return true
        end
    end
    return false
end

-- Warning notification
function sendWarning(playerId, timeLeft)
    if timeLeft > Config.WarnTime / Config.WarningCount then
        TriggerClientEvent("chat:addMessage", playerId, {
            color = {255, 0, 0},
            args = {Config.FirstWarning}
        })
    else
        TriggerClientEvent("chat:addMessage", playerId, {
            color = {255, 0, 0},
            args = {Config.FinalWarning:gsub("{time}", timeLeft)}
        })
    end
end

-- Kick the player
function kickForAFK(playerId)
    DropPlayer(playerId, Config.KickMessage)
    if Config.LogToDiscord then
        sendDiscordLog(Config.LogMessage:gsub("{player}", GetPlayerName(playerId)))
    end
end

-- Send log to Discord
function sendDiscordLog(message)
    PerformHttpRequest(Config.DiscordWebhook, function() end, "POST", json.encode({
        content = message
    }), { ["Content-Type"] = "application/json" })
end
