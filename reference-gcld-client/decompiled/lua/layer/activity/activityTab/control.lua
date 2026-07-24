local var_0_0 = class("activityTabControl")

function var_0_0.ctor(arg_1_0, arg_1_1)
	arg_1_0.ui = arg_1_1
end

function var_0_0.getActivityInfo(arg_2_0)
	local function var_2_0(arg_3_0)
		arg_2_0.data = arg_3_0.action.data

		arg_2_0.ui:init(o)

		if arg_2_0.rewardTable then
			arg_2_0.rewardTable = nil
		end
	end

	for iter_2_0, iter_2_1 in pairs(activityConstant.TYPES) do
		if iter_2_1.tag == arg_2_0.ui.actTag then
			cmgr.sendRequest(var_2_0, iter_2_1.action)

			return
		end
	end
end

function var_0_0.expDrawReward(arg_4_0)
	local function var_4_0(arg_5_0)
		local var_5_0 = {
			{}
		}

		var_5_0[1].id = 6
		var_5_0[1].value = arg_5_0.action.data.addLvExp

		globalAction_gotResource(var_5_0)

		local var_5_1 = smgr.getLayer("activityLayer")

		smgr.getLayer("topLayer"):removeChild(var_5_1, true)
	end

	cmgr.sendRequest(var_4_0, actions.rewardLvExpActivity)
end

function var_0_0.ironDrawReward(arg_6_0)
	local function var_6_0(arg_7_0)
		local var_7_0 = {
			{}
		}

		var_7_0[1].id = 4
		var_7_0[1].value = arg_7_0.action.data.iron

		globalAction_gotResource(var_7_0)

		if arg_6_0.data.lv >= #arg_6_0.data.lvs and arg_6_0.data.rewardTimes == 1 then
			local var_7_1 = smgr.getLayer("activityLayer")

			smgr.getLayer("topLayer"):removeChild(var_7_1, true)

			return
		end

		arg_6_0:getActivityInfo()
	end

	cmgr.sendRequest(var_6_0, actions.rewardIronActivity)
end

function var_0_0.act51DrawReward(arg_8_0)
	local function var_8_0(arg_9_0)
		local var_9_0 = smgr.getLayer("pushLayer")
		local var_9_1 = CCSprite:create()

		var_9_1:setPosition(ccp(visibleSize.width / 2, visibleSize.height / 2))
		var_9_0:addChild(var_9_1)

		local var_9_2 = CCSprite:createWithSpriteFrameName("acti_jyjc_congr_view.png")

		var_9_2:setPosition(ccp(0, 0))
		var_9_1:addChild(var_9_2)

		local var_9_3 = CCSprite:createWithSpriteFrameName("acti_jyjc_congr.png")

		var_9_3:setPosition(ccp(0, 113))
		var_9_1:addChild(var_9_3, 1)

		local var_9_4 = CCSprite:createWithSpriteFrameName("acti_jyjc_" .. arg_8_0.data.addExp .. "0.png")

		var_9_4:setPosition(ccp(-visibleSize.width, 40))
		var_9_1:addChild(var_9_4, 1)
		var_9_4:runAction(CCEaseSineOut:create(CCMoveTo:create(1, ccp(0, 40))))

		local var_9_5 = CCSprite:createWithSpriteFrameName("acti_jyjc_congr_atti.png")

		var_9_5:setPosition(ccp(visibleSize.height, -50))
		var_9_1:addChild(var_9_5, 1)
		var_9_5:runAction(CCEaseSineOut:create(CCMoveTo:create(1, ccp(0, -50))))

		local var_9_6 = CCArray:create()

		var_9_6:addObject(CCDelayTime:create(3))
		var_9_6:addObject(CCCallFuncN:create(function()
			var_9_0:removeAllChildrenWithCleanup(true)
		end))
		var_9_1:runAction(CCSequence:create(var_9_6))

		user.activity.activity51 = false

		local var_9_7 = smgr.getLayer("activityLayer")

		smgr.getLayer("topLayer"):removeChild(var_9_7, true)
	end

	cmgr.sendRequest(var_8_0, actions.rewardActivity51)
end

function var_0_0.getEventReward(arg_11_0, arg_11_1)
	log.info("getEventReward(step)=%s", arg_11_1)

	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0.action.data
		local var_12_1 = {}

		if var_12_0.phantom then
			table.insert(var_12_1, {
				id = 41,
				value = var_12_0.phantom
			})
		end

		if var_12_0.tips then
			table.insert(var_12_1, {
				id = 10030,
				value = var_12_0.tips
			})
		end

		globalAction_gotResource(var_12_1)
		arg_11_0:getActivityInfo()
	end

	cmgr.sendRequest(var_11_0, actions.getFamousPhantom, arg_11_1)
end

function var_0_0.showLoginReward(arg_13_0, arg_13_1)
	return
end

local var_0_1 = {
	type_12 = 41,
	type_9 = 5,
	type_3 = 3,
	type_6 = 6
}
local var_0_2 = false

function var_0_0.onTouch(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_1 == CCTOUCHBEGAN then
		if arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_7DAY_LOGIN.tag then
			local var_14_0 = 0

			for iter_14_0 = 1, #arg_14_0.data.days do
				local var_14_1 = arg_14_0.ui.uiTable["item" .. tostring(iter_14_0)]
				local var_14_2 = var_14_1:getContentSize()
				local var_14_3 = var_14_1:convertToNodeSpace(ccp(arg_14_2, arg_14_3))

				log.info(tostring(var_14_3.x) .. "←x★y→" .. tostring(var_14_3.y))

				if CCRectMake(0, 0, var_14_2.width, var_14_2.height):containsPoint(var_14_3) then
					var_14_0 = iter_14_0

					break
				end
			end

			if var_14_0 ~= 0 then
				local var_14_4 = arg_14_0.data.days[var_14_0].rewards
				local var_14_5 = 290
				local var_14_6 = 55 + #var_14_4 * 25
				local var_14_7 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

				var_14_7:setContentSize(CCSizeMake(var_14_5, var_14_6))
				var_14_7:setPosition(ccp(160, 250))

				local var_14_8 = CCLabelTTF:create(language.get(360008, var_14_0), "", 26)

				var_14_8:setPosition(var_14_5 / 2, var_14_6 - 20)
				var_14_8:setColor(ccc3(235, 209, 167))
				var_14_8:setDimensions(CCSizeMake(var_14_5 - 30, 30))
				var_14_8:setHorizontalAlignment(kCCTextAlignmentLeft)
				var_14_7:addChild(var_14_8)

				local var_14_9 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_tips_list.png")

				var_14_9:setPosition(ccp(var_14_5 / 2, var_14_6 - 40))
				var_14_7:addChild(var_14_9)

				local var_14_10 = {
					["2"] = language.get(10102),
					["19"] = language.get(10100),
					["3"] = language.get(10103),
					["1"] = language.get(10101),
					["102"] = language.get(360009),
					["40"] = language.get(360010),
					["24"] = language.get(360011),
					["100001"] = language.get(360012),
					["100002"] = language.get(360014),
					["100003"] = language.get(360015),
					["100004"] = language.get(360016),
					["100005"] = language.get(360013),
					["42"] = language.get(360017)
				}

				for iter_14_1, iter_14_2 in ipairs(var_14_4) do
					local var_14_11 = var_14_10["" .. iter_14_2.type] or "未知奖励"
					local var_14_12 = CCLabelTTF:create(var_14_11 .. "+" .. iter_14_2.value, "", 22)

					var_14_12:setPosition(var_14_5 / 2, var_14_6 - 38 - 26 * iter_14_1)
					var_14_12:setColor(ccc3(235, 209, 167))
					var_14_12:setDimensions(CCSizeMake(var_14_5 - 30, 30))
					var_14_12:setHorizontalAlignment(kCCTextAlignmentLeft)
					var_14_7:addChild(var_14_12)
				end

				arg_14_0.ui.uiTable.bgPic:addChild(var_14_7, 200)

				arg_14_0.ui.uiTable.tipsBg = var_14_7
			end
		end

		return true
	elseif arg_14_1 == CCTOUCHENDED then
		if arg_14_0.tips and not tolua.isnull(arg_14_0.tips) then
			arg_14_0.tips:removeFromParentAndCleanup(true)

			arg_14_0.tips = nil
		end

		if arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_DRAGON.tag then
			if arg_14_0.data.dragonNum > 0 and tool.checkIfTouch(arg_14_0.ui.uiTable.actBox, arg_14_2, arg_14_3) then
				local function var_14_13(arg_15_0)
					local var_15_0 = {
						{}
					}

					var_15_0[1].id = var_0_1["type_" .. arg_15_0.action.data.type]
					var_15_0[1].value = arg_15_0.action.data.num

					globalAction_gotResource(var_15_0)

					arg_14_0.data.dragonNum = arg_14_0.data.dragonNum - 1

					arg_14_0.ui.uiTable.actDragonMulti:setString(arg_14_0.data.dragonNum)
				end

				cmgr.sendRequest(var_14_13, actions.rewardDragonActivity)
			end

			for iter_14_3 = 1, 3 do
				if tool.checkIfTouch(arg_14_0.ui.uiTable["actDragonIcon_" .. iter_14_3], arg_14_2, arg_14_3) then
					arg_14_0:showDragonIconTips(iter_14_3)
				end
			end
		elseif arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_7DAY_LOGIN.tag then
			if arg_14_0.ui.uiTable.tipsBg ~= nil then
				arg_14_0.ui.uiTable.tipsBg:setVisible(false)
			end

			local var_14_14 = arg_14_0.data.days[arg_14_0.data.createDay]

			if var_14_14 and var_14_14.rewardObtained ~= 1 then
				local var_14_15 = 0

				for iter_14_4 = 1, #arg_14_0.data.days do
					local var_14_16 = arg_14_0.ui.uiTable["item" .. tostring(iter_14_4)]
					local var_14_17 = var_14_16:getContentSize()
					local var_14_18 = var_14_16:convertToNodeSpace(ccp(arg_14_2, arg_14_3))

					log.info(tostring(var_14_18.x) .. "←x★y→" .. tostring(var_14_18.y))

					if CCRectMake(0, 0, var_14_17.width, var_14_17.height):containsPoint(var_14_18) then
						var_14_15 = iter_14_4

						break
					end
				end

				if var_14_15 == arg_14_0.data.createDay then
					local function var_14_19(arg_16_0)
						local var_16_0 = arg_16_0.action.data
						local var_16_1 = require("lua/common/json")

						log.info("", var_16_1.encode(arg_16_0))

						local var_16_2 = {}

						for iter_16_0, iter_16_1 in ipairs(var_16_0.rewards) do
							var_16_2[iter_16_0] = {}
							var_16_2[iter_16_0].id = iter_16_1.type
							var_16_2[iter_16_0].value = iter_16_1.value

							if iter_16_1.type == 102 then
								var_16_2[iter_16_0].id = 41
							end
						end

						local var_16_3 = arg_14_0.ui.uiTable["item" .. tostring(arg_14_0.data.createDay)]

						if var_16_3 then
							local var_16_4 = CCSprite:create("res/ui/activity/weekActivity/acti_lxdl_already_got.png")

							var_16_4:setPosition(ccp(46, 60))
							var_16_3:addChild(var_16_4)
						end

						globalAction_gotResource(var_16_2)
					end

					cmgr.sendRequest(var_14_19, actions.getWeekLoginTodayReward)

					var_14_14.rewardObtained = 1
				end
			end
		elseif arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_REDBOMB.tag then
			if arg_14_0.ui.uiTable.tipsBg ~= nil then
				arg_14_0.ui.uiTable.tipsBg:setVisible(false)
			end
		elseif arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_ZIYUAN.tag then
			if arg_14_0.ui.uiTable.res_info_bg ~= nil then
				arg_14_0.ui.uiTable.bgPic:removeChild(arg_14_0.ui.uiTable.res_info_bg, true)

				arg_14_0.ui.uiTable.res_info_bg = nil
			end
		elseif arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_XILIAN.tag then
			local var_14_20
			local var_14_21
			local var_14_22

			for iter_14_5, iter_14_6 in pairs(arg_14_0.data.xiLianTimes) do
				if iter_14_6.ids == 1 then
					var_14_20 = iter_14_6
				elseif iter_14_6.ids == 2 then
					var_14_21 = iter_14_6
				elseif iter_14_6.ids == 3 then
					var_14_22 = iter_14_6
				end
			end

			local var_14_23 = {
				var_14_20,
				var_14_21,
				var_14_22
			}

			for iter_14_7 = 1, 3 do
				xlInfo = var_14_23[iter_14_7]

				if xlInfo.received == 0 and arg_14_0.data.num >= xlInfo.times and tool.checkIfTouch(arg_14_0.ui.uiTable["clickToChoose_" .. iter_14_7], arg_14_2, arg_14_3) then
					log.info("choose " .. iter_14_7)
					arg_14_0:chooseEquip(iter_14_7)
				end
			end
		elseif arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_FAMOUS.tag then
			if arg_14_0.ui.uiTable.giftPanel and arg_14_0.ui.uiTable.giftPanel:isVisible() then
				if not tool.checkIfTouch(arg_14_0.ui.uiTable.giftPanel, arg_14_2, arg_14_3) then
					arg_14_0.ui.uiTable.giftPanel:setVisible(false)
					arg_14_0:getActivityInfo()
				end

				return true
			end

			if arg_14_0.ui.uiTable.famousHead and tool.checkIfTouch(arg_14_0.ui.uiTable.famousHead, arg_14_2, arg_14_3) then
				local var_14_24

				for iter_14_8, iter_14_9 in pairs(arg_14_0.data.npcs) do
					if iter_14_9.state ~= 1 and var_14_24 == nil then
						var_14_24 = iter_14_9
					end
				end

				if var_14_24 and var_14_24.state == 0 then
					smgr.getLayer("topLayer"):removeAllChildrenWithCleanup(true)
					loadingLayer.show(SCENE_WORLD, var_14_24.cityId, nil, nil, true)
				end
			end

			if arg_14_0.ui.uiTable.hsbBg and arg_14_0.ui.uiTable.hsbBg:isVisible() then
				if tool.checkIfTouch(arg_14_0.ui.uiTable.hsbBg, arg_14_2, arg_14_3) then
					if arg_14_0.data.bigRewardType == 108 then
						arg_14_0:showFamousGiftPanel()
					elseif arg_14_0.data.bigRewardType == 126 then
						if arg_14_0.data.silkTipsOver then
							smgr.showTipText(language.get(132015))
							amgr.playEffect(enumAudioFile.ui_click_error, false, true)
						else
							arg_14_0:showFamousGiftPanel()
						end
					elseif arg_14_0.ui.uiTable.goldLabel:isVisible() then
						messageBox.confirm(language.get(131095, arg_14_0.data.gold), function()
							arg_14_0:getHeshibi()
						end)
					else
						arg_14_0:getHeshibi()
					end
				end
			elseif tool.checkIfTouch(arg_14_0.ui.uiTable.hsbBg, arg_14_2, arg_14_3) then
				arg_14_0:showHeshibiTips()
			end

			for iter_14_10 = 1, 3 do
				if tool.checkIfTouch(arg_14_0.ui.uiTable["famousItem" .. iter_14_10], arg_14_2, arg_14_3) then
					arg_14_0:showFamousItemTips(iter_14_10)
				end
			end
		elseif arg_14_0.ui.actTag == activityConstant.TYPES.ACTIVITY_WUSEGEM.tag then
			log.info("@@神捶砸宝石")

			local var_14_25 = arg_14_0.data.num

			for iter_14_11 = 1, 3 do
				local var_14_26 = arg_14_0.ui.uiTable["actShenChuiIcon" .. iter_14_11]
				local var_14_27 = arg_14_0.data.gems[iter_14_11]

				if var_14_25 >= var_14_27.gem and var_14_27.status == 1 and tool.checkIfTouch(var_14_26, arg_14_2, arg_14_3) and arg_14_0.data.hammer <= 0 then
					log.info("touch on " .. iter_14_11)
					arg_14_0:GetHammerActive(iter_14_11)
					arg_14_0:getActivityInfo()

					break
				elseif tool.checkIfTouch(var_14_26, arg_14_2, arg_14_3) and arg_14_0.data.hammer <= 0 then
					log.info("touch on shenchui")
					arg_14_0:showGemActivityTips(iter_14_11, arg_14_0.data.num)
				end
			end

			for iter_14_12 = 1, #arg_14_0.data.hammers do
				local var_14_28 = arg_14_0.ui.uiTable["GemMine_" .. iter_14_12]
				local var_14_29 = arg_14_0.data.hammers[iter_14_12]
				local var_14_30 = arg_14_0.data.hammer
				local var_14_31 = var_14_29.num

				if tool.checkIfTouch(var_14_28, arg_14_2, arg_14_3) and arg_14_0.data.gemHeap <= 0 and var_0_2 == false then
					if var_14_30 > 0 and var_14_31 > 0 then
						log.info(arg_14_0.data.hammer)

						local var_14_32 = {
							{
								posy = 90,
								posx = 295
							},
							{
								posy = 90,
								posx = 450
							},
							{
								posy = 75,
								posx = 677
							},
							{
								posy = 75,
								posx = 870
							}
						}
						local var_14_33 = arg_14_0.ui.uiTable.HammerClick:getContentSize().width
						local var_14_34 = arg_14_0.ui.uiTable.HammerClick:getContentSize().height

						arg_14_0.ui.uiTable.HammerClick:setPosition(ccp(var_14_32[iter_14_12].posx, var_14_32[iter_14_12].posy))
						arg_14_0.ui.uiTable.HammerClick:setVisible(true)

						local var_14_35 = CCDelayTime:create(0.2)
						local var_14_36 = CCEaseExponentialOut:create(CCRotateBy:create(0.1, -45))
						local var_14_37 = CCEaseExponentialOut:create(CCRotateBy:create(0.1, 45))
						local var_14_38 = CCFadeOut:create(0.5)
						local var_14_39 = CCArray:create()

						var_14_39:addObject(var_14_35)
						var_14_39:addObject(var_14_36)
						var_14_39:addObject(var_14_37)
						var_14_39:addObject(var_14_38)

						local var_14_40, var_14_41 = var_14_28:getPosition()
						local var_14_42 = CCMoveTo:create(0.1, ccp(var_14_40 + 2, var_14_41))
						local var_14_43 = CCMoveTo:create(0.1, ccp(var_14_40 - 2, var_14_41))
						local var_14_44 = CCMoveTo:create(0.1, ccp(var_14_40, var_14_41))
						local var_14_45 = CCArray:create()

						var_14_45:addObject(var_14_42)
						var_14_45:addObject(var_14_43)
						var_14_45:addObject(var_14_44)

						local var_14_46 = CCSequence:create(var_14_39)
						local var_14_47 = CCSequence:create(var_14_45)

						arg_14_0.ui.uiTable.HammerClick:runAction(CCRepeat:create(var_14_46, 1))
						arg_14_0.ui.uiTable["GemMine_" .. iter_14_12]:runAction(CCRepeat:create(var_14_47, 2))
						arg_14_0:UpdataGemMineNum(iter_14_12)

						local function var_14_48()
							arg_14_0:dropGem(iter_14_12)
						end

						NewTimer(0.6, var_14_48)
					elseif var_14_29.num > 0 then
						arg_14_0.ui.uiTable.HammerClick:setVisible(false)
						arg_14_0:showGemMineTips(iter_14_12, var_14_29.numStar1, var_14_29.gemNum, var_14_29.gemId)
					end
				end
			end
		end
	end
end

function var_0_0.getHeshibi(arg_19_0)
	local function var_19_0(arg_20_0)
		if arg_20_0.action.data.heshibi == 1 or arg_20_0.action.data.bigRewardType == 107 then
			local var_20_0 = {
				{}
			}

			var_20_0[1].id = 27
			var_20_0[1].value = 1

			globalAction_gotResource(var_20_0)
		end

		arg_19_0:getActivityInfo()
	end

	cmgr.sendRequest(var_19_0, actions.getFamousHeshibi)
end

function var_0_0.showFamousGiftPanel(arg_21_0)
	if arg_21_0.data.bigRewardType == 108 then
		arg_21_0.ui.uiTable.tongNum:setVisible(false)
		arg_21_0.ui.uiTable.yongNum:setVisible(false)
		arg_21_0.ui.uiTable.btn_getGift:setEnabled(false)
		arg_21_0.ui.uiTable.msProcess:setPercentage(0)
		arg_21_0.ui.uiTable.giftPanel:setVisible(true)

		local var_21_0 = CCArray:create()

		var_21_0:addObject(CCProgressTo:create(0.3, 100))
		var_21_0:addObject(CCCallFuncN:create(function()
			arg_21_0.ui.uiTable.tongNum:setVisible(true)
			arg_21_0.ui.uiTable.yongNum:setVisible(true)
			arg_21_0.ui.uiTable.btn_getGift:setEnabled(true)
		end))

		local var_21_1 = CCSequence:create(var_21_0)

		arg_21_0.ui.uiTable.msProcess:runAction(var_21_1)
	elseif arg_21_0.data.bigRewardType == 126 then
		arg_21_0.ui.uiTable.tipsRange:setVisible(false)
		arg_21_0.ui.uiTable.btn_getGift:setEnabled(false)
		arg_21_0.ui.uiTable.msProcess:setPercentage(0)
		arg_21_0.ui.uiTable.giftPanel:setVisible(true)

		local var_21_2 = CCArray:create()

		var_21_2:addObject(CCProgressTo:create(0.3, 100))
		var_21_2:addObject(CCCallFuncN:create(function()
			arg_21_0.ui.uiTable.tipsRange:setVisible(true)
			arg_21_0.ui.uiTable.btn_getGift:setEnabled(true)
		end))

		local var_21_3 = CCSequence:create(var_21_2)

		arg_21_0.ui.uiTable.msProcess:runAction(var_21_3)
	end
end

function var_0_0.getFamousBigGift(arg_24_0)
	math.randomseed(os.time())

	local function var_24_0(arg_25_0)
		local var_25_0 = arg_25_0.action.data

		if arg_24_0.data.bigRewardType == 108 then
			local var_25_1 = CCArray:create()

			var_25_1:addObject(CCCallFuncN:create(function()
				local var_26_0 = math.random(arg_24_0.data.leaMin, arg_24_0.data.leaMax)
				local var_26_1 = math.random(arg_24_0.data.strMin, arg_24_0.data.strMax)

				arg_24_0.ui.uiTable.tongNum:setString(var_26_0)
				arg_24_0.ui.uiTable.yongNum:setString(var_26_1)
			end))
			var_25_1:addObject(CCDelayTime:create(0.1))
			arg_24_0.ui.uiTable.tongNum:runAction(CCRepeatForever:create(CCSequence:create(var_25_1)))

			local var_25_2 = CCArray:create()

			var_25_2:addObject(CCProgressTo:create(1.2, 100))
			var_25_2:addObject(CCCallFuncN:create(function()
				arg_24_0.ui.uiTable.tongNum:setString(var_25_0.lea)
				arg_24_0.ui.uiTable.yongNum:setString(var_25_0.str)
				arg_24_0.ui.uiTable.tongNum:stopAllActions()
				rmgr.loadResource("res/ui/equip/quenching/equipmentQuenchingView.plist")

				local var_27_0 = 12
				local var_27_1 = CCArray:create()

				for iter_27_0 = 1, var_27_0 do
					local var_27_2 = string.format("equipmentQuenchingView_explodeEffect_%s.png", iter_27_0)
					local var_27_3 = tool.spriteByName(var_27_2):displayFrame()

					var_27_1:addObject(var_27_3)
				end

				local var_27_4 = CCAnimation:createWithSpriteFrames(var_27_1, 0.1)
				local var_27_5 = CCAnimate:create(var_27_4)
				local var_27_6 = CCSprite:create()

				arg_24_0.ui.uiTable.itemPic:addChild(var_27_6)
				var_27_6:setPosition(ccp(36, 36))

				local var_27_7 = CCArray:create()

				var_27_7:addObject(var_27_5)
				var_27_7:addObject(CCCallFuncN:create(function()
					var_27_6:removeFromParentAndCleanup(true)
				end))
				var_27_6:runAction(CCSequence:create(var_27_7))
			end))
			var_25_2:addObject(CCCallFuncN:create(function()
				local var_29_0 = {
					{}
				}

				var_29_0[1].id = 108
				var_29_0[1].value = 1

				globalAction_gotResource(var_29_0)
			end))
			arg_24_0.ui.uiTable.msProcess:runAction(CCSequence:create(var_25_2))
		elseif arg_24_0.data.bigRewardType == 126 then
			arg_24_0.ui.uiTable.tipsRange:setVisible(false)
			arg_24_0.ui.uiTable.tipsNum:setVisible(true)

			local var_25_3 = CCArray:create()

			var_25_3:addObject(CCCallFuncN:create(function()
				local var_30_0 = math.random(arg_24_0.data.leaMin, arg_24_0.data.leaMax)

				arg_24_0.ui.uiTable.tipsNum:setString(var_30_0)
			end))
			var_25_3:addObject(CCDelayTime:create(0.1))
			arg_24_0.ui.uiTable.tipsNum:runAction(CCRepeatForever:create(CCSequence:create(var_25_3)))

			local var_25_4 = CCArray:create()

			var_25_4:addObject(CCProgressTo:create(1.2, 100))
			var_25_4:addObject(CCCallFuncN:create(function()
				arg_24_0.ui.uiTable.tipsNum:setString(var_25_0.bigRewardNum)
				arg_24_0.ui.uiTable.tipsNum:stopAllActions()
				rmgr.loadResource("res/ui/equip/quenching/equipmentQuenchingView.plist")

				local var_31_0 = 12
				local var_31_1 = CCArray:create()

				for iter_31_0 = 1, var_31_0 do
					local var_31_2 = string.format("equipmentQuenchingView_explodeEffect_%s.png", iter_31_0)
					local var_31_3 = tool.spriteByName(var_31_2):displayFrame()

					var_31_1:addObject(var_31_3)
				end

				local var_31_4 = CCAnimation:createWithSpriteFrames(var_31_1, 0.1)
				local var_31_5 = CCAnimate:create(var_31_4)
				local var_31_6 = CCSprite:create()

				arg_24_0.ui.uiTable.itemPic:addChild(var_31_6)
				var_31_6:setPosition(ccp(36, 36))

				local var_31_7 = CCArray:create()

				var_31_7:addObject(var_31_5)
				var_31_7:addObject(CCCallFuncN:create(function()
					var_31_6:removeFromParentAndCleanup(true)
				end))
				var_31_6:runAction(CCSequence:create(var_31_7))
			end))
			var_25_4:addObject(CCCallFuncN:create(function()
				local var_33_0 = {
					{}
				}

				var_33_0[1].id = 10030
				var_33_0[1].value = var_25_0.bigRewardNum

				globalAction_gotResource(var_33_0)
			end))
			arg_24_0.ui.uiTable.msProcess:runAction(CCSequence:create(var_25_4))
		end
	end

	arg_24_0.ui.uiTable.btn_getGift:setEnabled(false)
	cmgr.sendRequest(var_24_0, actions.getFamousHeshibi)
end

function var_0_0.incenseIron(arg_34_0, arg_34_1)
	local var_34_0 = 0
	local var_34_1

	local function var_34_2(arg_35_0)
		local var_35_0 = arg_35_0.action.data

		if var_35_0.extraIron and var_35_0.extraIron > 0 then
			local var_35_1 = {}
			local var_35_2 = {}

			var_35_2.id = 4
			var_35_2.value = var_35_0.extraIron

			table.insert(var_35_1, var_35_2)
			globalAction_gotResource(var_35_1)
		end

		if var_35_0.extraGang and var_35_0.extraGang > 0 then
			local var_35_3 = {}
			local var_35_4 = {}

			var_35_4.id = 10033
			var_35_4.value = var_35_0.extraGang

			table.insert(var_35_3, var_35_4)
			globalAction_gotResource(var_35_3)
		end

		local var_35_5 = var_35_0.resourceGot[1]
		local var_35_6 = var_35_0.multiple
		local var_35_7 = CCSprite:create("res/ui/activity/ironReward/js_get_bg.png")
		local var_35_8 = var_35_5.resourceType == 119 and 131152 or 131165
		local var_35_9 = CCStrokeLabelTTF:create(language.get(var_35_8, var_35_5.addNum), "Thonburi", 20, 2, ccc3(22, 18, 13))
		local var_35_10 = smgr.getLayer("pushLayer")
		local var_35_11

		if arg_34_1 == 1 then
			var_35_11 = arg_34_0.ui.uiTable.actIronRewardLeft
		else
			var_35_11 = arg_34_0.ui.uiTable.actIronRewardRight
		end

		if var_35_6 > 1 then
			if arg_34_0.bjSprite and not tolua.isnull(arg_34_0.bjSprite) then
				arg_34_0.bjSprite:removeFromParentAndCleanup(true)

				arg_34_0.bjSprite = nil
			end

			local var_35_12 = CCSprite:create("res/ui/activity/ironReward/js_bj_" .. var_35_6 .. ".png")
			local var_35_13 = ccp(tool.getPositionInScreen(var_35_11))
			local var_35_14 = ccpAdd(var_35_13, ccp(-80, 71))

			var_35_12:setPosition(var_35_14)
			var_35_10:addChild(var_35_12)

			local var_35_15 = CCArray:create()

			var_35_15:addObject(CCDelayTime:create(0.5))
			var_35_15:addObject(CCFadeOut:create(0.2))
			var_35_15:addObject(CCCallFunc:create(function()
				var_35_12:removeFromParentAndCleanup(true)

				var_35_12 = nil
			end))
			var_35_12:runAction(CCSequence:create(var_35_15))

			arg_34_0.bjSprite = var_35_12
		end

		if var_35_6 == 1 then
			var_35_9:setColor(ccc3(255, 255, 204))
		elseif var_35_6 == 2 then
			var_35_9:setColor(ccc3(255, 204, 0))
		elseif var_35_6 == 4 then
			var_35_9:setColor(ccc3(240, 112, 84))
		elseif var_35_6 == 10 then
			var_35_9:setColor(ccc3(200, 123, 245))
		end

		var_35_9:setPosition(ccp(80.5, 16.5))
		var_35_7:addChild(var_35_9)

		local var_35_16 = ccp(tool.getPositionInScreen(var_35_11))
		local var_35_17 = ccpAdd(var_35_16, ccp(-80, -71))

		var_35_7:setPosition(var_35_17)
		var_35_10:addChild(var_35_7)

		local var_35_18 = CCArray:create()

		var_35_18:addObject(CCEaseSineInOut:create(CCMoveBy:create(0.5, ccp(0, 100))))
		var_35_18:addObject(CCFadeOut:create(0.4))
		var_35_18:addObject(CCCallFunc:create(function()
			var_35_7:removeFromParentAndCleanup(true)
		end))
		var_35_7:runAction(CCSequence:create(var_35_18))

		local var_35_19 = CCArray:create()

		var_35_19:addObject(CCDelayTime:create(0.5))
		var_35_19:addObject(CCFadeOut:create(0.4))
		var_35_9:runAction(CCSequence:create(var_35_19))

		var_34_0 = var_34_0 + 1

		if var_34_0 >= arg_34_1 then
			arg_34_0:getActivityInfo()
		else
			cmgr.sendRequest(var_34_2, actions.doWorship, "4")
		end
	end

	messageBox.showChargeWin(language.get(10003), language.get(71010, arg_34_0.data["gold" .. arg_34_1]), "incenseGold", function()
		cmgr.sendRequest(var_34_2, actions.doWorship, "4")
	end)
end

function var_0_0.click_activityResource_info(arg_39_0)
	if arg_39_0.ui.uiTable.res_info_bg ~= nil then
		arg_39_0.ui.uiTable.bgPic:removeChild(arg_39_0.ui.uiTable.res_info_bg, true)

		arg_39_0.ui.uiTable.res_info_bg = nil
	end

	local var_39_0 = #arg_39_0.data.areas
	local var_39_1 = CCScale9Sprite:create("res/ui/weapon/tips_di.png", CCRectMake(0, 0, 80, 80), CCRectMake(20, 20, 40, 40))

	if conf.language == "vie" then
		var_39_1:setContentSize(CCSizeMake(450, var_39_0 * 30 + 10))
	else
		var_39_1:setContentSize(CCSizeMake(390, var_39_0 * 30 + 10))
	end

	var_39_1:setPosition(ccp(620, 440 - var_39_0 * 10))
	arg_39_0.ui.uiTable.bgPic:addChild(var_39_1, 10)

	local var_39_2 = {
		language.get(102020),
		language.get(102021),
		language.get(102022),
		language.get(102023),
		language.get(102024)
	}

	for iter_39_0 = 1, var_39_0 do
		local var_39_3 = arg_39_0.data.areas[iter_39_0]
		local var_39_4 = var_39_2[var_39_3.areaId]
		local var_39_5 = language.get(131064)

		if var_39_3.additionMode == 1 then
			var_39_5 = language.get(131065, 1.5)
		elseif var_39_3.additionMode == 2 then
			var_39_5 = language.get(131065, 2)
		elseif var_39_3.additionMode == 3 then
			var_39_5 = language.get(131065, 3)
		end

		local var_39_6 = language.get(131063)

		if tonumber(var_39_3.additionMode) > 0 then
			local var_39_7 = math.floor(var_39_3.additionCd / 1000)
			local var_39_8 = math.floor(var_39_7 / 60)
			local var_39_9 = math.floor(var_39_8 / 60)
			local var_39_10 = math.floor(var_39_9 / 24)

			if var_39_10 > 0 then
				var_39_6 = language.get(180004, var_39_10)
			elseif var_39_9 > 0 then
				var_39_6 = language.get(180003, var_39_9)
			else
				var_39_6 = language.get(131066)
			end
		end

		local var_39_11 = language.get(131061, var_39_4, var_39_5)
		local var_39_12 = language.get(131062, var_39_6)
		local var_39_13 = CCLabelTTF:create(var_39_11, "", 20)

		var_39_13:setColor(ccc3(197, 171, 141))
		var_39_13:setPosition(ccp(150, (var_39_0 - iter_39_0) * 30 + 17))
		var_39_13:setDimensions(CCSizeMake(280, 30))
		var_39_13:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_39_1:addChild(var_39_13)

		local var_39_14 = CCLabelTTF:create(var_39_12, "", 20)

		var_39_14:setColor(ccc3(197, 171, 141))
		var_39_14:setPosition(ccp(390, (var_39_0 - iter_39_0) * 30 + 17))
		var_39_14:setDimensions(CCSizeMake(280, 30))
		var_39_14:setHorizontalAlignment(kCCTextAlignmentLeft)
		var_39_1:addChild(var_39_14)
	end

	arg_39_0.ui.uiTable.res_info_bg = var_39_1
end

function var_0_0.click_resourceUp(arg_40_0, arg_40_1)
	local var_40_0 = math.floor((arg_40_1 - 1) / 2)
	local var_40_1 = arg_40_1 - 1 - var_40_0 * 2
	local var_40_2 = arg_40_0.data.areas[var_40_0 + 1]
	local var_40_3 = {
		7,
		30
	}
	local var_40_4 = 3

	if var_40_2.areaId == 5 then
		var_40_4 = 2
	end

	local function var_40_5(arg_41_0)
		local var_41_0 = arg_41_0.action.data

		if var_41_0.rewardType ~= nil then
			local var_41_1 = {
				{}
			}

			var_41_1[1].id = var_41_0.rewardType
			var_41_1[1].value = var_41_0.rewardValue

			globalAction_gotResource(var_41_1)
			arg_40_0:getActivityInfo()
		end
	end

	if tonumber(var_40_2.additionRate) > 1 then
		local var_40_6 = ""

		if var_40_2.rate == var_40_2.additionMode then
			var_40_6 = language.get(250009)
		else
			var_40_6 = language.get(250010)
		end

		local var_40_7 = var_40_2.rate * 100

		messageBox.confirm(var_40_6, function()
			messageBox.confirm(language.get(250011, var_40_2["gold" .. var_40_1 + 1], var_40_3[var_40_1 + 1], tostring(var_40_7) .. "%"), function()
				local var_43_0 = var_40_2.currentTimeType

				if var_40_1 == 0 then
					var_43_0 = 2
				elseif var_40_1 == 1 then
					var_43_0 = 3
				end

				cmgr.sendRequest(var_40_5, actions.addBuildingAddition, var_43_0, var_40_2.areaId, var_40_4)
			end)
		end)
	else
		local var_40_8 = var_40_2.rate * 100

		messageBox.confirm(language.get(250011, var_40_2["gold" .. var_40_1 + 1], var_40_3[var_40_1 + 1], tostring(var_40_8) .. "%"), function()
			local var_44_0 = var_40_2.currentTimeType

			if var_40_1 == 0 then
				var_44_0 = 2
			elseif var_40_1 == 1 then
				var_44_0 = 3
			end

			cmgr.sendRequest(var_40_5, actions.addBuildingAddition, var_44_0, var_40_2.areaId, var_40_4)
		end)
	end

	arg_40_0.ui.offset = arg_40_0.ui.uiTable.ziyuan_scoll:getContentOffset()
end

function var_0_0.chooseEquip(arg_45_0, arg_45_1)
	local var_45_0 = require("lua/layer/activity/activityTab/ChooseEquipPanel").new(arg_45_1)

	arg_45_0.chooesEquipPanel = var_45_0

	arg_45_0.ui:addChild(var_45_0, 101)
end

function var_0_0.updateQuenchingEquip(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	log.info("should updateQuenchingEquip", arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	arg_46_0.ui:updateEquipBlock(arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	pcall(arg_46_0.chooesEquipPanel.removeFromParentAndCleanup, arg_46_0.chooesEquipPanel, true)
end

function var_0_0.showDragonIconTips(arg_47_0, arg_47_1)
	if arg_47_0.tips and not tolua.isnull(arg_47_0.tips) then
		arg_47_0.tips:removeFromParentAndCleanup(true)

		arg_47_0.tips = nil
	end

	local var_47_0 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_47_0:setPreferredSize(CCSizeMake(235, 65))
	var_47_0:setAnchorPoint(ccp(1, 1))
	var_47_0:setPosition(ccp(38, 20))
	arg_47_0.ui.uiTable["actDragonIcon_" .. arg_47_1]:addChild(var_47_0, 1110)

	local var_47_1

	if arg_47_1 == 1 then
		var_47_1 = language.get(131069)
	elseif arg_47_1 == 2 then
		var_47_1 = language.get(131070)
	else
		var_47_1 = language.get(131071)
	end

	local var_47_2 = CCStrokeLabelTTF:create(var_47_1, "Thonburi", 20)

	var_47_2:setDimensions(CCSizeMake(230, 50))
	var_47_2:setPosition(ccp(117.5, 30))
	var_47_0:addChild(var_47_2)
	var_47_2:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_47_0.tips = var_47_0
end

function var_0_0.showIronRewardTips(arg_48_0, arg_48_1)
	if arg_48_0.tips and not tolua.isnull(arg_48_0.tips) then
		arg_48_0.tips:removeFromParentAndCleanup(true)

		arg_48_0.tips = nil
	end

	local var_48_0, var_48_1 = arg_48_0.ui.uiTable["actIronRewardIcon" .. arg_48_1]:getPosition()
	local var_48_2 = ({
		language.get(133001),
		language.get(133002),
		language.get(133003),
		language.get(133004),
		language.get(133005)
	})[arg_48_1]
	local var_48_3 = arg_48_0.data.incenseTimes[arg_48_1]

	if var_48_3.type == 119 then
		var_48_2 = language.get(131161, var_48_3.num)
	end

	local var_48_4 = CCStrokeLabelTTF:create(var_48_2, "Thonburi", 22)

	var_48_4:setDimensions(CCSizeMake(230, 80))
	var_48_4:setPosition(ccp(125, 50))
	bg:addChild(var_48_4)
	var_48_4:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_48_0.tips = bg
end

function var_0_0.showWenhaoTips(arg_49_0)
	if arg_49_0.tips and not tolua.isnull(arg_49_0.tips) then
		arg_49_0.tips:removeFromParentAndCleanup(true)

		arg_49_0.tips = nil
	end

	local var_49_0 = {
		{
			anchorPointX = 0,
			name = "tipsFrame",
			type = "pic_9_tips",
			pic = "frame:autoSizePanel.png",
			y = 463,
			anchorPointY = 1,
			x = 79,
			middleRect = CCRectMake(6, 6, 68, 68),
			content = {
				{
					height = 0,
					fontSize = 22,
					type = "label",
					width = 480,
					text = language.get(131075),
					align = kCCTextAlignmentLeft
				}
			}
		}
	}
	local var_49_1 = autoUI.initUI(nil, var_49_0)

	arg_49_0.ui.uiTable.background:addChild(var_49_1.tipsFrame, 101)

	arg_49_0.tips = var_49_1.tipsFrame
end

function var_0_0.showBlockWenhaoTips(arg_50_0, arg_50_1)
	if arg_50_0.tips and not tolua.isnull(arg_50_0.tips) then
		arg_50_0.tips:removeFromParentAndCleanup(true)

		arg_50_0.tips = nil
	end

	local var_50_0

	if arg_50_1 == 1 then
		var_50_0 = language.get(131076)
	elseif arg_50_1 == 2 then
		var_50_0 = language.get(131077)
	else
		var_50_0 = language.get(131078)
	end

	local var_50_1 = {
		{
			anchorPointX = 0.5,
			name = "tipsFrame",
			type = "pic_9_tips",
			pic = "frame:autoSizePanel.png",
			y = 300,
			anchorPointY = 0.5,
			x = 107,
			middleRect = CCRectMake(6, 6, 68, 68),
			content = {
				{
					height = 0,
					fontSize = 20,
					type = "label",
					width = 230,
					text = var_50_0,
					align = kCCTextAlignmentLeft
				}
			}
		}
	}
	local var_50_2 = autoUI.initUI(nil, var_50_1)

	arg_50_0.ui.uiTable["blockbg_" .. arg_50_1]:addChild(var_50_2.tipsFrame, 101)

	arg_50_0.tips = var_50_2.tipsFrame
end

function var_0_0.showFamousTips(arg_51_0)
	if arg_51_0.tips and not tolua.isnull(arg_51_0.tips) then
		arg_51_0.tips:removeFromParentAndCleanup(true)

		arg_51_0.tips = nil
	end

	local var_51_0 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_51_0:setAnchorPoint(ccp(0.5, 0.5))
	var_51_0:setPosition(ccp(750, 450))
	arg_51_0.ui.uiTable.background:addChild(var_51_0, 101)

	local var_51_1 = CCStrokeLabelTTF:create(language.get(131096), "Thonburi", 20)

	var_51_1:setAnchorPoint(ccp(0, 0))
	var_51_1:setDimensions(CCSizeMake(250, 0))

	local var_51_2 = var_51_1:getContentSize().width
	local var_51_3 = var_51_1:getContentSize().height

	var_51_0:setPreferredSize(CCSizeMake(var_51_2 + 30, var_51_3 + 30))
	var_51_1:setPosition(ccp(15, 15))
	var_51_0:addChild(var_51_1)
	var_51_1:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_51_0.tips = var_51_0
end

function var_0_0.showHeshibiTips(arg_52_0)
	if arg_52_0.tips and not tolua.isnull(arg_52_0.tips) then
		arg_52_0.tips:removeFromParentAndCleanup(true)

		arg_52_0.tips = nil
	end

	local var_52_0 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_52_0:setAnchorPoint(ccp(0.5, 0.5))
	var_52_0:setPosition(ccp(750, 450))
	arg_52_0.ui.uiTable.background:addChild(var_52_0, 101)

	local var_52_1 = 132001

	if arg_52_0.data.bigRewardType == 108 then
		var_52_1 = 132011
	elseif arg_52_0.data.bigRewardType == 126 then
		var_52_1 = 132013
	end

	local var_52_2 = CCStrokeLabelTTF:create(language.get(var_52_1), "Thonburi", 20)

	var_52_2:setAnchorPoint(ccp(0, 0))
	var_52_2:setDimensions(CCSizeMake(250, 0))

	local var_52_3 = var_52_2:getContentSize().width
	local var_52_4 = var_52_2:getContentSize().height

	var_52_0:setPreferredSize(CCSizeMake(var_52_3 + 30, var_52_4 + 30))
	var_52_2:setPosition(ccp(15, 15))
	var_52_0:addChild(var_52_2)
	var_52_2:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_52_0.tips = uiTable.tipsFrame
end

function var_0_0.showFamousItemTips(arg_53_0, arg_53_1)
	local var_53_0 = {}

	if conf.language == "vie" then
		var_53_0.tipFrameW = 20
	else
		var_53_0.tipFrameW = 0
	end

	if arg_53_0.tips and not tolua.isnull(arg_53_0.tips) then
		arg_53_0.tips:removeFromParentAndCleanup(true)

		arg_53_0.tips = nil
	end

	local var_53_1 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_53_1:setPreferredSize(CCSizeMake(255, 60 + var_53_0.tipFrameW))
	var_53_1:setAnchorPoint(ccp(0.5, 0.5))
	var_53_1:setPosition(ccp(659, 238 - (arg_53_1 - 1) * 82))
	arg_53_0.ui.uiTable.background:addChild(var_53_1, 101)

	local var_53_2 = language.get(132002)
	local var_53_3 = CCStrokeLabelTTF:create(var_53_2, "Thonburi", 20)

	var_53_3:setDimensions(CCSizeMake(250, 0))
	var_53_3:setPosition(ccp(127.5, (60 + var_53_0.tipFrameW) / 2))
	var_53_1:addChild(var_53_3)
	var_53_3:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_53_0.tips = var_53_1
end

function var_0_0.showGemActivityTips(arg_54_0, arg_54_1, arg_54_2)
	if arg_54_0.tips and not tolua.isnull(arg_54_0.tips) then
		arg_54_0.tips:removeFromParentAndCleanup(true)

		arg_54_0.tips = nil
	end

	local var_54_0 = arg_54_0.ui.uiTable["actShenChuiIcon" .. arg_54_1]
	local var_54_1 = CCScale9Sprite:createWithSpriteFrameName("autoSizePanel.png")

	var_54_1:setPreferredSize(CCSizeMake(300, 150))
	var_54_1:setAnchorPoint(ccp(0.5, 0))

	local var_54_2, var_54_3 = var_54_0:getPosition()

	var_54_1:setPosition(ccp(var_54_2, var_54_3 + 40))
	log.info(var_54_2, var_54_3 - 40)
	arg_54_0.ui.uiTable.GemsProgressBg:addChild(var_54_1, 110)

	local var_54_4 = CCStrokeLabelTTF:create(language.get(135001, arg_54_2), "Thonburi", 22)

	var_54_4:setDimensions(CCSizeMake(280, 130))
	var_54_4:setPosition(ccp(150, 75))
	var_54_1:addChild(var_54_4)
	var_54_4:setHorizontalAlignment(kCCTextAlignmentLeft)

	arg_54_0.tips = var_54_1
end

function var_0_0.getBigGemStatus(arg_55_0)
	return var_0_2
end

function var_0_0.setBigGemStatus(arg_56_0, arg_56_1)
	var_0_2 = arg_56_1

	return var_0_2
end

function var_0_0.dropGem(arg_57_0, arg_57_1)
	log.info("宝石掉落")

	local var_57_0
	local var_57_1 = false
	local var_57_2

	var_57_2 = tonumber(arg_57_0.data.hammers[arg_57_1].numStar1) > 10 and 10 or tonumber(arg_57_0.data.hammers[arg_57_1].numStar1)

	log.info(arg_57_0.data.gemHeap)
	arg_57_0:scalfunction(arg_57_0.ui.uiTable.PickupGemTit)

	if arg_57_0.data.hammers[arg_57_1].num == 0 then
		arg_57_0.ui.uiTable["GemMine_" .. arg_57_1]:setVisible(false)
	end

	for iter_57_0 = 1, arg_57_0.data.gemHeap do
		local var_57_3 = CCScale9Sprite:create("res/ui/activity/gemsActivity/icon_gem.png")
		local var_57_4 = CCControlButton:create(var_57_3)

		var_57_4:setPreferredSize(CCSizeMake(112, 92))

		local var_57_5 = math.random(-20, 170)
		local var_57_6 = math.random(95, 175)

		arg_57_0.ui.uiTable["MineIntro_" .. arg_57_1]:addChild(var_57_4)
		var_57_4:setPosition(var_57_5, var_57_6)

		local function var_57_7()
			local function var_58_0(arg_59_0)
				local var_59_0 = {
					{}
				}

				var_59_0[1].id = 7
				var_59_0[1].value = arg_59_0.action.data.num

				globalAction_gotResource(var_59_0)
				var_57_4:removeFromParentAndCleanup(true)

				arg_57_0.data.gemHeap = arg_57_0.data.gemHeap - 1

				if arg_57_0.data.gemHeap <= 0 then
					if arg_57_0.data.hammers[arg_57_1].num == 0 then
						var_0_2 = true

						local var_59_1 = {
							"greengem",
							"yellowgem",
							"redgem",
							"purplegem"
						}
						local var_59_2 = CCScale9Sprite:create("res/ui/activity/gemsActivity/gem/" .. var_59_1[arg_57_1] .. ".png")
						local var_59_3 = CCSprite:create("res/ui/activity/gemsActivity/gem/" .. var_59_1[arg_57_1] .. ".png")
						local var_59_4 = CCControlButton:create(var_59_2)

						var_59_4:setPreferredSize(var_59_3:getContentSize())

						local var_59_5 = CCSprite:create("res/ui/activity/gemsActivity/gemeffect/gemeffectsmall_1.png")

						var_59_4:addChild(var_59_5)
						var_59_5:setPosition(ccp(71, 86))
						var_59_4:setPosition(ccp(75, 100))
						arg_57_0.ui.uiTable.GemMineNumBoard:addChild(var_59_4, 210)

						local var_59_6, var_59_7 = arg_57_0.ui.uiTable["GemMine_" .. arg_57_1]:getPosition()
						local var_59_8 = CCSprite:create("res/ui/activity/gemsActivity/gemeffect/gemeffectbig_1.png")

						var_59_8:setAnchorPoint(ccp(0.5, 0.5))
						var_59_4:addChild(var_59_8, -1)
						var_59_8:setPosition(ccp(69, 76))
						var_59_4:setPosition(ccp(var_59_6, var_59_7))

						local var_59_9 = CCArray:create()
						local var_59_10 = CCMoveTo:create(0.4, ccp(464, 300))
						local var_59_11 = CCScaleBy:create(0.4, 2)
						local var_59_12 = var_59_11:reverse()

						var_59_9:addObject(var_59_10)
						var_59_9:addObject(var_59_11)
						var_59_9:addObject(var_59_12)

						local var_59_13 = CCArray:create()
						local var_59_14 = CCFadeOut:create(2)
						local var_59_15 = CCFadeIn:create(1)

						var_59_13:addObject(var_59_15)
						var_59_13:addObject(var_59_14)

						local var_59_16 = CCArray:create()
						local var_59_17 = CCFadeOut:create(2)
						local var_59_18 = CCRotateBy:create(0.4, 90)
						local var_59_19 = CCRotateBy:create(0.4, 90)
						local var_59_20 = CCRotateBy:create(0.4, 90)
						local var_59_21 = CCRotateBy:create(0.4, 90)

						var_59_16:addObject(var_59_18)
						var_59_16:addObject(var_59_19)
						var_59_16:addObject(var_59_20)
						var_59_16:addObject(var_59_21)

						local var_59_22 = CCFadeOut:create(3)
						local var_59_23 = CCSequence:create(var_59_9)
						local var_59_24 = CCSequence:create(var_59_13)
						local var_59_25 = CCSequence:create(var_59_16)

						var_59_4:runAction(CCRepeat:create(var_59_23, 1))
						var_59_8:runAction(CCRepeat:create(var_59_24, 1))
						var_59_5:runAction(CCRepeatForever:create(var_59_25))

						local function var_59_26()
							log.info("@@@@@@@@@@@@@@@@@@@", arg_57_0.data.hammers[arg_57_1].num)

							if arg_57_0.data.hammers[arg_57_1].num == 0 then
								var_57_1 = true

								local var_60_0 = {
									{}
								}

								var_60_0[1].id = 7
								var_60_0[1].value = arg_57_0.data.hammers[arg_57_1].gemNum
								var_60_0[1].gemLevel = arg_57_0.data.hammers[arg_57_1].gemId

								globalAction_gotResource(var_60_0)
								var_59_4:runAction(CCFadeOut:create(1))

								var_0_2 = false

								arg_57_0:getActivityInfo()
							end
						end

						var_59_4:addHandleOfControlEvent(var_59_26, CCControlEventTouchUpInside)
					else
						arg_57_0:getActivityInfo()
					end
				end
			end

			cmgr.sendRequest(var_58_0, actions.getpickUpGemInfo, arg_57_1)
		end

		var_57_4:addHandleOfControlEvent(var_57_7, CCControlEventTouchUpInside)
	end
end

function var_0_0.scalfunction(arg_61_0, arg_61_1)
	local var_61_0 = CCArray:create()
	local var_61_1 = CCScaleBy:create(0.4, 1.4)
	local var_61_2 = var_61_1:reverse()

	var_61_0:addObject(var_61_1)
	var_61_0:addObject(var_61_2)

	local var_61_3 = CCSequence:create(var_61_0)

	arg_61_1:runAction(CCRepeat:create(var_61_3, 1))
end

function var_0_0.UpdataGemMineNum(arg_62_0, arg_62_1)
	local function var_62_0(arg_63_0)
		arg_62_0.ui.uiTable.PickupGemTit:setVisible(true)
		arg_62_0.ui.uiTable.ClickGemMineNumleft:setVisible(false)
		arg_62_0.ui.uiTable.ClickGemMineNumTit:setVisible(false)
		arg_62_0.ui.uiTable.ClickGemMine:setVisible(false)

		if arg_63_0.action.data.num > 0 then
			arg_62_0.data.hammers[arg_62_1].num = arg_62_0.data.hammers[arg_62_1].num - 1

			arg_62_0.ui.uiTable["HammerGemLeft_" .. arg_62_1]:setString(tostring(arg_62_0.data.hammers[arg_62_1].num))
		end

		if arg_63_0.action.data.num > 10 then
			arg_62_0.data.gemHeap = 10
		else
			arg_62_0.data.gemHeap = arg_63_0.action.data.num
		end
	end

	cmgr.sendRequest(var_62_0, actions.knockgemmine, arg_62_1)
end

function var_0_0.GetHammerActive(arg_64_0, arg_64_1)
	function handlerAction(arg_65_0)
		arg_64_0.ui.uiTable.ClickGemMineNumleft:setString(tostring(arg_65_0.action.data.hammer))
		arg_64_0.ui.uiTable.GemMineNumBoard:setVisible(true)
		arg_64_0:scalfunction(arg_64_0.ui.uiTable.ClickGemMineNumleft)
		arg_64_0:scalfunction(arg_64_0.ui.uiTable.ClickGemMineNumTit)
		arg_64_0:scalfunction(arg_64_0.ui.uiTable.ClickGemMine)
	end

	cmgr.sendRequest(handlerAction, actions.getHammerActive, arg_64_1)
end

function var_0_0.showGemMineTips(arg_66_0, arg_66_1, arg_66_2, arg_66_3, arg_66_4)
	if arg_66_0.tips and not tolua.isnull(arg_66_0.tips) then
		arg_66_0.tips:removeFromParentAndCleanup(true)

		arg_66_0.tips = nil
	end

	local var_66_0 = arg_66_0.ui.uiTable["GemMine_" .. arg_66_1]
	local var_66_1 = {
		anchorPointX = 0.5,
		name = "frame",
		type = "pic_9_tips",
		pic = "frame:autoSizePanel.png",
		y = 515,
		anchorPointY = 0,
		x = 910,
		middleRect = CCRectMake(10, 10, 60, 60),
		content = {
			{
				fontSize = 22,
				height = 0,
				type = "label",
				width = 300,
				text = language.get(135003, arg_66_2, arg_66_3, arg_66_4),
				align = kCCTextAlignmentLeft
			}
		}
	}
	local var_66_2 = {}

	autoUI.createUI(nil, var_66_1, var_66_2)
	var_66_2.frame:setPosition(ccp(70, 115))
	arg_66_0.ui.uiTable["GemMine_" .. arg_66_1]:addChild(var_66_2.frame, 110)

	arg_66_0.tips = var_66_2.frame
end

function var_0_0.onEnter(arg_67_0)
	arg_67_0.updateRef = handler(arg_67_0, arg_67_0.updateQuenchingEquip)
	arg_67_0.refreshRef = handler(arg_67_0, arg_67_0.getActivityInfo)

	eventManager.registerEvent("quenchingOrderReady", arg_67_0.updateRef)
	eventManager.registerEvent("getActivityInfo", arg_67_0.refreshRef)
end

function var_0_0.onExit(arg_68_0)
	eventManager.unregisterEvent("quenchingOrderReady", arg_68_0.updateRef)
	eventManager.unregisterEvent("getActivityInfo", arg_68_0.refreshRef)
end

return var_0_0
