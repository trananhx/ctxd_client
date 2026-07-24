recharge.constant = {}
recharge.constant.singleItemWidth = 320
recharge.constant.skipPayCountry = {
	"XYZ"
}
recharge.constant.currentPayCountry = ""

if conf.language == "tw" then
	recharge.constant.iapPriceTableTwNew = {
		{
			extra = 0,
			gold = 60,
			money = "3000",
			pic = 1
		},
		{
			extra = 0,
			gold = 240,
			money = "12000",
			pic = 2
		},
		{
			extra = 10,
			gold = 480,
			money = "24000",
			pic = 3
		},
		{
			extra = 40,
			gold = 1680,
			money = "84000",
			pic = 4
		},
		{
			extra = 100,
			gold = 2880,
			money = "144000",
			pic = 5
		},
		{
			extra = 320,
			gold = 5980,
			money = "299000",
			pic = 6
		}
	}
end

if conf.language == "tw" then
	recharge.constant.twGo2PlayGpPriceTable = {
		{
			extra = 0,
			gold = 60,
			money = "30",
			pic = 1
		},
		{
			extra = 10,
			gold = 480,
			money = "240",
			pic = 2
		},
		{
			extra = 40,
			gold = 1680,
			money = "840",
			pic = 3
		},
		{
			extra = 100,
			gold = 2880,
			money = "1440",
			pic = 4
		},
		{
			extra = 320,
			gold = 5980,
			money = "2990",
			pic = 5
		},
		{
			extra = 620,
			gold = 11380,
			money = "5690",
			pic = 6
		}
	}
	recharge.constant.twGo2PlayThirdPriceTable = {
		{
			gold = 115,
			pic = 1,
			money = "50"
		},
		{
			gold = 345,
			pic = 1,
			money = "150"
		},
		{
			gold = 690,
			pic = 2,
			money = "300"
		},
		{
			gold = 805,
			pic = 2,
			money = "350"
		},
		{
			gold = 920,
			pic = 3,
			money = "400"
		},
		{
			gold = 1035,
			pic = 3,
			money = "450"
		},
		{
			gold = 1150,
			pic = 4,
			money = "500"
		},
		{
			gold = 2300,
			pic = 4,
			money = "1000"
		},
		{
			gold = 2645,
			pic = 5,
			money = "1150"
		},
		{
			gold = 4600,
			pic = 5,
			money = "2000"
		},
		{
			gold = 6900,
			pic = 6,
			money = "3000"
		},
		{
			gold = 11500,
			pic = 6,
			money = "5000"
		},
		{
			gold = 23000,
			pic = 6,
			money = "10000"
		}
	}
end

function recharge.constant.isCountryInSkip()
	for iter_1_0, iter_1_1 in pairs(recharge.constant.skipPayCountry) do
		if iter_1_1 == recharge.constant.currentPayCountry then
			return true
		end
	end

	return false
end

function recharge.constant.skipPayCountryString()
	local var_2_0 = ""

	for iter_2_0, iter_2_1 in ipairs(recharge.constant.skipPayCountry) do
		if iter_2_0 == 1 then
			var_2_0 = iter_2_1
		else
			var_2_0 = var_2_0 .. "_" .. iter_2_1
		end
	end

	return var_2_0
end
