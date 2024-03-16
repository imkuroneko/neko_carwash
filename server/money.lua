local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("neko_carwash:server:removeCash", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('cash', amount)
end)