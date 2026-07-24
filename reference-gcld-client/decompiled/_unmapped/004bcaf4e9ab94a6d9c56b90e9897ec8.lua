require("lua/common/eventManager")
require("lua/layer/outputMode/ui")

resourceAreaControl = {}

local var_0_0 = resourceAreaControl
local var_0_1 = resourceAreaConstant

var_0_0.buildingTable = {}
var_0_0.buildingDeveloperTable = {}
var_0_0.freeConsNum = 0
var_0_0.additionMode = 0
var_0_0.totalOutput = 0
var_0_0.buildingWorks = {}
var_0_0.totalWorkAmount = 0
var_0_0.workAmount = 0
var_0_0.tempWorksTable = {}
var_0_0.autoTimes = 0
var_0_0.ifStartAutoUp = false
var_0_0.forceExpandTaskBoard = false
var_0_0.upgradeFinishedTable = {}
var_0_0.lastBuildingTable = nil
var_0_0.ifWaitingForRefresh = false
var_0_0.upgradeCdTable = {}
var_0_0.upgradingBuildingTable = {}
var_0_0.jiasuTapTime = 0
var_0_0.jiasuBIDTable = {}
var_0_0.hasBandit = nil
var_0_0.upgradeTimeScheduleEntry = nil
var_0_0.needRefreshObject = {}
var_0_0.flyExp = 0
var_0_0.jiasuX = 0
var_0_0.jiasuY = 0
var_0_0.goldHammer_flash = true

local function var_0_2()
	local var_1_0 = smgr.getLayer("resourceAreaLayer")

	for iter_1_0, iter_1_1 in pairs(var_0_0.needRefreshObject) do
		if not tolua.isnull(iter_1_1) then
			var_1_0:removeChild(iter_1_1, true)
		end
	end

	var_0_0.needRefreshObject = {}
	var_0_0.buildingTable = {}
	var_0_0.freeConsNum = 0
	var_0_0.additionMode = 0
	var_0_0.totalOutput = 0
	var_0_0.buildingWorks = {}
	var_0_0.totalWorkAmount = 0
	var_0_0.workAmount = 0
	var_0_0.tempWorksTable = {}
	var_0_0.upgradeFinishedTable = {}
	var_0_0.upgradeCdTable = {}
	var_0_0.upgradingBuildingTable = {}
end

local function var_0_3(arg_2_0)
	if var_0_0.additionCd and var_0_0.additionCd > 0 then
		var_0_0.additionCd = var_0_0.additionCd - arg_2_0 * 1000

		if var_0_0.additionCd < 0 then
			var_0_0.additionCd = 0
		end
	end

	if table.getn(var_0_0.upgradeCdTable) == 0 then
		return
	end

	local var_2_0 = smgr.getLayer("resourceAreaLayer")
	local var_2_1 = false

	for iter_2_0, iter_2_1 in pairs(var_0_0.upgradeCdTable) do
		local var_2_2 = iter_2_1.tag
		local var_2_3 = iter_2_1.value - 1

		if var_2_3 < 0 then
			local var_2_4 = tolua.cast(var_2_0:getChildByTag(var_2_2), "CCLabelTTF")

			var_2_0:removeChild(var_2_4, true)
			table.remove(var_0_0.upgradeCdTable, iter_2_0)
			table.insert(var_0_0.upgradeFinishedTable, iter_2_1.buildingId)

			var_2_1 = true
		else
			local var_2_5 = tolua.cast(var_2_0:getChildByTag(var_2_2), "CCLabelTTF")
			local var_2_6 = os.date("%M:%S", var_2_3)

			if var_2_3 >= 3600 then
				local var_2_7 = math.floor(tonumber(var_2_3) / 3600)

				var_2_6 = string.format("%02d:%s", var_2_7, var_2_6)
			end

			if var_2_5 ~= nil then
				var_2_5:setString(var_2_6)
			end

			var_0_0.upgradeCdTable[iter_2_0].value = var_2_3
		end
	end

	if var_2_1 then
		var_0_0.getBuildingInfo()
	end
end

local function var_0_4(arg_3_0)
	local var_3_0 = smgr.getLayer("resourceAreaLayer")

	for iter_3_0, iter_3_1 in pairs(var_0_0.buildingTable) do
		if iter_3_1.id == arg_3_0 then
			local var_3_1 = tolua.cast(var_3_0:getChildByTag(iter_3_1.id + var_0_1.LVLABEL_TAG), "CCLabelTTF")

			if var_3_1 then
				var_3_1:setString(iter_3_1.lv)
			end

			local var_3_2 = tolua.cast(var_3_0:getChildByTag(iter_3_1.id + var_0_1.FIELD_TAG), "CCSprite")

			if var_3_2 then
				var_3_2:stopAllActions()
				resourceAreaUI.playerJinguangAnim(var_3_2, 35)
				resourceAreaUI.taskFinishAnim(var_3_2, 1)
			end
		end
	end
end

local function var_0_5(arg_4_0)
	if arg_4_0.action.state == 3 then
		local var_4_0 = arg_4_0.action.data.autoUpbuilding

		if var_4_0 and var_4_0.state == 1 then
			var_0_0.autoTimes = var_4_0.times

			var_0_0.getBuildingInfo()
		end

		if arg_4_0.action.data.upgrade ~= nil then
			var_0_0.flyExp = arg_4_0.action.data.upgrade.exp

			print(arg_4_0.action.data.upgrade.exp)

			if arg_4_0.action.data.upgrade.player then
				for iter_4_0, iter_4_1 in pairs(arg_4_0.action.data.upgrade.player) do
					user.player[iter_4_0] = iter_4_1

					log.info("response.action.data.upgrade.player: ", iter_4_0, iter_4_1, user.player[iter_4_0])
				end
			end
		end

		if arg_4_0.action.data.output then
			log.debug("资源有更新")
		end
	end
end

local function var_0_6(arg_5_0)
	if arg_5_0.action.state == 1 then
		if user.player.vipLv == 0 and user.player.playerLv > 30 then
			messageBox.createGoldWarning(language.get(160001))
		end

		var_0_0.autoTimes = arg_5_0.action.data.times

		var_0_0.getBuildingInfo()
	end
end

local function var_0_7(arg_6_0)
	local var_6_0 = arg_6_0.action.state

	log.debug("handlerStopAutoUpgradeAction ", var_6_0)

	if var_6_0 == 1 then
		var_0_0.getBuildingInfo()
	end
end

local function var_0_8(arg_7_0)
	if arg_7_0.action.state == 1 then
		amgr.playEffect(enumAudioFile.ui_minju_jiasu)

		local var_7_0 = arg_7_0.action.data.areaId
		local var_7_1 = arg_7_0.action.data.buildingId
		local var_7_2 = arg_7_0.action.data.reduceTime

		for iter_7_0, iter_7_1 in pairs(var_0_0.upgradeCdTable) do
			if iter_7_1.buildingId == var_7_1 then
				local var_7_3 = iter_7_1.value - var_0_0.jiasuTapTime

				log.debug("delay: ", var_7_3)

				iter_7_1.value = iter_7_1.value - var_7_2

				log.debug("work.value", iter_7_1.value)
				table.remove(var_0_0.jiasuBIDTable, 1)

				break
			end
		end

		if var_7_0 == var_0_1.RESOURCE_AREA_TYPE then
			local function var_7_4(arg_8_0)
				smgr.getLayer("resourceAreaLayer"):removeChild(arg_8_0, true)
			end

			local var_7_5 = language.get(160002, var_7_2)
			local var_7_6 = CCLabelTTF:create(var_7_5, "", 25)

			var_7_6:setPosition(ccp(var_0_0.jiasuX, var_0_0.jiasuY))
			var_7_6:setColor(ccc3(0, 255, 0))

			local var_7_7 = CCMoveTo:create(1, ccp(var_0_0.jiasuX, var_0_0.jiasuY + 50))
			local var_7_8 = CCCallFuncN:create(var_7_4)
			local var_7_9 = CCArray:create()

			var_7_9:addObject(var_7_7)
			var_7_9:addObject(var_7_8)

			local var_7_10 = CCSequence:create(var_7_9)

			var_7_6:runAction(var_7_10)
			smgr.getLayer("resourceAreaLayer"):addChild(var_7_6, 1000003)

			if guide.constant.other[5] == true then
				guide.constant.other[5] = false

				guide.ui.setVisible(false)
			end
		end
	else
		log.debug("已经升级完了")

		local var_7_11 = var_0_0.jiasuBIDTable[1]

		for iter_7_2, iter_7_3 in pairs(var_0_0.upgradeCdTable) do
			if iter_7_3.buildingId == var_7_11 then
				iter_7_3.value = -1

				log.debug("work.value: ", iter_7_3.value)
				table.remove(var_0_0.jiasuBIDTable, 1)

				break
			end
		end
	end
end

local function var_0_9(arg_9_0)
	if arg_9_0.action.data.update["function"] then
		resourceAreaUI.updateFuncionItem()
	end
end

local function var_0_10(arg_10_0)
	local var_10_0 = arg_10_0.action.data

	showTable(var_10_0)

	if var_10_0.finish and var_10_0.finish.allOver then
		roleDialogue.control.loadSpeak(2230)
	end

	if var_10_0.finishPlus then
		if var_10_0.finishPlus.first == 1 then
			roleDialogue.control.loadSpeak(2270)
		end

		if var_10_0.finishPlus.allOver == true then
			roleDialogue.control.loadSpeak(2280)
		end
	end

	if var_10_0.finishFarm then
		if var_10_0.finishFarm.first == 1 then
			roleDialogue.control.loadSpeak(2420)
		end

		if var_10_0.finishFarm.allOver == true then
			roleDialogue.control.loadSpeak(2430)
		end
	end

	if var_10_0.info and var_10_0.info.drawingNumFarm then
		local var_10_1 = {
			{}
		}

		var_10_1[1].id = 30012
		var_10_1[1].value = tonumber(var_10_0.info.drawingNumFarm)

		globalAction_gotResource(var_10_1)
	end
end

local function var_0_11(arg_11_0)
	local var_11_0 = arg_11_0.action.state

	if var_11_0 == 1 then
		var_0_0.workAmount = var_0_0.workAmount - 1

		var_0_0.getBuildingInfo()
	elseif var_11_0 == 0 then
		local var_11_1 = arg_11_0.action.data.msg

		require("lua/component/messageBox")
		messageBox.alert(language.get(10003), var_11_1)
	end
end

local function var_0_12(arg_12_0)
	amgr.playEffect(enumAudioFile.ui_minju_jiasu)
	var_0_0.getBuildingInfo()
end

local function var_0_13(arg_13_0)
	if var_0_0.isRemove then
		return
	end

	log.info("building info update ")

	local var_13_0 = smgr.getLayer("resourceAreaLayer")
	local var_13_1 = resourceAreaUI.uiTable
	local var_13_2 = arg_13_0.action.state
	local var_13_3 = arg_13_0.action.data

	var_0_0.currentTimeType = var_13_3.currentTimeType or 0
	var_0_0.additionCd = var_13_3.additionCd
	var_0_0.additionRate = var_13_3.additionRate
	var_0_0.slaveNum = var_13_3.slaveNum or 0
	var_0_0.progress = var_13_3.progress or 0
	var_0_0.luban = var_13_3.luban
	var_0_0.reformComplete = var_13_3.reformComplete or 0
	var_0_0.displayIron = var_13_3.displayIron
	var_0_0.totalGemOutPut = var_13_3.totalGemOutPut
	var_0_0.buyGrabCost = var_13_3.buyGrabCost
	var_0_0.buyGrabNum = var_13_3.buyGrabNum
	var_0_0.buyGrabState = var_13_3.buyGrabState

	if var_13_2 == 1 then
		var_0_2()

		var_0_0.hasBandit = var_13_3.hasBandit

		resourceAreaUI.add_mazeiAndTufei()

		if var_13_3.autoUpbuilding.state == 1 then
			var_0_0.autoTimes = var_13_3.autoUpbuilding.times
			var_0_0.ifStartAutoUp = true
		else
			var_0_0.ifStartAutoUp = false
		end

		log.info("@@@@@response.action.data.feat : ", arg_13_0.action.data.feat)

		var_0_0.buildingFeat = arg_13_0.action.data.feat

		resourceAreaUI.update_buildingFeat(arg_13_0.action.data.feat)

		var_0_0.freeConsNum = var_13_3.freeConsNum
		var_0_0.additionMode = var_13_3.additionMode
		var_0_0.totalOutput = var_13_3.totalOutput[1].output
		var_0_0.silkOutput = var_13_3.totalOutput[1].totalSilkOutPut or 0
		var_0_0.lumberYardReform = var_13_3.lumberYardReform
		var_0_0.lumberYardReformPlus = var_13_3.lumberYardReformPlus
		var_0_0.farmReform = var_13_3.farmReform
		var_0_0.mohistAreaInfo = var_13_3.mohistAreaInfo

		if var_0_0.mohistAreaInfo then
			user.mojia.mohistDrawingNum = var_0_0.mohistAreaInfo.drawingNum
		end

		var_0_0.buildingTable = {}
		var_0_0.buildingDeveloperTable = {}

		for iter_13_0, iter_13_1 in pairs(var_13_3.buildings) do
			if iter_13_1.type == 0 then
				var_0_0.buildingTable[iter_13_0] = {}
				var_0_0.buildingTable[iter_13_0].lv = iter_13_1.lv
				var_0_0.buildingTable[iter_13_0].id = iter_13_1.id

				log.debug("$$$###$$$###", var_0_0.buildingTable[iter_13_0].id)

				var_0_0.buildingTable[iter_13_0].name = iter_13_1.name
				var_0_0.buildingTable[iter_13_0].resType = iter_13_1.resType
				var_0_0.buildingTable[iter_13_0].hasEvent = iter_13_1.hasEvent
				var_0_0.buildingTable[iter_13_0].goldValue = iter_13_1.upgrade.cost[1].value
				var_0_0.buildingTable[iter_13_0].woodValue = iter_13_1.upgrade.cost[2].value
				var_0_0.buildingTable[iter_13_0].upgradeEnable = iter_13_1.upgrade.upgradeEnable
				var_0_0.buildingTable[iter_13_0].speedUpNum = iter_13_1.speedUpNum
				var_0_0.buildingTable[iter_13_0].yinbiCost = nil
				var_0_0.buildingTable[iter_13_0].mucaiCost = nil
				var_0_0.buildingTable[iter_13_0].pos = iter_13_1.pos
				var_0_0.buildingTable[iter_13_0].isNew = iter_13_1.isNew
				var_0_0.buildingTable[iter_13_0].status = iter_13_1.status
				var_0_0.buildingTable[iter_13_0].output = iter_13_1.output
				var_0_0.buildingTable[iter_13_0].needSlaveNum = iter_13_1.needSlaveNum
				var_0_0.buildingTable[iter_13_0].harvest = iter_13_1.harvest
				var_0_0.buildingTable[iter_13_0].canChanged = iter_13_1.canChanged
				var_0_0.buildingTable[iter_13_0].isChanged = iter_13_1.isChanged
				var_0_0.buildingTable[iter_13_0].outputSilk = iter_13_1.outputSilk
				var_0_0.buildingTable[iter_13_0].lumberYardReform = iter_13_1.lumberYardReform
				var_0_0.buildingTable[iter_13_0].lumberYardReformPlus = iter_13_1.lumberYardReformPlus
				var_0_0.buildingTable[iter_13_0].farmReform = iter_13_1.farmReform
				var_0_0.buildingTable[iter_13_0].mohistBuilding = iter_13_1.mohistBuilding

				for iter_13_2, iter_13_3 in pairs(iter_13_1.upgrade.cost) do
					if iter_13_3.type == 1 then
						var_0_0.buildingTable[iter_13_0].yinbiCost = iter_13_3.value
					elseif iter_13_3.type == 2 then
						var_0_0.buildingTable[iter_13_0].mucaiCost = iter_13_3.value
					end
				end

				var_0_0.buildingTable[iter_13_0].isUpgrading = 0
			else
				var_0_0.buildingDeveloperTable[iter_13_0] = iter_13_1
			end
		end

		var_0_0.buildingWorks = var_13_3.buildingWorks
		var_0_0.totalWorkAmount = #var_0_0.buildingWorks
		var_0_0.workAmount = #var_0_0.buildingWorks

		for iter_13_4, iter_13_5 in pairs(var_0_0.buildingWorks) do
			if iter_13_5.state == 1 then
				var_0_0.workAmount = var_0_0.workAmount - 1
			end
		end

		local var_13_4 = false

		var_0_0.tempWorksTable = {}

		for iter_13_6, iter_13_7 in pairs(var_0_0.buildingWorks) do
			var_0_0.tempWorksTable[iter_13_6] = {}
			var_0_0.tempWorksTable[iter_13_6].workId = iter_13_7.workId
			var_0_0.tempWorksTable[iter_13_6].state = iter_13_7.state
			var_0_0.tempWorksTable[iter_13_6].buildingId = 0

			if iter_13_7.state == 1 then
				var_0_0.tempWorksTable[iter_13_6].buildingId = iter_13_7.buildingId
			end

			for iter_13_8, iter_13_9 in pairs(var_0_0.buildingTable) do
				if iter_13_7.buildingId == iter_13_9.id then
					iter_13_9.isUpgrading = iter_13_7.state

					if iter_13_9.isUpgrading == 1 then
						if not var_0_0.upgradingBuildingTable.upgradingBuildingId then
							var_0_0.upgradingBuildingTable.upgradingBuildingId = {}
						end

						local var_13_5 = iter_13_7.buildingId

						var_0_0.upgradingBuildingTable.upgradingBuildingId[var_13_5] = {}
						var_0_0.upgradingBuildingTable.upgradingBuildingId[var_13_5].id = iter_13_7.buildingId

						if iter_13_7.cd then
							var_0_0.upgradingBuildingTable.upgradingBuildingId[var_13_5].cd = iter_13_7.cd
						end

						if iter_13_7.totalTime then
							var_0_0.upgradingBuildingTable.upgradingBuildingId[var_13_5].totalTime = iter_13_7.totalTime
							var_13_4 = true
						end

						if iter_13_9.speedUpNum then
							var_0_0.upgradingBuildingTable.upgradingBuildingId[var_13_5].speedUpNum = iter_13_9.speedUpNum
						end
					end
				end
			end
		end

		var_0_0.upgradeFinishedTable = {}

		if var_0_0.lastBuildingTable then
			for iter_13_10, iter_13_11 in pairs(var_0_0.lastBuildingTable) do
				for iter_13_12, iter_13_13 in pairs(var_0_0.buildingTable) do
					if iter_13_11.id == iter_13_13.id and iter_13_13.lv > iter_13_11.lv then
						table.insert(var_0_0.upgradeFinishedTable, iter_13_11.id)
					end
				end
			end
		end

		if table.getn(var_0_0.upgradeFinishedTable) > 0 then
			var_0_0.ifWaitingForRefresh = true

			log.debug("$$$$$$需要更新", table.getn(var_0_0.upgradeFinishedTable))
		else
			var_0_0.ifWaitingForRefresh = false

			log.debug("$$$$$$不需要更新", table.getn(var_0_0.upgradeFinishedTable))
		end

		var_0_0.lastBuildingTable = var_0_0.buildingTable
		var_0_0.worksTable = var_0_0.tempWorksTable
		var_0_0.canSetMode = true

		if var_0_0.luban and mainCity.control.reformStatus and (mainCity.control.reformStatus ~= 3 and var_0_1.RESOURCE_AREA_TYPE == 4 or mainCity.control.reformStatus == 3) then
			var_0_0.canSetMode = false
		end

		resourceAreaUI.initGameUI()

		if var_0_0.ifWaitingForRefresh then
			local var_13_6 = {}
			local var_13_7 = table.getn(var_0_0.upgradeFinishedTable)

			for iter_13_14 = 1, var_13_7 do
				var_0_4(var_0_0.upgradeFinishedTable[iter_13_14])
			end
		end

		if var_13_4 == true and var_0_0.freeConsNum > 0 and var_0_0.goldHammer_flash == true then
			var_0_0.goldHammer_flash = false

			local var_13_8 = CCSprite:create("res/ui/resourceArea2/resou_gra_view_on.png")
			local var_13_9 = CCSprite:create("res/ui/resourceArea2/resou_gra_view.png")
			local var_13_10 = CCArray:create()

			var_13_10:addObject(var_13_8:displayFrame())
			var_13_10:addObject(var_13_9:displayFrame())

			local var_13_11 = CCAnimation:createWithSpriteFrames(var_13_10, 0.5)
			local var_13_12 = CCAnimate:create(var_13_11)
			local var_13_13 = CCRepeat:create(var_13_12, 5)

			resourceAreaUI.uiTable.gold_bg:runAction(var_13_13)
		end
	end
end

function var_0_0.getBuildingInfo()
	cmgr.sendRequest(var_0_13, actions.buildingInfo, var_0_1.RESOURCE_AREA_TYPE)
end

function var_0_0.getBuildingFeat(arg_15_0)
	arg_15_0 = arg_15_0 or 0

	local function var_15_0(arg_16_0)
		if arg_16_0.action.data.feat and arg_16_0.action.data.feat > 0 then
			log.info("building Feat : ", var_0_0.buildingFeat)

			local var_16_0 = {
				{}
			}

			var_16_0[1].id = 10001
			var_16_0[1].value = arg_16_0.action.data.feat

			globalAction_gotResource(var_16_0)
			var_0_0.getBuildingInfo()
		elseif arg_16_0.action.data.maxFeat and arg_16_0.action.data.maxFeat > 0 then
			messageBox.confirm(language.get(83051, arg_16_0.action.data.maxFeat), function()
				var_0_0.getBuildingFeat(1)
			end)
		elseif arg_16_0.action.data.maxNum and arg_16_0.action.data.maxNum > 0 then
			messageBox.confirm(language.get(83052, arg_16_0.action.data.maxNum), function()
				var_0_0.getBuildingFeat(1)
			end)
		end
	end

	cmgr.sendRequest(var_15_0, actions.buildingGetBuildingFeat, arg_15_0)
end

local function var_0_14(arg_19_0)
	cmgr.sendRequest(var_0_11, actions.buildingUpgrade, arg_19_0)
end

local function var_0_15(arg_20_0)
	local function var_20_0(arg_21_0)
		var_0_0.getBuildingInfo()
	end

	cmgr.sendRequest(var_20_0, actions.lumberYardReform, arg_20_0)
end

local function var_0_16(arg_22_0)
	local function var_22_0(arg_23_0)
		var_0_0.getBuildingInfo()
	end

	cmgr.sendRequest(var_22_0, actions.lumberYardReformPlus, arg_22_0)
end

local function var_0_17(arg_24_0)
	local function var_24_0(arg_25_0)
		var_0_0.getBuildingInfo()
	end

	cmgr.sendRequest(var_24_0, actions.farmReform, arg_24_0)
end

local function var_0_18(arg_26_0)
	local function var_26_0(arg_27_0)
		var_0_0.getBuildingInfo()
	end

	cmgr.sendRequest(var_26_0, actions.mohistReform, arg_26_0)
end

function var_0_0.getWorkId(arg_28_0, arg_28_1)
	local var_28_0 = 0

	if arg_28_0 == 1 then
		local var_28_1 = arg_28_1

		for iter_28_0, iter_28_1 in pairs(var_0_0.tempWorksTable) do
			if iter_28_1.buildingId == var_28_1 then
				var_28_0 = iter_28_1.workId
			end
		end
	elseif arg_28_0 == 2 then
		for iter_28_2, iter_28_3 in pairs(arg_28_1) do
			if var_0_1.worksTable[iter_28_2] and var_0_1.worksTable[iter_28_2].state == 0 and iter_28_3.state == 1 then
				var_28_0 = iter_28_3.workId
			end
		end
	end

	return var_28_0
end

function var_0_0.jiasuSelected(arg_29_0)
	log.debug("加速按钮按下")

	local var_29_0 = smgr.getLayer("resourceAreaLayer")
	local var_29_1 = arg_29_0 - var_0_1.JIASU_TAG
	local var_29_2 = 0

	if not var_0_0.upgradeCdTable then
		log.debug("这个表竟然是空!!!!")
	end

	for iter_29_0, iter_29_1 in pairs(var_0_0.upgradeCdTable) do
		if iter_29_1.buildingId == var_29_1 then
			var_29_2 = iter_29_1.workId
			var_0_0.jiasuTapTime = iter_29_1.value

			log.debug("find workId: ", var_29_2)
		end
	end

	cmgr.sendRequest(var_0_8, actions.buidlSpeedUp, var_29_2)
	table.insert(var_0_0.jiasuBIDTable, var_29_1)

	local var_29_3 = var_29_0:getChildByTag(arg_29_0 + var_0_1.JIASUMENU_PLUS_TAG)

	var_0_0.jiasuX = var_29_3:getPositionX()
	var_0_0.jiasuY = var_29_3:getPositionY()

	var_29_0:removeChildByTag(arg_29_0 + var_0_1.JIASUMENU_PLUS_TAG, true)
end

function var_0_0.jiasuBuildingSelected(arg_30_0)
	local var_30_0 = smgr.getLayer("resourceAreaLayer")
	local var_30_1 = arg_30_0 - var_0_1.JIASU_TAG
	local var_30_2

	for iter_30_0, iter_30_1 in pairs(var_0_0.buildingDeveloperTable) do
		if iter_30_1.id == var_30_1 then
			var_30_2 = iter_30_1
		end
	end

	local function var_30_3()
		var_30_0:removeChildByTag(var_0_1.JIASU_TAG + var_0_1.JIASUMENU_PLUS_TAG + var_30_1, true)
		var_30_0:removeChildByTag(var_0_1.BUILDING_DEVELOPER_TAG_1 + var_30_1, true)
	end

	if var_30_2 ~= nil then
		if user.chargeItems.consDrawingGold.noDisturb then
			var_30_3()
			cmgr.sendRequest(var_0_0.handleBuildingDeveloperInfo, actions.consCdRecoverConfirm, var_30_2.id)
		else
			local function var_30_4(arg_32_0)
				local var_32_0 = arg_32_0.action.data.gold

				require("lua/component/messageBox")
				messageBox.showChargeWin(language.get(10003), language.get(160003, var_32_0), "consDrawingGold", function()
					var_30_3()
					cmgr.sendRequest(var_0_0.handleBuildingDeveloperInfo, actions.consCdRecoverConfirm, var_30_2.id)
				end)
			end

			cmgr.sendRequest(var_30_4, actions.consCdRecover, var_30_2.id)
		end
	end
end

function var_0_0.autoUpgradeSelected()
	log.debug("$$$$$$$ifStartAutoUp", var_0_0.ifStartAutoUp)

	if guide.constant.other[1] == true then
		guide.constant.other[1] = false

		guide.ui.setVisible(false)
	end

	log.debug("$$$$$$$ifStartAutoUp", var_0_0.ifStartAutoUp)
	cmgr.sendRequest(var_0_6, actions.buildAutoUpgrade, var_0_1.RESOURCE_AREA_TYPE)

	var_0_0.ifStartAutoUp = true
end

function var_0_0.goldHammerSelected()
	if user.chargeItems.freeConsGold.noDisturb or var_0_0.freeConsNum > 0 then
		cmgr.sendRequest(var_0_12, actions.freeCdRecoverConfirm)
	else
		require("lua/component/messageBox")
		messageBox.showChargeWin(language.get(10003), language.get(160004), "freeConsGold", function()
			cmgr.sendRequest(var_0_12, actions.freeCdRecoverConfirm)
		end)
	end
end

function var_0_0.goldBuySlave()
	local function var_37_0(arg_38_0)
		if arg_38_0.action.data and arg_38_0.action.data.slaveNum then
			var_0_0.getBuildingInfo()
		end
	end

	messageBox.confirm(language.get(490946, var_0_0.buyGrabCost, var_0_0.buyGrabNum), function()
		cmgr.sendRequest(var_37_0, actions.buyGrab)
	end)
end

function var_0_0.shengjiItemSelected(arg_40_0)
	local var_40_0 = smgr.getLayer("resourceAreaLayer")

	if var_0_1.workAmount == 0 then
		log.debug("no workAmount")

		local var_40_1 = tolua.cast(var_40_0:getChildByTag(arg_40_0), "CCMenu")

		if var_40_1 then
			var_40_0:removeChild(var_40_1, true)
		end

		require("lua/component/messageBox")
		messageBox.alert(language.get(10003), language.get(160005))

		return
	end

	if guide.constant.other[4] == true then
		guide.constant.other[4] = false

		guide.ui.setVisible(false)

		guide.constant.other[5] = true

		guide.control.loadGuide(5, 5)
	end

	var_0_14(arg_40_0 - var_0_1.UPGRADELABEL_TAG)
	var_40_0:removeChild(tolua.cast(var_40_0:getChildByTag(arg_40_0), "CCSprite"), true)
end

function var_0_0.luomuGaizaoSelected(arg_41_0)
	local var_41_0 = smgr.getLayer("resourceAreaLayer")

	var_0_15(arg_41_0 - var_0_1.UPGRADELABEL_TAG)
	var_41_0:removeChild(tolua.cast(var_41_0:getChildByTag(arg_41_0), "CCSprite"), true)
end

function var_0_0.luomuGaizaoSelected2(arg_42_0)
	local var_42_0 = smgr.getLayer("resourceAreaLayer")

	var_0_16(arg_42_0 - var_0_1.UPGRADELABEL_TAG)
	var_42_0:removeChild(tolua.cast(var_42_0:getChildByTag(arg_42_0), "CCSprite"), true)
end

function var_0_0.majunGaizaoSelected(arg_43_0)
	local var_43_0 = smgr.getLayer("resourceAreaLayer")

	var_0_17(arg_43_0 - var_0_1.UPGRADELABEL_TAG)
	var_43_0:removeChild(tolua.cast(var_43_0:getChildByTag(arg_43_0), "CCSprite"), true)
end

function var_0_0.mojiaGaizaoSelected(arg_44_0)
	local var_44_0 = smgr.getLayer("resourceAreaLayer")

	var_0_18(arg_44_0 - var_0_1.UPGRADELABEL_TAG)
	var_44_0:removeChild(tolua.cast(var_44_0:getChildByTag(arg_44_0), "CCSprite"), true)
end

function var_0_0.handleBuildingDeveloperInfo(arg_45_0)
	var_0_0.getBuildingInfo()
end

local function var_0_19(arg_46_0, arg_46_1)
	local var_46_0 = ccp(arg_46_0, arg_46_1)

	if user.settings.isCharacterLayerDisplayed == true then
		return
	end

	if user.getFunc(41) and tool.checkIfTouch(resourceAreaUI.uiTable.outputSprite, arg_46_0, arg_46_1) then
		if var_0_0.canSetMode then
			outputModeUI.show({
				timeType = var_0_0.currentTimeType,
				resType = var_0_1.RESOURCE_AREA_TYPE,
				additionMode = var_0_0.additionMode,
				additionCd = var_0_0.additionCd,
				additionRate = var_0_0.additionRate
			})
		end

		return
	end

	if menuUI.ui.isOpen == true then
		menuUI.ui.clickedMainItem()
	end

	local var_46_1 = smgr.getLayer("resourceAreaLayer")

	for iter_46_0, iter_46_1 in pairs(var_0_0.buildingTable) do
		local var_46_2 = 0

		if iter_46_1.isUpgrading ~= 1 and not LayerTransparentCheck:ifTransparent(iter_46_1.id + var_0_1.FIELD_TAG, var_46_0, var_46_1) and not tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG), "CCSprite") then
			if var_0_1.RESOURCE_AREA_TYPE == 1 then
				if resourceAreaUI.uiTable.icon_mazei ~= nil and iter_46_1.pos == 16 then
					return
				end
			elseif var_0_1.RESOURCE_AREA_TYPE == 2 and resourceAreaUI.uiTable.icon_tufei ~= nil then
				if var_0_0.hasBandit == 3 then
					if iter_46_1.pos == 1 then
						return
					end
				elseif var_0_0.hasBandit == 2 and iter_46_1.pos == 2 then
					return
				end
			end

			if iter_46_1.lumberYardReformPlus and (iter_46_1.lumberYardReformPlus.canReform == true or iter_46_1.lumberYardReformPlus.star >= 3) then
				local var_46_3 = tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.FIELD_TAG), "CCSprite")
				local var_46_4 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/build_upg_view.png")
				local var_46_5 = var_46_3:getPositionX()
				local var_46_6 = var_46_3:getPositionY()

				if iter_46_1.pos == 1 then
					var_46_6 = var_46_6 - 30
				elseif iter_46_1.pos == 4 then
					var_46_5 = var_46_5 - 60
				elseif iter_46_1.pos == 12 then
					var_46_5 = var_46_5 + 60
				end

				var_46_4:setPosition(ccp(var_46_5, var_46_6))
				var_46_1:addChild(var_46_4, 1000003, iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

				var_46_2 = 1

				if iter_46_1.lumberYardReformPlus.canReform then
					local var_46_7 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_7:setColor(ccc3(237, 209, 169))
					var_46_7:setPosition(ccp(var_46_4:getContentSize().width / 2, var_46_4:getContentSize().height - 30))
					var_46_4:addChild(var_46_7)

					for iter_46_2 = 1, 3 do
						local var_46_8 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star.png")

						if iter_46_2 > iter_46_1.lumberYardReformPlus.star then
							var_46_8 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star_g.png")
						end

						var_46_8:setPosition(ccp(25 + (iter_46_2 - 1) * 25, 145))
						var_46_4:addChild(var_46_8)
					end

					local var_46_9 = CCStrokeLabelTTF:create(language.get("223308_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_9:setColor(ccc3(237, 209, 169))

					local var_46_10 = CCStrokeLabelTTF:create(" " .. var_0_0.lumberYardReformPlus.drawingNumPlus, "Thonburi-Bold", 20)

					if var_0_0.lumberYardReformPlus.drawingNumPlus < iter_46_1.lumberYardReformPlus.needDrawingNum then
						var_46_10:setColor(ccc3(255, 0, 0))
					else
						var_46_10:setColor(ccc3(0, 255, 0))
					end

					local var_46_11 = CCStrokeLabelTTF:create("/" .. iter_46_1.lumberYardReformPlus.needDrawingNum, "Thonburi-Bold", 20)

					var_46_11:setColor(ccc3(237, 209, 169))

					local var_46_12 = createRichNode({
						var_46_9,
						var_46_10,
						var_46_11
					}, 0)

					var_46_12:setPosition(ccp(15, 114))
					var_46_4:addChild(var_46_12)

					local var_46_13 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_13:setColor(ccc3(237, 209, 169))

					local var_46_14 = CCStrokeLabelTTF:create(iter_46_1.lumberYardReformPlus.intro, "Thonburi-Bold", 20)

					var_46_14:setColor(ccc3(255, 218, 38))

					local var_46_15 = createRichNode({
						var_46_13,
						var_46_14
					}, 0)

					var_46_15:setPosition(ccp(15, 83))
					var_46_4:addChild(var_46_15)

					local var_46_16 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
					local var_46_17 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
					local var_46_18 = CCMenuItemSprite:create(var_46_16, var_46_17)

					var_46_18:registerScriptTapHandler(var_0_0.luomuGaizaoSelected2)
					var_46_18:setTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

					local var_46_19 = CCMenu:createWithItem(var_46_18)

					var_46_19:setPosition(ccp(var_46_4:getContentSize().width / 2, 37))
					var_46_4:addChild(var_46_19, 2)

					local var_46_20 = CCLabelTTF:create(language.get("223307_luomu"), "Thonburi", 24)

					var_46_20:setPosition(ccp(var_46_4:getContentSize().width / 2, 37))
					var_46_4:addChild(var_46_20, 3)
				else
					local var_46_21 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_21:setColor(ccc3(237, 209, 169))
					var_46_21:setPosition(ccp(var_46_4:getContentSize().width / 2, var_46_4:getContentSize().height - 30))
					var_46_4:addChild(var_46_21)

					local var_46_22 = CCStrokeLabelTTF:create(language.get("223311_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_22:setColor(ccc3(237, 209, 169))

					local var_46_23 = CCSprite:createWithSpriteFrameName("res_icon_2_small.png")
					local var_46_24 = CCStrokeLabelTTF:create(iter_46_1.output, "Thonburi-Bold", 20)

					if iter_46_1.resType == 2 then
						var_46_24:setString("0")
					end

					var_46_24:setColor(ccc3(237, 209, 169))

					local var_46_25 = CCSprite:createWithSpriteFrameName("res_icon_55.png")

					var_46_25:setScale(0.55)

					local var_46_26 = CCStrokeLabelTTF:create(iter_46_1.lumberYardReformPlus.silkOuput, "Thonburi-Bold", 20)

					var_46_26:setColor(ccc3(237, 209, 169))

					local var_46_27 = createRichNode({
						var_46_22,
						var_46_23,
						var_46_24,
						var_46_25,
						var_46_26
					}, 0)

					var_46_27:setPosition(ccp(15, 145))
					var_46_4:addChild(var_46_27)

					local var_46_28 = CCStrokeLabelTTF:create(language.get("223312_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_28:setColor(ccc3(237, 209, 169))

					local var_46_29 = CCSprite:createWithSpriteFrameName("res_icon_55.png")

					var_46_29:setScale(0.55)

					local var_46_30 = CCStrokeLabelTTF:create(iter_46_1.outputSilk, "Thonburi-Bold", 20)

					var_46_30:setColor(ccc3(237, 209, 169))

					local var_46_31

					if iter_46_1.outputSilk == nil or iter_46_1.outputSilk <= 0 then
						var_46_30 = CCStrokeLabelTTF:create(language.get("223310_luomu"), "Thonburi-Bold", 20)
						var_46_31 = createRichNode({
							var_46_28,
							var_46_30
						}, 0)
					else
						var_46_31 = createRichNode({
							var_46_28,
							var_46_29,
							var_46_30
						}, 0)
					end

					var_46_31:setPosition(ccp(15, 114))
					var_46_4:addChild(var_46_31)

					local var_46_32 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_32:setColor(ccc3(237, 209, 169))

					local var_46_33 = CCStrokeLabelTTF:create(iter_46_1.lumberYardReformPlus.intro, "Thonburi-Bold", 20)

					var_46_33:setColor(ccc3(255, 218, 38))

					local var_46_34 = createRichNode({
						var_46_32,
						var_46_33
					}, 0)

					var_46_34:setPosition(ccp(15, 83))
					var_46_4:addChild(var_46_34)
				end
			elseif iter_46_1.lumberYardReform and (iter_46_1.lumberYardReform.canReform == 1 or iter_46_1.lumberYardReform.alreadyReform == 1) then
				local var_46_35 = tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.FIELD_TAG), "CCSprite")
				local var_46_36 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/build_upg_view.png")
				local var_46_37 = var_46_35:getPositionX()
				local var_46_38 = var_46_35:getPositionY()

				if iter_46_1.pos == 1 then
					var_46_38 = var_46_38 - 30
				elseif iter_46_1.pos == 4 then
					var_46_37 = var_46_37 - 60
				elseif iter_46_1.pos == 12 then
					var_46_37 = var_46_37 + 60
				end

				var_46_36:setPosition(ccp(var_46_37, var_46_38))
				var_46_1:addChild(var_46_36, 1000003, iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

				var_46_2 = 1

				if iter_46_1.lumberYardReform.canReform == 1 then
					local var_46_39 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_39:setColor(ccc3(237, 209, 169))
					var_46_39:setPosition(ccp(var_46_36:getContentSize().width / 2, var_46_36:getContentSize().height - 30))
					var_46_36:addChild(var_46_39)

					local var_46_40 = CCStrokeLabelTTF:create(language.get(85017) .. ":", "Thonburi-Bold", 20)

					var_46_40:setColor(ccc3(237, 209, 169))

					local var_46_41 = CCStrokeLabelTTF:create(" " .. iter_46_1.lv, "Thonburi-Bold", 20)

					if iter_46_1.lv < iter_46_1.lumberYardReform.needLv then
						var_46_41:setColor(ccc3(255, 0, 0))
					else
						var_46_41:setColor(ccc3(0, 255, 0))
					end

					local var_46_42 = CCStrokeLabelTTF:create("/" .. iter_46_1.lumberYardReform.needLv, "Thonburi-Bold", 20)

					var_46_42:setColor(ccc3(237, 209, 169))

					local var_46_43 = createRichNode({
						var_46_40,
						var_46_41,
						var_46_42
					}, 0)

					var_46_43:setPosition(ccp(15, 145))
					var_46_36:addChild(var_46_43)

					local var_46_44 = CCStrokeLabelTTF:create(language.get("223308_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_44:setColor(ccc3(237, 209, 169))

					local var_46_45 = CCStrokeLabelTTF:create(" " .. var_0_0.lumberYardReform.drawingNum, "Thonburi-Bold", 20)

					if var_0_0.lumberYardReform.drawingNum < iter_46_1.lumberYardReform.needDrawingNum then
						var_46_45:setColor(ccc3(255, 0, 0))
					else
						var_46_45:setColor(ccc3(0, 255, 0))
					end

					local var_46_46 = CCStrokeLabelTTF:create("/" .. iter_46_1.lumberYardReform.needDrawingNum, "Thonburi-Bold", 20)

					var_46_46:setColor(ccc3(237, 209, 169))

					local var_46_47 = createRichNode({
						var_46_44,
						var_46_45,
						var_46_46
					}, 0)

					var_46_47:setPosition(ccp(15, 114))
					var_46_36:addChild(var_46_47)

					local var_46_48 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_48:setColor(ccc3(237, 209, 169))

					local var_46_49 = CCStrokeLabelTTF:create(iter_46_1.lumberYardReform.intro, "Thonburi-Bold", 20)

					var_46_49:setColor(ccc3(255, 218, 38))

					local var_46_50 = createRichNode({
						var_46_48,
						var_46_49
					}, 0)

					var_46_50:setPosition(ccp(15, 83))
					var_46_36:addChild(var_46_50)

					local var_46_51 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
					local var_46_52 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
					local var_46_53 = CCMenuItemSprite:create(var_46_51, var_46_52)

					var_46_53:registerScriptTapHandler(var_0_0.luomuGaizaoSelected)
					var_46_53:setTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

					local var_46_54 = CCMenu:createWithItem(var_46_53)

					var_46_54:setPosition(ccp(var_46_36:getContentSize().width / 2, 37))
					var_46_36:addChild(var_46_54, 2)

					local var_46_55 = CCLabelTTF:create(language.get("223307_luomu"), "Thonburi", 24)

					var_46_55:setPosition(ccp(var_46_36:getContentSize().width / 2, 37))
					var_46_36:addChild(var_46_55, 3)
				else
					local var_46_56 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_56:setColor(ccc3(237, 209, 169))
					var_46_56:setPosition(ccp(var_46_36:getContentSize().width / 2, var_46_36:getContentSize().height - 30))
					var_46_36:addChild(var_46_56)

					local var_46_57 = CCStrokeLabelTTF:create(language.get("223311_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_57:setColor(ccc3(237, 209, 169))

					local var_46_58 = CCSprite:createWithSpriteFrameName("res_icon_2_small.png")
					local var_46_59 = CCStrokeLabelTTF:create(iter_46_1.output, "Thonburi-Bold", 20)

					if iter_46_1.resType == 2 then
						var_46_59:setString("0")
					end

					var_46_59:setColor(ccc3(237, 209, 169))

					local var_46_60 = CCSprite:createWithSpriteFrameName("res_icon_55.png")

					var_46_60:setScale(0.55)

					local var_46_61 = CCStrokeLabelTTF:create(iter_46_1.lumberYardReform.silkOuput, "Thonburi-Bold", 20)

					var_46_61:setColor(ccc3(237, 209, 169))

					local var_46_62 = createRichNode({
						var_46_57,
						var_46_58,
						var_46_59,
						var_46_60,
						var_46_61
					}, 0)

					var_46_62:setPosition(ccp(15, 145))
					var_46_36:addChild(var_46_62)

					local var_46_63 = CCStrokeLabelTTF:create(language.get("223312_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_63:setColor(ccc3(237, 209, 169))

					local var_46_64 = CCSprite:createWithSpriteFrameName("res_icon_55.png")

					var_46_64:setScale(0.55)

					local var_46_65 = CCStrokeLabelTTF:create(iter_46_1.outputSilk, "Thonburi-Bold", 20)

					var_46_65:setColor(ccc3(237, 209, 169))

					local var_46_66

					if iter_46_1.outputSilk == nil or iter_46_1.outputSilk <= 0 then
						var_46_65 = CCStrokeLabelTTF:create(language.get("223310_luomu"), "Thonburi-Bold", 20)
						var_46_66 = createRichNode({
							var_46_63,
							var_46_65
						}, 0)
					else
						var_46_66 = createRichNode({
							var_46_63,
							var_46_64,
							var_46_65
						}, 0)
					end

					var_46_66:setPosition(ccp(15, 114))
					var_46_36:addChild(var_46_66)

					local var_46_67 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_67:setColor(ccc3(237, 209, 169))

					local var_46_68 = CCStrokeLabelTTF:create(iter_46_1.lumberYardReform.intro, "Thonburi-Bold", 20)

					var_46_68:setColor(ccc3(255, 218, 38))

					local var_46_69 = createRichNode({
						var_46_67,
						var_46_68
					}, 0)

					var_46_69:setPosition(ccp(15, 83))
					var_46_36:addChild(var_46_69)
				end
			elseif iter_46_1.farmReform and (iter_46_1.farmReform.canReform == 1 or iter_46_1.farmReform.alreadyReform == 1) and not iter_46_1.mohistBuilding then
				local var_46_70 = tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.FIELD_TAG), "CCSprite")
				local var_46_71 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/build_upg_view.png")
				local var_46_72 = var_46_70:getPositionX()
				local var_46_73 = var_46_70:getPositionY()

				if iter_46_1.pos == 1 then
					var_46_73 = var_46_73 - 30
				elseif iter_46_1.pos == 4 then
					var_46_72 = var_46_72 - 60
				elseif iter_46_1.pos == 12 then
					var_46_72 = var_46_72 + 60
				end

				var_46_71:setPosition(ccp(var_46_72, var_46_73))
				var_46_1:addChild(var_46_71, 1000003, iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

				var_46_2 = 1

				if iter_46_1.farmReform.canReform == 1 then
					local var_46_74 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_74:setColor(ccc3(237, 209, 169))
					var_46_74:setPosition(ccp(var_46_71:getContentSize().width / 2, var_46_71:getContentSize().height - 30))
					var_46_71:addChild(var_46_74)

					local var_46_75 = CCStrokeLabelTTF:create(language.get(85017) .. ":", "Thonburi-Bold", 20)

					var_46_75:setColor(ccc3(237, 209, 169))

					local var_46_76 = CCStrokeLabelTTF:create(" " .. iter_46_1.lv, "Thonburi-Bold", 20)

					if iter_46_1.lv < iter_46_1.farmReform.needLv then
						var_46_76:setColor(ccc3(255, 0, 0))
					else
						var_46_76:setColor(ccc3(0, 255, 0))
					end

					local var_46_77 = CCStrokeLabelTTF:create("/" .. iter_46_1.farmReform.needLv, "Thonburi-Bold", 20)

					var_46_77:setColor(ccc3(237, 209, 169))

					local var_46_78 = createRichNode({
						var_46_75,
						var_46_76,
						var_46_77
					}, 0)

					var_46_78:setPosition(ccp(15, 145))
					var_46_71:addChild(var_46_78)

					local var_46_79 = CCStrokeLabelTTF:create(language.get("223308_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_79:setColor(ccc3(237, 209, 169))

					local var_46_80 = CCStrokeLabelTTF:create(" " .. var_0_0.farmReform.drawingNum, "Thonburi-Bold", 20)

					if var_0_0.farmReform.drawingNum < iter_46_1.farmReform.needDrawingNum then
						var_46_80:setColor(ccc3(255, 0, 0))
					else
						var_46_80:setColor(ccc3(0, 255, 0))
					end

					local var_46_81 = CCStrokeLabelTTF:create("/" .. iter_46_1.farmReform.needDrawingNum, "Thonburi-Bold", 20)

					var_46_81:setColor(ccc3(237, 209, 169))

					local var_46_82 = createRichNode({
						var_46_79,
						var_46_80,
						var_46_81
					}, 0)

					var_46_82:setPosition(ccp(15, 114))
					var_46_71:addChild(var_46_82)

					local var_46_83 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_83:setColor(ccc3(237, 209, 169))

					local var_46_84 = CCStrokeLabelTTF:create(iter_46_1.farmReform.intro, "Thonburi-Bold", 20)

					var_46_84:setColor(ccc3(255, 218, 38))

					local var_46_85 = createRichNode({
						var_46_83,
						var_46_84
					}, 0)

					var_46_85:setPosition(ccp(15, 83))
					var_46_71:addChild(var_46_85)

					local var_46_86 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
					local var_46_87 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
					local var_46_88 = CCMenuItemSprite:create(var_46_86, var_46_87)

					var_46_88:registerScriptTapHandler(var_0_0.majunGaizaoSelected)
					var_46_88:setTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

					local var_46_89 = CCMenu:createWithItem(var_46_88)

					var_46_89:setPosition(ccp(var_46_71:getContentSize().width / 2, 37))
					var_46_71:addChild(var_46_89, 2)

					local var_46_90 = CCLabelTTF:create(language.get("223307_luomu"), "Thonburi", 24)

					var_46_90:setPosition(ccp(var_46_71:getContentSize().width / 2, 37))
					var_46_71:addChild(var_46_90, 3)
				else
					local var_46_91 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_91:setColor(ccc3(237, 209, 169))
					var_46_91:setPosition(ccp(var_46_71:getContentSize().width / 2, var_46_71:getContentSize().height - 30))
					var_46_71:addChild(var_46_91)

					local var_46_92 = CCStrokeLabelTTF:create(language.get("223311_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_92:setColor(ccc3(237, 209, 169))

					local var_46_93 = CCSprite:createWithSpriteFrameName("res_icon_3.png")

					var_46_93:setScale(0.7)

					local var_46_94 = CCStrokeLabelTTF:create(iter_46_1.output, "Thonburi-Bold", 20)

					if iter_46_1.resType == 2 then
						var_46_94:setString("0")
					end

					var_46_94:setColor(ccc3(237, 209, 169))

					local var_46_95 = createRichNode({
						var_46_92,
						var_46_93,
						var_46_94
					}, 0)

					var_46_95:setPosition(ccp(15, 145))
					var_46_71:addChild(var_46_95)

					local var_46_96 = CCStrokeLabelTTF:create(language.get("223312_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_96:setColor(ccc3(237, 209, 169))

					local var_46_97 = CCSprite:createWithSpriteFrameName("res_icon_3.png")

					var_46_97:setScale(0.7)

					local var_46_98 = CCStrokeLabelTTF:create(iter_46_1.farmReform.foodOutput, "Thonburi-Bold", 20)

					var_46_98:setColor(ccc3(237, 209, 169))

					local var_46_99 = createRichNode({
						var_46_96,
						var_46_97,
						var_46_98
					}, 0)

					var_46_99:setPosition(ccp(15, 114))
					var_46_71:addChild(var_46_99)

					local var_46_100 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_100:setColor(ccc3(237, 209, 169))

					local var_46_101 = CCStrokeLabelTTF:create(iter_46_1.farmReform.intro, "Thonburi-Bold", 20)

					var_46_101:setColor(ccc3(255, 218, 38))

					local var_46_102 = createRichNode({
						var_46_100,
						var_46_101
					}, 0)

					var_46_102:setPosition(ccp(15, 83))
					var_46_71:addChild(var_46_102)

					local var_46_103 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
					local var_46_104 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
					local var_46_105 = CCMenuItemSprite:create(var_46_103, var_46_104)

					var_46_105:registerScriptTapHandler(var_0_0.shengjiItemSelected)
					var_46_105:setTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

					local var_46_106 = CCMenu:createWithItem(var_46_105)

					var_46_106:setPosition(ccp(var_46_71:getContentSize().width / 2, 37))
					var_46_71:addChild(var_46_106, 2)

					local var_46_107 = CCLabelTTF:create(language.get(160006), "Thonburi", 24)

					var_46_107:setPosition(ccp(var_46_71:getContentSize().width / 2, 37))
					var_46_71:addChild(var_46_107, 3)
				end
			elseif iter_46_1.mohistBuilding then
				local var_46_108 = tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.FIELD_TAG), "CCSprite")
				local var_46_109 = CCSprite:create("res/ui/resourceArea2/wood_gaizao/build_upg_view.png")
				local var_46_110 = var_46_108:getPositionX()
				local var_46_111 = var_46_108:getPositionY()

				if iter_46_1.pos == 1 then
					var_46_111 = var_46_111 - 30
				elseif iter_46_1.pos == 4 then
					var_46_110 = var_46_110 - 60
				elseif iter_46_1.pos == 12 then
					var_46_110 = var_46_110 + 60
				end

				var_46_109:setPosition(ccp(var_46_110, var_46_111))
				var_46_1:addChild(var_46_109, 1000003, iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

				var_46_2 = 1

				if iter_46_1.mohistBuilding.star < 3 then
					local var_46_112 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_112:setColor(ccc3(237, 209, 169))
					var_46_112:setPosition(ccp(var_46_109:getContentSize().width / 2, var_46_109:getContentSize().height - 30))
					var_46_109:addChild(var_46_112)

					for iter_46_3 = 1, 3 do
						local var_46_113 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star.png")

						if iter_46_3 > iter_46_1.mohistBuilding.star then
							var_46_113 = CCSprite:create("res/ui/resourceArea2/wood_gaizao2/mczgz_star_g.png")
						end

						var_46_113:setPosition(ccp(25 + (iter_46_3 - 1) * 25, 145))
						var_46_109:addChild(var_46_113)
					end

					local var_46_114 = CCStrokeLabelTTF:create(language.get("223308_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_114:setColor(ccc3(237, 209, 169))

					local var_46_115 = CCStrokeLabelTTF:create(" " .. user.mojia.mohistDrawingNum, "Thonburi-Bold", 20)

					if user.mojia.mohistDrawingNum < iter_46_1.mohistBuilding.needDrawingNum then
						var_46_115:setColor(ccc3(255, 0, 0))
					else
						var_46_115:setColor(ccc3(0, 255, 0))
					end

					local var_46_116 = CCStrokeLabelTTF:create("/" .. iter_46_1.mohistBuilding.needDrawingNum, "Thonburi-Bold", 20)

					var_46_116:setColor(ccc3(237, 209, 169))

					local var_46_117 = createRichNode({
						var_46_114,
						var_46_115,
						var_46_116
					}, 0)

					var_46_117:setPosition(ccp(15, 114))
					var_46_109:addChild(var_46_117)

					local var_46_118 = CCStrokeLabelTTF:create(language.get("223309_luomu") .. ":", "Thonburi-Bold", 20)

					var_46_118:setColor(ccc3(237, 209, 169))

					local var_46_119 = CCStrokeLabelTTF:create(iter_46_1.mohistBuilding.intro, "Thonburi-Bold", 20)

					var_46_119:setColor(ccc3(255, 218, 38))

					local var_46_120 = createRichNode({
						var_46_118,
						var_46_119
					}, 0)

					var_46_120:setPosition(ccp(15, 83))
					var_46_109:addChild(var_46_120)

					local var_46_121 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
					local var_46_122 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
					local var_46_123 = CCMenuItemSprite:create(var_46_121, var_46_122)

					var_46_123:registerScriptTapHandler(var_0_0.mojiaGaizaoSelected)
					var_46_123:setTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

					local var_46_124 = CCMenu:createWithItem(var_46_123)

					var_46_124:setPosition(ccp(var_46_109:getContentSize().width / 2, 37))
					var_46_109:addChild(var_46_124, 2)

					local var_46_125 = CCLabelTTF:create(language.get("223307_luomu"), "Thonburi", 24)

					var_46_125:setPosition(ccp(var_46_109:getContentSize().width / 2, 37))
					var_46_109:addChild(var_46_125, 3)
				else
					local var_46_126 = CCStrokeLabelTTF:create(iter_46_1.name, "Thonburi-Bold", 24)

					var_46_126:setColor(ccc3(237, 209, 169))
					var_46_126:setPosition(ccp(var_46_109:getContentSize().width / 2, var_46_109:getContentSize().height - 30))
					var_46_109:addChild(var_46_126)

					local var_46_127 = language.get(217412, iter_46_1.output)

					if iter_46_1.resType ~= 1 then
						var_46_127 = language.get(217413, iter_46_1.output)
					end

					local var_46_128 = CCStrokeLabelTTF:create(var_46_127, "Thonburi-Bold", 20)

					var_46_128:setColor(ccc3(237, 209, 169))
					var_46_128:setPosition(ccp(var_46_109:getContentSize().width / 2, var_46_109:getContentSize().height - 64))
					var_46_109:addChild(var_46_128)
				end
			else
				local var_46_129 = tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.FIELD_TAG), "CCSprite")
				local var_46_130 = CCSprite:create("res/ui/resourceArea2/build_upg_view.png")
				local var_46_131 = var_46_129:getPositionX()
				local var_46_132 = var_46_129:getPositionY() + var_46_130:getContentSize().height / 2

				if iter_46_1.pos == 1 then
					var_46_132 = var_46_132 - 30
				end

				var_46_130:setPosition(ccp(var_46_131, var_46_132))

				local var_46_133 = CCSprite:createWithSpriteFrameName("btn2_gre_a.png")
				local var_46_134 = CCSprite:createWithSpriteFrameName("btn2_gre_c.png")
				local var_46_135 = CCMenuItemSprite:create(var_46_133, var_46_134)

				var_46_135:registerScriptTapHandler(var_0_0.shengjiItemSelected)
				var_46_135:setTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

				local var_46_136 = CCMenu:createWithItem(var_46_135)

				var_46_136:setPosition(cccp(var_46_130:getContentSize().width / 2 + 45, var_46_130:getContentSize().height / 2 + 24, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_136, 2)

				local var_46_137 = CCLabelTTF:create(language.get(160006), "Thonburi", 24)

				var_46_137:setPosition(cccp(var_46_130:getContentSize().width / 2 + 45, var_46_130:getContentSize().height / 2 + 24, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_137, 3)

				local var_46_138 = CCLabelTTF:create(iter_46_1.name, "Thonburi", 20, CCSizeMake(autoPositionX(80), 50), kCCTextAlignmentLeft)

				var_46_138:setPosition(cccp(var_46_130:getContentSize().width / 2 - 75, 40, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_138)

				local var_46_139 = string.format("Lv.%.f", iter_46_1.lv)
				local var_46_140 = CCLabelTTF:create(var_46_139, "Thonburi", 20, CCSizeMake(autoPositionX(80), 50), kCCTextAlignmentRight)

				var_46_140:setPosition(cccp(var_46_130:getContentSize().width / 2 + 75, 40, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_140)

				local var_46_141 = CCLabelTTF:create(iter_46_1.yinbiCost, "Thonburi", 20, CCSizeMake(autoPositionX(80), 50), kCCTextAlignmentLeft)

				var_46_141:setPosition(cccp(var_46_130:getContentSize().width / 2 - 35, 80, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_141)

				local var_46_142 = CCLabelTTF:create(iter_46_1.mucaiCost, "Thonburi", 20, CCSizeMake(autoPositionX(80), 50), kCCTextAlignmentLeft)

				var_46_142:setPosition(cccp(var_46_130:getContentSize().width / 2 - 35, 110, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_142)

				local var_46_143 = CCSprite:createWithSpriteFrameName("res_icon_1_small.png")

				var_46_143:setPosition(cccp(var_46_130:getContentSize().width / 2 - 100, 70, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_143)

				local var_46_144 = CCSprite:createWithSpriteFrameName("res_icon_2_small.png")

				var_46_144:setPosition(cccp(var_46_130:getContentSize().width / 2 - 100, 100, var_46_130:getContentSize().height))
				var_46_130:addChild(var_46_144)
				var_46_1:addChild(var_46_130, 1000003, iter_46_1.id + var_0_1.UPGRADELABEL_TAG)

				var_46_2 = 1

				if guide.constant.other[2] == true then
					guide.constant.other[2] = false

					guide.ui.setVisible(false)

					guide.constant.other[4] = true
				end

				if guide.constant.other[4] == true then
					guide.control.loadGuide(5, 4)
				end
			end
		end

		if var_46_2 == 0 then
			local var_46_145 = tolua.cast(var_46_1:getChildByTag(iter_46_1.id + var_0_1.UPGRADELABEL_TAG), "CCSprite")

			if var_46_145 then
				var_46_1:removeChild(var_46_145, true)
				guide.ui.setVisible(false)
			end
		end
	end

	for iter_46_4, iter_46_5 in pairs(var_0_0.buildingDeveloperTable) do
		if not LayerTransparentCheck:ifTransparent(iter_46_5.id + var_0_1.FIELD_TAG, var_46_0, var_46_1) then
			if iter_46_5.type == 1 and iter_46_5.copper ~= nil and iter_46_5.copper > 0 then
				local var_46_146 = language.get(160007, iter_46_5.copper)

				messageBox.confirm(var_46_146, function()
					cmgr.sendRequest(var_0_0.handleBuildingDeveloperInfo, actions.openBluePrint, iter_46_5.id)
				end)
			elseif iter_46_5.type == 2 then
				smgr.showTipText(iter_46_5.tips)
			elseif iter_46_5.type == 3 then
				cmgr.sendRequest(var_0_0.handleBuildingDeveloperInfo, actions.consBluePrint, iter_46_5.id)
			elseif iter_46_5.type == 4 then
				-- block empty
			end
		end
	end
end

function var_0_0.onTouch(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_0 == CCTOUCHBEGAN then
		return var_0_19(arg_48_1, arg_48_2)
	end
end

function var_0_0.addGuide()
	if resourceAreaConstant.RESOURCE_AREA_TYPE == 1 and guide.constant.other[2] == true then
		guide.control.loadGuide(5, 2)
	end

	if guide.constant.other[1] == true then
		guide.control.loadGuide(5, 1)
	end
end

function var_0_0.delGuide()
	if resourceAreaConstant.RESOURCE_AREA_TYPE == 1 and guide.constant.other[2] == true then
		guide.ui.setVisible(false)
	end

	if resourceAreaConstant.RESOURCE_AREA_TYPE == 2 and guide.constant.other[3] == true then
		guide.ui.setVisible(false)
	end
end

function var_0_0.game_exit()
	var_0_0.buildingTable = {}
	var_0_0.buildingDeveloperTable = {}
	var_0_0.freeConsNum = 0
	var_0_0.additionMode = 0
	var_0_0.totalOutput = 0
	var_0_0.buildingWorks = {}
	var_0_0.totalWorkAmount = 0
	var_0_0.workAmount = 0
	var_0_0.tempWorksTable = {}
	var_0_0.autoTimes = 0
	var_0_0.ifStartAutoUp = false
	var_0_0.forceExpandTaskBoard = false
	var_0_0.upgradeFinishedTable = {}
	var_0_0.lastBuildingTable = nil
	var_0_0.ifWaitingForRefresh = false
	var_0_0.upgradeCdTable = {}
	var_0_0.upgradingBuildingTable = {}
	var_0_0.jiasuTapTime = 0
	var_0_0.jiasuBIDTable = {}
	var_0_0.hasBandit = nil
	var_0_0.goldHammer_flash = true

	if var_0_0.upgradeTimeScheduleEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.upgradeTimeScheduleEntry)

		var_0_0.upgradeTimeScheduleEntry = nil
	end

	var_0_0.needRefreshObject = {}
	var_0_0.flyExp = 0
	var_0_0.jiasuX = 0
	var_0_0.jiasuY = 0
	var_0_0.additionCd = nil
end

function var_0_0.moveSingle(arg_52_0, arg_52_1)
	if arg_52_0 then
		local var_52_0, var_52_1 = arg_52_0:getPosition()

		print(visibleSize.width - var_52_0, visibleSize.height - var_52_1)

		if arg_52_1 == true then
			local var_52_2 = CCMoveTo:create(0.3, ccp(var_52_0 + 300, var_52_1))

			arg_52_0:runAction(var_52_2)
		else
			local var_52_3 = CCMoveTo:create(0.3, ccp(var_52_0 - 300, var_52_1))

			arg_52_0:runAction(var_52_3)
		end
	end
end

function var_0_0.CrossMenuClicked(arg_53_0)
	print(arg_53_0)
	var_0_0.moveSingle(resourceAreaUI.uiTable.outputValueLabel, arg_53_0)
	var_0_0.moveSingle(resourceAreaUI.uiTable.additionMode, arg_53_0)
	var_0_0.moveSingle(resourceAreaUI.uiTable.resourceIcon, arg_53_0)
	var_0_0.moveSingle(resourceAreaUI.uiTable.outputUnit, arg_53_0)
	var_0_0.moveSingle(resourceAreaUI.uiTable.outputSprite, arg_53_0)
end

function var_0_0.doEvent(arg_54_0)
	return
end

function var_0_0.handlerPushMohistAction(arg_55_0)
	local var_55_0 = arg_55_0.action.data.update

	if var_55_0.reformDone and (var_55_0.reformDone.buildingId and false or var_55_0.reformDone.bios) then
		roleDialogue.control.loadSpeak("moJiaBuild7")
	end

	if var_55_0.completeInfo and var_55_0.completeInfo.allOver then
		var_0_0.isRemove = true

		smgr.changeScene(SCENE_MAIN_CITY)
		roleDialogue.control.loadSpeak("moJiaBuild2")
	end

	if var_55_0.mohistDrawing then
		user.mojia.mohistDrawingNum = var_55_0.mohistDrawing.drawingNum
	end
end

function var_0_0.onEnter(arg_56_0)
	var_0_0.isRemove = false

	menuUI.ui.show()
	log.info("enter resource area layer  ... ")
	cmgr.registerResponseHandler(actions.pushBuilding, var_0_5)
	cmgr.registerResponseHandler(actions.pushPlayer, var_0_9)
	cmgr.registerResponseHandler(actions.pushLumberReform, var_0_10)
	eventManager.registerEvent("updateConstruction", resourceAreaUI.updateConstruction)
	eventManager.registerEvent("refreshResourceAreaLayer", var_0_0.getBuildingInfo)
	eventManager.registerEvent("roleDialogue_dialogue_130", resourceAreaUI.action_flyAutoUpgradeMenu)
	eventManager.registerEvent("resourceAreaDidGetPic", var_0_0.getBuildingInfo)
	eventManager.registerEvent("GameOver", var_0_0.game_exit)
	eventManager.registerEvent("CrossMenuClicked", var_0_0.CrossMenuClicked)
	eventManager.registerEvent("zhwnWindowClose", var_0_0.getBuildingInfo)
	eventManager.registerEvent("refreshMuchang", var_0_0.getBuildingInfo)
	cmgr.registerResponseHandler(actions.pushMohist, var_0_0.handlerPushMohistAction)

	var_0_0.upgradeTimeScheduleEntry = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_3, 1, false)

	playerInfoUI.show()
	var_0_0.addGuide()
end

function var_0_0.onExit(arg_57_0)
	log.info("exit resource area layer  ... ")
	cmgr.unregisterResponseHandler(actions.pushBuilding, var_0_5)
	cmgr.unregisterResponseHandler(actions.pushPlayer, var_0_9)
	cmgr.unregisterResponseHandler(actions.pushLumberReform, var_0_10)
	eventManager.unregisterEvent("updateConstruction", resourceAreaUI.updateConstruction)
	eventManager.unregisterEvent("refreshResourceAreaLayer", var_0_0.getBuildingInfo)
	eventManager.unregisterEvent("roleDialogue_dialogue_130", resourceAreaUI.action_flyAutoUpgradeMenu)
	eventManager.unregisterEvent("resourceAreaDidGetPic", var_0_0.getBuildingInfo)
	eventManager.unregisterEvent("GameOver", var_0_0.game_exit)
	eventManager.unregisterEvent("CrossMenuClicked", var_0_0.CrossMenuClicked)
	eventManager.unregisterEvent("zhwnWindowClose", var_0_0.getBuildingInfo)
	eventManager.unregisterEvent("refreshMuchang", var_0_0.getBuildingInfo)
	cmgr.unregisterResponseHandler(actions.pushMohist, var_0_0.handlerPushMohistAction)

	if var_0_0.upgradeTimeScheduleEntry then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(var_0_0.upgradeTimeScheduleEntry)

		var_0_0.upgradeTimeScheduleEntry = nil
	end

	var_0_0.delGuide()
end
