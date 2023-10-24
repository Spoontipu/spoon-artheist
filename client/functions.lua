local QBCore = exports['qb-core']:GetCoreObject()

-----------------------------------
----------- FUNCTIONS -------------
-----------------------------------

local breakerAlarm = false

function loadModel(ped)
    local x, y, z, h = table.unpack(Config.SellLocation.pos)

    ---Loads the model before spawning it to avoid errors---
    while not HasModelLoaded(GetHashKey(ped)) do
        RequestModel(GetHashKey(ped))
        Citizen.Wait(50)
    end

    local sellPed = CreatePed(4, GetHashKey(ped), x, y, z-1, h, false, true)
    FreezeEntityPosition(sellPed, true)
    SetEntityInvincible(sellPed, true)
    SetBlockingOfNonTemporaryEvents(sellPed, true)

    if Config.Debug then
        print("DEBUG: Ped has been loaded")
    end
end

---Plays animations on the players ped for tasks---
function loadAnim(anim)
    if HasAnimDictLoaded(anim) then return end
    RequestAnimDict(anim)
    repeat Wait(1) until HasAnimDictLoaded(anim)
end

-- Removes create zones
function removeBoxZone(zone)
    exports['qb-target']:RemoveZone(zone)

    if Config.Debug then
        print("DEBUG: " .. zone .. " has been removed.")
    end
end

-- Creates the breaker box zone
function createBreaker()
    local pos = Config.BreakerBox.pos
    local reqItem = Config.BreakerBox.item
    exports['qb-target']:AddBoxZone("ArtGalleryBreaker", pos, 1, 1, {
        name = "ArtGalleryBreaker",
        heading = 252,
        debugPoly = Config.Debug,
        minZ=81.59,
        maxZ=85.59,
    }, {
        options = {
            {
                type = "client",
                event = "heist:client:HackBox",
                icon = "fa-solid fa-ring",
                label = "Blow Fuse",
                item = reqItem,
            },
        },
        distance = 2.5
    })

    if Config.Debug then
        print("DEBUG: ArtGalleryBreaker zone has been created.")
    end
end

function createPaintings()
    if Config.Debug then print("DEBUG: Spawned painting props") end

    
end

-- Loads particle effects
function loadPtfx(name)
    if HasNamedPtfxAssetLoaded(name) then UseParticleFxAsset(name) return end
    RequestNamedPtfxAsset(name)

    repeat Wait(1) until HasNamedPtfxAssetLoaded(name)
    UseParticleFxAsset(name)
end

-- Plays thermite animation with particle effects
function playThermiteAnim(source)
    if Config.Debug then print("DEBUG: Playing thermal charge animation") end

    -- Checks if required cops are online
    QBCore.Functions.TriggerCallback('heist:server:checkCops', function(cops)
        if cops >= Config.RequiredPolice then
            QBCore.Functions.TriggerCallback('heist:server:checkHeistTime', function(rob)
                if rob then
                    local alertChance = math.random(1, 100)

                    local ped = PlayerPedId()
                    local coords = GetEntityCoords(ped)
                    local dist = #(coords - Config.BreakerBox.pos)
                    local thermiteCoords = Config.BreakerBox.thermiteLoc
                    local rot = GetEntityRotation(ped)
                    local bagEmote = NetworkCreateSynchronisedScene(thermiteCoords.x, thermiteCoords.y, thermiteCoords.z, rot.x, rot.y, rot.z, 2, false, false, 1065353216, 0, 1.3)
                    local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, thermiteCoords.x, thermiteCoords.y, thermiteCoords.z,  true,  true, false)
                    
                    -- Plays animation to place thermal charge
                    NetworkAddPedToSynchronisedScene(ped, bagEmote, 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 1.5, -4.0, 1, 16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(bag, bagEmote, 'anim@heists@ornate_bank@thermal_charge', 'bag_thermal_charge', 4.0, -8.0, 1)
                    NetworkStartSynchronisedScene(bagEmote)
                    Wait(1500)

                    coords = GetEntityCoords(ped)
                    local thermal_charge = CreateObject(`hei_prop_heist_thermite`, coords.x, coords.y, coords.z + 0.2,  true,  true, true)
                            
                    SetEntityCollision(thermal_charge, false, true)
                    AttachEntityToEntity(thermal_charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
                    Wait(4000)

                    DetachEntity(thermal_charge, true, true)
                    FreezeEntityPosition(thermal_charge, true)
                    Wait(100)
                    DeleteObject(bag)
                    ClearPedTasks(ped)

                    Wait(1000)

                    loadPtfx('scr_ornate_heist')

                    local thermCoords = GetEntityCoords(thermal_charge)
                    local effect = StartParticleFxLoopedAtCoord('scr_heist_ornate_thermal_burn', thermCoords.x, thermCoords.y + 1.0, thermCoords.z, 0, 0, 0, 0x3F800000, false, false, false, false)

                    -- Remove thermite from player inventory
                    TriggerServerEvent('heist:server:removeItem', 'thermite')
                    Wait(3000)
                    StopParticleFxLooped(effect, false)
                    DeleteObject(thermal_charge)

                    -- Sends out a 911 dispatch to officers
                    if not breakerAlarm and alertChance <= Config.AlertChance then
                        if Config.Dispatch == 'qb-dispatch' then
                            TriggerServerEvent('police:server:policeAlert', 'Explosion Reported')
                        elseif Config.Displach == 'ps-dispatch' then
                            exports['ps-dispatch']:Explosion()
                        end
                        breakerAlarm = true
                    end
                end
            end)
        else
            QBCore.Functions.Notify('Not enough cops!', 'error', 5000)
        end
        TriggerServerEvent('heist:server:finishHeist')
    end)
end