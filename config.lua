Config = {
    debug = true, -- will enable polyzone debug
    command_name = "delv", -- /delv <zone>
    ace_group = "qbcore.god", -- only players with this ace group can use the command
    countdown = 10, -- seconds
    zones = {
        -- Default zone
        -- [""] = {
        --     vertices = {},
        --     options = {}
        -- },
        ["pillbox"] = {
            vertices = {vector2(-675.41241455078, -1102.9605712891), vector2(-680.75128173828, -1091.0770263672),
                        vector2(-681.77728271484, -1084.6221923828), vector2(-686.20330810547, -1078.1710205078),
                        vector2(-697.94635009766, -1085.6312255859), vector2(-694.63452148438, -1091.7305908203),
                        vector2(-690.2822265625, -1093.2945556641), vector2(-685.107421875, -1102.4680175781),
                        vector2(-689.12036132812, -1104.6055908203), vector2(-693.51513671875, -1098.2175292969),
                        vector2(-707.21325683594, -1107.1917724609), vector2(-702.77496337891, -1114.3973388672),
                        vector2(-706.23803710938, -1117.251953125), vector2(-701.80871582031, -1120.3790283203),
                        vector2(-700.13073730469, -1119.8321533203), vector2(-696.89367675781, -1124.6745605469),
                        vector2(-680.623046875, -1114.2738037109), vector2(-683.46734619141, -1109.1394042969)},
            options = {
                name = "idk",
                minZ = 13.391509056091,
                maxZ = 14.918909072876
            }
        }
    },
    Events = { -- maybe dont touch these
        CLEARZONE = GetCurrentResourceName() .. ":client_clear"
    },
    Notify = function(zone, message)
        -- dont put anything here if you dont want all clients to recieve a notification
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            multiline = true,
            args = {zone, message}
        })

        -- exports["notify"]:message(zone, message)
    end
}

function zoneExist(zone)
    return Config.zones[zone] ~= nil
end
