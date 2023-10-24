-----------------------------------
----------- FUNCTIONS -------------
-----------------------------------

function loadModel(model)
    ---Loads the model before spawning it to avoid errors---
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Citizen.Wait(50)
    end

    startPed = CreatePed(4, GetHashKey(ped), x, y, z-1, h, false, true)
    FreezeEntityPosition(startPed, true)
    SetEntityInvincible(startPed, true)
    SetBlockingOfNonTemporaryEvents(startPed, true)

    if Config.Debug then
        print("DEBUG: Ped has been loaded")
    end
end

function playAnim(animDict, anim, pid)
    ---Plays animations on the players ped for tasks---
    TriggerEvent('chat:addMessage', {
        args = {'In playAnim()'}
    })
    -- RequestAnimDict("anim")
    -- RequestAnimDict("anim@amb")
    -- RequestAnimDict("anim@amb@nightclub")
    -- RequestAnimDict("anim@amb@nightclub@poster@")
    while (not HasAnimDictLoaded(animDict)) do
        TriggerEvent('chat:addMessage', {
            args = {'In loop'}
        })
        Citizen.Wait(10)
    end
    TaskPlayAnim(pid, animDict, anim, 1.0, -1.0, 5000, 0, 1, true, true, true)
end

-- Removes create zones
function removeBoxZone(zone)
    exports['qb-target']:RemoveZone(zone)

    if Config.Debug then
        print("DEBUG: " .. zone .. " has been removed")
    end
end

-- Creates the breaker box zone
function createBreaker()
    ---Creates the starting breaker box for all players---
    local pos = Config['Heist']['BreakerBox']['pos']
    exports['qb-target']:AddBoxZone("ArtGalleryBreaker", pos, 1, 1, {
        name = "ArtGalleryBreaker",
        heading = 252,
        debugPoly = Config.Debug,
        minZ=81.59,
        maxZ=85.59,
    }, {
        options = {
            {
                type = "client",
                event = "heist:client:HackBox",
                icon = "fas fa-example",
                label = "Blow Fuse",
            },
        },
        distance = 2.5
    })
end