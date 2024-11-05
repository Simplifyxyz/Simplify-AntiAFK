# Simplify's Anti-AFK Script

This Advanced Anti-AFK script is designed to help prevent players from staying idle for too long on your FiveM server. With customizable settings, admins can configure the AFK duration, warning messages, and actions to take when a player goes AFK.

## Features
- Customizable AFK time limit and warning messages
- Configurable actions when a player goes AFK (kick, warning message, or no action)
- Flexible configuration options to tailor the script to server needs

## Configuration

Open the `config.lua` file inside the folder. The following settings are available:

### Configurable Options

| Option               | Description                                                                                  | Default Value  |
|----------------------|----------------------------------------------------------------------------------------------|----------------|
| `AFK_TimeLimit`      | The time in seconds before a player is marked as AFK.                                        | `300` (5 min)  |
| `WarningMessageTime` | Time in seconds before kicking that the warning message is sent to the player.               | `60` (1 min)   |
| `KickOnAFK`          | Set to `true` to kick the player after the AFK time limit, or `false` to simply notify them. | `true`         |
| `WarningMessage`     | Customizable message to notify players they are about to be kicked for AFK.                  | `"You will be kicked for AFK in 60 seconds!"` |

### Example Configuration

```lua
Config = {
    AFK_TimeLimit = 600,                -- 10 minutes until a player is marked as AFK
    WarningMessageTime = 120,           -- 2-minute warning before kick
    KickOnAFK = true,                   -- Enable kicking on AFK
    WarningMessage = "You will be kicked for being AFK in 2 minutes!",  -- Custom message
}
```

## Commands
- **/afkcheck**: Allows admins to check a player’s AFK status.
- **/afkreset [playerID]**: Resets a player’s AFK timer, useful if a player was mistakenly flagged.

## Notes
- Ensure that the resource folder is named exactly `advanced_anti_afk` to prevent any issues with starting the script.
- Customize the messages and time limits in `config.lua` to best fit your community's needs.

## License
This script is for use on whitelisted and community-focused FiveM servers. Please do not redistribute or modify the script without permission.

---

This README should help your players and admins understand the setup and use of the Anti-AFK script on your server. Let me know if there’s anything specific you’d like added!
