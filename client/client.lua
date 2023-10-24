local QBCore = exports['qb-core']:GetCoreObject()
local breakerHit = false

Citizen.CreateThread(function()
    ---Spawns the sell peds for every player---
    local ped = Config['Heist']['SellLocation']['ped']
    local x, y, z, h = table.unpack(Config['Heist']['SellLocation']['pos'])

    -- Load the sell ped
    loadModel(ped)
    startPed = CreatePed(4, GetHashKey(ped), x, y, z-1, h, false, true)
    FreezeEntityPosition(startPed, true)
    SetEntityInvincible(startPed, true)
    SetBlockingOfNonTemporaryEvents(startPed, true)

    -- Create the breaker box players need to break
    createBreaker()
end)

RegisterNetEvent('heist:client:HackBox')
AddEventHandler('heist:client:HackBox', function(source)
    TriggerEvent('chat:addMessage', {
        args = {'heist:client:HackBox'}
    })
    local pid = PlayerPedId()
    local animDict = 'anim@amb@nightclub@poster@'
    local anim = 'poster_placement'
    playAnim(animDict, anim, pid)
    
    
end)

-----------------------------------
----------- FUNCTIONS -------------
-----------------------------------

function loadModel(model)
    ---Loads the model before spawning it to avoid errors---
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Citizen.Wait(50)
    end
end

function createBreaker()
    ---Creates the starting breaker box for all players---
    local pos = Config['Heist']['BreakerBox']['pos']
    exports['qb-target']:AddBoxZone("ArtGalleryBreaker", pos, 1, 1, {
        name = "ArtGalleryBreaker",
        heading = 252,
        debugPoly = Config['Heist']['BreakerBox']['debug'],
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