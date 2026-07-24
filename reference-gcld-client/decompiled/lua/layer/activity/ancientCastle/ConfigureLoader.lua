local var_0_0 = class("AdventureConfigureLoader")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ad = arg_1_1
	arg_1_0.city = require("lua/layer/activity/ancientCastle/config/" .. arg_1_1.mapId .. "/city")
end

function var_0_0.getMap(arg_2_0)
	return {
		width = tonumber(arg_2_0.city.map.width),
		height = tonumber(arg_2_0.city.map.height),
		row = tonumber(arg_2_0.city.map.row),
		column = tonumber(arg_2_0.city.map.column)
	}
end

local var_0_1 = {
	model503 = "worldBuildingGuanqia3.png",
	model101 = "worldBuildingPingyuan.png",
	model401 = "worldBuildingShuidi1.png",
	model601 = "worldBuildingZhucheng.png",
	model501 = "worldBuildingGuanqia1.png",
	model602 = "worldBuildingZhucheng.png",
	model502 = "worldBuildingGuanqia2.png",
	model301 = "worldBuildingShandi.png",
	model604 = "worldBuildingChengchi1.png",
	model605 = "worldBuildingChengchi2.png",
	model402 = "worldBuildingShuidi1.png",
	model606 = "worldBuildingTesechengchi.png",
	model403 = "worldBuildingShuidi2.png"
}

function var_0_0.getCity(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.city.cities[arg_3_1]

	if var_3_0 == nil then
		log.error("Juben City[%s] Not Found", arg_3_1)

		return nil
	end

	return {
		id = tonumber(var_3_0.id),
		x = tonumber(var_3_0.x),
		y = tonumber(var_3_0.y),
		model = var_0_1[var_3_0.model] or var_0_1.model604
	}
end

return var_0_0
