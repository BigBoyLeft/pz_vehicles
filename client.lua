local polyzones = {}

Citizen.CreateThread(function()
    for zone, config in pairs(Config.zones) do
        config.options.debugPoly = Config.debug

        local polyzone = PolyZone:Create(config.vertices, config.options)

        polyzones[zone] = polyzone
    end
end)

RegisterNetEvent("onResourceStop", function(name)
    if (name ~= GetCurrentResourceName()) then
        return
    end

    for _, v in pairs(polyzones) do
        v:destroy()
    end
end)

RegisterNetEvent(Config.Events.CLEARZONE, function(zone)
    countdown(Config.countdown, zone, function()
        local vehicles = getVehiclesInZone(zone)
        Config.Notify(zone, "Clearing " .. #vehicles .. " vehicles")
        for _, veh in pairs(vehicles) do
            SetVehicleHasBeenOwnedByPlayer(veh, false)
            SetEntityAsMissionEntity(veh, false, false)
            DeleteVehicle(veh)
        end
    end)
end)

function getVehiclesInZone(_zone)
    local zone = polyzones[_zone]

    if (zone == nil) then
        return {}
    end

    local vehicles = {}

    for veh in EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) do
        local coords = GetEntityCoords(veh)
        if (zone:isPointInside(coords) and not IsPedAPlayer(GetPedInVehicleSeat(veh, -1))) then
            table.insert(vehicles, veh)
        end
    end

    return vehicles
end

function countdown(seconds, zone, func)
    Config.Notify(zone, "Clearing vehicles in " .. seconds .. " seconds")
    for i = seconds, 1, -1 do
        if (i <= 5) then
            Config.Notify(zone, "Clearing vehicles in " .. i)
        end
        Wait(1000)
    end

    func()
end
