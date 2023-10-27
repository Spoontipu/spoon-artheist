-----------------------------------
------------ EVENTS ---------------
-----------------------------------

RegisterNetEvent('heist:client:HackBox')
AddEventHandler('heist:client:HackBox', function(source)
    local animDict = 'anim@heists@ornate_bank@thermal_charge'

    loadAnim(animDict)

    playThermiteAnim(source)
end)

RegisterNetEvent('heist:client:HackComputer')
AddEventHandler('heist:client:HackComputer', function(source)
    local animDict = 'anim@amb@business@cfid@cfid_desk_id@'
    local ped = PlayerPedId()
    loadAnim(animDict)

    TaskPlayAnim(ped, animDict, 'light_investigation_driverslicense', 2, 2, 2, 1, 2, true, true, true)

end)

RegisterNetEvent('heist:client:syncHeistStart', function()
    HeistStarted = not HeistStarted
end)