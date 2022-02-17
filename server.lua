local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem('fish', function(source)

	xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName('fishingrod').amount > 0 then
		TriggerClientEvent('fishing:setbait', source, "stingray")
		
		xPlayer.Functions.RemoveItem('fish', 1)
		TriggerClientEvent('fishing:message', source, "~g~You attach the fish onto your fishing rod")
	else
		TriggerClientEvent('fishing:message', source, "~r~You dont have a fishing rod")
	end
	
end)

QBCore.Functions.CreateUseableItem('fishbait', function(source)

	xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName('fishingrod').amount > 0 then
		TriggerClientEvent('fishing:setbait', source, "fish")
		
		xPlayer.Functions.RemoveItem('fishbait', 1)
		TriggerClientEvent('fishing:message', source, "~g~You attach the fish meat onto your fishing rod")
		
	else
		TriggerClientEvent('fishing:message', source, "~r~You dont have a fishing rod")
	end
	
end)

QBCore.Functions.CreateUseableItem('stingray', function(source)

	xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName('fishingrod').amount > 0 then
		TriggerClientEvent('fishing:setbait', source, "dolphin")
		
		xPlayer.Functions.RemoveItem('stingray', 1)
		TriggerClientEvent('fishing:message', source, "~g~You attach the stingray meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', source, "~r~You dont have a fishing rod")
	end
	
end)

QBCore.Functions.CreateUseableItem('dolphin', function(source)

	xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName('fishingrod').amount > 0 then
		TriggerClientEvent('fishing:setbait', source, "sharktiger")
		
		xPlayer.Functions.RemoveItem('dolphin', 1)
		TriggerClientEvent('fishing:message', source, "~g~You attach the dolphin meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', source, "~r~You dont have a fishing rod")
	end
	
end)

QBCore.Functions.CreateUseableItem('sharktiger', function(source)

	xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName('fishingrod').amount > 0 then
		TriggerClientEvent('fishing:setbait', source, "sharkhammer")
		
		xPlayer.Functions.RemoveItem('sharktiger', 1)
		TriggerClientEvent('fishing:message', source, "~g~You attach the tiger shark meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', source, "~r~You dont have a fishing rod")
	end
	
end)

QBCore.Functions.CreateUseableItem('sharkhammer', function(source)

	xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName('fishingrod').amount > 0 then
		TriggerClientEvent('fishing:setbait', source, "killerwhale")
		
		xPlayer.Functions.RemoveItem('sharkhammer', 1)
		TriggerClientEvent('fishing:message', source, "~g~You attach the hammerhead shark meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', source, "~r~You dont have a fishing rod")
	end
	
end)


QBCore.Functions.CreateUseableItem('fishingrod', function(source)

	TriggerClientEvent('fishing:fishstart', source)
	
	

end)

--[[Working Harpoon to use for Whales
QBCore.Functions.CreateUseableItem('harpoon', function(source)

	TriggerClientEvent('fishing:fishstart', source)
	
	

end)]]


-- Start catching shit			
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait)
	local weight = 2
	local rnd = math.random(1,100)
	local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))
	local worm = xPlayer.Functions.GetItemByName('worm')
	local fish = xPlayer.Functions.GetItemByName('fish')
	local stingray = xPlayer.Functions.GetItemByName('stingray')
	local delphin = xPlayer.Functions.GetItemByName('delphin')
	local sharktiger = xPlayer.Functions.GetItemByName('sharktiger')
	local sharkhammer = xPlayer.Functions.GetItemByName('sharkhammer')
	local killerwhale = xPlayer.Functions.GetItemByName('killerwhale')
	
	if bait == "none" then
		TriggerClientEvent('fishing:message', _source, "You are currently fishing without any equipped bait")
		if rnd >= 90 then
		if  fish.amount > 100 then
				TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
			else
				weight = math.random(2,4)
				TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
				xPlayer.addInventoryItem('fish', weight)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish'], "add")
				TriggerClientEvent('fish:spawnPed', _source)
			end
		else
				TriggerClientEvent('fishing:message', _source, "There was no fish")
		end
	end
	
	if bait == "worm" then
		if rnd >= 75 then
			TriggerClientEvent('fishing:setbait', _source, "none")
			if fish.amount > 100 then
				TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
			else
				weight = math.random(1,6)
				TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
				xPlayer.addInventoryItem('fish', weight)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish'], "add")
				TriggerClientEvent('fish:spawnPed', _source)
			end

		else
			TriggerClientEvent('fishing:setbait', _source, "none")
			TriggerClientEvent('fishing:message', _source, "There was no fish")
		end
	end
	if bait == "fish" then
		if rnd >= 75 then
			TriggerClientEvent('fishing:setbait', _source, "none")
			if stingray.count > 10 then
				TriggerClientEvent('fishing:message', _source, "~r~You cant hold more stingray")
			else
				weight = math.random(1,2)
				TriggerClientEvent('fishing:message', _source, "You caught a stingray")
				xPlayer.addInventoryItem('stingray', weight)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "add")
				TriggerClientEvent('stingray:spawnPed', _source)
			end

		else
			TriggerClientEvent('fishing:setbait', _source, "none")
			TriggerClientEvent('fishing:message', _source, "There was no stingray")
		end
	end
	if bait == "stingray" then
		if rnd >= 78 then
			if rnd >= 90
				TriggerClientEvent('fishing:setbait', _source, "none")
				if delphin.count > 1 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more delphins")
				else
					weight = 1
					TriggerClientEvent('fishing:message', _source, "You caught a dolphin"
					xPlayer.addInventoryItem('dolphin', weight)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "add")
					TriggerClientEvent('stingray:spawnPed', _source)
				end
			
		else
			TriggerClientEvent('fishing:setbait', _source, "none")
			TriggerClientEvent('fishing:message', _source, "There was no stingray")
		end
	end
	if bait == "dolphin" then
		if rnd >= 75 then
			TriggerClientEvent('fishing:setbait', _source, "none")
			if stingray.count > 10 then
				TriggerClientEvent('fishing:message', _source, "~r~You cant hold more stingray")
			else
				weight = math.random(1,2)
				TriggerClientEvent('fishing:message', _source, "You caught a stingray")
				xPlayer.addInventoryItem('stingray', weight)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "add")
				TriggerClientEvent('stingray:spawnPed', _source)
			end

		else
			TriggerClientEvent('fishing:setbait', _source, "none")
			TriggerClientEvent('fishing:message', _source, "There was no stingray")
		end
	end
	if bait == "sharktiger" then
		if rnd >= 75 then
			TriggerClientEvent('fishing:setbait', _source, "none")
			if stingray.count > 10 then
				TriggerClientEvent('fishing:message', _source, "~r~You cant hold more stingray")
			else
				weight = math.random(1,2)
				TriggerClientEvent('fishing:message', _source, "You caught a stingray")
				xPlayer.addInventoryItem('stingray', weight)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "add")
				TriggerClientEvent('stingray:spawnPed', _source)
			end

		else
			TriggerClientEvent('fishing:setbait', _source, "none")
			TriggerClientEvent('fishing:message', _source, "There was no stingray")
		end
	end
	if bait == "sharkhammer" then
		if rnd >= 75 then
			TriggerClientEvent('fishing:setbait', _source, "none")
			if stingray.count > 10 then
				TriggerClientEvent('fishing:message', _source, "~r~You cant hold more stingray")
			else
				weight = math.random(1,2)
				TriggerClientEvent('fishing:message', _source, "You caught a stingray")
				xPlayer.addInventoryItem('stingray', weight)
				TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "add")
				TriggerClientEvent('stingray:spawnPed', _source)
			end

		else
			TriggerClientEvent('fishing:setbait', _source, "none")
			TriggerClientEvent('fishing:message', _source, "There was no stingray")
		end
	end
end)
RegisterServerEvent("fishing:lowmoney")
AddEventHandler("fishing:lowmoney", function(model)
	local myModel = model
	local xPlayer = QBCore.Functions.GetPlayer(source)
	for k, v in ipairs(Server_Config.RentalBoats) do
		if GetHashKey(v.model) == myModel then
			xPlayer.Functions.RemoveMoney('cash' ,v.price)
		end
	end
end)

RegisterServerEvent("fishing:returnDeposit")
AddEventHandler("fishing:returnDeposit", function(model)
	local myModel = model
	local xPlayer = QBCore.Functions.GetPlayer(source)
	for k, v in ipairs(Server_Config.RentalBoats) do
		if GetHashKey(v.model) == myModel then
			xPlayer.Functions.AddMoney('cash' ,v.price / 2)
		end
	end
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(yaItem)
	local item = yaItem
	local xPlayer = QBCore.Functions.GetPlayer(tonumber(source))

	--[[if xPlayer.PlayerData.items ~= nil then
        if grape ~= nil then
            if grape.amount >= 23 then
                xPlayer.Functions.RemoveItem("grapejuice", 23, false)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['grapejuice'], "remove")
                TriggerClientEvent("qb-vineyard:client:loadIngredients", source)
            else
                TriggerClientEvent('QBCore:Notify', source, Lang:t("error.invalid_items"), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t("error.invalid_items"), 'error')
        end
	else
		TriggerClientEvent('QBCore:Notify', source, Lang:t("error.no_items"), "error")
	end]]
	if item == "legal" then
	local FishQuantity = xPlayer.Functions.GetItemByName('fish')
		if xPlayer.PlayerData.items ~= nil then
			if FishQuantity ~= nil then
				if FishQuantity.amount >= 5 then
					xPlayer.Functions.RemoveItem('fish', 5)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['fish'], "remove")
					local payment = Server_Config.FishPrice.a
					payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
					xPlayer.Functions.AddMoney('cash', payment)
				else
					TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
					print("1")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
				print("2")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
			print("3")
		end
	end
	if item == "legal" then
	local FishQuantity = xPlayer.Functions.GetItemByName('stingray')
		if xPlayer.PlayerData.items ~= nil then
			if FishQuantity ~= nil then
				if FishQuantity.amount >= 1 then
					xPlayer.Functions.RemoveItem('stingray', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['stingray'], "remove")
					local payment = Server_Config.FishPrice.a
					payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
					xPlayer.Functions.AddMoney('cash', payment)
				else
					TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
					print("1")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
				print("2")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
			print("3")
		end
	end
	if item == "illegal" then
	local FishQuantity = xPlayer.Functions.GetItemByName('sharktiger')
		if xPlayer.PlayerData.items ~= nil then
			if FishQuantity ~= nil then
				if FishQuantity.amount >= 1 then
					xPlayer.Functions.RemoveItem('sharktiger', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharktiger'], "remove")
					local payment = Server_Config.FishPrice.a
					payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
					xPlayer.Functions.AddMoney('cash', payment)
				else
					TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
					print("1")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
				print("2")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
			print("3")
		end
	end
	if item == "illegal" then
	local FishQuantity = xPlayer.Functions.GetItemByName('sharkhammer')
		if xPlayer.PlayerData.items ~= nil then
			if FishQuantity ~= nil then
				if FishQuantity.amount >= 1 then
					xPlayer.Functions.RemoveItem('sharkhammer', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sharkhammer'], "remove")
					local payment = Server_Config.FishPrice.a
					payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
					xPlayer.Functions.AddMoney('cash', payment)
				else
					TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
					print("1")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
				print("2")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
			print("3")
		end
	end
	if item == "illegal" then
	local FishQuantity = xPlayer.Functions.GetItemByName('dolphin')
		if xPlayer.PlayerData.items ~= nil then
			if FishQuantity ~= nil then
				if FishQuantity.amount >= 1 then
					xPlayer.Functions.RemoveItem('dolphin', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dolphin'], "remove")
					local payment = Server_Config.FishPrice.a
					payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
					xPlayer.Functions.AddMoney('cash', payment)
				else
					TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
					print("1")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
				print("2")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
			print("3")
		end
	end
	if item == "illegal" then
	local FishQuantity = xPlayer.Functions.GetItemByName('killerwhale')
		if xPlayer.PlayerData.items ~= nil then
			if FishQuantity ~= nil then
				if FishQuantity.amount >= 1 then
					xPlayer.Functions.RemoveItem('killerwhale', 1)
					TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['killerwhale'], "remove")
					local payment = Server_Config.FishPrice.a
					payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
					xPlayer.Functions.AddMoney('cash', payment)
				else
					TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
					print("1")
				end
			else
				TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
				print("2")
			end
		else
			TriggerClientEvent('QBCore:Notify', source, 'You dont have enough fish')
			print("3")
		end
	end
end)
