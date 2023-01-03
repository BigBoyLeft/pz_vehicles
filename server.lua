RegisterCommand(Config.command_name, function(_, args)
    local zone = args[1]
    if (zone == nil or not zoneExist(zone)) then
        return print("Failed to clear vehicles from zone: " .. zone .. " (zone not found)")
    end

    TriggerClientEvent(Config.Events.CLEARZONE, -1, zone)
end, Config.ace_group)

