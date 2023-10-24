AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        print(GetCurrentResourceName() .. "========" .. resourceName)
      return
    end

    TriggerClientEvent("heist:server:startPed", -1)

  end)