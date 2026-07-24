msgTransform = {}

local var_0_0 = {}

var_0_0.idle = 0
var_0_0.conscription = 1
var_0_0.instanceWar = 2
var_0_0.countryWar = 3
var_0_0.officialWar = 4
var_0_0.find = 5
var_0_0.move = 6
var_0_0.mineWar = 7
var_0_0.rankingWar = 8
var_0_0.cityWar = 10
var_0_0.pvpOne = 13
var_0_0.savageWar = 14
var_0_0.pvpSavage = 15
var_0_0.armyGroup = 16
var_0_0.biwu = 17
var_0_0.eventWar = 18
var_0_0.storyWar = 19
var_0_0.pvpOneInStory = 20
var_0_0.eventInStory = 21
var_0_0.prison = 22
var_0_0.escape = 23
var_0_0.sleep = 24
var_0_0.farm = 25
var_0_0.training1 = 26
var_0_0.training2 = 27
var_0_0.training3 = 28
var_0_0.training4 = 29
var_0_0.training5 = 30
var_0_0.kfgzWar = 1003
var_0_0.kfgzSolo = 1013
var_0_0.kfyzDongying = 1014
var_0_0.kfgzArmyGroup = 1015

function msgTransform.simpleGeneral2Assemble(arg_1_0, arg_1_1)
	local var_1_0 = 1
	local var_1_1 = {
		action = {}
	}

	var_1_1.action.state = 1
	var_1_1.action.data = {}
	var_1_1.action.data.gIds = {}

	if arg_1_0 and arg_1_0.action and arg_1_0.action.state == 1 and arg_1_0.action.data.military then
		local var_1_2 = arg_1_0.action.data.military

		for iter_1_0 = 1, 10 do
			if var_1_2[iter_1_0] and (var_1_2[iter_1_0].generalState == var_0_0.move or var_1_2[iter_1_0].generalState == var_0_0.idle or var_1_2[iter_1_0].generalState == var_0_0.conscription or var_1_2[iter_1_0].generalState == var_0_0.sleep) then
				local var_1_3 = false

				if var_1_2[iter_1_0].cState and var_1_2[iter_1_0].cState ~= 0 then
					var_1_3 = true
				end

				if var_1_3 == false and var_1_2[iter_1_0].generalLocationId ~= arg_1_1 then
					var_1_1.action.data.gIds[var_1_0] = {}
					var_1_1.action.data.gIds[var_1_0].gId = var_1_2[iter_1_0].generalId
					var_1_1.action.data.gIds[var_1_0].gName = var_1_2[iter_1_0].generalName
					var_1_1.action.data.gIds[var_1_0].gQuality = var_1_2[iter_1_0].quality
					var_1_1.action.data.gIds[var_1_0].gPic = var_1_2[iter_1_0].pic
					var_1_0 = var_1_0 + 1
				end
			end
		end

		if var_1_0 > 1 then
			return var_1_1
		else
			local var_1_4 = {
				action = {}
			}

			var_1_4.action.state = 0
			var_1_4.action.data = {}
			var_1_4.action.data.msg = language.get(83039)

			return var_1_4
		end
	else
		local var_1_5 = {
			action = {}
		}

		var_1_5.action.state = 0
		var_1_5.action.data = {}
		var_1_5.action.data.msg = language.get(83039)

		return var_1_5
	end
end

function msgTransform.GeneralInfo2Assemble(arg_2_0)
	log.info("msgTransform.GeneralInfo2Assemble")

	local var_2_0 = 1
	local var_2_1 = {
		action = {}
	}

	var_2_1.action.state = 1
	var_2_1.action.data = {}
	var_2_1.action.data.gIds = {}

	if recordGeneralState then
		for iter_2_0, iter_2_1 in pairs(recordGeneralState) do
			if iter_2_1 and (iter_2_1.generalState == var_0_0.move or iter_2_1.generalState == var_0_0.idle or iter_2_1.generalState == var_0_0.conscription or iter_2_1.generalState == var_0_0.sleep) then
				local var_2_2 = false
				local var_2_3

				if generalMoveLayer.generalTable["id_" .. iter_2_1.id] then
					var_2_3 = generalMoveLayer.generalTable["id_" .. iter_2_1.id].locationId
				end

				if var_2_2 == false and var_2_3 ~= arg_2_0 then
					var_2_1.action.data.gIds[var_2_0] = {}
					var_2_1.action.data.gIds[var_2_0].gId = iter_2_1.id
					var_2_1.action.data.gIds[var_2_0].gName = iter_2_1.generalName
					var_2_1.action.data.gIds[var_2_0].gQuality = iter_2_1.quality
					var_2_1.action.data.gIds[var_2_0].gPic = iter_2_1.pic
					var_2_0 = var_2_0 + 1
				end
			end
		end

		if var_2_0 > 1 then
			return var_2_1
		else
			local var_2_4 = {
				action = {}
			}

			var_2_4.action.state = 0
			var_2_4.action.data = {}
			var_2_4.action.data.msg = language.get(83039)

			return var_2_4
		end
	else
		local var_2_5 = {
			action = {}
		}

		var_2_5.action.state = 0
		var_2_5.action.data = {}
		var_2_5.action.data.msg = language.get(83039)

		return var_2_5
	end
end
