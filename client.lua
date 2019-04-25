function setBleedingOn(ped)
   SetEntityHealth(ped,GetEntityHealth(ped)-2)
   if not effect then
  StartScreenEffect('Rampage', 0, true)
  effect = true
  end
   ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
   InfoRanny("~r~Źle się czujesz jak najszybciej udaj się do medyka!")
   SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
   Wait(7000)

end

function setBleedingOff(ped)
   effect = false
   StopScreenEffect('Rampage')
   SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
end

local effect = false

Citizen.CreateThread(function()
while true do
Wait(0)
local player = GetPlayerPed(-1)
local Health = GetEntityHealth(player)

 if Health <= 139  then
    setBleedingOn(player)

 elseif Health > 140 then
   setBleedingOff(player)
 end
end
end)
 
function InfoRanny(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(false, false)
end
