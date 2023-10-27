Config = {}

Config.Debug = true

Config.RequiredPolice = 1

Config.Cooldown = 1 -- Cooldown in minutes

----------------------------------------------------------------------------------
-- Alert Chance is the chance that blowing the breaker is alerted to the police --
----------------------------------------------------------------------------------
Config.AlertChance = 100 -- This is % based. Default: 25%

----------------------------------------------------
-- Available Dispatches: qb-dispatch, ps-dispatch --
----------------------------------------------------
Config.Dispatch = 'qb-dispatch' 

Config.SellLocation = {
    pos = vector4(244.62, 374.69, 105.74, 162.77),
    ped = 's_m_m_highsec_02',
}

Config.BreakerBox = {
    pos = vector3(30.65, 128.09, 84.99),
    heading = 252,
    minZ = 81.59,
    maxZ = 85.59,
    item = 'thermite',
    thermiteLoc = vector3(30.50, 127.61, 85.18),
}

Config.Computer = {
    pos = vector3(14.72, 145.4, 93.79),
    heading = 309,
    minZ = 90.39,
    maxZ = 94.39,
    item = 'trojan_usb',
}

Config.Rewards = {
    rareChange = true,
    rareReward = 5000,
    maxCash = 1000,
    minCash = 100,
}

Config.Paintings = {
    'ch_prop_vault_painting_01e',
    'ch_prop_vault_painting_01f',
    'ch_prop_vault_painting_01g',
    'ch_prop_vault_painting_01h',
    'ch_prop_vault_painting_01i',
    'ch_prop_vault_painting_01j',
}

----------------------------------------------------------
-- PAINTING LOCATIONS AND ANIMATION LOCATIONS CORRELATE --
-- COORD 1 FOR PAINTINGS MATCHES COORD 1 FOR ANIMATIONS --
----------------------------------------------------------
Config.PaintingLocations = {
    vector3(23.92, 157.9, 93.79),

}

Config.AnimationLocations = {
    vector3(23.87, 157.72, 93.8),
}

-- Config.Paintings = {
--     {
--         animationPos = vector3(23.87, 157.72, 93.8),
--         sceneRot = vector3(0.0, 0.0, 90.0),
--         painting = 'ch_prop_vault_painting_01e',
--         paintingPos = vector3(23.92, 157.9, 93.79),
--         paintingHeading = 180.0
--     }
-- }
