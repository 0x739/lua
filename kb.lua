local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ChatEvent = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest

task.spawn(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not LocalPlayer:IsFriendsWith(player.UserId) then
            LocalPlayer:RequestFriendship(player)
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and not LocalPlayer:IsFriendsWith(player.UserId) then
                LocalPlayer:RequestFriendship(player)
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    player.FriendStatusChanged:Connect(function(friendStatus)
        if friendStatus == Enum.FriendStatus.RequestReceived then
            LocalPlayer:RequestFriendship(player)
        end
    end)
end)
