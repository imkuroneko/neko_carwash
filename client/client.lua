local QBCore = exports['qb-core']:GetCoreObject()
lib.locale()
MainMenu = {}
CurrentlyWashing = false

CreateThread(function()
    -- ===== creación del menú
    MainMenu = {
        id      = 'neko_carwash_menu',
        title   = locale('menu_title'),
        options = {}
    }

    if Config.debug then
        table.insert(MainMenu.options, {
            title       = locale('debug_dirt_car'),
            icon        = 'fas fa-car',
            event       = 'neko_carwash:client:dirtyCar',
        })

        RegisterNetEvent('neko_carwash:client:dirtyCar', function()
            SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
            WashDecalsFromVehicle(GetVehiclePedIsIn(PlayerPedId(), false), 0.0)
        end)
    end

    for key, value in ipairs(Config.tiers) do
        table.insert(MainMenu.options, {
            title       = locale(value.label, value.price),
            description = locale(value.description),
            icon        = 'fas fa-car',
            event       = 'neko_carwash:client:wash_tier'..key,
            args        = { price = value.price, seconds = value.timeSeconds, clean = value.cleanLevel, washDecal = value.decal }
        })
    end

    lib.registerContext(MainMenu)

    -- ===== Creación de eventos
    for key, value in ipairs(Config.tiers) do
        RegisterNetEvent('neko_carwash:client:wash_tier'..key, function(data)
            if data.price > QBCore.Functions.GetPlayerData().money['cash'] then
                lib.notify({ description = locale('not_enough_money'), type = 'error' })
            else
                local progressParams = {
                    duration = (data.seconds * 1000),
                    label = locale('progress_loading'),
                    useWhileDead = false,
                    position = 'bottom',
                    canCancel = false,
                    disable = { car = true, move = true, combat = true },
                }

                CurrentlyWashing = true

                if lib.progressCircle(progressParams) then
                    CurrentlyWashing = false
                    SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), false), levelToClean)
                    if data.decal then WashDecalsFromVehicle(GetVehiclePedIsIn(PlayerPedId(), false), 1.0) end

                    TriggerServerEvent('neko_carwash:server:removeCash', data.price)
                    lib.notify({ description = locale('progress_success'), type = 'success' })
                else
                    lib.notify({ description = locale('progress_cancelled'), type = 'error' })
                end
            end
        end)
    end

    -- ===== creación de puntos
    for _, place in pairs(Config.places) do
        if Config.useStations then
            for _, station in pairs(place.stations) do
                local point = lib.points.new({ coords = station, distance = 10 })

                local oxMarker = lib.marker.new({
                    coords = station,
                    type   = Config.station.marker,
                    width  = Config.station.size,
                    height = Config.station.size,
                    color  = { r = Config.station.color.r, g = Config.station.color.g, b = Config.station.color.b, a = Config.station.color.a },
                })

                function point:nearby()
                    oxMarker:draw()

                    if (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId()) and not CurrentlyWashing then
                        if self.currentDistance < 2 then
                            lib.showTextUI(locale('press_to_wash'), { icon = 'fas fa-soap', position = 'left-center' })
                            if IsControlJustPressed(0, 38) then
                                lib.showContext(MainMenu.id)
                            end
                        end
                    end
                end

                function point:onExit()
                    if lib.isTextUIOpen() then
                        lib.hideTextUI()
                    end
                end
            end
        else
            lib.zones.poly({
                points = place.area,
                debug = place.debug,
                onEnter = function(s)
                    if (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId()) and not CurrentlyWashing then
                        lib.showTextUI(locale('press_to_wash'), { icon = 'fas fa-soap', position = 'left-center' })
                    end
                end,
                onExit = function()
                    lib.hideTextUI()
                end,
                inside = function()
                    if (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId()) then
                        if IsControlJustPressed(0, 38) then
                            lib.hideTextUI()
                            if not CurrentlyWashing then
                                lib.showContext(MainMenu.id)
                            end
                        end
                    else
                        lib.hideTextUI()
                    end
                end,
            })
        end
    end
end)
