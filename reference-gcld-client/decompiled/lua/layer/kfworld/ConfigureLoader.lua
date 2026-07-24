local var_0_0 = class("KfConfigureLoader")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.world = arg_1_1

	if conf.language == "kr" or conf.language == "tw" or conf.language == "vie" or conf.language == "tha" then
		arg_1_0.city = require("res/native/kfworld/config/" .. user.kfworldId .. "/city")
	else
		arg_1_0.city = require("lua/layer/kfworld/config/" .. user.kfworldId .. "/city")
	end
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
		log.error("KfWorld City[%s] Not Found", arg_3_1)

		return nil
	end

	return {
		id = tonumber(var_3_0.id),
		x = tonumber(var_3_0.x),
		y = tonumber(var_3_0.y),
		model = var_0_1[var_3_0.model] or var_0_1.model604,
		name = var_3_0.name,
		trick = var_3_0.trick
	}
end

function var_0_0.getHiddenRoad(arg_4_0, arg_4_1)
	local var_4_0 = {}
	local var_4_1 = arg_4_0:getMap()
	local var_4_2 = var_4_1.height * var_4_1.row
	local var_4_3 = arg_4_0.city.hiddenRoads[arg_4_1]

	var_4_0.x = tonumber(var_4_3.x)
	var_4_0.y = var_4_2 - tonumber(var_4_3.y)

	return var_4_0
end

function var_0_0.getPathArrow(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = (tonumber(user.player.kfgzForceId) - 1) * 3 + arg_5_1
	local var_5_2 = arg_5_0.city.pathArrow[var_5_1]
	local var_5_3 = arg_5_0:getMap()
	local var_5_4 = var_5_3.height * var_5_3.row

	var_5_0.x = tonumber(var_5_2.x)
	var_5_0.y = var_5_4 - tonumber(var_5_2.y)
	var_5_0.rotation = tonumber(var_5_2.rotation)
	var_5_0.rx = tonumber(var_5_2.rx)
	var_5_0.ry = var_5_4 - tonumber(var_5_2.ry)

	return var_5_0
end

return var_0_0
