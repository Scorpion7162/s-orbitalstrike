local function orbitalstrike(coords)
    for i = 1, Config.Iterations do
        AddExplosion(coords.x, coords.y, coords.z + 1.0, 29, 10.0, true, false, 10.0)
        Wait(Config.WaitTime)
    end
 
    UseParticleFxAssetNextCall('scr_xm_orbital')
    StartParticleFxNonLoopedAtCoord('scr_xm_orbital_blast', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 3.0, false, false, false)
    AddExplosion(coords.x, coords.y, coords.z, 59, 50.0, true, false, 10.0)
    StartScriptFire(coords.x, coords.y, coords.z, 25, true)
    ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.0)
 end
 
 RegisterNetEvent('s-orbitalstrike:client', function()
    orbitalstrike(GetEntityCoords(PlayerPedId()))
 end)
