worldThumbnailControl = {}

local var_0_0 = worldThumbnailControl

var_0_0.generalTable = {}

local var_0_1
local var_0_2 = false
local var_0_3 = 20

var_0_0.thumbnailIsVisible = false
var_0_0.updateSchedulerEntry = nil

local function var_0_4(arg_1_0, arg_1_1)
	if worldControl.lock then
		eventManager.dispatchEvent("conveneOnTap", arg_1_0, arg_1_1)
		eventManager.dispatchEvent("eventWindowOnTap", arg_1_0, arg_1_1)

		return false
	end

	if var_0_0.thumbnailIsVisible == true then
		if not tolua.isnull(worldThumbnailUI.batchUiTable.thumbnail) and tool.checkIfTouch(worldThumbnailUI.batchUiTable.thumbnail, arg_1_0, arg_1_1) then
			var_0_2 = true

			worldThumbnailUI.shotAt(arg_1_0, arg_1_1)
		else
			var_0_2 = false
		end
	end

	var_0_1 = ccp(arg_1_0, arg_1_1)

	return true
end

local function var_0_5(arg_2_0, arg_2_1)
	if var_0_0.thumbnailIsVisible == true and var_0_2 == true then
		worldThumbnailUI.shotAt(arg_2_0, arg_2_1)
	end
end

local function var_0_6(arg_3_0, arg_3_1)
	if var_0_0.thumbnailIsVisible == true then
		if var_0_2 == true then
			worldThumbnailUI.shotAt(arg_3_0, arg_3_1)
		else
			if ccpDistance(var_0_1, ccp(arg_3_0, arg_3_1)) > var_0_3 then
				return
			end

			local var_3_0 = 0

			for iter_3_0, iter_3_1 in pairs(var_0_0.generalTable) do
				if not tolua.isnull(iter_3_1.sprite) and tool.checkIfTouch(iter_3_1.sprite, arg_3_0, arg_3_1) then
					var_3_0 = var_3_0 + 1
				end
			end

			if var_3_0 == 1 then
				for iter_3_2, iter_3_3 in pairs(var_0_0.generalTable) do
					if tool.checkIfTouch(iter_3_3.sprite, arg_3_0, arg_3_1) then
						iter_3_3.highlight:setVisible(true)
						log.info("general %s at %s", iter_3_3.info.generalId, iter_3_3.info.generalLocationId)
						worldThumbnailUI.showLocationAt(iter_3_3.info.generalLocationId)

						worldControl.generalId = iter_3_3.info.generalId
					else
						iter_3_3.highlight:setVisible(false)
					end
				end
			end
		end

		if not tolua.isnull(worldThumbnailUI.uiTable.thumbnailButton) and tool.checkIfTouch(worldThumbnailUI.uiTable.thumbnailButton, arg_3_0, arg_3_1) then
			var_0_0.thumbnailIsVisible = not var_0_0.thumbnailIsVisible

			worldThumbnailUI.setThumbnailVisible(var_0_0.thumbnailIsVisible)
			eventManager.dispatchEvent("sideGeneralSetVisible", not var_0_0.thumbnailIsVisible)
			eventManager.dispatchEvent("taskButtonItemSetVisible", not var_0_0.thumbnailIsVisible)

			return
		end
	else
		if ccpDistance(var_0_1, ccp(arg_3_0, arg_3_1)) > var_0_3 then
			return
		end

		if not tolua.isnull(worldThumbnailUI.uiTable.thumbnailButton) and tool.checkIfTouch(worldThumbnailUI.uiTable.thumbnailButton, arg_3_0, arg_3_1) then
			var_0_0.thumbnailIsVisible = not var_0_0.thumbnailIsVisible

			worldThumbnailUI.setThumbnailVisible(var_0_0.thumbnailIsVisible)
			eventManager.dispatchEvent("sideGeneralSetVisible", not var_0_0.thumbnailIsVisible)
			eventManager.dispatchEvent("taskButtonItemSetVisible", not var_0_0.thumbnailIsVisible)
			eventManager.dispatchEvent("cityWindowOnTap", 0, 0)

			return
		end

		local var_3_1 = eventManager.dispatchEvent("hourRankOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("cityEventOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("manzuTaskBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("kfyzRebuildBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("silkPowerBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("castleBuildBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("castleShowPeopleBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("castleLeftBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("castleRightBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("feudBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("forceEventBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("newInvestBtnOnTap", arg_3_0, arg_3_1) and eventManager.dispatchEvent("cityWindowOnTap", arg_3_0, arg_3_1)

		if var_3_1 == nil or var_3_1 == true then
			var_0_0.C.onTap(arg_3_0, arg_3_1)
		end
	end
end

function var_0_0.onTouch(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0 == CCTOUCHBEGAN then
		return var_0_4(arg_4_1, arg_4_2)
	elseif arg_4_0 == CCTOUCHMOVED then
		return var_0_5(arg_4_1, arg_4_2)
	else
		return var_0_6(arg_4_1, arg_4_2)
	end
end

local function var_0_7(arg_5_0)
	if arg_5_0.action.state == 1 then
		var_0_0.military = arg_5_0.action.data.military

		worldThumbnailUI.initMilitaryUI()
	end
end

function var_0_0.getGeneralSimpleInfo()
	cmgr.sendRequest(var_0_7, actions.generalSimpleInfo)
end

local function var_0_8(arg_7_0)
	if loadingLayer.visible then
		return
	end

	if var_0_0.thumbnailIsVisible and arg_7_0.action.data.general.update == "set" then
		for iter_7_0, iter_7_1 in pairs(arg_7_0.action.data.general.military) do
			if iter_7_1.isDeputy and iter_7_1.isDeputy == true then
				log.info("control.handlPushGeneral 收到副将消息！！")
			else
				log.info("change info %s", "general_" .. iter_7_1.generalId)

				if iter_7_1.generalLocationId then
					var_0_0.generalTable["general_" .. iter_7_1.generalId].info.generalLocationId = iter_7_1.generalLocationId

					if var_0_0.generalTable["general_" .. iter_7_1.generalId].highlight and not tolua.isnull(var_0_0.generalTable["general_" .. iter_7_1.generalId].highlight) and var_0_0.generalTable["general_" .. iter_7_1.generalId].highlight:isVisible() and iter_7_1.generalLocationId then
						worldThumbnailUI.showLocationAt(iter_7_1.generalLocationId)
					end
				end
			end
		end
	end
end

local function var_0_9(arg_8_0)
	local var_8_0 = arg_8_0.action.data

	if var_8_0.residueNum > 0 then
		worldThumbnailUI.otherUiTable.totalLabel:setVisible(true)
		worldThumbnailUI.leftTimeLabel:setVisible(false)
		worldThumbnailUI.otherUiTable.drawButton:setEnabled(true)
	else
		worldThumbnailUI.otherUiTable.totalLabel:setVisible(false)
		worldThumbnailUI.leftTimeLabel:setVisible(true)
		worldThumbnailUI.leftTimeLabel:setTime(var_8_0.ms)
		worldThumbnailUI.otherUiTable.drawButton:setEnabled(false)
	end

	local var_8_1 = arg_8_0.action.data.silver or 0
	local var_8_2 = arg_8_0.action.data.iron or 0

	worldThumbnailUI.otherUiTable.rewardSilver:setVisible(true)

	local var_8_3 = visibleSize.width / 2
	local var_8_4 = visibleSize.height / 2

	if var_8_2 == 0 then
		worldThumbnailUI.otherUiTable.rewardIron:setVisible(false)
		worldThumbnailUI.otherUiTable.rewardSilver:setPosition(ccp(var_8_3 - 433 + 45, var_8_4 - 87 + 15))
	else
		worldThumbnailUI.otherUiTable.rewardIron:setVisible(true)
		worldThumbnailUI.otherUiTable.rewardSilver:setPosition(ccp(var_8_3 - 433, var_8_4 - 87 + 15))
	end

	worldThumbnailUI.otherUiTable.rewardSilverNum:setString(tostring(var_8_1))
	worldThumbnailUI.otherUiTable.rewardIronNum:setString(tostring(var_8_2))
	worldThumbnailUI.otherUiTable.totalLabel:setString(var_8_0.residueNum .. "/" .. var_8_0.max .. "")
	user.welfare.setWelfare("countryRewardNum", var_8_0.residueNum)
end

local function var_0_10(arg_9_0)
	local var_9_0 = arg_9_0.action.data.rewards
	local var_9_1 = {}

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		var_9_1[iter_9_0] = {}
		var_9_1[iter_9_0].id = iter_9_1.type
		var_9_1[iter_9_0].value = iter_9_1.value
	end

	globalAction_gotResource(var_9_1)
	cmgr.sendRequest(var_0_9, actions.worldGetRewardInfo)
end

function var_0_0.drawCountryReward()
	cmgr.sendRequest(var_0_10, actions.worldCountryReward)
end

function var_0_0.getRewardInfo()
	cmgr.sendRequest(var_0_9, actions.worldGetRewardInfo)
end

function var_0_0.CrossMenuClicked(arg_12_0)
	local var_12_0, var_12_1 = worldThumbnailUI.uiTable.thumbnailButton:getPosition()

	if arg_12_0 == true then
		local var_12_2 = CCMoveTo:create(0.3, ccp(var_12_0 + 100, var_12_1))

		worldThumbnailUI.uiTable.thumbnailButton:runAction(var_12_2)
	else
		local var_12_3 = CCMoveTo:create(0.3, ccp(var_12_0 - 100, var_12_1))

		worldThumbnailUI.uiTable.thumbnailButton:runAction(var_12_3)
	end
end

function var_0_0.onEnter()
	cmgr.registerResponseHandler(actions.pusGeneral, var_0_8)
	eventManager.registerEvent("setThumbnailFire", worldThumbnailUI.setThumbnailFire)
	eventManager.registerEvent("setThumbnailPointBelong", worldThumbnailUI.setThumbnailPointBelong)
	eventManager.registerEvent("CrossMenuClicked", var_0_0.CrossMenuClicked)
	eventManager.registerEvent("juntuanFlag", worldThumbnailUI.showJuntuanLocationAt)
end

function var_0_0.onExit()
	cmgr.unregisterResponseHandler(actions.pusGeneral, var_0_8)
	eventManager.unregisterEvent("setThumbnailFire", worldThumbnailUI.setThumbnailFire)
	eventManager.unregisterEvent("setThumbnailPointBelong", worldThumbnailUI.setThumbnailPointBelong)
	eventManager.unregisterEvent("CrossMenuClicked", var_0_0.CrossMenuClicked)
	eventManager.unregisterEvent("juntuanFlag", worldThumbnailUI.showJuntuanLocationAt)
end
