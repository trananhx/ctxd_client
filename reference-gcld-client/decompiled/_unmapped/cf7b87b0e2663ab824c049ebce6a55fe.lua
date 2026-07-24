jailControl = {}

local var_0_0 = jailControl

var_0_0.jailData = {}

local var_0_1 = false
local var_0_2 = 0
local var_0_3 = 200
local var_0_4 = 5

function var_0_0.onEnter()
	var_0_2 = 0

	jailUI.resetFlag()
end

function var_0_0.onExit()
	return
end

function var_0_0.onTouch(arg_3_0, arg_3_1, arg_3_2)
	var_0_0.tryLash = var_0_0.tryLash or {}

	if arg_3_0 == CCTOUCHBEGAN then
		log.info("CCTOUCH_BEGAN", arg_3_1, arg_3_2)

		for iter_3_0 = 1, 10 do
			local var_3_0 = tolua.cast(jailUI.uiTable["work" .. iter_3_0], "CCSprite")

			if tool.checkIfTouch(var_3_0, arg_3_1, arg_3_2) then
				var_0_2 = iter_3_0

				local var_3_1 = var_0_2 <= 5
				local var_3_2 = var_3_1 and var_0_3 or var_0_4

				if var_3_1 then
					if iter_3_0 <= var_0_0.jailData.prisonLv and var_0_0.jailData.plainWorks[iter_3_0].status == 1 then
						var_3_0:setPositionY(var_3_2 + 5)
					else
						var_0_2 = 0
					end
				elseif var_0_2 - 5 <= var_0_0.jailData.lashLv and var_0_0.jailData.forceWorks[var_0_2 - 5].status == 1 then
					var_3_0:setPositionY(var_3_2 + 5)
				elseif var_0_0.tryLash[var_0_2 - 5] then
					var_3_0:setPositionY(var_3_2 + 5)
					jailUI.uiTable["node_normal" .. var_0_2 - 5]:setVisible(false)
					jailUI.uiTable["node_touched" .. var_0_2 - 5]:setVisible(true)
				else
					var_0_2 = 0
				end

				return true
			end
		end

		return false
	elseif arg_3_0 == CCTOUCHMOVED then
		log.info("CCTOUCH_MOVED", arg_3_1, arg_3_2)

		local var_3_3 = tolua.cast(jailUI.uiTable["work" .. var_0_2], "CCSprite")

		if var_3_3 and not tool.checkIfTouch(var_3_3, arg_3_1, arg_3_2) then
			local var_3_4 = var_0_2 <= 5
			local var_3_5 = var_3_4 and var_0_3 or var_0_4

			var_3_3:setPositionY(var_3_5)

			if not var_3_4 and var_0_0.tryLash[var_0_2 - 5] then
				jailUI.uiTable["node_normal" .. var_0_2 - 5]:setVisible(true)
				jailUI.uiTable["node_touched" .. var_0_2 - 5]:setVisible(false)
			end

			return false
		end

		return true
	elseif arg_3_0 == CCTOUCHENDED then
		log.info("CCTOUCH_ENDED", arg_3_1, arg_3_2)

		local var_3_6 = tolua.cast(jailUI.uiTable["work" .. var_0_2], "CCSprite")

		if tool.checkIfTouch(var_3_6, arg_3_1, arg_3_2) then
			local var_3_7 = var_0_2 <= 5
			local var_3_8 = var_3_7 and var_0_3 or var_0_4

			var_3_6:setPositionY(var_3_8)

			if var_3_7 then
				var_0_0.slavePlainWork(var_0_2)
			elseif var_0_2 - 5 <= var_0_0.jailData.lashLv and var_0_0.jailData.forceWorks[var_0_2 - 5].status == 1 then
				var_0_0.slaveForceWork(var_0_2 - 5)
			elseif var_0_0.tryLash[var_0_2 - 5] then
				jailUI.uiTable["node_normal" .. var_0_2 - 5]:setVisible(true)
				jailUI.uiTable["node_touched" .. var_0_2 - 5]:setVisible(false)

				if var_0_0.jailData.forceWorks[var_0_2 - 5].status == 1 then
					var_0_0.slaveForceWork(var_0_2 - 5)
				else
					jailUI.handleLashUpgradeButtonTap(var_0_2 - 5, var_0_0.jailData.forceWorks[var_0_2 - 5].upGold)
				end
			end

			return true
		end

		return false
	end
end

function var_0_0.handlerSlaveGetSlaveInfoAction(arg_4_0)
	local var_4_0 = 0

	if arg_4_0.action.data.generals and #arg_4_0.action.data.generals > 0 then
		for iter_4_0, iter_4_1 in pairs(arg_4_0.action.data.generals) do
			if iter_4_1.lashTimes == 0 then
				var_4_0 = var_4_0 + 1
			end
		end

		user.welfare.setWelfare("slaveNum", var_4_0)

		local function var_4_1(arg_5_0, arg_5_1)
			return arg_5_0.lashTimes < arg_5_1.lashTimes
		end

		table.sort(arg_4_0.action.data.generals, var_4_1)
	end

	var_0_0.jailData = arg_4_0.action.data
	var_0_0.jailData.freeToLashCount = var_4_0

	jailUI.updateJailUi(arg_4_0.action.data)
end

function var_0_0.slaveGetSlaveInfo()
	cmgr.sendRequest(var_0_0.handlerSlaveGetSlaveInfoAction, actions.slaveGetSlaveInfo, "")
end

function var_0_0.slaveInvestCopper(arg_7_0)
	local function var_7_0(arg_8_0)
		if arg_8_0.action.state == 1 then
			var_0_0.slaveGetSlaveInfo()

			if arg_7_0 == 1 then
				jailUI.showInvestCopperEffect(1)
			elseif arg_7_0 == 2 then
				jailUI.showInvestCopperEffect(5)
			end
		end
	end

	cmgr.sendRequest(var_7_0, actions.slaveInvestCopper, arg_7_0)
end

function var_0_0.handlerSlaveMakeCellAction(arg_9_0)
	if arg_9_0.action.state == 1 then
		var_0_0.slaveGetSlaveInfo()
	end
end

function var_0_0.slaveMakeCell()
	cmgr.sendRequest(var_0_0.handlerSlaveMakeCellAction, actions.slaveMakeCell)
end

function var_0_0.handlerSlaveUpdateLimboAction(arg_11_0)
	if arg_11_0.action.state == 1 then
		jailUI.showUpgradeEffect()
		var_0_0.slaveGetSlaveInfo()
	end
end

function var_0_0.slaveUpdateLimbo()
	cmgr.sendRequest(var_0_0.handlerSlaveUpdateLimboAction, actions.slaveUpdateLimbo)
end

function var_0_0.handlerSlaveUpdateLashLvAction(arg_13_0)
	local var_13_0 = CCSprite:create("res/ui/general/jailView/jail_flog_upgrade.png")

	var_13_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
	smgr.showTipSpriteText(var_13_0)
	var_0_0.slaveGetSlaveInfo()
end

function var_0_0.slaveUpdateLashLv(arg_14_0)
	cmgr.sendRequest(var_0_0.handlerSlaveUpdateLashLvAction, actions.slaveUpdateLashLv, arg_14_0)
end

function var_0_0.slaveUseInTrail(arg_15_0)
	local function var_15_0(arg_16_0)
		if arg_16_0.action.state == 1 then
			local var_16_0 = CCSprite:create("res/ui/general/jailView/jail_sysx.png")

			var_16_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
			smgr.showTipSpriteText(var_16_0)
			var_0_0.slaveGetSlaveInfo()
		end
	end

	cmgr.sendRequest(var_15_0, actions.slaveUseInTrail, arg_15_0)
end

function var_0_0.slaveFreeInTaril()
	local function var_17_0(arg_18_0)
		if arg_18_0.action.state == 1 then
			local var_18_0 = CCSprite:create("res/ui/general/jailView/jail_sysx.png")

			var_18_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 60))
			smgr.showTipSpriteText(var_18_0)
			var_0_0.slaveGetSlaveInfo()
		end
	end

	cmgr.sendRequest(var_17_0, actions.slaveFreeInTaril)
end

function var_0_0.slavePlainWork(arg_19_0)
	local function var_19_0(arg_20_0)
		jailUI.showWorkEffect(false, arg_20_0.action.data.exp)
	end

	cmgr.sendRequest(var_19_0, actions.slavePlainWork, arg_19_0)
end

function var_0_0.slaveForceWork(arg_21_0)
	local function var_21_0(arg_22_0)
		jailUI.showWorkEffect(true, arg_22_0.action.data.exp)
	end

	cmgr.sendRequest(var_21_0, actions.slaveForceWork, arg_21_0)
end

function var_0_0.slaveLashPlayer(arg_23_0)
	jailUI.uiTable.node_arrow:setVisible(false)

	local function var_23_0(arg_24_0)
		jailUI.showLashEffect(function()
			jailUI.uiTable.player:setDisplayFrame(CCSprite:create("res/ui/general/jailView/new/lf_qf2.png"):displayFrame())

			local var_25_0 = CCArray:create()

			var_25_0:addObject(CCDelayTime:create(0.5))
			var_25_0:addObject(CCCallFuncN:create(function()
				var_0_0.slaveGetSlaveInfo()
			end))
			jailUI.uiTable.player:runAction(CCSequence:create(var_25_0))
		end)

		local var_24_0 = {
			{}
		}

		var_24_0[1].id = 6
		var_24_0[1].value = arg_24_0.action.data.exp

		globalAction_gotResource(var_24_0)
	end

	cmgr.sendRequest(var_23_0, actions.slaveLashPlayer, arg_23_0)
end
