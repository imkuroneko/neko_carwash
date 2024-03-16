local blips = {}

CreateThread(function()
    if Config.blip.show then
        for _, place in pairs(Config.places) do
            local num = (#blips + 1)
            blips[num] = AddBlipForCoord(place.blip)
            SetBlipSprite(blips[num], Config.blip.sprite)
            SetBlipDisplay(blips[num], Config.blip.display)
            SetBlipScale(blips[num], Config.blip.scale)
            SetBlipAsShortRange(blips[num], true)
            SetBlipColour(blips[num], Config.blip.colour)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.blip.name)
            EndTextCommandSetBlipName(blips[num])
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for i = 1, #blips do
            if DoesBlipExist(blips[i]) then
                RemoveBlip(blips[i])
            end
        end
    end
end)