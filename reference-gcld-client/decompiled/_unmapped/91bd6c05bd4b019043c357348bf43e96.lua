farmControl = {}

local var_0_0 = farmControl

function var_0_0.getFarmInfo()
	local function var_1_0(arg_2_0)
		log.info("handlerGetFarmInfoAction")
		farmUI.updateFarmArea(arg_2_0.action.data)
	end

	local function var_1_1(arg_3_0)
		log.info("handlerGetFarmInfoAction2")
		farmUI.updateFarmArea(arg_3_0.action.data, 2)
		cmgr.sendRequest(var_1_0, actions.farmGetInfo)
	end

	log.info("getFarmInfo!!!!!!!")
	cmgr.sendRequest(var_1_1, actions.farmLbGetInfo)
end

function var_0_0.showTextSpriteWithType(arg_4_0)
	if arg_4_0 == 2 then
		local var_4_0 = CCSprite:create("res/ui/farm/ttq_sta_gao.png")
		local var_4_1 = CCSprite:create("res/ui/farm/ttq_sta_slbsx.png")

		var_4_1:addChild(var_4_0)
		var_4_0:setPosition(ccp(-35, 36))
		var_4_1:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))
		smgr.showTipSpriteText(var_4_1)
	elseif arg_4_0 == 3 then
		local var_4_2 = CCSprite:create("res/ui/farm/ttq_sta_ji.png")
		local var_4_3 = CCSprite:create("res/ui/farm/ttq_sta_slbsx.png")

		var_4_3:addChild(var_4_2)
		var_4_2:setPosition(ccp(-35, 36))
		var_4_3:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5 - 50))
		smgr.showTipSpriteText(var_4_3)
	end
end

function var_0_0.showTextSpriteWithTypeTha(arg_5_0)
	if arg_5_0 == 2 then
		local var_5_0 = CCSprite:create("res/ui/farm/ttq_sta_gao.png")
		local var_5_1 = CCSprite:create("res/ui/farm/ttq_sta_slbsx.png")

		var_5_0:setAnchorPoint(ccp(0, 0.5))
		var_5_0:setPosition(ccp(var_5_1:getContentSize().width - 50, var_5_1:getContentSize().height / 2))
		var_5_1:addChild(var_5_0)
		var_5_1:setPosition(ccp(visibleSize.width * 0.45, visibleSize.height * 0.5 - 50))
		smgr.showTipSpriteText(var_5_1)
	elseif arg_5_0 == 3 then
		local var_5_2 = CCSprite:create("res/ui/farm/ttq_sta_ji.png")
		local var_5_3 = CCSprite:create("res/ui/farm/ttq_sta_slbsx.png")

		var_5_2:setAnchorPoint(ccp(0, 0.5))
		var_5_2:setPosition(ccp(var_5_3:getContentSize().width, var_5_3:getContentSize().height / 2))
		var_5_3:addChild(var_5_2)
		var_5_3:setPosition(ccp(visibleSize.width * 0.4, visibleSize.height * 0.5 - 50))
		smgr.showTipSpriteText(var_5_3)
	end
end

function var_0_0.farmStartAll(arg_6_0)
	local function var_6_0(arg_7_0)
		showTable(arg_7_0)
		var_0_0.getFarmInfo()
	end

	cmgr.sendRequest(var_6_0, actions.farmStartAll, arg_6_0)
end

function var_0_0.farmStart(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		var_0_0.getFarmInfo()
	end

	cmgr.sendRequest(var_8_0, actions.farmStart, arg_8_0, arg_8_1)
end

function var_0_0.farmStopAll()
	local function var_10_0(arg_11_0)
		local var_11_0 = {}

		for iter_11_0 = 1, #arg_11_0.action.data.rewards do
			if arg_11_0.action.data.rewards[iter_11_0].foodReward and arg_11_0.action.data.rewards[iter_11_0].foodReward > 0 then
				var_11_0[#var_11_0 + 1] = {
					id = 3,
					value = arg_11_0.action.data.rewards[iter_11_0].foodReward
				}
			end

			if arg_11_0.action.data.rewards[iter_11_0].chiefExpReward and arg_11_0.action.data.rewards[iter_11_0].chiefExpReward > 0 then
				var_11_0[#var_11_0 + 1] = {
					id = 6,
					value = arg_11_0.action.data.rewards[iter_11_0].chiefExpReward
				}
			end
		end

		globalAction_gotResource(var_11_0)

		for iter_11_1, iter_11_2 in pairs(farmUI.farmInfo.generals) do
			if iter_11_2.playerId == user.player.id and iter_11_2.type and iter_11_2.type > 1 and iter_11_2.type < 5 then
				var_0_0.farmAutoMove(iter_11_2)
			end
		end

		var_0_0.getFarmInfo()
	end

	cmgr.sendRequest(var_10_0, actions.farmStopAll)
end

function var_0_0.farmAutoMove(arg_12_0)
	local function var_12_0(arg_13_0)
		log.info("general say somthing ......")
		var_0_0.getFarmInfo()
	end

	local var_12_1 = {
		123,
		19,
		207
	}

	cmgr.sendRequest(var_12_0, actions.autoMove, var_12_1[arg_12_0.forceId], arg_12_0.generalId)
end

function var_0_0.farmStop(arg_14_0)
	local function var_14_0(arg_15_0)
		local var_15_0 = {
			{}
		}

		if arg_15_0.action.data.type == 0 then
			var_15_0[1].id = 3
		else
			var_15_0[1].id = 6
		end

		var_15_0[1].value = arg_15_0.action.data.reward

		globalAction_gotResource(var_15_0)
		var_0_0.getFarmInfo()
	end

	cmgr.sendRequest(var_14_0, actions.farmStop, arg_14_0)
end

function var_0_0.farmGetReward(arg_16_0)
	local function var_16_0(arg_17_0)
		local var_17_0 = {}

		if arg_17_0.action.data.foodReward and arg_17_0.action.data.foodReward > 0 then
			var_17_0[#var_17_0 + 1] = {
				id = 3,
				value = arg_17_0.action.data.foodReward
			}
		end

		if arg_17_0.action.data.chiefExpReward and arg_17_0.action.data.chiefExpReward > 0 then
			var_17_0[#var_17_0 + 1] = {
				id = 6,
				value = arg_17_0.action.data.chiefExpReward
			}
		end

		globalAction_gotResource(var_17_0)

		for iter_17_0, iter_17_1 in pairs(farmUI.farmInfo.generals) do
			if iter_17_1.playerId == user.player.id and iter_17_1.generalId == arg_16_0 then
				if iter_17_1.type and iter_17_1.type > 1 and iter_17_1.type < 5 then
					var_0_0.farmAutoMove(iter_17_1)
				end

				break
			end
		end

		var_0_0.getFarmInfo()
	end

	log.info("generalId", arg_16_0)
	cmgr.sendRequest(var_16_0, actions.farmGetReward, arg_16_0)
end

function var_0_0.onEnter()
	return
end

function var_0_0.onExit()
	return
end
