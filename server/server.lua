local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        print(GetCurrentResourceName() .. "========" .. resourceName)
      return
    end

    TriggerClientEvent("heist:server:startPed", -1)
  end)

  -- RegisterNetEvent('heist:server:startCooldown')
  -- AddEventHandler('heist:server:startCooldown', function()
    
  -- end)

RegisterServerEvent('heist:server:removeItem', function(item)
  -- Removes thermite from player inventory
  local src = source
  local player = QBCore.Functions.GetPlayer(source)
  player.Functions.RemoveItem(item, 1)
end)
