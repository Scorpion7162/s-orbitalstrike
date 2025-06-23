lib.addCommand('kaboom', {
    help = 'Trigger orbital strike on a player or all players',
    params = {{
        name = 'target',
        help = 'Server ID of the target player or "all"',
        type = 'string'
    }},
    restricted = 'group.admin'
}, function(source, args, raw)
    local target = args.target
    if not target then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Usage', 
            description = 'Usage: ' .. Config.BlowUpCommand .. ' <target>/all', 
            type = 'error'
        })
        return
    end

    -- Handle "all"
    if target == 'all' then
        TriggerClientEvent('s-orbitalstrike:client', -1)
        return
    end

    -- Try to convert to number
    local targetId = tonumber(target)
    if targetId and GetPlayerName(targetId) then
        TriggerClientEvent('s-orbitalstrike:client', targetId)
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Error',
            description = 'Invalid player ID',
            type = 'error'
        })
    end
end)