local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('heist:server:checkCops', function(source, cb)
    if Config.Debug then print("DEBUG: In checkCops callback") end
    local src = source
    local amount = 0

    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

QBCore.Functions.CreateCallback('heist:server:checkHeistTime', function(source, cb)
    local src = source 
    local player = QBCore.Functions.GetPlayer(src) 

    if (os.time() - lastHeist) < (Config.Cooldown * 60) and lastHeist ~= 0 then
        TriggerClientEvent('QBCore:Notify', src, "The paintings are still missing! What are you doing?!", 'error', 3000)
        cb(false)
    else
        lastHeist = os.time()
        cb(true)
    end
end)