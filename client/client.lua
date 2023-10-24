local QBCore = exports['qb-core']:GetCoreObject()

local breakerHit = false -- DO NOT TOUCH

Citizen.CreateThread(function()
    ---Spawns the sell peds for every player---
    local ped = Config['Heist']['SellLocation']['ped']
    local x, y, z, h = table.unpack(Config['Heist']['SellLocation']['pos'])

    -- Load the sell ped
    loadModel(ped)

    -- Create the breaker box players need to break
    createBreaker()
end)