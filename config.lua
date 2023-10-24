Config = {}

Config.Debug = true

Config.RequiredPolice = 1

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

Config.Rewards = {
    rareChange = true,
    rareReward = 5000,
    maxCash = 1000,
    minCash = 100,
}
