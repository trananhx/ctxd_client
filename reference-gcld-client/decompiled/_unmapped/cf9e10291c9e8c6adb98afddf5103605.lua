empire.control = {}
empire.data = {}

function empire.control.receive_applyBuilding(arg_1_0)
	if arg_1_0.action.state == 1 then
		empire.control.request_officerBuildingInfo()

		if arg_1_0.action.data.message ~= nil then
			smgr.showTipText(arg_1_0.action.data.message)
		end
	end
end

function empire.control.receive_officerBuildingInfo(arg_2_0)
	if arg_2_0.action.state == 1 then
		empire.data.buildings = {}
		empire.data.myBuildingId = arg_2_0.action.data.myBuildingId
		empire.data.myOfficerName = arg_2_0.action.data.myOfficerName

		empire.ui.updateBuildingInfo(arg_2_0.action.data.buildings)
		empire.ui.updateHeadFrame(empire.data.myBuildingId)

		empire.data.resourceAddition = arg_2_0.action.data.resourceAddition

		empire.ui.showTips()

		if empire.ui.isFirstTimeEnter == true then
			empire.ui.isFirstTimeEnter = false

			empire.ui.switchMyPosition()
		end
	end
end

function empire.control.request_officerBuildingInfo()
	cmgr.sendRequest(empire.control.receive_officerBuildingInfo, actions.getEmpireInfo)
end

function empire.control.clicked_zhanling()
	bmgr.tryEnterBattle(battleType.BATTLE_OCCUPY, {
		terrain = 0,
		targetId = empire.ui.currentSelectBuilding
	})
end

function empire.control.clicked_shenqing()
	cmgr.sendRequest(empire.control.receive_applyBuilding, actions.applyBuilding, empire.ui.currentSelectBuilding)
	empire.ui.table.info_bg:setVisible(false)
end

function empire.control.clicked_xiangqing()
	rankInfoUI.show(2)
	empire.ui.table.info_bg:setVisible(false)
end

function empire.control.receive_operate(arg_7_0)
	if arg_7_0.action.state == 1 then
		local var_7_0 = arg_7_0.action.data

		empire.data.canOccupy = var_7_0.canOccupy
		empire.data.canQuit = var_7_0.canQuit
		empire.data.canApply = var_7_0.canApply

		empire.ui.updateClickInfo(empire.ui.currentSelectBuilding)
	end
end

function empire.control.request_operate()
	cmgr.sendRequest(empire.control.receive_operate, actions.getOperation, empire.ui.currentSelectBuilding)
end

function empire.control.receive_drop(arg_9_0)
	if arg_9_0.action.state == 1 then
		empire.control.request_officerBuildingInfo()
	end
end

function empire.control.request_drop()
	cmgr.sendRequest(empire.control.receive_drop, actions.officerDrop, empire.ui.currentSelectBuilding)
	empire.ui.table.info_bg:setVisible(false)
end

function empire.control.receive_applyInfo(arg_11_0)
	if arg_11_0.action.state == 1 then
		local var_11_0 = arg_11_0.action.data

		empire.data.applyInfo = var_11_0.list

		empire.ui.showTips()
	end
end

function empire.control.request_applyInfo()
	cmgr.sendRequest(empire.control.receive_applyInfo, actions.getApplyList, 1)
end

function empire.control.receive_tick(arg_13_0)
	if arg_13_0.action.state == 1 then
		empire.control.request_officerBuildingInfo()
		empire.control.request_applyInfo()
	end
end

function empire.control.click_tick(arg_14_0)
	local var_14_0 = empire.data.applyInfo[arg_14_0].playerId

	cmgr.sendRequest(empire.control.receive_tick, actions.kickMember, var_14_0)
end

local var_0_0 = 1
local var_0_1 = 0

local function var_0_2(arg_15_0)
	log.info("secondCount:%s", var_0_1)

	if empire.ui.pageIndex == 0 and var_0_0 == 1 then
		var_0_1 = var_0_1 + 1

		log.info("secondCount:%s", var_0_1)

		if var_0_1 >= 3 then
			var_0_0 = 0

			local var_15_0 = empire.ui.table.layer
			local var_15_1 = CCCallFuncN:create(function(arg_16_0)
				local var_16_0 = tolua.cast(arg_16_0, "CCSprite")

				var_15_0:removeChild(var_16_0, true)
			end)
			local var_15_2 = tool.spriteByName("fubenDituShouzhi.PNG")

			var_15_2:setPosition(ccp(visibleSize.width * 940 / 960 - platform.getSafeDistance(), 396))
			var_15_0:addChild(var_15_2, 102)

			local var_15_3 = CCSprite:create("res/ui/empire/off_guide_next.png")

			var_15_3:setPosition(ccp(visibleSize.width * 860 / 960 - platform.getSafeDistance(), 458))
			var_15_0:addChild(var_15_3, 101)

			local var_15_4 = CCArray:create()

			var_15_4:addObject(CCDelayTime:create(0.3))
			var_15_4:addObject(CCCallFuncN:create(function(arg_17_0)
				var_15_2:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi1.PNG"))
			end))
			var_15_4:addObject(CCMoveBy:create(0.8, ccp(-175, 0)))
			var_15_4:addObject(CCDelayTime:create(0.3))
			var_15_4:addObject(CCCallFuncN:create(function(arg_18_0)
				var_15_2:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi.PNG"))
				var_15_2:setPosition(ccp(visibleSize.width * 940 / 960 - platform.getSafeDistance(), 396))
			end))
			var_15_4:addObject(CCDelayTime:create(0.3))
			var_15_4:addObject(CCCallFuncN:create(function(arg_19_0)
				var_15_2:setDisplayFrame(tool.spriteFrameByName("fubenDituShouzhi1.PNG"))
			end))
			var_15_4:addObject(CCMoveBy:create(0.8, ccp(-175, 0)))
			var_15_4:addObject(CCDelayTime:create(0.3))
			var_15_4:addObject(CCCallFuncN:create(function(arg_20_0)
				var_15_0:removeChild(var_15_3, true)
			end))
			var_15_4:addObject(var_15_1)

			local var_15_5 = CCSequence:create(var_15_4)

			var_15_2:runAction(var_15_5)

			var_0_0 = 0
			var_0_1 = 2
		end
	elseif empire.ui.pageIndex == 0 and var_0_0 == 0 then
		var_0_1 = var_0_1 - 1

		if var_0_1 <= 0 then
			var_0_0 = 1
		end
	end
end

function empire.control.onEnter()
	empire.control.updateEntityId = CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(var_0_2, 1, false)

	rmgr.loadResource("res/ui/instance/instanceMap.plist")
end

function empire.control.onExit()
	if empire.control.updateEntityId then
		CCDirector:sharedDirector():getScheduler():unscheduleScriptEntry(empire.control.updateEntityId)

		empire.control.updateEntityId = nil
	end
end
