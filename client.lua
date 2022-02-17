local QBCore = exports['qb-core']:GetCoreObject()
local ESXMenu = exports['esx_menu_default']:GetMenu()
local function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local Keys = {
	["1"] = 185, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["E"] = 38, ["X"] = 73
}

local fishing = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0
local veh = nil
local bait = "none"
local SellWait = false

for _, v in ipairs(Config.Sell) do
	local blip = AddBlipForCoord(v.pos)
	SetBlipSprite (blip, v.blip)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.8)
	SetBlipColour (blip, v.colour)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(v.sellText)
	EndTextCommandSetBlipName(blip)
end
			
	
Citizen.CreateThread(function()
    while true do

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		Sell = false

		-- Sell markers
			local nearSell = #(pedCoords - vector3(Config.Sell["legal"].pos.x, Config.Sell["legal"].pos.y, Config.Sell["legal"].pos.z))
				if nearSell <= 15 then
					Sell = true
					if nearSell <= 3 then
						if not sellSell then
						DrawText3Ds(-639.51, -1223.95, 11.48, 'Legalen Fisch verkaufen')
					
							if IsControlJustReleased(0,38) then
							
								TriggerServerEvent('fishing:startSelling')
							end
						end
					end
				end
		if not Sell then
			Citizen.Wait(5000)
        end
            
        Citizen.Wait(5)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if SellWait then
			Citizen.Wait(4000)
			SellWait = false
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while true do
		Wait(1200)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if fishing then
				if IsControlJustReleased(0, Keys[tostring(1)]) then
					input = 1
			   	end
			-- Stops the player from cancelling the task by getting out a weapon
			if IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING") then
				BlockWeaponWheelThisFrame()
			end
			
			if IsControlJustReleased(0, Keys['X']) then
				fishing = false
				QBCore.Functions.Notify("~r~Stopped fishing", 'error', 3500)
				TriggerEvent("fishing:break")
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z-3.0)  then
					-- Nothing
				else
					fishing = false
					QBCore.Functions.Notify("~r~Stopped fishing", 'error', 3500)
				end
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					QBCore.Functions.Notify("~r~Stopped fishing", 'error', 3500)
				end
			end
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					TriggerServerEvent('fishing:catch', bait)
				else
					QBCore.Functions.Notify("~r~Fish got free", 'error', 3500)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = math.random(Config.FishTime.a , Config.FishTime.b)
		Citizen.Wait(wait)
		if fishing then
			pause = true
			correct = 1
			QBCore.Functions.Notify("Fish is taking the bait\nPress ~y~F~s~ to catch it", 'primary', 5000)
			input = 0
			pausetimer = 0
		end	
	end
end)

RegisterNetEvent('fishing:message')
AddEventHandler('fishing:message', function(message)
	QBCore.Functions.Notify(message, 'primary', 3500)
end)

RegisterNetEvent('fishing:break')
AddEventHandler('fishing:break', function()
	fishing = false
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('sharktiger:spawnPed')
AddEventHandler('sharktiger:spawnPed', function()
	RequestTheModel("A_C_SharkTiger")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_SharkTiger`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_SharkTiger`)
	Wait(10000)
        DeletePed(ped)	
end)

RegisterNetEvent('killerwhale:spawnPed')
AddEventHandler('killerwhale:spawnPed', function()
	RequestTheModel("A_C_KillerWhale")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_KillerWhale`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_KillerWhale`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('stingray:spawnPed')
AddEventHandler('stingray:spawnPed', function()
	RequestTheModel("A_C_stingray")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_stingray`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_stingray`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('sharkhammer:spawnPed')
AddEventHandler('sharkhammer:spawnPed', function()
	RequestTheModel("A_C_sharkhammer")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_sharkhammer`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_sharkhammer`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('dolphin:spawnPed')
AddEventHandler('dolphin:spawnPed', function()
	RequestTheModel("A_C_dolphin")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `A_C_dolphin`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`A_C_dolphin`)
	Wait(10000)
        DeletePed(ped)
end)

RegisterNetEvent('fish:spawnPed')
AddEventHandler('fish:spawnPed', function()
	RequestTheModel("a_c_fish")
	local pos = GetEntityCoords(PlayerPedId())
	local ped = CreatePed(29, `a_c_fish`, pos.x, pos.y, pos.z, 90.0, true, false)
	SetEntityHealth(ped, 0)
	DecorSetInt(ped, "propHack", 74)
	SetModelAsNoLongerNeeded(`a_c_fish`)
	Wait(10000)
    DeletePed(ped)
end)

RegisterNetEvent('fishing:setbait')
AddEventHandler('fishing:setbait', function(bool)
	bait = bool
end)

RegisterNetEvent('fishing:fishstart')
AddEventHandler('fishing:fishstart', function()
	playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())
	if IsPedInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("~r~You can not fish from a vehicle", 'error', 3500)
	else
		if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z-3.0)  then
			QBCore.Functions.Notify("Fishing started\nPress ~y~X~s~ to stop fishing", 'success', 5000)
			TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
			fishing = true
			print("fishing has started")
		else
			QBCore.Functions.Notify("You need to go further away from the shore", 'error', 3500)
		end
	end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(Config.MarkerZones) do
        	local ped = PlayerPedId()
			local pedc = GetEntityCoords(ped, false)
            local distance = #(pedc - v.Marker)
            if distance <= 1.40 then
				DisplayHelpText('Press ~INPUT_CONTEXT~ to rent a boat')
				
				if IsControlJustPressed(0, Keys['E']) and IsPedOnFoot(ped) then
					OpenBoatsMenu(v.Spawn, v.SpawnHeading)
				end 
			elseif distance < 1.45 then
				ESX.UI.Menu.CloseAll()
            end
        end
    end
end)

function RequestTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

RegisterCommand("fish", function(source)
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
    fishing = true
end)
