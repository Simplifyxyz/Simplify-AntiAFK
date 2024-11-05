Config = {}

-- General Settings
Config.AFKTimeout = 300             -- Time in seconds before marking as AFK
Config.WarnTime = 240               -- Time in seconds before kicking (should be less than AFKTimeout)
Config.ExemptRoles = { "admin", "moderator" } -- Roles exempted from AFK checks
Config.KickMessage = "System: You have been kicked for being AFK."

-- Warning Settings
Config.WarningCount = 2             -- Number of warnings before kick
Config.WarnMessage = "You will be kicked in {time} seconds for inactivity!"
Config.NotifyInterval = 20          -- Interval between warnings in seconds

-- Logging
Config.DiscordWebhook = "YOUR_DISCORD_WEBHOOK_URL"
Config.LogToDiscord = true
Config.LogMessage = "Player {player} was kicked for being AFK."

-- AFK Detection
Config.CheckForKeyPress = true      -- Kick based on keyboard inactivity
Config.CheckForMovement = true      -- Kick based on player movement
Config.CheckVehicleExit = true      -- Kick players who sit idle in a vehicle

-- Customizable messages
Config.FirstWarning = "System: Warning 1, Please move before you are kicked from the server."
Config.FinalWarning = "System: Final Warning, please move before you are kicked from the server."
