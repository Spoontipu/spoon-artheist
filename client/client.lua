local QBCore = exports['qb-core']:GetCoreObject()

BreakerHit = false -- DO NOT TOUCH
HeistStarted = false

Citizen.CreateThread(function()
    ---Spawns the sell peds for every player---
    local ped = Config.SellLocation.ped

    -- Load the sell ped
    loadModel(ped)

    -- Create the breaker box players need to break
    createZones()

    --createBreaker()
    --createPaintings()

    Wait(5000)
end)