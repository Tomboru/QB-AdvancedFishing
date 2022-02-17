Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.Sell = {
	["legal"] ={
			pos = vector3(-639.51, -1223.95, 12.48), 
			type = "legal",
			sellText = "Fisch Market",
			blip = 317,
			colour = 69
		},
	["illegal"] ={
			pos = vector3(-317.21 , -2778.76, 4.0), 
			type = "illegal", 
			sellText = "Fisch Schwarzmarkt",
			blip = 68,
			colour = 49
		}
	}

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
}

Config.RentalBoats = {
	{model = "seashark", price = 500},
	{model = "dinghy", price = 1000},
	{model = "marquis", price = 1250},
	{model = "tropic", price = 1500},
	{model = "jetmax", price = 1500},
	{model = "speeder", price = 1500},
	{model = "tug", price = 2500},
	{model = "submersible", price = 5000},
	
}