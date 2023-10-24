AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        print(GetCurrentResourceName() .. "========" .. resourceName)
      return
    end
    print('~y~The resource ' .. resourceName .. ' has been started.')

    TriggerClientEvent("heist:server:startPed", -1)
  end)