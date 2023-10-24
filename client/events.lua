-----------------------------------
------------ EVENTS ---------------
-----------------------------------

RegisterNetEvent('heist:client:HackBox')
AddEventHandler('heist:client:HackBox', function(source)
    TriggerEvent('chat:addMessage', {
        args = {'heist:client:HackBox'}
    })

    local animDict = 'anim@heists@ornate_bank@thermal_charge'
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local dist = #(coords - Config.BreakerBox.pos )
    loadAnim(animDict)

    --NetworkAddPedToSynchronisedScene

    -- Remove Breaker box zone
    removeBoxZone('ArtGalleryBreaker')
    
    -- TriggerServerEvent('heist:server:startCooldown')
end)
