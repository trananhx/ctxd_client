require("lua/layer/playerInfo2/ui")

local var_0_0 = class("activityTab", function()
	return createBaseLayer()
end)

function var_0_0.ctor(arg_2_0, arg_2_1)
	arg_2_0.actTag = arg_2_1
	arg_2_0.uidata = require("lua/layer/activity/activityTab/uidata").new(arg_2_1)
	arg_2_0.control = require("lua/layer/activity/activityTab/control").new(arg_2_0)

	arg_2_0.control:getActivityInfo()
	arg_2_0:registerScriptTouchHandler(function(arg_3_0, arg_3_1, arg_3_2)
		return arg_2_0.control:onTouch(arg_3_0, arg_3_1, arg_3_2)
	end)
	arg_2_0:setTouchEnabled(true)

	function arg_2_0.onEnter()
		arg_2_0.control:onEnter()
	end

	function arg_2_0.onExit()
		arg_2_0.control:onExit()
	end

	local var_2_0

	for iter_2_0, iter_2_1 in pairs(activityConstant.TYPES) do
		if iter_2_1.tag == arg_2_1 then
			var_2_0 = iter_2_1
		end
	end

	if user.newActivity and var_2_0 then
		local var_2_1

		for iter_2_2, iter_2_3 in pairs(user.newActivity) do
			if var_2_0.id == iter_2_3 then
				var_2_1 = iter_2_2
			end
		end

		if var_2_1 then
			table.remove(user.newActivity, var_2_1)
			log.info("user.newActivity", unpack(user.newActivity))
			eventManager.dispatchEvent("refreshActivityNotice")
		end
	end
end

function var_0_0.init(arg_6_0)
	local function var_6_0(arg_7_0, arg_7_1)
		local var_7_0, var_7_1 = arg_7_1:getPosition()

		arg_7_1:setPosition(ccp(var_7_0 - 20, var_7_1))

		local var_7_2 = arg_7_0 / 1000

		if var_7_2 < 3600 then
			arg_7_1:setString("")

			local var_7_3 = createTimerLabel(var_7_2 * 1000, language.get(131003), "Thonburi", 22, nil, nil, nil, ccc3(255, 0, 0))

			arg_7_1:addChild(var_7_3)
		elseif var_7_2 < 86400 then
			local var_7_4 = var_7_2 / 3600

			arg_7_1:setString(language.get(131001, tool.toint(var_7_4)))
		else
			local var_7_5 = var_7_2 / 3600 / 24

			arg_7_1:setString(language.get(131002, tool.toint(var_7_5)))
		end
	end

	arg_6_0:removeAllChildrenWithCleanup(true)

	arg_6_0.uiTable = autoUI.initUI(arg_6_0, arg_6_0.uidata:getData())

	local var_6_1 = arg_6_0.actTag

	if var_6_1 == activityConstant.TYPES.ACTIVITY_LV_EXP.tag then
		if arg_6_0.control.data.reward == true then
			arg_6_0.uiTable.actRewardTrue:setVisible(true)
			arg_6_0.uiTable.actRewardFalse:setVisible(false)
			arg_6_0.uiTable.actDesc:setString(language.get(131004, arg_6_0.control.data.curLv, arg_6_0.control.data.addLvExp / 10000))
			arg_6_0.uiTable.actDrawReward:registerScriptTapHandler(function()
				arg_6_0.control:expDrawReward()
			end)
		else
			arg_6_0.uiTable.actRewardTrue:setVisible(false)
			arg_6_0.uiTable.actRewardFalse:setVisible(true)
			var_6_0(arg_6_0.control.data.leftTime, arg_6_0.uiTable.actLefttime)
			arg_6_0.uiTable.actRewardExp:setString(tool.toint(arg_6_0.control.data.addLvExp / 10000))

			local var_6_2 = 1 * (arg_6_0.control.data.curLv - arg_6_0.control.data.startLv) / (arg_6_0.control.data.targetLv - arg_6_0.control.data.startLv)

			if var_6_2 > 1 then
				var_6_2 = 1
			end

			if var_6_2 < 0 then
				var_6_2 = 0
			end

			arg_6_0.uiTable.actExpBar:setPercentage(100 * var_6_2)
			arg_6_0.uiTable.actCurArrow:setPosition(ccp(363 + var_6_2 * 468, 340))
			arg_6_0.uiTable.actCurLv:setString("Lv." .. arg_6_0.control.data.curLv)
			arg_6_0.uiTable.actStartLv:setString("Lv." .. arg_6_0.control.data.startLv)
			arg_6_0.uiTable.actEndLv:setString("Lv." .. arg_6_0.control.data.targetLv)

			local var_6_3 = false

			for iter_6_0, iter_6_1 in pairs(arg_6_0.control.data.lvExps) do
				arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_0]:setVisible(true)

				if iter_6_1.targetLv > arg_6_0.control.data.curLv then
					arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_0]:setDisplayFrame(tool.spriteFrameByName("acti_icon_unfini.png"))

					if not var_6_3 then
						arg_6_0.uiTable["actNeed_" .. iter_6_0]:setString(language.get(131005, tool.tofloat(iter_6_1.targetLv - arg_6_0.control.data.curLv, 3)))
						arg_6_0.uiTable["actNeed_" .. iter_6_0]:setVisible(true)

						var_6_3 = true
					end
				end

				arg_6_0.uiTable["actRewardDesc_" .. iter_6_0]:setString(language.get(131006, iter_6_1.targetLv))

				local var_6_4 = iter_6_1.addLvExp >= 10000 and iter_6_1.addLvExp / 10000 or iter_6_1.addLvExp

				arg_6_0.uiTable["actRewardExp_" .. iter_6_0]:setString(tool.toint(var_6_4))

				if iter_6_1.addLvExp < 10000 then
					arg_6_0.uiTable["actRewardExpWan_" .. iter_6_0]:setVisible(false)
				end
			end
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_IRON.tag then
		var_6_0(arg_6_0.control.data.cd, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actSurplus:setString(arg_6_0.control.data.remainIron)
		arg_6_0.uiTable.tipItem:registerScriptTapHandler(function()
			local var_9_0 = CCLayerColor:create(ccc4(255, 255, 255, 0))

			var_9_0:registerScriptTouchHandler(function(arg_10_0, arg_10_1, arg_10_2)
				if arg_10_0 == CCTOUCHBEGAN then
					return true
				elseif arg_10_0 == CCTOUCHMOVED then
					return true
				elseif arg_10_0 == CCTOUCHENDED then
					var_9_0:removeFromParentAndCleanup(true)

					return true
				end
			end, false, true)
			var_9_0:setTouchEnabled(true)
			autoUI.createUI(var_9_0, getIronActDescData(), {})
			smgr.rootLayer:addChild(var_9_0, 60000)
		end)

		local var_6_5 = 1 * arg_6_0.control.data.todayIron / arg_6_0.control.data.maxIron

		if var_6_5 > 1 then
			var_6_5 = 1
		end

		arg_6_0.uiTable.actIronBar:setPercentage(100 * var_6_5)
		arg_6_0.uiTable.actCurArrow:setPosition(ccp(363 + var_6_5 * 354, 340))

		local var_6_6 = arg_6_0.control.data.rewardValues == 0 and "" or language.get(131007, arg_6_0.control.data.rewardValues)

		arg_6_0.uiTable.actCurIron:setString(var_6_6)
		arg_6_0.uiTable.actDrawIron:setVisible(arg_6_0.control.data.rewardTimes ~= 0)
		arg_6_0.uiTable.actDrawIron:registerScriptTapHandler(function()
			arg_6_0.control:ironDrawReward()
		end)

		for iter_6_2, iter_6_3 in pairs(arg_6_0.control.data.lvs) do
			arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_2]:setVisible(true)

			if iter_6_2 >= arg_6_0.control.data.lv then
				arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_2]:setDisplayFrame(tool.spriteFrameByName("acti_icon_unfini.png"))
			end

			if arg_6_0.control.data.lv == iter_6_2 then
				arg_6_0.uiTable["actNeed_" .. iter_6_2]:setVisible(true)
				arg_6_0.uiTable["actNeed_" .. iter_6_2]:setString(language.get(131008, arg_6_0.control.data.needIron))
			end

			arg_6_0.uiTable["actRewardDesc_" .. iter_6_2]:setString(language.get(131009, iter_6_3.iron))
			arg_6_0.uiTable["actRewardIron_" .. iter_6_2]:setString(iter_6_3.rewardIron)
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_QUENCHING.tag then
		var_6_0(arg_6_0.control.data.leftTime, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actGoToQuenching:registerScriptTapHandler(function()
			local var_12_0 = smgr.getLayer("topLayer")
			local var_12_1 = smgr.getLayer("activityLayer")

			var_12_0:removeChild(var_12_1, true)
			equipmentUI.show(4)
		end)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DRAGON.tag then
		var_6_0(arg_6_0.control.data.cd, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actDragonNum1:setString("x" .. arg_6_0.control.data.occupyNum)
		arg_6_0.uiTable.actDragonNum2:setString("x" .. arg_6_0.control.data.assistNum)
		arg_6_0.uiTable.actDragonNum3:setString("x" .. arg_6_0.control.data.cheerNum)
		arg_6_0.uiTable.actDesc:setString(language.get(131010, arg_6_0.control.data.todayNum))

		local var_6_7 = 1 * arg_6_0.control.data.todayNum / arg_6_0.control.data.maxNum

		if var_6_7 > 1 then
			var_6_7 = 1
		end

		arg_6_0.uiTable.actDragonBar:setPercentage(100 * var_6_7)
		arg_6_0.uiTable.actCurArrow:setPosition(ccp(338 + var_6_7 * 468, 355))
		arg_6_0.uiTable.actDragonMulti:setString(arg_6_0.control.data.dragonNum)

		for iter_6_4, iter_6_5 in pairs(arg_6_0.control.data.lvs) do
			if iter_6_4 >= arg_6_0.control.data.lv then
				arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_4]:setDisplayFrame(tool.spriteFrameByName("acti_icon_unfini.png"))
			end

			if arg_6_0.control.data.lv == iter_6_4 then
				arg_6_0.uiTable["actNeed_" .. iter_6_4]:setVisible(true)
				arg_6_0.uiTable["actNeed_" .. iter_6_4]:setString(language.get(131011, arg_6_0.control.data.needNum))
			end

			arg_6_0.uiTable["actRewardDesc_" .. iter_6_4]:setString(language.get(131012, iter_6_5.num))
			arg_6_0.uiTable["actDragonRewardNum_" .. iter_6_4]:setString(iter_6_5.rewardNum)
		end

		local var_6_8 = CCArray:create()

		for iter_6_6 = 1, 19 do
			var_6_8:addObject(tool.spriteFrameByName(string.format("web_shine%04d.png", iter_6_6)))
		end

		local var_6_9 = CCAnimation:createWithSpriteFrames(var_6_8, 0.1)
		local var_6_10 = CCAnimate:create(var_6_9)

		arg_6_0.uiTable.actBox:runAction(CCRepeatForever:create(var_6_10))
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DSTQ.tag then
		var_6_0(arg_6_0.control.data.day, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actDstqNum1:setString(language.get(131013, arg_6_0.control.data.remainingDstq1))
		arg_6_0.uiTable.actDstqNum2:setString(language.get(131014, arg_6_0.control.data.remainingDstq2))
		arg_6_0.uiTable.actDesc:setString(language.get(131015, arg_6_0.control.data.gold))
		arg_6_0.uiTable.actDesc:setDimensions(CCSizeMake(350, 0))
		arg_6_0.uiTable.actGoToInstance:registerScriptTapHandler(function()
			menuUI.ui.clickedFuben()

			local var_13_0 = smgr.getLayer("activityLayer")

			smgr.getLayer("topLayer"):removeChild(var_13_0, true)
		end)

		for iter_6_7, iter_6_8 in pairs(arg_6_0.control.data.lvs) do
			if iter_6_7 >= arg_6_0.control.data.lv then
				arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_7]:setDisplayFrame(tool.spriteFrameByName("acti_icon_unfini.png"))
			end

			if arg_6_0.control.data.lv == iter_6_7 then
				arg_6_0.uiTable["actNeed_" .. iter_6_7]:setVisible(true)
				arg_6_0.uiTable["actNeed_" .. iter_6_7]:setString(language.get(131016, arg_6_0.control.data.needGold))
			end

			arg_6_0.uiTable["actRewardDesc_" .. iter_6_7]:setString(language.get(131017, iter_6_8.gold))
			arg_6_0.uiTable["actRewardDstq_" .. iter_6_7]:setString(iter_6_8.rewardDstq)
			arg_6_0.uiTable["actRewardDesc2_" .. iter_6_7]:setString(iter_6_8.type == 1 and language.get(131018) or language.get(131019))
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_51.tag then
		local var_6_11 = arg_6_0.control.data.addExp > 0 and arg_6_0.control.data.addExp or 1

		arg_6_0.uiTable.act51Pic:setDisplayFrame(tool.spriteFrameByName("acti_jyjc_" .. var_6_11 .. "0.png"))
		arg_6_0.uiTable.actDesc:setString(language.get(131020, arg_6_0.control.data.condition))

		if arg_6_0.control.data.addExp == 0 then
			arg_6_0.uiTable.actDrawReward:setEnabled(false)
			arg_6_0.uiTable.actDrawReward:setVisible(false)
		end

		arg_6_0.uiTable.actDrawReward:registerScriptTapHandler(function()
			arg_6_0.control:act51DrawReward()
		end)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TICKET.tag then
		var_6_0(arg_6_0.control.data.day, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actSurplus:setString(arg_6_0.control.data.remainingTicket)
		arg_6_0.uiTable.actTotalPay:setString(language.get(131021, arg_6_0.control.data.gold))
		arg_6_0.uiTable.actPay:registerScriptTapHandler(function()
			playerInfo2.ui.show(2)
		end)

		for iter_6_9, iter_6_10 in pairs(arg_6_0.control.data.lvs) do
			arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_9]:setVisible(true)

			if iter_6_9 >= arg_6_0.control.data.lv then
				arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_9]:setDisplayFrame(tool.spriteFrameByName("acti_icon_unfini.png"))
			end

			if arg_6_0.control.data.lv == iter_6_9 and conf.language ~= "vie" then
				arg_6_0.uiTable["actNeed_" .. iter_6_9]:setVisible(true)
				arg_6_0.uiTable["actNeed_" .. iter_6_9]:setString(language.get(131016, arg_6_0.control.data.needGold))
			end

			if conf.language == "kr" then
				arg_6_0.uiTable["actRewardDesc_" .. iter_6_9]:setString(string.format("%s금화 충전시", iter_6_10.gold))
			else
				arg_6_0.uiTable["actRewardDesc_" .. iter_6_9]:setString(language.get(131017, iter_6_10.gold))
			end

			if iter_6_10.rewardTicket > 0 then
				arg_6_0.uiTable["icon_ticket_" .. iter_6_9]:setVisible(true)
				arg_6_0.uiTable["actRewardTicket_" .. iter_6_9]:setVisible(true)
				arg_6_0.uiTable["actRewardTicket_" .. iter_6_9]:setString(iter_6_10.rewardTicket)
			elseif iter_6_10.rewardToken > 0 then
				arg_6_0.uiTable["icon_token_" .. iter_6_9]:setVisible(true)
				arg_6_0.uiTable["actRewardToken_" .. iter_6_9]:setVisible(true)
			end
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_PAY.tag then
		var_6_0(arg_6_0.control.data.day, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actSurplus:setString(arg_6_0.control.data.remainingGold)
		arg_6_0.uiTable.actTotalPay:setString(language.get(131021, arg_6_0.control.data.gold))
		arg_6_0.uiTable.actPay:registerScriptTapHandler(function()
			playerInfo2.ui.show(2)
		end)

		for iter_6_11, iter_6_12 in pairs(arg_6_0.control.data.lvs) do
			arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_11]:setVisible(true)

			if iter_6_11 >= arg_6_0.control.data.lv then
				arg_6_0.uiTable["actRewardStateIcon_" .. iter_6_11]:setDisplayFrame(tool.spriteFrameByName("acti_icon_unfini.png"))
			end

			if arg_6_0.control.data.lv == iter_6_11 then
				arg_6_0.uiTable["actNeed_" .. iter_6_11]:setVisible(true)
				arg_6_0.uiTable["actNeed_" .. iter_6_11]:setString(language.get(131016, arg_6_0.control.data.needGold))
			end

			if conf.language == "kr" then
				arg_6_0.uiTable["actRewardDesc_" .. iter_6_11]:setString(string.format("%s금화 충전시", iter_6_12.gold))
			else
				arg_6_0.uiTable["actRewardDesc_" .. iter_6_11]:setString(language.get(131017, iter_6_12.gold))
			end

			arg_6_0.uiTable["actRewardGold_" .. iter_6_11]:setString(iter_6_12.rewardGold)
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_7DAY_LOGIN.tag then
		local var_6_12 = {}

		if conf.language == "tha" then
			var_6_12.unitY = -10
		else
			var_6_12.unitY = 0
		end

		local var_6_13 = {}

		var_6_13["2"] = "res/ui/activity/weekActivity/acti_icon_wood.png"
		var_6_13["19"] = "res_icon_19.png"
		var_6_13["3"] = "res/ui/activity/weekActivity/acti_icon_food.png"
		var_6_13["1"] = "res_icon_1.png"
		var_6_13["102"] = "res/ui/activity/weekActivity/acti_icon_jb.png"
		var_6_13["40"] = "res/ui/activity/weekActivity/acti_icon_hjc.png"
		var_6_13["24"] = "res/ui/activity/weekActivity/acti_icon_dstq.png"
		var_6_13["100001"] = "res/ui/activity/weekActivity/acti_icon_mucailing.png"
		var_6_13["100002"] = "res/ui/activity/weekActivity/acti_icon_yinbiling.png"
		var_6_13["100003"] = "res/ui/activity/weekActivity/acti_icon_liangshiling.png"
		var_6_13["100004"] = "res/ui/activity/weekActivity/acti_icon_bingyingling.png"
		var_6_13["100005"] = "res/ui/activity/weekActivity/acti_icon_wuqi.png"
		var_6_13["42"] = "res/ui/activity/weekActivity/acti_icon_mubingling.png"

		local var_6_14 = arg_6_0.uiTable.awardsBg
		local var_6_15 = 5
		local var_6_16 = 92
		local var_6_17 = 5
		local var_6_18 = 15
		local var_6_19 = #arg_6_0.control.data.days / var_6_15 * (var_6_16 + var_6_18) + var_6_18
		local var_6_20 = var_6_14:getContentSize()
		local var_6_21 = var_6_20.width
		local var_6_22 = var_6_20.height
		local var_6_23 = createBaseLayer()
		local var_6_24 = CCScrollView:create(CCSizeMake(var_6_21 - 2 * var_6_17, var_6_22 - 2 * var_6_17))

		var_6_24:setContainer(var_6_23)
		var_6_24:setPosition(ccp(var_6_17, var_6_17))
		var_6_24:setContentSize(CCSizeMake(var_6_21, var_6_19))
		var_6_24:setDirection(kCCScrollViewDirectionVertical)
		var_6_24:setBounceable(true)
		var_6_24:setContentOffset(var_6_24:minContainerOffset())

		arg_6_0.uiTable.scrollView = var_6_24

		arg_6_0.uiTable.awardsBg:addChild(var_6_24, 1)
		log.info("连续登陆奖励领取情况: ")

		for iter_6_13 = 1, #arg_6_0.control.data.days do
			local var_6_25 = arg_6_0.control.data.days[iter_6_13]

			print("--> ", iter_6_13, var_6_25.rewardObtained)

			local var_6_26 = (iter_6_13 - 1) % var_6_15
			local var_6_27 = math.modf((iter_6_13 - 1) / var_6_15)
			local var_6_28 = arg_6_0.control.data.days[iter_6_13].rewards
			local var_6_29 = 1

			if var_6_28[1].type == 102 or var_6_28[1].type == 40 or var_6_28[1].type == 24 or var_6_28[1].type == 42 or var_6_28[1].type >= 100001 and var_6_28[1].type <= 100005 then
				var_6_29 = 2
			elseif var_6_28[1].type == 19 then
				var_6_29 = 3
			end

			local var_6_30

			if iter_6_13 < arg_6_0.control.data.createDay then
				var_6_30 = GraySprite:create("res/ui/activity/weekActivity/acti_lxdl_item_bg_" .. tostring(var_6_29) .. ".png")
			else
				var_6_30 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_item_bg_" .. tostring(var_6_29) .. ".png")
			end

			arg_6_0.uiTable["item" .. tostring(iter_6_13)] = var_6_30

			var_6_30:setPosition(ccp(var_6_26 * (var_6_16 + var_6_18) + var_6_18, var_6_19 - var_6_27 * (var_6_16 + var_6_18) - var_6_18))
			var_6_30:setAnchorPoint(ccp(0, 1))

			if #var_6_28 == 1 then
				local var_6_31 = var_6_28[1].type
				local var_6_32

				if var_6_31 == 2 or var_6_31 == 3 or var_6_31 == 102 or var_6_31 == 40 or var_6_31 == 24 or var_6_31 == 42 or var_6_31 >= 100001 and var_6_31 <= 100005 then
					if iter_6_13 < arg_6_0.control.data.createDay then
						var_6_32 = GraySprite:create(var_6_13["" .. var_6_31])
					else
						var_6_32 = CCSprite:create(var_6_13["" .. var_6_31])
					end
				elseif var_6_31 == 19 then
					local var_6_33 = var_6_28[1].value

					if var_6_33 <= 10 then
						if iter_6_13 < arg_6_0.control.data.createDay then
							var_6_32 = GraySprite:createWithSpriteFrameName(var_6_13["" .. var_6_31])
						else
							var_6_32 = CCSprite:createWithSpriteFrameName(var_6_13["" .. var_6_31])
						end
					elseif var_6_33 < 20 then
						if iter_6_13 < arg_6_0.control.data.createDay then
							var_6_32 = GraySprite:create("res/ui/activity/weekActivity/acti_icon_gold_2.png")
						else
							var_6_32 = CCSprite:create("res/ui/activity/weekActivity/acti_icon_gold_2.png")
						end
					elseif iter_6_13 < arg_6_0.control.data.createDay then
						var_6_32 = GraySprite:create("res/ui/activity/weekActivity/acti_icon_gold_3.png")
					else
						var_6_32 = CCSprite:create("res/ui/activity/weekActivity/acti_icon_gold_3.png")
					end
				elseif iter_6_13 < arg_6_0.control.data.createDay then
					var_6_32 = GraySprite:createWithSpriteFrameName(var_6_13["1"])
				else
					var_6_32 = CCSprite:createWithSpriteFrameName(var_6_13["1"])
				end

				var_6_32:setPosition(ccp(var_6_16 / 2, var_6_16 / 2))
				var_6_30:addChild(var_6_32)

				local var_6_34 = CCLabelAtlas:create(tostring(iter_6_13), "res/ui/common/number/icon_numb.png", 19, 23, 48)

				var_6_34:setPosition(ccp(10, 10))
				var_6_34:setAnchorPoint(ccp(0.5, 0.5))
				var_6_30:addChild(var_6_34)
				var_6_34:setScale(0.75)

				local var_6_35 = arg_6_0.control.data.days[iter_6_13].rewards[1].value
				local var_6_36 = false

				if var_6_35 >= 10000 then
					var_6_35 = math.floor(var_6_35 / 10000)
					var_6_36 = true
				end

				local var_6_37 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_awards_num_bg.png")

				var_6_37:setPosition(ccp(55, 21))

				local var_6_38 = CCLabelAtlas:create(":" .. tostring(var_6_35), "res/ui/activity/weekActivity/acti_lxdl_num.png", 11, 17, 48)

				var_6_38:setAnchorPoint(ccp(0.5, 0.5))

				if var_6_36 == true then
					var_6_38:setPosition(ccp(20, 8))
				else
					var_6_38:setPosition(ccp(26, 8))
				end

				var_6_37:addChild(var_6_38)

				if var_6_36 == true then
					local var_6_39 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_num_wan.png")
					local var_6_40 = var_6_38:getContentSize()

					var_6_39:setPosition(ccp(var_6_40.width + 10, var_6_40.height / 2 - 1 + var_6_12.unitY))
					var_6_38:addChild(var_6_39)
				end

				var_6_30:addChild(var_6_37)

				if arg_6_0.control.data.days[iter_6_13].rewardObtained == 1 then
					local var_6_41 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_already_got.png")

					var_6_41:setPosition(ccp(46, 60))
					var_6_30:addChild(var_6_41)
				end
			else
				local var_6_42

				if iter_6_13 < arg_6_0.control.data.createDay then
					var_6_42 = GraySprite:create("res/ui/activity/weekActivity/acti_icon_box.png")
				else
					var_6_42 = CCSprite:create("res/ui/activity/weekActivity/acti_icon_box.png")
				end

				var_6_42:setPosition(ccp(var_6_16 / 2, var_6_16 / 2))
				var_6_30:addChild(var_6_42)

				local var_6_43 = CCLabelAtlas:create(tostring(iter_6_13), "res/ui/common/number/icon_numb.png", 19, 23, 48)

				var_6_43:setPosition(ccp(10, 10))
				var_6_43:setAnchorPoint(ccp(0.5, 0.5))
				var_6_30:addChild(var_6_43)
				var_6_43:setScale(0.75)

				if arg_6_0.control.data.days[iter_6_13].rewardObtained == 1 then
					local var_6_44 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_already_got.png")

					var_6_44:setPosition(ccp(46, 60))
					var_6_30:addChild(var_6_44)
				end
			end

			var_6_23:addChild(var_6_30)
		end

		rmgr.loadResource("res/anim/resourceAnim/itemLight.plist")

		local var_6_45 = rmgr.getAnimation("sdtj_itemLight")
		local var_6_46 = CCAnimation:createWithSpriteFrames(var_6_45, 0.08)
		local var_6_47 = CCAnimate:create(var_6_46)
		local var_6_48 = CCSprite:create()

		var_6_48:runAction(CCRepeatForever:create(var_6_47))
		var_6_48:setPosition(ccp(45, 48))
		arg_6_0.uiTable["item" .. tostring(arg_6_0.control.data.createDay)]:addChild(var_6_48)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_ZIYUAN.tag then
		if arg_6_0.uiTable.ziyuan_scoll ~= nil then
			arg_6_0.uiTable.bgPic:removeChild(arg_6_0.uiTable.ziyuan_scoll, true)

			arg_6_0.uiTable.ziyuan_scoll = nil
		end

		if arg_6_0.control.data.eventCd > 86400000 then
			local var_6_49 = math.floor(arg_6_0.control.data.eventCd / 86400000)

			arg_6_0.uiTable.remainDay:setString(language.get(131056, var_6_49))
		elseif arg_6_0.control.data.eventCd > 0 then
			arg_6_0.uiTable.remainDay:setVisible(false)

			local var_6_50 = "@M:@S"

			if arg_6_0.control.data.eventCd > 3600000 then
				var_6_50 = "@H:@M:@S"
			end

			if arg_6_0.uiTable.timerLayer ~= nil then
				arg_6_0.uiTable.bgPic:removeChild(arg_6_0.uiTable.timerLayer, true)
			end

			local var_6_51 = createTimerLabel(arg_6_0.control.data.eventCd, var_6_50, "Thonburi-Bold", 30, nil, nil, nil, ccc3(235, 46, 11))

			var_6_51:setPosition(ccp(arg_6_0.uiTable.remainDay:getPosition()))
			arg_6_0.uiTable.bgPic:addChild(var_6_51, 5)

			arg_6_0.uiTable.timerLayer = var_6_51
		end

		local var_6_52 = createBaseLayer()
		local var_6_53 = #arg_6_0.control.data.areas

		for iter_6_14 = 1, var_6_53 do
			local var_6_54 = arg_6_0.control.data.areas[iter_6_14]
			local var_6_55 = CCSprite:create("res/ui/activity/ziyuan/zyfb_list_view_bg.jpg")

			var_6_55:setPosition(ccp(2 * (iter_6_14 - 1) * 210 + 99, 163))
			var_6_52:addChild(var_6_55, 1)

			local var_6_56 = CCSprite:create("res/ui/activity/ziyuan/txt_zyfb_chae_1.png")

			var_6_56:setPosition(ccp(40, 286))
			var_6_55:addChild(var_6_56, 1)

			local var_6_57 = CCSprite:create("res/ui/activity/ziyuan/txt_zyfb_list_" .. tostring(var_6_54.areaId) .. ".png")

			var_6_57:setPosition(ccp(99, 210))
			var_6_55:addChild(var_6_57, 2)

			local var_6_58 = CCSprite:createWithSpriteFrameName("res_icon_19.png")

			var_6_58:setPosition(ccp(75, 110))
			var_6_55:addChild(var_6_58, 3)

			local var_6_59 = CCLabelTTF:create(tostring(var_6_54.gold1), "", 24)

			var_6_59:setPosition(ccp(125, 110))
			var_6_55:addChild(var_6_59, 4)

			local var_6_60 = CCSprite:create("res/ui/activity/ziyuan/btn_zyfb_a.jpg")
			local var_6_61 = CCSprite:create("res/ui/activity/ziyuan/btn_zyfb_c.jpg")
			local var_6_62 = CCMenuItemSprite:create(var_6_60, var_6_61)

			var_6_62:setPosition(ccp(99, 27))
			var_6_62:registerScriptTapHandler(function()
				arg_6_0.control:click_resourceUp(2 * iter_6_14 - 1)
			end)

			local var_6_63 = CCMenu:create()

			var_6_63:setPosition(ccp(0, 0))
			var_6_63:addChild(var_6_62, 1, iter_6_14)
			var_6_55:addChild(var_6_63)

			local var_6_64 = CCLabelTTF:create(language.get(131060, 7), "", 24)

			var_6_64:setPosition(ccp(99, 27))
			var_6_55:addChild(var_6_64)

			local var_6_65 = CCSprite:create("res/ui/activity/ziyuan/zyfb_list_view_bg.jpg")

			var_6_65:setPosition(ccp((2 * (iter_6_14 - 1) + 1) * 210 + 99, 163))
			var_6_52:addChild(var_6_65, 1)

			local var_6_66 = CCSprite:create("res/ui/activity/ziyuan/txt_zyfb_chae_6.png")

			var_6_66:setPosition(ccp(40, 286))
			var_6_65:addChild(var_6_66, 1)

			local var_6_67 = CCSprite:create("res/ui/activity/ziyuan/txt_zyfb_list_" .. tostring(iter_6_14) .. ".png")

			var_6_67:setPosition(ccp(99, 210))
			var_6_65:addChild(var_6_67, 2)

			local var_6_68 = CCSprite:createWithSpriteFrameName("res_icon_19.png")

			var_6_68:setPosition(ccp(75, 110))
			var_6_65:addChild(var_6_68, 3)

			local var_6_69 = CCLabelTTF:create(tostring(var_6_54.gold2), "", 24)

			var_6_69:setPosition(ccp(125, 110))
			var_6_65:addChild(var_6_69, 4)

			local var_6_70 = CCSprite:create("res/ui/activity/ziyuan/btn_zyfb_a.jpg")
			local var_6_71 = CCSprite:create("res/ui/activity/ziyuan/btn_zyfb_c.jpg")
			local var_6_72 = CCMenuItemSprite:create(var_6_70, var_6_71)

			var_6_72:setPosition(ccp(99, 27))
			var_6_72:registerScriptTapHandler(function()
				arg_6_0.control:click_resourceUp(2 * iter_6_14)
			end)

			local var_6_73 = CCMenu:create()

			var_6_73:setPosition(ccp(0, 0))
			var_6_73:addChild(var_6_72, 1, iter_6_14)
			var_6_65:addChild(var_6_73)

			local var_6_74 = CCLabelTTF:create(language.get(131060, 30), "", 24)

			var_6_74:setPosition(ccp(99, 27))
			var_6_65:addChild(var_6_74)
		end

		local var_6_75 = CCScrollView:create(CCSizeMake(845, 326))

		var_6_75:setContainer(var_6_52)
		var_6_75:setPosition(25, 50)
		var_6_75:setContentSize(CCSizeMake(var_6_53 * 2 * 210, 326))
		var_6_75:setDirection(kCCScrollViewDirectionHorizontal)
		arg_6_0.uiTable.bgPic:addChild(var_6_75, 10)

		arg_6_0.uiTable.ziyuan_scoll = var_6_75

		if arg_6_0.offset ~= nil then
			var_6_75:setContentOffset(arg_6_0.offset)
		end

		arg_6_0.uiTable.title:registerScriptTapHandler(function()
			arg_6_0.control:click_activityResource_info()
		end)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_REDBOMB.tag then
		arg_6_0.uiTable.currentGold:setHorizontalAlignment(kCCTextAlignmentLeft)
		arg_6_0.uiTable.currentGold:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		arg_6_0.uiTable.currentGold:setDimensions(CCSizeMake(100, 30))
		arg_6_0.uiTable.openCount:setHorizontalAlignment(kCCTextAlignmentLeft)
		arg_6_0.uiTable.openCount:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		arg_6_0.uiTable.openCount:setDimensions(CCSizeMake(100, 30))
		arg_6_0.uiTable.currentGold:setString(tostring(arg_6_0.control.data.gold))
		arg_6_0.uiTable.openCount:setString(tostring(arg_6_0.control.data.num))

		local var_6_76 = arg_6_0.control.data.eventCd / 1000
		local var_6_77 = language.get(131108)

		if var_6_76 > 86400 then
			var_6_77 = language.get(131107, math.floor(var_6_76 / 86400))
		elseif var_6_76 > 3600 then
			var_6_77 = language.get(131103, math.floor(var_6_76 / 3600))
		end

		arg_6_0.uiTable.remainTime:setString(var_6_77)

		local var_6_78 = 0
		local var_6_79 = 0
		local var_6_80 = 0
		local var_6_81 = arg_6_0.control.data.gold
		local var_6_82 = false

		for iter_6_15, iter_6_16 in ipairs(arg_6_0.control.data.redPapers) do
			arg_6_0.uiTable["index_" .. iter_6_16.id]:setString("X" .. iter_6_16.num)
			arg_6_0.uiTable["goldIndex_" .. iter_6_16.id]:setString(iter_6_16.gold)

			if iter_6_16.received == 1 then
				arg_6_0.uiTable["lingqu_" .. iter_6_16.id]:setVisible(true)
			else
				arg_6_0.uiTable["lingqu_" .. iter_6_16.id]:setVisible(false)
			end

			if var_6_81 >= iter_6_16.gold then
				var_6_78 = var_6_78 + 1
				var_6_80 = iter_6_16.gold
			elseif var_6_79 == 0 and var_6_82 == false then
				var_6_81 = var_6_81 - var_6_80
				var_6_79 = var_6_81 / (iter_6_16.gold - var_6_80)
				var_6_82 = true
			end
		end

		local var_6_83 = (var_6_78 + var_6_79) * 116

		arg_6_0.uiTable.bar:setScaleX(var_6_83)
		arg_6_0.uiTable.bar:setPosition(ccp(52 + var_6_83 / 2, 343))

		if arg_6_0.control.data.num >= 10 then
			arg_6_0.uiTable.sanbao:setVisible(false)
			arg_6_0.uiTable.shibao:setVisible(true)
		else
			arg_6_0.uiTable.sanbao:setVisible(true)
			arg_6_0.uiTable.shibao:setVisible(false)
		end

		if arg_6_0.control.data.num == 0 then
			arg_6_0.uiTable.open:setEnabled(false)
		end

		local function var_6_84(arg_20_0)
			local var_20_0 = 104
			local var_20_1 = 58
			local var_20_2 = {
				463,
				var_20_0 + 46,
				var_20_0 + 113,
				var_20_0 + 181,
				var_20_0 + 250,
				var_20_0 + 320,
				var_20_0 + 388,
				var_20_0 + 457,
				var_20_0 + 526,
				var_20_0 + 591,
				var_20_0 + 659
			}
			local var_20_3 = {
				213,
				var_20_1 + 81,
				var_20_1 + 102,
				var_20_1 + 122,
				var_20_1 + 138,
				var_20_1 + 154,
				var_20_1 + 151,
				var_20_1 + 136,
				var_20_1 + 124,
				var_20_1 + 111,
				var_20_1 + 94
			}
			local var_20_4 = arg_20_0 + 1

			if arg_6_0.uiTable["redBomb_" .. var_20_4] == nil then
				local var_20_5 = CCSprite:create()

				var_20_5:setPosition(ccp(var_20_2[var_20_4], var_20_3[var_20_4]))
				arg_6_0.uiTable.bgPic:addChild(var_20_5, 101)

				arg_6_0.uiTable["redBomb_" .. var_20_4] = var_20_5
			end

			local var_20_6 = CCArray:create()

			for iter_20_0 = 1, 7 do
				local var_20_7 = CCSprite:create("res/ui/activity/redBomb/anim/" .. string.format("bao%d.png", iter_20_0))

				var_20_6:addObject(var_20_7:displayFrame())

				if iter_20_0 == 1 then
					arg_6_0.uiTable["redBomb_" .. var_20_4]:setDisplayFrame(var_20_7:displayFrame())
				end
			end

			local var_20_8 = CCAnimation:createWithSpriteFrames(var_20_6, 0.1)
			local var_20_9 = CCAnimate:create(var_20_8)
			local var_20_10 = CCDelayTime:create(0.5)
			local var_20_11 = CCHide:create()
			local var_20_12 = CCArray:create()

			var_20_12:addObject(var_20_9)
			var_20_12:addObject(var_20_10)

			if arg_20_0 == 0 then
				var_20_12:addObject(var_20_11)
			end

			local var_20_13 = CCSequence:create(var_20_12)

			arg_6_0.uiTable["redBomb_" .. var_20_4]:runAction(var_20_13)
			arg_6_0.uiTable["redBomb_" .. var_20_4]:setVisible(true)

			local function var_20_14(arg_21_0)
				local var_21_0 = arg_21_0.action.data.rewards
				local var_21_1 = {}

				for iter_21_0, iter_21_1 in ipairs(var_21_0) do
					var_21_1[iter_21_0] = {}
					var_21_1[iter_21_0].id = iter_21_1.type
					var_21_1[iter_21_0].value = iter_21_1.value

					if iter_21_1.type == 5 then
						var_21_1[iter_21_0].id = 6
					elseif iter_21_1.type == 81 then
						var_21_1[iter_21_0].id = 24
					elseif iter_21_1.type == 102 then
						var_21_1[iter_21_0].id = 41
					end
				end

				globalAction_gotResource(var_21_1)

				if arg_20_0 == 0 then
					arg_6_0.control.data.num = arg_6_0.control.data.num - 1

					arg_6_0.uiTable.openCount:setString(tostring(arg_6_0.control.data.num))
				end

				if arg_6_0.control.data.num == 0 then
					arg_6_0.uiTable.open:setEnabled(false)
				end
			end

			cmgr.sendRequest(var_20_14, actions.getRedBombReward)
		end

		local function var_6_85()
			if arg_6_0.control.data.pauseOpenClick == true then
				return
			end

			if arg_6_0.control.data.num >= 10 then
				local var_22_0 = 0
				local var_22_1 = CCDirector:sharedDirector():getScheduler()
				local var_22_2
				local var_22_3 = 0

				local function var_22_4(arg_23_0)
					var_22_0 = var_22_0 + arg_23_0

					if var_22_0 >= 6 then
						var_22_1:unscheduleScriptEntry(var_22_2)

						arg_6_0.control.data.pauseOpenClick = false

						for iter_23_0 = 1, 10 do
							arg_6_0.uiTable["redBomb_" .. iter_23_0 + 1]:setVisible(false)
						end

						arg_6_0.control.data.num = arg_6_0.control.data.num - 10

						arg_6_0.uiTable.openCount:setString(tostring(arg_6_0.control.data.num))

						if arg_6_0.control.data.num == 0 then
							arg_6_0.uiTable.open:setEnabled(false)
						end

						if arg_6_0.control.data.num >= 10 then
							arg_6_0.uiTable.sanbao:setVisible(false)
							arg_6_0.uiTable.shibao:setVisible(true)
						else
							arg_6_0.uiTable.sanbao:setVisible(true)
							arg_6_0.uiTable.shibao:setVisible(false)
						end
					elseif var_22_0 >= 0.5 * var_22_3 then
						var_22_3 = var_22_3 + 1

						if var_22_3 <= 10 then
							var_6_84(var_22_3)
						end
					end
				end

				if var_22_2 == nil then
					var_22_2 = var_22_1:scheduleScriptFunc(var_22_4, 0, false)
					arg_6_0.control.data.pauseOpenClick = true
				end
			else
				var_6_84(0)
			end
		end

		local function var_6_86()
			local var_24_0 = {}

			if conf.language == "vie" then
				var_24_0.tipFrameW = 50
				var_24_0.tipFrameH = 80
				var_24_0.labelY = 40
			else
				var_24_0.tipFrameW = 0
				var_24_0.tipFrameH = 0
				var_24_0.labelY = 0
			end

			if arg_6_0.uiTable.tipsBg == nil then
				local var_24_1 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

				var_24_1:setContentSize(CCSizeMake(150 + var_24_0.tipFrameW, 200 + var_24_0.tipFrameH))
				var_24_1:setPosition(ccp(750, 420))

				local var_24_2 = CCLabelTTF:create(language.get(131105), "", 20)

				var_24_2:setPosition(90, 100 + var_24_0.labelY)
				var_24_2:setColor(ccc3(235, 209, 167))
				var_24_2:setDimensions(CCSizeMake(150, 200))
				var_24_2:setHorizontalAlignment(kCCTextAlignmentLeft)
				var_24_2:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
				var_24_1:addChild(var_24_2)
				arg_6_0.uiTable.bgPic:addChild(var_24_1, 10000)

				arg_6_0.uiTable.tipsBg = var_24_1
			end

			arg_6_0.uiTable.tipsBg:setVisible(true)
		end

		arg_6_0.uiTable.wenhao:registerScriptTapHandler(var_6_86)
		arg_6_0.uiTable.open:registerScriptTapHandler(var_6_85)

		arg_6_0.control.data.pauseOpenClick = false
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_NOVICEWANTED.tag then
		noviceWantedActivity.data = arg_6_0.control.data
		noviceWantedActivity.selfRef = arg_6_0

		noviceWantedActivity.ui.update()
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_XILIAN.tag then
		var_6_0(arg_6_0.control.data.eventCd, arg_6_0.uiTable.actLefttime)
		arg_6_0.uiTable.actGoToQuenching:registerScriptTapHandler(function()
			local var_25_0 = smgr.getLayer("topLayer")
			local var_25_1 = smgr.getLayer("activityLayer")

			var_25_0:removeChild(var_25_1, true)
			equipmentUI.show(4)
		end)
		arg_6_0.uiTable.wenhao:registerScriptTapHandler(function()
			arg_6_0.control:showWenhaoTips()
		end)

		local var_6_87 = 0
		local var_6_88 = 0
		local var_6_89 = 0
		local var_6_90 = arg_6_0.control.data.num
		local var_6_91 = arg_6_0.control.data.alreadyNum
		local var_6_92
		local var_6_93
		local var_6_94

		for iter_6_17, iter_6_18 in pairs(arg_6_0.control.data.xiLianTimes) do
			if iter_6_18.ids == 1 then
				var_6_92 = iter_6_18
			elseif iter_6_18.ids == 2 then
				var_6_93 = iter_6_18
			elseif iter_6_18.ids == 3 then
				var_6_94 = iter_6_18
			end
		end

		local var_6_95 = var_6_90 / var_6_92.times
		local var_6_96 = (var_6_90 - var_6_92.times) / (var_6_93.times - var_6_92.times)
		local var_6_97 = (var_6_90 - var_6_93.times) / (var_6_94.times - var_6_93.times)

		var_6_95 = var_6_95 < 0 and 0 or var_6_95
		var_6_95 = var_6_95 > 1 and 1 or var_6_95
		var_6_96 = var_6_96 < 0 and 0 or var_6_96
		var_6_96 = var_6_96 > 1 and 1 or var_6_96
		var_6_97 = var_6_97 < 0 and 0 or var_6_97
		var_6_97 = var_6_97 > 1 and 1 or var_6_97

		local var_6_98 = var_6_95 * 100
		local var_6_99 = var_6_96 * 100
		local var_6_100 = var_6_97 * 100

		arg_6_0.uiTable.progress_1:setPercentage(var_6_98)
		arg_6_0.uiTable.progress_2:setPercentage(var_6_99)
		arg_6_0.uiTable.progress_3:setPercentage(var_6_100)

		local var_6_101 = {
			var_6_92,
			var_6_93,
			var_6_94
		}

		for iter_6_19 = 1, 3 do
			local var_6_102 = var_6_101[iter_6_19]

			if var_6_90 < var_6_102.times then
				arg_6_0.uiTable["clickToChoose_" .. iter_6_19]:removeAllChildrenWithCleanup(true)
			end

			if var_6_102.received == 1 then
				local var_6_103 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", var_6_102.pic))

				var_6_103:setPosition(ccp(39, 39))
				tool.scaleTo(var_6_103, 79, 79)
				arg_6_0.uiTable["clickToChoose_" .. iter_6_19]:addChild(var_6_103, 101)
			end

			if var_6_90 < var_6_102.times then
				arg_6_0.uiTable["nextLabel_" .. iter_6_19]:setString(language.get(400040, var_6_102.times - var_6_90))
			else
				arg_6_0.uiTable["nextLabel_" .. iter_6_19]:setVisible(false)
			end

			arg_6_0.uiTable["blockWenhao_" .. iter_6_19]:registerScriptTapHandler(function()
				arg_6_0.control:showBlockWenhaoTips(iter_6_19)
			end)
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_IRON_REWARD.tag then
		log.info("@@ 镔铁祭祀")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_104 = require("lua/layer/activity/activityTab/IronReward").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_104.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_FAMOUS.tag then
		if arg_6_0.control.data.bigRewardType == 108 then
			arg_6_0.uiTable.hsbPic:setDisplayFrame(CCSpriteFrameCache:sharedSpriteFrameCache():spriteFrameByName("byzg.jpg"))
			arg_6_0.uiTable.msProcess:setScaleX(0.3689604685212299)
			arg_6_0.uiTable.btn_close:setScale(2)
			arg_6_0.uiTable.btn_close:registerScriptTapHandler(function()
				arg_6_0.uiTable.giftPanel:setVisible(false)
				arg_6_0.control:getActivityInfo()
			end)
			arg_6_0.uiTable.btn_getGift:registerScriptTapHandler(function()
				arg_6_0.control:getFamousBigGift()
			end)
			arg_6_0.uiTable.tongNum:setString(arg_6_0.control.data.leaMax)
			arg_6_0.uiTable.yongNum:setString(arg_6_0.control.data.strMax)
		end

		if arg_6_0.control.data.bigRewardType == 126 then
			arg_6_0.uiTable.hsbPic:setDisplayFrame(CCSprite:create("res/ui/activity/famous/jn.jpg"):displayFrame())
			arg_6_0.uiTable.itemPic:setDisplayFrame(CCSprite:create("res/ui/activity/famous/jn.jpg"):displayFrame())
			arg_6_0.uiTable.itemName:setString(language.get(111043))
			arg_6_0.uiTable.itemInfo:setString(language.get(132012, arg_6_0.control.data.canReceived))
			arg_6_0.uiTable.msProcess:setScaleX(0.3689604685212299)
			arg_6_0.uiTable.btn_close:setScale(2)
			arg_6_0.uiTable.btn_close:registerScriptTapHandler(function()
				arg_6_0.uiTable.giftPanel:setVisible(false)
				arg_6_0.control:getActivityInfo()
			end)
			arg_6_0.uiTable.btn_getGift:registerScriptTapHandler(function()
				arg_6_0.control:getFamousBigGift()
			end)
		end

		local var_6_105 = CCSprite:create("res/ui/activity/famous/gjms_xyjn_icon.png")
		local var_6_106 = CCStrokeLabelTTF:create(language.get(132014, arg_6_0.control.data.finalRecvTimes), "Thonburi", 20)

		var_6_106:setColor(ccc3(235, 209, 167))

		local var_6_107 = createRichNode({
			var_6_105,
			var_6_106
		}, 1)

		var_6_107:setPosition(ccp(235, 25))
		arg_6_0.uiTable.finalRecvBg:addChild(var_6_107)
		var_6_0(arg_6_0.control.data.eventCd, arg_6_0.uiTable.actLefttime)

		local var_6_108 = 0
		local var_6_109 = arg_6_0.control.data.totalRepute

		for iter_6_20, iter_6_21 in pairs(arg_6_0.control.data.gifts) do
			if var_6_109 > iter_6_21.needNum then
				var_6_108 = var_6_108 + 100 / #arg_6_0.control.data.gifts
			else
				local var_6_110 = 0

				if arg_6_0.control.data.gifts[iter_6_20 - 1] ~= nil then
					var_6_110 = arg_6_0.control.data.gifts[iter_6_20 - 1].needNum
				end

				if var_6_110 < var_6_109 then
					local var_6_111 = var_6_109 - var_6_110
					local var_6_112 = iter_6_21.needNum - var_6_110

					var_6_108 = var_6_108 + var_6_111 * 100 / var_6_112 / #arg_6_0.control.data.gifts
				end
			end

			arg_6_0.uiTable["giftLabel" .. iter_6_20]:setString(tostring(iter_6_21.needNum))

			if iter_6_21.state == 0 then
				arg_6_0.uiTable["lantern" .. iter_6_20]:registerScriptTapHandler(function()
					arg_6_0.control:getEventReward(iter_6_21.giftId)
				end)
				arg_6_0.uiTable["lantern" .. iter_6_20]:setRotation(10)

				local var_6_113 = CCEaseExponentialOut:create(CCRotateBy:create(0.4, -20))
				local var_6_114 = CCEaseExponentialOut:create(CCRotateBy:create(0.4, 20))
				local var_6_115 = CCArray:create()

				var_6_115:addObject(var_6_113)
				var_6_115:addObject(var_6_114)

				local var_6_116 = CCSequence:create(var_6_115)

				arg_6_0.uiTable["lantern" .. iter_6_20]:runAction(CCRepeatForever:create(var_6_116))
			else
				arg_6_0.uiTable["lantern" .. iter_6_20]:setEnabled(false)
			end

			if iter_6_21.tips and iter_6_21.tips > 0 then
				arg_6_0.uiTable["num_tips" .. iter_6_20]:setString(language.get(135039, iter_6_21.tips))

				if iter_6_21.tipsState == 0 then
					arg_6_0.uiTable["light_tips" .. iter_6_20]:setVisible(true)
					arg_6_0.uiTable["btn_tips" .. iter_6_20]:registerScriptTapHandler(function()
						arg_6_0.control:getEventReward(iter_6_21.giftId)
					end)
				elseif iter_6_21.tipsState == 1 then
					arg_6_0.uiTable["num_tips" .. iter_6_20]:setVisible(false)
					arg_6_0.uiTable["btn_tips" .. iter_6_20]:setVisible(false)
				elseif iter_6_21.tipsState == 2 then
					arg_6_0.uiTable["btn_tips" .. iter_6_20]:setEnabled(false)
				end
			else
				arg_6_0.uiTable["num_tips" .. iter_6_20]:setVisible(false)
				arg_6_0.uiTable["btn_tips" .. iter_6_20]:setVisible(false)
			end
		end

		arg_6_0.uiTable.wenhao:registerScriptTapHandler(function()
			arg_6_0.control:showFamousTips()
		end)
		arg_6_0.uiTable.actFamousBar:setPercentage(var_6_108)

		if arg_6_0.control.data.totalRepute >= arg_6_0.control.data.needRepute then
			arg_6_0.uiTable.canReceived:setVisible(true)
			arg_6_0.uiTable.canReceived:setString(language.get(330031, arg_6_0.control.data.canReceived))
		end

		if arg_6_0.control.data.canReceived > 0 then
			arg_6_0.uiTable.hsbBg:setVisible(true)

			local var_6_117 = CCFadeIn:create(0.5)
			local var_6_118 = var_6_117:reverse()
			local var_6_119 = CCSequence:createWithTwoActions(var_6_117, var_6_118)

			arg_6_0.uiTable.hsbBg:runAction(CCRepeatForever:create(var_6_119))
		end

		local var_6_120

		for iter_6_22, iter_6_23 in pairs(arg_6_0.control.data.npcs) do
			if iter_6_23.state ~= 1 and var_6_120 == nil then
				var_6_120 = iter_6_23
			end
		end

		local var_6_121 = {
			[31] = {
				pic = "res/ui/activity/famous/gjms_icon_bm.jpg",
				name = language.get(131087)
			},
			[32] = {
				pic = "res/ui/activity/famous/gjms_icon_mj.jpg",
				name = language.get(131088)
			},
			[33] = {
				pic = "res/ui/activity/famous/gjms_icon_sh.jpg",
				name = language.get(131089)
			}
		}

		if var_6_120 then
			arg_6_0.uiTable.famousFinish:setVisible(false)
			arg_6_0.uiTable.famousHead:setVisible(true)
			arg_6_0.uiTable.famousHead:setDisplayFrame(CCSprite:create("res/ui/common/halfPic/halfPic_" .. var_6_120.pic .. ".png"):displayFrame())
			log.info(tool.tableToJson(var_6_120))

			if var_6_120.state == 0 then
				local var_6_122 = CCRotateBy:create(5, 360)

				arg_6_0.uiTable.famousLight:runAction(CCRepeatForever:create(var_6_122))
			else
				arg_6_0.uiTable.famousLight:setVisible(false)
			end

			if var_6_120.isAdvanced then
				arg_6_0.uiTable.famousBg:setDisplayFrame(CCSprite:create("res/ui/activity/famous/gjmsyh_ms_d.png"):displayFrame())
				arg_6_0.uiTable.npcName:setString(var_6_120.name)
				arg_6_0.uiTable.npcName:setColor(ccc3(233, 197, 77))
				arg_6_0.uiTable.guoshi:setVisible(true)
			else
				arg_6_0.uiTable.famousBg:setDisplayFrame(CCSprite:create("res/ui/activity/famous/gjms_ms_tit_view.png"):displayFrame())
				arg_6_0.uiTable.npcName:setString(var_6_120.name)
				arg_6_0.uiTable.npcName:setColor(ccc3(255, 255, 255))
				arg_6_0.uiTable.guoshi:setVisible(false)
			end

			arg_6_0.uiTable.npcFavor:setString(language.get(131086, var_6_121[var_6_120.costType].name))
			arg_6_0.uiTable.dropItemIcon:setDisplayFrame(CCSprite:create(var_6_121[var_6_120.costType].pic):displayFrame())
		end

		if #arg_6_0.control.data.npcs == 0 then
			arg_6_0.uiTable.famousFinish:setVisible(true)
			arg_6_0.uiTable.famousHead:setVisible(false)
		end

		arg_6_0.uiTable.famousItemNum1:setString("×" .. tonumber(arg_6_0.control.data.bmw))
		arg_6_0.uiTable.famousItemNum2:setString("×" .. tonumber(arg_6_0.control.data.xo))
		arg_6_0.uiTable.famousItemNum3:setString("×" .. tonumber(arg_6_0.control.data.picasso))

		local var_6_123 = {}

		for iter_6_24, iter_6_25 in pairs(arg_6_0.control.data.cities) do
			var_6_123[iter_6_25.dropType] = iter_6_25
		end

		for iter_6_26, iter_6_27 in pairs(var_6_121) do
			local var_6_124 = var_6_123[iter_6_26]
			local var_6_125 = iter_6_26 - 30

			log.info("dropType", iter_6_26)

			if var_6_124 then
				arg_6_0.uiTable["teamCityName" .. var_6_125]:setString(language.get(131085, var_6_124.cityName))
				arg_6_0.uiTable["teamAttackBtn" .. var_6_125]:registerScriptTapHandler(function()
					smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
					loadingLayer.show(SCENE_WORLD, var_6_124.cityId)
				end)
			else
				arg_6_0.uiTable["teamCityName" .. var_6_125]:setVisible(false)
				arg_6_0.uiTable["teamAttackBtn" .. var_6_125]:setVisible(false)

				local var_6_126, var_6_127 = arg_6_0.uiTable["teamCityName" .. var_6_125]:getPosition()

				if arg_6_0.control.data.duringTask == true then
					local var_6_128 = CCStrokeLabelTTF:create(language.get(132017), "Thonburi", 24)

					var_6_128:setColor(ccc3(255, 0, 0))
					var_6_128:setPosition(ccp(var_6_126, var_6_127))
					arg_6_0.uiTable.background:addChild(var_6_128, 101)
				elseif arg_6_0.control.data.cd and arg_6_0.control.data.cd > 0 then
					local function var_6_129()
						arg_6_0.control:getActivityInfo()
					end

					local var_6_130 = createTimerLabel(arg_6_0.control.data.cd + 5000, "@M:@S", "Thonburi", 24, var_6_129, nil, nil, ccc3(255, 0, 0))

					var_6_130:setPosition(ccp(var_6_126, var_6_127))
					arg_6_0.uiTable.background:addChild(var_6_130, 101)
				end
			end
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SDTJ.tag then
		arg_6_0:removeAllChildrenWithCleanup(true)
		log.info("@@ 神刀天降界面")
		require("lua/layer/activity/activityTab/SDTJWindow")
		SDTJWindow.ctor(arg_6_0, arg_6_0.control.data)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_IRON_ROTARY.tag then
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_131 = require("lua/layer/activity/activityTab/IronRotary").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.ironRotaryEventCd, var_6_131.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_ANCIENT_CASTLE.tag then
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_132 = require("lua/layer/activity/ancientCastle/AncientCastleTab").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.leftTime, var_6_132.tableview.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_WUSEGEM.tag then
		log.info("@@ 神锤砸宝石界面")
		var_6_0(arg_6_0.control.data.eventCd, arg_6_0.uiTable.actLefttime)
		arg_6_0.control:setBigGemStatus(false)

		local var_6_133 = arg_6_0.control.data.gemHeap
		local var_6_134 = false

		for iter_6_28 = 1, 3 do
			local var_6_135 = arg_6_0.control.data.gems[iter_6_28]

			arg_6_0.uiTable["NeedGemNum" .. iter_6_28]:setString(tostring(var_6_135.gem))
			arg_6_0.uiTable["HammerLeft_" .. iter_6_28]:setString(tostring(language.get(135002, var_6_135.hammer)))

			if arg_6_0.control.data.hammer > 0 or var_6_133 > 0 then
				var_6_134 = true
			else
				var_6_134 = var_6_134 or false
			end
		end

		if var_6_134 then
			arg_6_0.uiTable.GemMineNumBoard:setVisible(true)
			arg_6_0.uiTable.ClickGemMineNumleft:setString(tostring(arg_6_0.control.data.hammer))

			if var_6_133 > 0 and var_6_134 then
				arg_6_0.uiTable.PickupGemTit:setVisible(true)
				arg_6_0.uiTable.ClickGemMineNumleft:setVisible(false)
				arg_6_0.uiTable.ClickGemMineNumTit:setVisible(false)
				arg_6_0.uiTable.ClickGemMine:setVisible(false)
			else
				arg_6_0.uiTable.PickupGemTit:setVisible(false)
				arg_6_0.uiTable.ClickGemMineNumleft:setVisible(true)
				arg_6_0.uiTable.ClickGemMineNumTit:setVisible(true)
				arg_6_0.uiTable.ClickGemMine:setVisible(true)
				arg_6_0.control:scalfunction(arg_6_0.uiTable.ClickGemMineNumleft)
				arg_6_0.control:scalfunction(arg_6_0.uiTable.ClickGemMineNumTit)
				arg_6_0.control:scalfunction(arg_6_0.uiTable.ClickGemMine)
			end
		else
			arg_6_0.uiTable.GemMineNumBoard:setVisible(false)
			arg_6_0.uiTable.PickupGemTit:setVisible(false)
			arg_6_0.uiTable.ClickGemMineNumleft:setVisible(false)
			arg_6_0.uiTable.ClickGemMineNumTit:setVisible(false)
			arg_6_0.uiTable.ClickGemMine:setVisible(false)
		end

		for iter_6_29 = 1, #arg_6_0.control.data.hammers do
			local var_6_136 = arg_6_0.control.data.hammers[iter_6_29]

			arg_6_0.uiTable["HammerGemLeft_" .. iter_6_29]:setString(tostring(var_6_136.num))

			if var_6_136.num <= 0 then
				arg_6_0.uiTable["GemMine_" .. iter_6_29]:setVisible(false)
			end

			local var_6_137 = {
				"greengem",
				"yellowgem",
				"redgem",
				"purplegem"
			}
			local var_6_138 = CCTextureCache:sharedTextureCache():addImage("res/ui/activity/gemsActivity/gem/" .. var_6_137[iter_6_29] .. var_6_136.pic .. ".png")

			arg_6_0.uiTable["GemMine_" .. iter_6_29]:setTexture(var_6_138)
		end

		local var_6_139 = arg_6_0.control.data.num
		local var_6_140 = arg_6_0.control.data.gems[2].gem - arg_6_0.control.data.gems[1].gem
		local var_6_141 = arg_6_0.control.data.gems[3].gem - arg_6_0.control.data.gems[2].gem

		if var_6_139 > arg_6_0.control.data.gems[1].gem then
			arg_6_0.uiTable.GemProgressLevel_1:setPreferredSize(CCSizeMake(200, 13))

			if var_6_139 > arg_6_0.control.data.gems[2].gem then
				arg_6_0.uiTable.GemProgressLevel_2:setPreferredSize(CCSizeMake(200, 13))

				if var_6_139 > arg_6_0.control.data.gems[3].gem then
					arg_6_0.uiTable.GemProgressLevel_3:setPreferredSize(CCSizeMake(200, 13))
				else
					local var_6_142 = (var_6_139 - arg_6_0.control.data.gems[2].gem) / var_6_141 * 200

					arg_6_0.uiTable.GemProgressLevel_3:setPreferredSize(CCSizeMake(var_6_142, 13))
				end
			else
				local var_6_143 = (var_6_139 - arg_6_0.control.data.gems[1].gem) / var_6_140 * 200

				arg_6_0.uiTable.GemProgressLevel_2:setPreferredSize(CCSizeMake(var_6_143, 13))
			end
		else
			local var_6_144 = var_6_139 / arg_6_0.control.data.gems[1].gem * 200

			arg_6_0.uiTable.GemProgressLevel_1:setPreferredSize(CCSizeMake(var_6_144, 13))
		end

		for iter_6_30, iter_6_31 in pairs(arg_6_0.control.data.gems) do
			if iter_6_31.status == 2 then
				tool.spriteToGray(arg_6_0.uiTable["actShenChuiIcon" .. iter_6_30])
			elseif iter_6_31.status == 1 then
				local var_6_145 = CCJumpBy:create(0.4, ccp(0, 0), 5, 1)

				arg_6_0.uiTable["actShenChuiIcon" .. iter_6_30]:runAction(CCRepeatForever:create(var_6_145))

				local var_6_146 = CCArray:create()

				for iter_6_32 = 1, 8 do
					local var_6_147 = CCSpriteFrame:create(string.format("res/ui/activity/ironReward/btjs_gq/btjs_gq_%04d.png", iter_6_32), CCRectMake(0, 0, 100, 100))

					var_6_146:addObject(var_6_147)
				end

				local var_6_148 = CCAnimation:createWithSpriteFrames(var_6_146, 0.1)
				local var_6_149 = CCAnimate:create(var_6_148)

				arg_6_0.uiTable["animSprite" .. iter_6_30]:runAction(CCRepeatForever:create(var_6_149))
			end
		end

		if arg_6_0.control.data.gemHeap > 0 then
			arg_6_0.control:dropGem(arg_6_0.control.data.gemStoneId)
		end
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_MID_AUTUMN.tag then
		log.info("@@ 中秋活动界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_150 = require("lua/layer/activity/activityTab/MidAutumn").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_150.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_IRON_MINE.tag then
		log.info("@@ 镔铁矿洞界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_151 = require("lua/layer/activity/activityTab/IronMine").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_151.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_MOVE_MOUNTAIN.tag then
		log.info("@@ 愚公移山界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_152 = require("lua/layer/activity/activityTab/MoveMountain").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_152.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TEL_FARE.tag then
		log.info("@@ 注册送礼界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_153 = require("lua/layer/activity/activityTab/TelFare").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_153.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_CHRISTMAS_DAY.tag then
		log.info("@@ 欢度圣诞界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_154 = require("lua/layer/activity/activityTab/ChristmasDay").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_154.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_GEM_ROTARY.tag then
		log.info("@@ 宝石转盘")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_155 = require("lua/layer/activity/activityTab/GemRotary").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.gemRotaryEventCd, var_6_155.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_CONSUME_GIFT.tag then
		log.info("@@ 消费送豪礼")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_156 = require("lua/layer/activity/activityTab/ConsumeGift").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_156.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_BIG_ROTARY.tag then
		log.info("@@ 飞流转盘界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_157 = require("lua/layer/activity/activityTab/BigRotary").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_157.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_BEAST.tag then
		log.info("@@ 年兽出现界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		if conf.language == "tha" then
			panel = require("lua/layer/activity/activityTab/PoShui2").new(arg_6_0, arg_6_0.control.data)
		else
			panel = require("lua/layer/activity/activityTab/Beast").new(arg_6_0, arg_6_0.control.data)
		end

		var_6_0(arg_6_0.control.data.eventCd, panel.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_WISH.tag then
		log.info("@@ 新春许愿界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_158 = require("lua/layer/activity/activityTab/Wish").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_158.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_BAI_NIAN.tag then
		log.info("@@ 新春拜年界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_159 = require("lua/layer/activity/activityTab/BaiNian").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_159.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_LANTERN.tag then
		log.info("@@ 欢庆元宵界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_160 = require("lua/layer/activity/activityTab/Lantern").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_160.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_BETRAY.tag then
		log.info("@@ 阵营转换界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_161 = require("lua/layer/activity/activityTab/Betray").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_161.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_ZHUAN_PAN.tag then
		log.info("@@ 周年庆转盘")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_162 = require("lua/layer/activity/activityTab/ZhuanPan").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_162.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_KAIGUANG_GIFT.tag then
		log.info("@@ 开光点数放送界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_163 = require("lua/layer/activity/activityTab/KaiguangPoint").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_163.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_CARD.tag then
		log.info("@@ 超级翻牌界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_164 = require("lua/layer/activity/activityTab/Card").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_164.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_NEW_GEMS.tag then
		log.info("@@ 新神锤砸宝石界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_165 = require("lua/layer/activity/activityTab/NewGems").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_165.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_NEW_GEM_ROTARY.tag then
		log.info("@@ 新宝石转盘界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_166 = require("lua/layer/activity/activityTab/NewGemRotary").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_166.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_FURNACE.tag then
		log.info("@@ 神鼎养晶石界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_167 = require("lua/layer/activity/activityTab/Furnace").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_167.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TAXI.tag then
		log.info("@@ 滴滴送券界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_168 = require("lua/layer/activity/activityTab/TaxiFare").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_168.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SEVEN_CATCH.tag then
		log.info("@@ 七擒孟获界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_169 = require("lua/layer/activity/activityTab/SevenCatch").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_169.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_GOLD.tag then
		log.info("@@ 充值送金抢红包界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_170 = require("lua/layer/activity/activityTab/GoldActivity").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_170.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DATA_REWARD.tag then
		log.info("@@ 领取流量界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_171 = require("lua/layer/activity/activityTab/DataReward").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_171.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_GODRED.tag then
		log.info("@@ 财神送红包（充值砸元宝）界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_172 = require("lua/layer/activity/activityTab/GodPaper").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_172.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_JINLIAN.tag then
		log.info("@@ 精炼活动界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_173 = require("lua/layer/activity/activityTab/JinglianLayer").new(arg_6_0.control.data)

		arg_6_0:addChild(var_6_173)
		var_6_0(arg_6_0.control.data.eventCd, var_6_173.widgets.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_NEW_MID_AUTUMN.tag then
		log.info("@@ 新中秋活动界面")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_174 = require("lua/layer/activity/activityTab/NewMidAutumn").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.leftTime, var_6_174.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TIANDENG.tag then
		log.info("@@ 天灯许愿")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_175 = require("lua/layer/activity/activityTab/TianDeng").new(arg_6_0.control.data)

		arg_6_0:addChild(var_6_175)
		var_6_0(arg_6_0.control.data.eventCd, var_6_175:getLeftTimeLabel())
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_FISHING.tag then
		log.info("@@ 寒江独钓")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_176 = require("lua/layer/activity/activityTab/Fishing").new(arg_6_0.control.data)

		arg_6_0:addChild(var_6_176)
		var_6_0(arg_6_0.control.data.eventCd, var_6_176:getLeftTimeLabel())
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SUPER_GEM_ROTARY.tag then
		log.info("@@ 超级宝石转盘")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_177 = require("lua/layer/activity/activityTab/SuperGemRotary").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_177.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_HORSE_RACING.tag then
		log.info("@@ 赛马")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_178 = require("lua/layer/activity/activityTab/HorseRacing").new(arg_6_0.control.data)

		arg_6_0:addChild(var_6_178)
		var_6_0(arg_6_0.control.data.eventCd, var_6_178:getLeftTimeLabel())
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_REWARD_GENERAL.tag then
		log.info("@@ 犒赏武将")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_179 = require("lua/layer/activity/activityTab/RewardGeneral").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_179.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_GEM_MINE.tag then
		log.info("@@ 宝石矿脉")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_180 = require("lua/layer/activity/activityTab/GemMine").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_180.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_HERO_DRINK.tag then
		log.info("@@ 以酒会友")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_181 = require("lua/layer/activity/activityTab/HeroDrink").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_181.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_NEW_SWORD.tag then
		log.info("@@ 天降神剑")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_182 = require("lua/layer/activity/activityTab/NewSword")

		var_6_182.ctor(arg_6_0, arg_6_0.control.data)
		var_6_0(arg_6_0.control.data.leftTime, var_6_182.view.widgets.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_IRON_MOUNTAIN.tag then
		log.info("@@ 矿山开采")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_183 = require("lua/layer/activity/activityTab/IronMountain").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_183.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_IRON_GIVE.tag then
		log.info("@@ 镔铁倾销")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_184 = require("lua/layer/activity/activityTab/IronSell").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_184.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SILK_SHOP.tag then
		log.info("@@ 丝绸酬宾")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_185 = require("lua/layer/activity/activityTab/SilkShop").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_185.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_MUL_NATION.tag then
		log.info("@@ 万邦来朝")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_186 = require("lua/layer/activity/activityTab/MulNation").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_186.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_BUILDNATION_PUSH.tag then
		log.info("@@ 建国冲刺")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_187 = require("lua/layer/activity/activityTab/BuildNationRush").new(arg_6_0, arg_6_0.control.data)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TRIAL_BUILD.tag then
		log.info("@@ 世界建造")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_188 = require("lua/layer/activity/activityTab/TrialBuild").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_188.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SEA_SILK.tag then
		log.info("@@ 海上丝路")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_189 = require("lua/layer/activity/activityTab/SeaSilk").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_189.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_MOON_CAKE.tag then
		log.info("@@ 月饼大赛")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_190 = require("lua/layer/activity/activityTab/MoonCake").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_190.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SILK_CARD.tag then
		log.info("@@ 新丝绸酬宾")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_191 = require("lua/layer/activity/activityTab/SilkCard").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_191.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_GANG_MINE.tag then
		log.info("@@ 神兵锻造")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_192 = require("lua/layer/activity/activityTab/GangMine").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_192.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_GANG_CARD.tag then
		log.info("@@ 钢铁酬宾")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_193 = require("lua/layer/activity/activityTab/SilkCard").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_193.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_SEA_SILK2.tag then
		log.info("@@ 海岛寻宝")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_194 = require("lua/layer/activity/activityTab/SeaSilk2").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_194.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DRAGON_BOAT.tag then
		log.info("@@ 龙舟大赛/圣诞雪橇")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_195 = require("lua/layer/activity/activityTab/DragonBoat" .. user.haveDragonBoatActivity).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_195.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_LOOK.tag then
		log.info("@@ 传递圣火(游览名胜)")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_196 = require("lua/layer/activity/lookActivity/ui").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_196.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_QA.tag then
		log.info("@@ 奥运答题")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_197 = require("lua/layer/activity/activityTab/QAActivity").new(arg_6_0, arg_6_0.control.data)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TS_DRINKING.tag then
		log.info("@@ 清明酒宴")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_198 = require("lua/layer/activity/activityTab/TsDrinking").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_198.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_JUE_STONE.tag then
		log.info("@@ 角石放送")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_199 = require("lua/layer/activity/activityTab/JueStone").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_199.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_NEW_LANTERN.tag then
		log.info("@@ 新元宵活动")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_200 = require("lua/layer/activity/activityTab/NewLantern4").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_200.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_MU_NIU.tag then
		log.info("@@ 木牛流马")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_201

		if user.haveNewYearRedPaperActivity == 1 then
			var_6_201 = require("lua/layer/activity/activityTab/MuNiu").new(arg_6_0, arg_6_0.control.data)
		elseif user.haveNewYearRedPaperActivity == 2 then
			var_6_201 = require("lua/layer/activity/activityTab/MuNiu2").new(arg_6_0, arg_6_0.control.data)
		end

		var_6_0(arg_6_0.control.data.eventCd, var_6_201.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TOMB.tag then
		log.info("@@ 清明祭拜")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_202 = require("lua/layer/activity/activityTab/Tomb").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_202.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_OUTLINE.tag then
		log.info("@@ 线下活动")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_203 = require("lua/layer/activity/activityTab/OutLineActivity").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.offlineCd, var_6_203.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_OUTLINE2.tag then
		log.info("@@ 线下活动2")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_204 = require("lua/layer/activity/activityTab/OutLineActivity2").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.offlineCd, var_6_204.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_OUTLINE3.tag then
		log.info("@@ 线下活动3")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_205 = require("lua/layer/activity/activityTab/OutLineActivity3").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.offlineCd, var_6_205.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_OUTLINE4.tag then
		log.info("@@ 线下活动4")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_206 = require("lua/layer/activity/activityTab/OutLineActivity4").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.offlineCd, var_6_206.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_HERO_DRINK2.tag then
		log.info("@@ 以酒会友2")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_207 = require("lua/layer/activity/activityTab/HeroDrink2").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_207.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DWXZ.tag then
		log.info("@@ 端午香粽")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_208 = "lua/layer/activity/activityTab/ZongziGiving" .. user.haveDwxzActivity
		local var_6_209 = require(var_6_208).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_209.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DYQX.tag then
		log.info("@@ 大宴群雄")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_210 = "lua/layer/activity/activityTab/FeteHero"
		local var_6_211 = require(var_6_210).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_211.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_CCJJ.tag then
		log.info("@@ 草船借箭")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_212 = "lua/layer/activity/activityTab/BoatArrow"
		local var_6_213 = require(var_6_212).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_213.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_CHANG_BAN_SALLY.tag then
		log.info("@@ 长坂突围")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_214 = "lua/layer/activity/activityTab/ChangbanSally"
		local var_6_215 = require(var_6_214).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_215.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_METEOR_INCENSE.tag then
		log.info("@@ 陨铁祭祀")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_216 = "lua/layer/activity/activityTab/MeteorIncense"
		local var_6_217 = require(var_6_216).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_217.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_PAY0805.tag then
		log.info("@@ 财神到")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_218 = "lua/layer/activity/activityTab/Pay0805"
		local var_6_219 = require(var_6_218).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_219.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_YEAR_BEAST17.tag then
		log.info("@@ 讨伐董卓")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_220 = "lua/layer/activity/activityTab/YearBeast18"
		local var_6_221 = require(var_6_220).new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_221.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_METEORITE.tag then
		log.info("@@ 天降陨石")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_222 = require("lua/layer/activity/activityTab/Meteorite").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_222.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_TANK_CHARGE.tag then
		log.info("@@ 铁甲冲锋")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_223 = require("lua/layer/activity/activityTab/TankCharge").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_223.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_QING_MEI.tag then
		log.info("@@ 青梅酒宴")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_224 = require("lua/layer/activity/activityTab/Qingmei").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_224.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_DEFEND_XIANGYANG.tag then
		log.info("@@ 镇守襄阳")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_225 = require("lua/layer/activity/activityTab/DefendXiangYang").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_225.leftTime)
	elseif var_6_1 == activityConstant.TYPES.ACTIVITY_CONSUME_GIFT2.tag then
		log.info("@@ 消费送豪礼150")
		arg_6_0:removeAllChildrenWithCleanup(true)

		local var_6_226 = require("lua/layer/activity/activityTab/ConsumeGift2").new(arg_6_0, arg_6_0.control.data)

		var_6_0(arg_6_0.control.data.eventCd, var_6_226.leftTime)
	end
end

function var_0_0.GemDropInit(arg_37_0, arg_37_1)
	log.info("初始宝石掉落")

	local var_37_0
	local var_37_1 = CCArray:create()
	local var_37_2 = CCScaleBy:create(0.4, 2)
	local var_37_3 = var_37_2:reverse()

	var_37_1:addObject(var_37_2)
	var_37_1:addObject(var_37_3)

	local var_37_4 = CCSequence:create(var_37_1)

	arg_37_0.uiTable.PickupGemTit:runAction(CCRepeat:create(var_37_4, 1))

	local var_37_5 = arg_37_0.control.data.gemHeap

	for iter_37_0 = 1, arg_37_0.control.data.gemHeap do
		local var_37_6 = CCScale9Sprite:create("res/ui/task/get_icon_gem.png")
		local var_37_7 = CCControlButton:create(var_37_6)

		var_37_7:setPreferredSize(CCSizeMake(56, 46))

		local var_37_8 = math.random(-20, 170)
		local var_37_9 = math.random(95, 175)

		arg_37_0.uiTable["MineIntro_" .. arg_37_1]:addChild(var_37_7)
		var_37_7:setPosition(var_37_8, var_37_9)

		local function var_37_10()
			local function var_38_0(arg_39_0)
				local var_39_0 = {
					{}
				}

				var_39_0[1].id = 7
				var_39_0[1].value = arg_39_0.action.data.num

				globalAction_gotResource(var_39_0)
				var_37_7:removeFromParentAndCleanup(true)

				arg_37_0.control.data.gemHeap = arg_37_0.control.data.gemHeap - 1

				if arg_37_0.control.data.gemHeap <= 0 then
					if arg_37_0.control.data.hammers[arg_37_1].num == 0 then
						local var_39_1 = {
							"greengem",
							"yellowgem",
							"redgem",
							"purplegem"
						}
						local var_39_2 = CCScale9Sprite:create("res/ui/activity/gemsActivity/gem/" .. var_39_1[arg_37_1] .. ".png")
						local var_39_3 = CCSprite:create("res/ui/activity/gemsActivity/gem/" .. var_39_1[arg_37_1] .. ".png")
						local var_39_4 = CCControlButton:create(var_39_2)

						var_39_4:setPreferredSize(var_39_3:getContentSize())

						local var_39_5 = CCSprite:create("res/ui/activity/gemsActivity/gemeffect/gemeffectsmall_1.png")

						var_39_4:addChild(var_39_5)
						var_39_5:setPosition(ccp(71, 86))
						var_39_4:setPosition(ccp(75, 100))
						arg_37_0.uiTable.GemMineNumBoard:addChild(var_39_4, 210)

						local var_39_6, var_39_7 = arg_37_0.uiTable["GemMine_" .. arg_37_1]:getPosition()
						local var_39_8 = CCSprite:create("res/ui/activity/gemsActivity/gemeffect/gemeffectbig_1.png")

						var_39_8:setAnchorPoint(ccp(0.5, 0.5))
						var_39_4:addChild(var_39_8, -1)
						var_39_8:setPosition(ccp(69, 76))
						var_39_4:setPosition(ccp(var_39_6, var_39_7))

						local var_39_9 = CCArray:create()
						local var_39_10 = CCMoveTo:create(0.4, ccp(464, 300))
						local var_39_11 = CCScaleBy:create(0.4, 2)
						local var_39_12 = var_39_11:reverse()

						var_39_9:addObject(var_39_10)
						var_39_9:addObject(var_39_11)
						var_39_9:addObject(var_39_12)

						local var_39_13 = CCArray:create()
						local var_39_14 = CCFadeOut:create(2)
						local var_39_15 = CCFadeIn:create(1)

						var_39_13:addObject(var_39_15)
						var_39_13:addObject(var_39_14)

						local var_39_16 = CCArray:create()
						local var_39_17 = CCFadeOut:create(2)
						local var_39_18 = CCRotateBy:create(0.4, 90)
						local var_39_19 = CCRotateBy:create(0.4, 90)
						local var_39_20 = CCRotateBy:create(0.4, 90)
						local var_39_21 = CCRotateBy:create(0.4, 90)

						var_39_16:addObject(var_39_18)
						var_39_16:addObject(var_39_19)
						var_39_16:addObject(var_39_20)
						var_39_16:addObject(var_39_21)

						local var_39_22 = CCFadeOut:create(3)
						local var_39_23 = CCSequence:create(var_39_9)
						local var_39_24 = CCSequence:create(var_39_13)
						local var_39_25 = CCSequence:create(var_39_16)

						var_39_4:runAction(CCRepeat:create(var_39_23, 1))
						var_39_8:runAction(CCRepeat:create(var_39_24, 1))
						var_39_5:runAction(CCRepeatForever:create(var_39_25))

						local function var_39_26()
							log.info("@@@@@@@@@@@@@@@@@@@", arg_37_0.control.data.hammers[arg_37_1].num)

							if arg_37_0.control.data.hammers[arg_37_1].num == 0 then
								local var_40_0 = {
									{}
								}

								var_40_0[1].id = 7
								var_40_0[1].value = arg_37_0.control.data.hammers[arg_37_1].gemNum
								var_40_0[1].gemLevel = arg_37_0.control.data.hammers[arg_37_1].gemId

								globalAction_gotResource(var_40_0)
								var_39_4:runAction(CCFadeOut:create(1))
								arg_37_0.control:getActivityInfo()
								arg_37_0.control:setBigGemStatus(false)
							end
						end

						var_39_4:addHandleOfControlEvent(var_39_26, CCControlEventTouchUpInside)
					else
						arg_37_0.control:getActivityInfo()
					end
				end
			end

			cmgr.sendRequest(var_38_0, actions.getpickUpGemInfo, arg_37_1)
		end

		var_37_7:addHandleOfControlEvent(var_37_10, CCControlEventTouchUpInside)
	end
end

function var_0_0.updateEquipBlock(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	local var_41_0 = CCSprite:createWithSpriteFrameName(string.format("%s.jpg", arg_41_1.pic))

	var_41_0:setPosition(ccp(39, 39))
	tool.scaleTo(var_41_0, 79, 79)
	arg_41_0.uiTable["clickToChoose_" .. arg_41_3]:addChild(var_41_0, 101)
	arg_41_0.uiTable["xilian_" .. arg_41_3]:setEnabled(true)
	arg_41_0.uiTable["xilian_" .. arg_41_3]:registerScriptTapHandler(function()
		arg_41_4()
		arg_41_0.control:getActivityInfo()
	end)
end

function globalAction_updateSpecialEffect(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	log.info("global id,limit,multiple", arg_43_0, arg_43_1, arg_43_2)

	local var_43_0 = smgr.getLayer("pushLayer")
	local var_43_1 = var_43_0:getChildByTag(110)

	if var_43_1 == nil then
		var_43_1 = CCNode:create()

		var_43_0:addChild(var_43_1, 101, 110)
	else
		var_43_1:removeAllChildrenWithCleanup(true)
	end

	if arg_43_0 == 2 and arg_43_1 > 0 then
		local var_43_2 = CCSprite:create("res/ui/activity/ironReward/acti_text_qjzz.png")
		local var_43_3 = CCLabelAtlas:create(tonumber(arg_43_1), "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)
		local var_43_4 = CCSprite:create("res/ui/activity/ironReward/acti_text_ci.png")

		var_43_3:setAnchorPoint(ccp(0.5, 0.5))

		local var_43_5 = createRichNode({
			var_43_2,
			var_43_3,
			var_43_4
		}, 0.5)

		var_43_5:setPosition(ccp(visibleSize.width / 2, visibleSize.height - 50))
		var_43_1:addChild(var_43_5)
	elseif arg_43_0 == 3 and arg_43_1 > 0 then
		local var_43_6 = CCSprite:create("res/ui/activity/ironReward/acti_text_tljs.png")
		local var_43_7 = CCLabelAtlas:create(tonumber(arg_43_1), "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)
		local var_43_8 = CCSprite:create("res/ui/activity/ironReward/acti_text_ci.png")

		var_43_7:setAnchorPoint(ccp(0.5, 0.5))

		local var_43_9 = createRichNode({
			var_43_6,
			var_43_7,
			var_43_8
		}, 0.5)

		var_43_9:setPosition(ccp(visibleSize.width / 2, visibleSize.height - 50))
		var_43_1:addChild(var_43_9)

		local var_43_10 = CCSprite:createWithSpriteFrameName("js_view_bg.png")

		var_43_10:setPosition(ccp(visibleSize.width / 2 + 192, visibleSize.height / 2 - 35))
		var_43_1:addChild(tool.setShade(var_43_10, false), -1)

		local var_43_11 = CCSprite:create("res/ui/guide/jiantou-shang.png")

		var_43_11:setPosition(ccp(visibleSize.width / 2 + 192, visibleSize.height / 2 - 235))
		var_43_1:addChild(var_43_11)

		local var_43_12 = CCJumpBy:create(1, ccp(0, 0), -40, 1)

		var_43_11:runAction(CCRepeatForever:create(var_43_12))
	elseif arg_43_0 == 4 and arg_43_1 > 0 then
		local var_43_13 = CCSprite:create("res/ui/activity/ironReward/acti_text_sqzz.png")
		local var_43_14 = CCLabelAtlas:create(tonumber(arg_43_1), "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)
		local var_43_15 = CCSprite:create("res/ui/activity/ironReward/acti_text_ci.png")

		var_43_14:setAnchorPoint(ccp(0.5, 0.5))

		local var_43_16 = createRichNode({
			var_43_13,
			var_43_14,
			var_43_15
		}, 0.5)

		var_43_16:setPosition(ccp(visibleSize.width / 2, visibleSize.height - 50))
		var_43_1:addChild(var_43_16)
	elseif arg_43_0 == 5 and arg_43_3 and arg_43_3 > 0 then
		local var_43_17 = CCSprite:create("res/ui/activity/ironReward/bq_icon_sud.png")
		local var_43_18 = smgr.getLayer("topLayer")

		var_43_17:setPosition(ccp(visibleSize.width / 2 - 418, visibleSize.height / 2 + 283))
		var_43_18:addChild(var_43_17)
	elseif arg_43_0 == 6 and arg_43_1 > 0 then
		local var_43_19 = CCSprite:create("res/ui/activity/ironReward/acti_text_gfzz.png")
		local var_43_20 = CCLabelAtlas:create(tonumber(arg_43_1), "res/ui/common/number/nation_task_upg_numb.png", 53, 64, 48)
		local var_43_21 = CCSprite:create("res/ui/activity/ironReward/acti_text_ci.png")

		var_43_20:setAnchorPoint(ccp(0.5, 0.5))

		local var_43_22 = createRichNode({
			var_43_19,
			var_43_20,
			var_43_21
		}, 0.5)

		var_43_22:setPosition(ccp(visibleSize.width / 2, visibleSize.height - 50))
		var_43_1:addChild(var_43_22)
	end
end

function globalAction_showSpecialWindow(arg_44_0)
	log.info("@@@@@@@@@@@@@@@@item", tool.tableToJson(arg_44_0))

	local var_44_0 = arg_44_0.openType

	if var_44_0 == 1 then
		if arg_44_0.vId then
			messageBox.confirm(language.get(131170), function()
				cmgr.sendRequest(function()
					eventManager.dispatchEvent("refreshSpecialWindow")
					cmgr.sendRequest(function(arg_47_0)
						local var_47_0 = arg_47_0.action.data

						if var_47_0.extraIron and var_47_0.extraIron > 0 then
							local var_47_1 = {}
							local var_47_2 = {}

							var_47_2.id = 4
							var_47_2.value = var_47_0.extraIron

							table.insert(var_47_1, var_47_2)
							globalAction_gotResource(var_47_1)
						end

						if var_47_0.extraGang and var_47_0.extraGang > 0 then
							local var_47_3 = {}
							local var_47_4 = {}

							var_47_4.id = 10033
							var_47_4.value = var_47_0.extraGang

							table.insert(var_47_3, var_47_4)
							globalAction_gotResource(var_47_3)
						end

						local var_47_5 = var_47_0.resourceGot[1]
						local var_47_6 = arg_47_0.action.data.multiple
						local var_47_7 = smgr.getLayer("pushLayer")
						local var_47_8 = {
							{}
						}

						var_47_8[1].id = var_47_5.resourceType == 119 and 10033 or 4
						var_47_8[1].value = var_47_5.addNum

						globalAction_gotResource(var_47_8)

						if var_47_6 > 1 then
							local var_47_9 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_47_6 .. ".png")
							local var_47_10 = ccp(visibleSize.width / 2, visibleSize.height / 2)

							var_47_9:setPosition(var_47_10)
							var_47_9:setScale(1.5)
							var_47_7:addChild(var_47_9)

							local var_47_11 = CCArray:create()

							var_47_11:addObject(CCDelayTime:create(0.5))
							var_47_11:addObject(CCFadeOut:create(0.2))
							var_47_11:addObject(CCCallFunc:create(function()
								var_47_9:removeFromParentAndCleanup(true)

								var_47_9 = nil
							end))
							var_47_9:runAction(CCSequence:create(var_47_11))
						end
					end, actions.doWorship, "4")
				end, actions.useIronRewardToken, arg_44_0.vId)
			end, language.get(10001))
		else
			messageBox.confirm(language.get(131170), function()
				cmgr.sendRequest(function()
					local var_50_0 = CCSprite:create()

					var_50_0:setContentSize(CCSizeMake(309, 72))

					local var_50_1 = CCSprite:create("res/ui/activity/ironReward/acti_iron_icon_1.jpg")
					local var_50_2 = CCSprite:create("res/ui/activity/ironReward/acti_text_ncjs.png")

					var_50_1:setPosition(ccp(36, 36))
					var_50_2:setPosition(ccp(190.5, 36))
					var_50_0:addChild(var_50_1)
					var_50_0:addChild(var_50_2)

					local var_50_3 = smgr.getLayer("pushLayer")

					var_50_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 100))
					var_50_3:addChild(var_50_0)

					local var_50_4 = CCArray:create()

					var_50_4:addObject(CCEaseSineInOut:create(CCMoveBy:create(1, ccp(0, 200))))
					var_50_4:addObject(CCDelayTime:create(0.3))
					var_50_4:addObject(CCCallFunc:create(function()
						var_50_0:removeFromParentAndCleanup(true)
					end))
					var_50_0:runAction(CCSequence:create(var_50_4))
					eventManager.dispatchEvent("getActivityInfo")
				end, actions.useIronRewardItem, 1)
			end, language.get(10001))
		end

		return
	elseif var_44_0 == 5 then
		if arg_44_0.vId then
			messageBox.confirm(language.get(131081), function()
				cmgr.sendRequest(function()
					local var_53_0 = CCSprite:create()

					var_53_0:setContentSize(CCSizeMake(309, 72))

					local var_53_1 = CCSprite:create("res/ui/activity/ironReward/acti_iron_icon_4.jpg")
					local var_53_2 = CCSprite:create("res/ui/activity/ironReward/acti_text_qqtg.png")

					var_53_1:setPosition(ccp(36, 36))
					var_53_2:setPosition(ccp(190.5, 36))
					var_53_0:addChild(var_53_1)
					var_53_0:addChild(var_53_2)

					local var_53_3 = smgr.getLayer("pushLayer")

					var_53_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 100))
					var_53_3:addChild(var_53_0)

					local var_53_4 = CCArray:create()

					var_53_4:addObject(CCEaseSineInOut:create(CCMoveBy:create(1, ccp(0, 200))))
					var_53_4:addObject(CCDelayTime:create(0.3))
					var_53_4:addObject(CCCallFunc:create(function()
						var_53_0:removeFromParentAndCleanup(true)
					end))
					var_53_0:runAction(CCSequence:create(var_53_4))
					eventManager.dispatchEvent("refreshSpecialWindow")
				end, actions.useIronRewardToken, arg_44_0.vId)
			end, language.get(10001))
		else
			messageBox.confirm(language.get(131081), function()
				cmgr.sendRequest(function()
					local var_56_0 = CCSprite:create()

					var_56_0:setContentSize(CCSizeMake(309, 72))

					local var_56_1 = CCSprite:create("res/ui/activity/ironReward/acti_iron_icon_4.jpg")
					local var_56_2 = CCSprite:create("res/ui/activity/ironReward/acti_text_qqtg.png")

					var_56_1:setPosition(ccp(36, 36))
					var_56_2:setPosition(ccp(190.5, 36))
					var_56_0:addChild(var_56_1)
					var_56_0:addChild(var_56_2)

					local var_56_3 = smgr.getLayer("pushLayer")

					var_56_0:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2 - 100))
					var_56_3:addChild(var_56_0)

					local var_56_4 = CCArray:create()

					var_56_4:addObject(CCEaseSineInOut:create(CCMoveBy:create(1, ccp(0, 200))))
					var_56_4:addObject(CCDelayTime:create(0.3))
					var_56_4:addObject(CCCallFunc:create(function()
						var_56_0:removeFromParentAndCleanup(true)
					end))
					var_56_0:runAction(CCSequence:create(var_56_4))
					eventManager.dispatchEvent("getActivityInfo")
				end, actions.useIronRewardItem, 5)
			end, language.get(10001))
		end

		return
	end

	local var_44_1 = CCScale9Sprite:createWithSpriteFrameName("commanWindow.png", CCRectMake(52, 85, 1, 1))

	var_44_1:setPreferredSize(CCSizeMake(580, 610))
	var_44_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))

	local var_44_2 = smgr.getLayer("topLayer")
	local var_44_3 = createBaseLayer()

	var_44_3:setTouchEnabled(true)
	var_44_3:registerScriptTouchHandler(function()
		return true
	end, false, true)
	var_44_2:addChild(var_44_3)
	var_44_3:addChild(var_44_1)
	require("lua/layer/weaponTab/ui")
	require("lua/layer/resource/ui")

	local var_44_4 = {
		{
			icon = "res/ui/activity/ironReward/acti_iron_icon_1.jpg",
			iconTitle = "",
			title = language.get(131171)
		},
		{
			icon = "res/ui/activity/ironReward/acti_iron_icon_2.jpg",
			title = language.get(131172),
			iconTitle = language.get(131176),
			desc = language.get(131178),
			color = ccc3(214, 85, 64),
			callback = weaponTab.ui.show
		},
		{
			icon = "res/ui/activity/ironReward/acti_iron_icon_5.jpg",
			title = language.get(131173),
			iconTitle = language.get(131177),
			desc = language.get(131180),
			color = colorQuality[6],
			callback = resourceUI.show
		},
		{
			icon = "res/ui/activity/ironReward/acti_iron_icon_3.jpg",
			title = language.get(131174),
			iconTitle = language.get(131177),
			desc = language.get(131179),
			color = colorQuality[6],
			callback = weaponTab.ui.show
		},
		{
			icon = "res/ui/activity/ironReward/acti_iron_icon_4.jpg",
			iconTitle = "",
			title = language.get(131175)
		},
		{
			icon = "res/ui/activity/ironReward/acti_iron_icon_6.jpg",
			title = language.get(133007),
			iconTitle = language.get(131176),
			desc = language.get(133008),
			color = colorQuality[6],
			callback = weaponTab.ui.show
		},
		[2201] = {
			icon = "frame:tcjbl.jpg",
			title = language.get(131181),
			iconTitle = language.get(131187, 10),
			desc = var_44_0 == 2201 and language.get(131182, arg_44_0.intro) or "",
			color = colorQuality[6]
		},
		[2202] = {
			icon = "frame:hfjbl.jpg",
			title = language.get(131184),
			iconTitle = language.get(131188, 10),
			desc = var_44_0 == 2202 and language.get(131185, arg_44_0.intro) or "",
			color = colorQuality[6]
		}
	}
	local var_44_5 = {}

	if conf.language == "vie" then
		var_44_5.itlSize = -6
	else
		var_44_5.itlSize = 0
	end

	local var_44_6 = CCStrokeLabelTTF:create(var_44_4[var_44_0].title, "Thonburi", 24)

	var_44_6:setPosition(ccp(290, 580))
	var_44_1:addChild(var_44_6)

	local var_44_7 = CCSprite:create("res/ui/activity/ironReward/acti_view_award_describe.jpg")

	var_44_7:setPosition(ccp(290, 315))
	var_44_1:addChild(var_44_7)

	local var_44_8
	local var_44_9 = var_44_4[var_44_0].icon

	if string.find(var_44_9, "frame:") ~= nil then
		var_44_8 = CCSprite:createWithSpriteFrameName(string.sub(var_44_9, 7))
	else
		var_44_8 = CCSprite:create(var_44_9)
	end

	var_44_8:setPosition(ccp(268.5, 291))
	var_44_7:addChild(var_44_8)

	local var_44_10 = CCStrokeLabelTTF:create(var_44_4[var_44_0].iconTitle, "Thonburi", 24 + var_44_5.itlSize, 2, ccc3(22, 18, 13))

	var_44_10:setPosition(ccp(269.5, 382))

	if var_44_4[var_44_0].color then
		var_44_10:setColor(var_44_4[var_44_0].color)
	end

	var_44_7:addChild(var_44_10)

	local var_44_11 = CCStrokeLabelTTF:create(var_44_4[var_44_0].desc, "Thonburi", 22)

	var_44_11:setPosition(ccp(269.5, 115))
	var_44_11:setDimensions(CCSizeMake(450, 150))
	var_44_7:addChild(var_44_11)
	var_44_11:setHorizontalAlignment(kCCTextAlignmentLeft)
	var_44_11:setDimensions(CCSizeMake(500, 0))

	local var_44_12 = CCSprite:createWithSpriteFrameName("btn3_gre_a.png")
	local var_44_13 = CCSprite:createWithSpriteFrameName("btn3_gre_c.png")
	local var_44_14 = CCSprite:createWithSpriteFrameName("btn3_yel_a.png")
	local var_44_15 = CCSprite:createWithSpriteFrameName("btn3_yel_c.png")
	local var_44_16 = CCMenuItemSprite:create(var_44_12, var_44_13)
	local var_44_17 = CCMenuItemSprite:create(var_44_14, var_44_15)
	local var_44_18 = CCStrokeLabelTTF:create(language.get(10001), "Thonburi", 24)
	local var_44_19 = CCStrokeLabelTTF:create(language.get(10002), "Thonburi", 24)

	var_44_18:setPosition(ccp(70, 29))
	var_44_19:setPosition(ccp(70, 29))
	var_44_16:addChild(var_44_18)
	var_44_17:addChild(var_44_19)

	local var_44_20 = CCArray:create()

	var_44_20:addObject(var_44_16)
	var_44_20:addObject(var_44_17)

	local var_44_21 = CCMenu:createWithArray(var_44_20)

	var_44_21:alignItemsHorizontallyWithPadding(150)
	var_44_21:setPosition(ccp(290, 50))
	var_44_1:addChild(var_44_21)
	var_44_16:registerScriptTapHandler(function(arg_59_0)
		if var_44_0 == 2201 or var_44_0 == 2202 then
			require("lua/layer/resource/ui")
			resourceUI.show(1)
			var_44_3:removeFromParentAndCleanup(true)
			require("lua/layer/resource/incense/ui")
			incenseUI.useGemToken(arg_44_0)

			return
		end

		if arg_44_0.vId then
			cmgr.sendRequest(function(arg_60_0)
				eventManager.dispatchEvent("refreshSpecialWindow")
				var_44_3:removeFromParentAndCleanup(true)

				if var_44_4[var_44_0].callback then
					var_44_4[var_44_0].callback(1)
				end

				var_44_0 = nil
			end, actions.useIronRewardToken, arg_44_0.vId)
		else
			cmgr.sendRequest(function(arg_61_0)
				eventManager.dispatchEvent("refreshSpecialWindow")
				var_44_3:removeFromParentAndCleanup(true)

				if var_44_4[var_44_0].callback then
					var_44_4[var_44_0].callback(1)
				end

				var_44_0 = nil
			end, actions.useIronRewardItem, arg_44_0.step or var_44_0)
		end
	end)
	var_44_17:registerScriptTapHandler(function(arg_62_0)
		var_44_0 = nil

		var_44_3:removeFromParentAndCleanup(true)
	end)
	log.info("finish finish finish finish ")
end

noviceWantedActivity = {}

tool.requireRes("noviceWantedActivity")

noviceWantedActivity.ui = {}
noviceWantedActivity.control = {}
noviceWantedActivity.data = {}
noviceWantedActivity.control.current_clickIndex = -1
noviceWantedActivity.control.total_money = 0
noviceWantedActivity.selfRef = nil

function noviceWantedActivity.ui.update_bar()
	local var_63_0 = #noviceWantedActivity.data.goldArrays

	for iter_63_0 = 1, var_63_0 do
		local var_63_1 = 25 + 810 * iter_63_0 / var_63_0

		if iter_63_0 < var_63_0 then
			local var_63_2 = CCSprite:create("res/ui/noviceWanted/xs_loading_strip.jpg")

			var_63_2:setPosition(ccp(var_63_1, 18))
			noviceWantedActivity.selfRef.uiTable.bar_bg:addChild(var_63_2, 2)
		end

		local var_63_3 = CCSprite:create("res/ui/noviceWanted/jiebing_yuanbao.png")

		var_63_3:setPosition(ccp(var_63_1 - 20, -20))
		noviceWantedActivity.selfRef.uiTable.bar_bg:addChild(var_63_3, 2)

		local var_63_4 = CCLabelTTF:create(noviceWantedActivity.data.goldArrays[iter_63_0], "", 20)

		var_63_4:setDimensions(CCSizeMake(100, 40))
		var_63_4:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_63_4:setVerticalAlignment(kCCVerticalTextAlignmentCenter)
		var_63_4:setPosition(var_63_1 + 48, -20)
		noviceWantedActivity.selfRef.uiTable.bar_bg:addChild(var_63_4, 2)
	end

	local var_63_5 = noviceWantedActivity.ui.calculate()
	local var_63_6 = CCSprite:create("res/ui/noviceWanted/xs_loading_con.jpg")

	var_63_6:setScaleX(var_63_5 - 25)
	var_63_6:setPosition(ccp(25 + (var_63_5 - 25) / 2, 18))
	noviceWantedActivity.selfRef.uiTable.bar_bg:addChild(var_63_6, 1)

	noviceWantedActivity.selfRef.uiTable.bar = var_63_6
end

function noviceWantedActivity.ui.calculate()
	local var_64_0 = 0
	local var_64_1 = 0
	local var_64_2 = #noviceWantedActivity.data.goldArrays

	for iter_64_0 = 1, var_64_2 do
		local var_64_3 = noviceWantedActivity.data.goldArrays[1]

		if iter_64_0 > 1 then
			var_64_3 = noviceWantedActivity.data.goldArrays[iter_64_0] - noviceWantedActivity.data.goldArrays[iter_64_0 - 1]
		end

		if noviceWantedActivity.control.total_money >= noviceWantedActivity.data.goldArrays[iter_64_0] then
			var_64_0 = iter_64_0
		else
			local var_64_4 = 0

			if iter_64_0 > 1 then
				var_64_4 = noviceWantedActivity.data.goldArrays[iter_64_0 - 1]
			end

			var_64_1 = (noviceWantedActivity.control.total_money - var_64_4) / var_64_3

			break
		end
	end

	return 25 + 810 * (var_64_0 + var_64_1) / var_64_2
end

function noviceWantedActivity.ui.update_scroll()
	local var_65_0 = #noviceWantedActivity.data.armiesArray
	local var_65_1 = createBaseLayer()

	noviceWantedActivity.control.total_money = 0

	for iter_65_0 = 1, var_65_0 do
		local var_65_2 = noviceWantedActivity.data.armiesArray[iter_65_0]
		local var_65_3 = CCSprite:create("res/ui/noviceWanted/xs_peop_down.jpg")

		var_65_3:setPosition(ccp(97 + 194 * (iter_65_0 - 1), 135))
		var_65_1:addChild(var_65_3)

		local var_65_4 = CCSprite:create("res/ui/noviceWanted/xs_peop_xs.png")

		var_65_4:setPosition(ccp(87, 240))
		var_65_3:addChild(var_65_4)

		local var_65_5 = "qWhite.png"

		if var_65_2.quality == 2 then
			var_65_5 = "qBlue.png"
		elseif var_65_2.quality == 3 then
			var_65_5 = "qGreen.png"
		elseif var_65_2.quality == 4 then
			var_65_5 = "qYellow.png"
		elseif var_65_2.quality == 5 then
			var_65_5 = "qRed.png"
		elseif var_65_2.quality == 6 then
			var_65_5 = "qViolet.png"
		end

		local var_65_6 = CCSprite:createWithSpriteFrameName(var_65_5)

		var_65_6:setPosition(ccp(87, 150))
		var_65_3:addChild(var_65_6)

		local var_65_7

		if var_65_2.goldState == 2 then
			var_65_7 = GraySprite:create("res/ui/common/generalPic/generalPic_" .. var_65_2.pic .. ".jpg")
		else
			var_65_7 = CCSprite:create("res/ui/common/generalPic/generalPic_" .. var_65_2.pic .. ".jpg")
		end

		var_65_7:setPosition(ccp(38, 38))
		var_65_6:addChild(var_65_7, 1)

		noviceWantedActivity.selfRef.uiTable["icon_" .. iter_65_0] = var_65_7

		local var_65_8 = CCSprite:create("res/ui/noviceWanted/xs_peop_up.png")

		var_65_8:setPosition(ccp(36, 13))
		var_65_7:addChild(var_65_8)

		local var_65_9 = CCLabelTTF:create(var_65_2.armiesName, "", 20)

		var_65_9:setPosition(ccp(36, 13))
		var_65_8:addChild(var_65_9)

		local var_65_10 = CCSprite:create("res/ui/noviceWanted/nation_task_draw.png")

		var_65_10:setPosition(ccp(100, 130))
		var_65_3:addChild(var_65_10)

		noviceWantedActivity.selfRef.uiTable["lingqu_" .. iter_65_0] = var_65_10

		if var_65_2.goldState == 2 then
			-- block empty
		else
			var_65_10:setVisible(false)
		end

		local var_65_11 = CCSprite:create("res/ui/noviceWanted/jiebing_yuanbao.png")
		local var_65_12 = CCSprite:create("res/ui/noviceWanted/resou_up_plus.png")
		local var_65_13 = CCLabelAtlas:create(tostring(var_65_2.gold), "res/ui/activity/weekActivity/resou_up_numb.png", 20, 22, 48)

		var_65_13:setAnchorPoint(ccp(0.5, 0.5))

		local var_65_14 = var_65_13:getContentSize().width
		local var_65_15 = createRichNode({
			var_65_11,
			var_65_12,
			var_65_13
		})

		var_65_15:setPosition(ccp(87 - (53 + var_65_14) / 2, 80))
		var_65_3:addChild(var_65_15)

		if var_65_2.goldState == 2 then
			noviceWantedActivity.control.total_money = noviceWantedActivity.control.total_money + var_65_2.gold
		end

		local var_65_16 = CCSprite:createWithSpriteFrameName("btn3_gre_a.png")
		local var_65_17 = CCSprite:createWithSpriteFrameName("btn3_gre_c.png")
		local var_65_18 = CCSprite:createWithSpriteFrameName("btn3_gre_g.png")
		local var_65_19 = CCMenuItemSprite:create(var_65_16, var_65_17, var_65_18)

		var_65_19:registerScriptTapHandler(noviceWantedActivity.control.click_lingqu)
		var_65_19:setPosition(ccp(87, 32))

		noviceWantedActivity.selfRef.uiTable["btn_" .. iter_65_0] = var_65_19

		local var_65_20 = CCMenu:create()

		var_65_20:setPosition(ccp(0, 0))
		var_65_20:addChild(var_65_19, 1, iter_65_0)
		var_65_3:addChild(var_65_20)

		local var_65_21 = CCLabelTTF:create(language.get(131057), "", 20)

		var_65_21:setPosition(ccp(87, 32))
		var_65_3:addChild(var_65_21)

		noviceWantedActivity.selfRef.uiTable["btn_title_" .. iter_65_0] = var_65_21

		if var_65_2.goldState == 0 then
			var_65_19:setEnabled(false)
		elseif var_65_2.goldState == 1 then
			var_65_19:setEnabled(true)
		elseif var_65_2.goldState == 2 then
			var_65_19:setEnabled(false)
			var_65_21:setString(language.get(131058))
		end
	end

	local var_65_22 = CCScrollView:create(CCSizeMake(845, 280))

	var_65_22:setContainer(var_65_1)
	var_65_22:setPosition(10, 20)
	var_65_22:setContentSize(CCSizeMake(var_65_0 * 194, 269))
	var_65_22:setDirection(kCCScrollViewDirectionHorizontal)
	noviceWantedActivity.selfRef.uiTable.scroll_bg:addChild(var_65_22, 10)
end

function noviceWantedActivity.ui.update_time()
	multiLangOffset = {}

	if conf.language == "kr" then
		multiLangOffset.offset1 = 40
	else
		multiLangOffset.offset1 = 0
	end

	local var_66_0 = noviceWantedActivity.data.endTime
	local var_66_1 = math.floor(var_66_0)
	local var_66_2 = createTimerLabel(var_66_1, "@H:@M:@S", "Thonburi-Bold", 24, nil, nil, nil, ccc3(216, 86, 73))

	var_66_2:setPosition(ccp(220 + multiLangOffset.offset1, 450))
	noviceWantedActivity.selfRef.uiTable.bg2:addChild(var_66_2)
end

function noviceWantedActivity.ui.update()
	noviceWantedActivity.ui.update_time()
	noviceWantedActivity.ui.update_scroll()
	noviceWantedActivity.ui.update_bar()
end

function noviceWantedActivity.control.action_zoom(arg_68_0)
	arg_68_0:setScale(5)

	local var_68_0 = CCScaleTo:create(0.3, 1)

	arg_68_0:runAction(var_68_0)
	arg_68_0:setVisible(true)
end

function noviceWantedActivity.control.receive_getTaskReward(arg_69_0)
	local var_69_0 = {
		{}
	}

	var_69_0[1].id = 19
	var_69_0[1].value = arg_69_0.action.data.rewards[1].value

	globalAction_gotResource(var_69_0)

	local var_69_1 = noviceWantedActivity.control.current_clickIndex

	noviceWantedActivity.control.action_zoom(noviceWantedActivity.selfRef.uiTable["lingqu_" .. var_69_1])

	noviceWantedActivity.data.armiesArray[var_69_1].goldState = 2

	noviceWantedActivity.selfRef.uiTable["btn_" .. var_69_1]:setEnabled(false)
	noviceWantedActivity.selfRef.uiTable["btn_title_" .. var_69_1]:setString("已领取")

	local var_69_2 = GraySprite:create("res/ui/common/generalPic/generalPic_" .. noviceWantedActivity.data.armiesArray[var_69_1].pic .. ".jpg")

	noviceWantedActivity.selfRef.uiTable["icon_" .. var_69_1]:setDisplayFrame(var_69_2:displayFrame())

	noviceWantedActivity.control.total_money = noviceWantedActivity.control.total_money + noviceWantedActivity.data.armiesArray[var_69_1].gold

	local var_69_3 = noviceWantedActivity.ui.calculate()

	noviceWantedActivity.selfRef.uiTable.bar:setScaleX(var_69_3 - 25)
	noviceWantedActivity.selfRef.uiTable.bar:setPosition(ccp(25 + (var_69_3 - 25) / 2, 18))
end

function noviceWantedActivity.control.request_getTaskReward(arg_70_0)
	cmgr.sendRequest(noviceWantedActivity.control.receive_getTaskReward, actions.getNoviceWantedReward, arg_70_0)
end

function noviceWantedActivity.control.click_lingqu(arg_71_0)
	noviceWantedActivity.control.current_clickIndex = arg_71_0

	local var_71_0 = noviceWantedActivity.data.armiesArray[arg_71_0].armiesId

	noviceWantedActivity.control.request_getTaskReward(var_71_0)
end

return var_0_0
