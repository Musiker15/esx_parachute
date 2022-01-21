ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Parachute
RegisterNetEvent('esx_parachute:getparachute')
AddEventHandler('esx_parachute:getparachute', function()
	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then  
		  SetPedComponentVariation (playerPed, 5, 63, 0)
		else  
		  SetPedComponentVariation (playerPed, 5, 63, 0)
		end  
	end)
end)

RegisterNetEvent('esx_parachute:delparachute')
AddEventHandler('esx_parachute:delparachute', function()
	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then  
		  SetPedComponentVariation (playerPed, 5, 0, 0)
		else  
		  SetPedComponentVariation (playerPed, 5, 0, 0)
		end  
	end)
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
       	local playerPed = PlayerPedId()

    	if IsPedInAnyHeli(playerPed) or IsPedInAnyPlane(playerPed) then
			TriggerServerEvent('esx_parachute:setparachute')
        end
    end
end)