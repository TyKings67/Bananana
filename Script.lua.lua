--[[
    highlightPlayers.lua
    ---------------------
    A simple Roblox Lua script that automatically highlights all players in the game.
    Works both for existing players and for new players who join later.

    Author: (your name or alias)
    License: MIT
    Repository: https://github.com/<your-username>/<your-repo>

    ✨ Features:
    • Highlights all player characters
    • Automatically updates when new players join or respawn
    • Customizable colors and depth mode
--]]

-- Function to highlight a player's character
local function highlightCharacter(character)
    if not character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "PlayerHighlight"
        highlight.FillColor = Color3.fromRGB(255, 255, 0) -- yellow fill
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- white outline
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = character
    end
end

-- Loop through existing players
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        highlightCharacter(player.Character)
    end
    player.CharacterAdded:Connect(highlightCharacter)
end

-- Handle new players joining
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(highlightCharacter)
end)