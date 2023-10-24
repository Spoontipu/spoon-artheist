local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('heist:server:removeItem', function(item)
    -- Removes thermite from player inventory
    local src = source
    local player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(item, 1)
  end)
  