Config = {}

Config.Debug = true

Config.RequiredPolice = 0

----------------------------------------------------------------------------------
-- Alert Chance is the chance that blowing the breaker is alerted to the police --
----------------------------------------------------------------------------------
Config.AlertChance = 100 -- This is % based. Default: 25%

----------------------------------------------------
-- Available Dispatches: qb-dispatch, ps-dispatch --
----------------------------------------------------
Config.Dispatch = 'qb-dispatch' 

Config.SellLocation = {
    pos = vector4(241.01, 357.23, 105.59, 337.79),
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
