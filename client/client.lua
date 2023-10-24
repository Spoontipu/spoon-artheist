local QBCore = exports['qb-core']:GetCoreObject()

local breakerHit = false -- DO NOT TOUCH

Citizen.CreateThread(function()
    ---Spawns the sell peds for every player---
    local ped = Config.SellLocation.ped

    -- Load the sell ped
    loadModel(ped)

    -- Create the breaker box players need to break
    createBreaker()
    createPaintings()

    Wait(5000)
end)