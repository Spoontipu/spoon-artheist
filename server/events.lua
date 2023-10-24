local QBCore = exports['qb-core']:GetCoreObject()

lastHeist = 0 -- DO NOT TOUCH

RegisterServerEvent('heist:server:removeItem', function(item)
    -- Removes thermite from player inventory
    local src = source
    local player = QBCore.Functions.GetPlayer(source)

    if player then
      player.Functions.RemoveItem(item, 1)
    end
end)

RegisterServerEvent('heist:server:giveItem')
AddEventHandler('heist:server:giveItem', function(item)
  local src = source
  local player = QBCore.Functions.GetPlayer(src)

  if player then
    player.Functions.AddItem(item, 1)
  end
end)

RegisterServerEvent('heist:server:addMoney')
AddEventHandler('heist:server:addMoney', function()
  local src = source 
  local player = QBCore.Functions.GetPlayer(src) 

  if player then
    player.Functions.AddMoney('cash', 1000)
  end
end)

-- Syncs start of heist with all players
RegisterServerEvent('heist:server:syncHeistStart')
AddEventHandler('heist:server:syncHeistStart', function()
  TriggerClientEvent('heist:client:syncHeistStart', -1)
end)

-- Syncs a single painting with all players
RegisterServerEvent('heist:server:syncPainting')
AddEventHandler('heist:server:syncPainting', function(x)
  TriggerClientEvent('heist:client:syncPainting', -1, x)
end)

-- Syncs prop paintings with all players
RegisterServerEvent('heist:server:syncAllPaintings')
AddEventHandler("heist:server:syncAllPaintings", function()
  TriggerClientEvent('heist:client:syncAllPaintings', -1)
end)

RegisterServerEvent('heist:server:finishHeist')
AddEventHandler('heist:server:finishHeist', function()
  local src = source
  local player = QBCore.Functions.GetPlayer(src)

  if player then
    TriggerEvent("qb-log:server:CreateLog", "robbery", "Art Heist", "green", GetPlayerName(src) .. " completed the art heist!")
  end
end)