AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print(GetCurrentResourceName() .. " has started.")

    TriggerClientEvent("heist:server:startPed", -1)

  end)