local zones = Config.zone
local range =  0.0 
local closestZone = 1

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	if Config.ShowBlip == true then	
		for i = 1, #zones, 1 do
			local blip = AddBlipForRadius(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z,  range+Config.size)

		
				local szBlip = AddBlipForCoord(zones[i].x, zones[i].y, zones[i].z)
				SetBlipAsShortRange(szBlip, true)
				SetBlipColour(blip,59)
				SetBlipSprite(szBlip, Config.Blip)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(Config.Blipname)
				EndTextCommandSetBlipName(szBlip)


			SetBlipColour(blip,11)
			SetBlipAlpha(blip,180)
		end
	end
end)



Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(2000)
	end
end)

if Config.ZoneView == true then
	Citizen.CreateThread(function()
		while not NetworkIsPlayerActive(PlayerId()) do
			Citizen.Wait(0)
		end
		while true do
			Citizen.Wait(99999)
			local player = GetPlayerPed(-1)
			local x,y,z = table.unpack(GetEntityCoords(player, true))
			local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
			if Config.Marker then
				DrawMarker(1, zones[closestZone].x, zones[closestZone].y, zones[closestZone].z-1.0001, 0, 0, 0, 0, 0, 0,  (range+Config.size) * 2,(range+Config.size) * 2, 10.0,Config.r ,Config.g, Config.b, 100, 0, 0, 2, 0, 0, 0, 0)
			end 
			if dist <= range+Config.size then
				if Config.Text == true then
					SetTextScale(0.0, 0.4)
					SetTextDropShadow()
					SetTextOutline()
					SetTextColour(500, 100, 100, 500)
					SetTextEntry("STRING")
					AddTextComponentString(Config.Textname)
					DrawText(Config.Position, Config.Position2)
				end
			end	
		end
	end)
end




if Config.God then 
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10000)
			if dist <= range+Config.size then
				SetEntityHealth (GetPlayerPed(-1),200)
			end
		end
	end)
end	


-- if Config.Reward then 
-- 	Citizen.CreateThread(function()
-- 		while true do
-- 			Citizen.Wait(Config.RewardTime*1000)
-- 			if dist <= range+Config.size then
-- 				print('zc-reward')
-- 				TriggerServerEvent(Config.ServerEventName)
-- 			end
-- 		end
-- 	end)
-- end	




if Config.DisableFight == true then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if dist <= range+Config.size then
				DisableControlAction(2, 37, true)
				DisableControlAction(0, 106, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 69, true)
				DisableControlAction(0, 70, true)
				DisableControlAction(0, 92, true)
				DisableControlAction(0, 114, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 331, true)
				DisableControlAction(0, 68, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 263, true)
				DisableControlAction(0, 264, true)
				DisableControlAction(0, 141, true)
			end
		end
	end)
end	




-- if Config.DeleteVehicles == true then
-- 	Citizen.CreateThread(function()
-- 		while true do
-- 			Citizen.Wait(100)
-- 			if dist <= range+Config.size then
-- 				if ( not DoesEntityExist( veh ) ) then 
-- 					local ped = GetPlayerPed(-1)
-- 					if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
-- 						local pos = GetEntityCoords( ped )
-- 						if ( IsPedSittingInAnyVehicle( ped ) ) then 
-- 							local vehicle = GetVehiclePedIsIn( ped, false )
-- 							if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
-- 								DeleteGivenVehicle( vehicle, numRetries )
-- 							end 
-- 						end 
-- 					end 
-- 				end
-- 			end	
-- 		end
-- 	end)
-- end




-- function DeleteGivenVehicle( veh, timeoutMax )
--     local timeout = 0 

--     SetEntityAsMissionEntity( veh, true, true )
--     DeleteVehicle( veh )

--     if ( DoesEntityExist( veh ) ) then
--         while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
--             DeleteVehicle( veh )

--             timeout = timeout + 1 
--             Citizen.Wait( 500 )
--         end 
--     end 
-- end 



if Config.unarmed then
	Citizen.CreateThread(function()
		while true do
			playerPed = PlayerPedId()
			car = GetVehiclePedIsIn(playerPed, false)
			Wait(10000)
			if dist <= range+Config.size then		
				SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
			end

		end
	end)
end

