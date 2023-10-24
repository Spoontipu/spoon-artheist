-----------------------------------
------------ EVENTS ---------------
-----------------------------------

RegisterNetEvent('heist:client:HackBox')
AddEventHandler('heist:client:HackBox', function(source)
    TriggerEvent('chat:addMessage', {
        args = {'heist:client:HackBox'}
    })
    local pid = PlayerPedId()
    local animDict = 'anim@amb@nightclub@poster@'
    local anim = 'poster_placement'
    playAnim(animDict, anim, pid)

    -- Remove Breaker box zone
    removeBoxZone('ArtGalleryBreaker')
    
    TriggerServerEvent('heist:server:startCooldown')
end)
