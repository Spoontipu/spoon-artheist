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