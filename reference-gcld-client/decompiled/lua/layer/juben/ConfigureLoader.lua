local var_0_0 = class("JubenConfigureLoader")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.juben = arg_1_1
	arg_1_0.city = require("lua/layer/juben/config/" .. arg_1_1.gId .. "/city")
	arg_1_0.chat = require("lua/layer/juben/config/" .. arg_1_1.gId .. "/chat")
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
	slope1r = "worldBuildingXiepo3.png",
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

function var_0_0.getGuide(arg_4_0)
	local var_4_0 = tonumber(arg_4_0.city.grade_guide_mapping[arg_4_0.juben.grade].guideId)
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_0.city.guides[var_4_0]) do
		var_4_1[iter_4_0] = {}
		var_4_1[iter_4_0].cityId = tonumber(iter_4_1.cityId)
		var_4_1[iter_4_0].start = tonumber(iter_4_1.start)

		if iter_4_1.focusCities ~= nil then
			var_4_1[iter_4_0].focusCities = {}

			for iter_4_2, iter_4_3 in pairs(tool.split(iter_4_1.focusCities, ",")) do
				var_4_1[iter_4_0].focusCities[iter_4_2] = tonumber(iter_4_3)
			end
		end

		local var_4_2 = tonumber(iter_4_1.chatId)

		if var_4_2 > 0 then
			var_4_1[iter_4_0].chat = arg_4_0:getChat(var_4_2)
		end
	end

	return var_4_1
end

function var_0_0.getChat(arg_5_0, arg_5_1)
	local var_5_0 = {}

	if arg_5_0.chat[arg_5_1] then
		for iter_5_0, iter_5_1 in pairs(arg_5_0.chat[arg_5_1]) do
			var_5_0[iter_5_0] = {}
			var_5_0[iter_5_0].pic = iter_5_1.pic
			var_5_0[iter_5_0].side = tonumber(iter_5_1.side)
			var_5_0[iter_5_0].content = language.get(tonumber(iter_5_1.contentId))
			var_5_0[iter_5_0].cityId = tonumber(iter_5_1.cityId)
			var_5_0[iter_5_0].start = tonumber(iter_5_1.start)
		end
	end

	return var_5_0
end

function var_0_0.getHiddenRoad(arg_6_0)
	local var_6_0 = {}

	if arg_6_0.city.hiddenRoads then
		for iter_6_0, iter_6_1 in pairs(arg_6_0.city.hiddenRoads) do
			var_6_0[iter_6_0] = {}
			var_6_0[iter_6_0].eventId = tonumber(iter_6_1.eventId)
			var_6_0[iter_6_0].initShow = tonumber(iter_6_1.initShow) == 1
			var_6_0[iter_6_0].x = tonumber(iter_6_1.x)
			var_6_0[iter_6_0].y = tonumber(iter_6_1.y)
			var_6_0[iter_6_0].roadId = iter_6_1.roadId
		end
	end

	arg_6_0.hiddenRoads = var_6_0

	return var_6_0
end

function var_0_0.getEventsAnim(arg_7_0)
	local var_7_0 = {}

	if arg_7_0.city.events then
		for iter_7_0, iter_7_1 in pairs(arg_7_0.city.events) do
			var_7_0[iter_7_0] = {}
			var_7_0[iter_7_0].id = tonumber(iter_7_1.id)
			var_7_0[iter_7_0].hasParticleEffect = tonumber(iter_7_1.hasParticleEffect) == 1
			var_7_0[iter_7_0].hasResultFly = tonumber(iter_7_1.hasResultFly) == 1
			var_7_0[iter_7_0].type = tonumber(iter_7_1.type)
			var_7_0[iter_7_0].resultId = tonumber(iter_7_1.resultId)
			var_7_0[iter_7_0].pic = tostring(iter_7_1.pic)
			var_7_0[iter_7_0].targetCityId = tonumber(iter_7_1.targetCityId)
		end
	end

	return var_7_0
end

return var_0_0
