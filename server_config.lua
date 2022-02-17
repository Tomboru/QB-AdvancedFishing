Server_Config = {}
	-------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Server_Config.FishPrice = {a = 5, b = 10} -- Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Server_Config.sharktigerPrice = {a = 750, b = 1000} -- Will get dirty money
	Server_Config.sharkhammerPrice = {a = 1000, b = 1500} -- Will get dirty money
	Server_Config.dolphinPrice = {a = 500, b = 750} -- Will get dirty money
	Server_Config.stingrayPrice = {a = 250, b = 500} -- Will get clean money
	Server_Config.killerwhalePrice = {a = 5000, b = 7500} -- will get dirty money
	Server_Config.RentalBoats = {
		-- Fee and Deposit is 50% of the price, you get the deposit returned
		-- Add more boats if you want
		{model = "smallboat", price = 2500},
	}