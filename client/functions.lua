-----------------------------------
----------- FUNCTIONS -------------
-----------------------------------

function loadModel(model)
    local x, y, z, h = table.unpack(Config.SellLocation.pos)

    ---Loads the model before spawning it to avoid errors---
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Citizen.Wait(50)
    end

    local startPed = CreatePed(4, GetHashKey(ped), x, y, z-1, h, false, true)
    FreezeEntityPosition(startPed, true)
    SetEntityInvincible(startPed, true)
    SetBlockingOfNonTemporaryEvents(startPed, true)

    if Config.Debug then
        print("DEBUG: Ped has been loaded")
    end
end

function loadAnim(anim)
    ---Plays animations on the players ped for tasks---
    TriggerEvent('chat:addMessage', {
        args = {'In playAnim()'}
    })
    if HasAnimDictLoaded(anim) then return end
    RequestAnimDict(anim)
    repeat Wait(1) until HasAnimDictLoaded(anim)
end

-- Removes create zones
function removeBoxZone(zone)
    exports['qb-target']:RemoveZone(zone)

    if Config.Debug then
        print("DEBUG: " .. zone .. " has been removed.")
    end
end

-- Creates the breaker box zone
function createBreaker()
    ---Creates the starting breaker box for all players---
    local pos = Config.BreakerBox.pos
    local reqItem = Config.BreakerBox.item
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
                icon = "fa-solid fa-ring",
                label = "Blow Fuse",
                item = reqItem,
            },
        },
        distance = 2.5
    })

    if Config.Debug then
        print("DEBUG: ArtGalleryBreaker zone has been created.")
    end
end