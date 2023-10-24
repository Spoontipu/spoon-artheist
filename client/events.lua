-----------------------------------
------------ EVENTS ---------------
-----------------------------------

RegisterNetEvent('heist:client:HackBox')
AddEventHandler('heist:client:HackBox', function(source)
    local animDict = 'anim@heists@ornate_bank@thermal_charge'

    loadAnim(animDict)

    playThermiteAnim(source)

    -- Remove Breaker box zone
    removeBoxZone('ArtGalleryBreaker')
    
    -- TriggerServerEvent('heist:server:startCooldown')
    print("DEBUG: Creating breaker again")
    createBreaker()
end)
