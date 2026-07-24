local var_0_0 = class("HuizhanTask", function()
	return createBaseLayer()
end)

function var_0_0.getForceNameAndColor(arg_2_0, arg_2_1)
	if arg_2_1 == 1 then
		return language.get(460037, user.forceIdToName[1]), "#90C8F8"
	elseif arg_2_1 == 2 then
		return language.get(460037, user.forceIdToName[2]), "#EB9642"
	else
		return language.get(460037, user.forceIdToName[3]), "#88D442"
	end
end

function var_0_0.getHuizhanForceNumbar(arg_3_0, arg_3_1)
	local var_3_0 = "huizhan_bar_hese.png"

	if arg_3_0.data.hzLv == 1 then
		var_3_0 = "huizhan_bar_lanzhu.png"
	elseif arg_3_0.data.hzLv == 2 then
		var_3_0 = "huizhan_bar_lvzhu.png"
	elseif arg_3_0.data.hzLv == 3 then
		var_3_0 = "huizhan_bar_huangzhu.png"
	elseif arg_3_0.data.hzLv == 4 then
		var_3_0 = "huizhan_bar_hongzhu.png"
	elseif arg_3_0.data.hzLv == 5 then
		var_3_0 = "huizhan_bar_zizhu.png"
	end

	log.info("@@ 会战柱子颜色 ", arg_3_0.data.hzLv, var_3_0)

	local var_3_1 = CCNode:create()
	local var_3_2 = 0
	local var_3_3 = 0

	for iter_3_0, iter_3_1 in pairs(arg_3_0.data.hzLvList) do
		local var_3_4 = CCSprite:createWithSpriteFrameName(var_3_0)

		var_3_4:setAnchorPoint(ccp(0.5, 0))
		var_3_4:setPosition(ccp(0, var_3_2))
		var_3_1:addChild(var_3_4)

		local var_3_5 = iter_3_1.hzLvNum * 10000

		if arg_3_1 < var_3_5 then
			local var_3_6 = (arg_3_1 - var_3_3) / (var_3_5 - var_3_3)

			var_3_4:setScaleY(var_3_6)

			var_3_2 = var_3_2 + 34 * var_3_6

			break
		else
			var_3_2 = var_3_2 + var_3_4:getContentSize().height
		end

		var_3_3 = var_3_5
	end

	if var_3_2 < 34 then
		var_3_2 = 34
	end

	return var_3_1, var_3_2
end

function var_0_0.ctor(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = {}

	if conf.language == "vie" then
		var_4_0.countDownTimerX = 100
	else
		var_4_0.countDownTimerX = 0
	end

	require("lua/common/CCBNode"):create(arg_4_0)

	arg_4_0.data = arg_4_2

	local var_4_1 = arg_4_0["task_title_" .. arg_4_2.taskType]

	if var_4_1 then
		var_4_1:setVisible(true)
	end

	local var_4_2 = {
		arg_4_2.attForceId1,
		arg_4_2.attForceId2,
		arg_4_2.defForceId
	}

	for iter_4_0 = 1, 3 do
		local var_4_3 = arg_4_0["force" .. iter_4_0]
		local var_4_4 = var_4_3:getContentSize()

		var_4_3:setOpacity(0)

		local var_4_5 = CCLabelTTF:create(user.forceIdToName[var_4_2[iter_4_0]], "", 25)

		var_4_5:setColor(colorForce[var_4_2[iter_4_0]])
		var_4_5:setPosition(var_4_4.width * 0.5, var_4_4.height * 0.5)
		var_4_3:addChild(var_4_5)
	end

	if arg_4_2.taskType == 1 then
		arg_4_0.coutDown:setString(language.get(460035))
	else
		arg_4_0.coutDown:setString(language.get(460036))
	end

	if arg_4_2.countDown and arg_4_2.countDown > 0 then
		local var_4_6 = createTimerLabel(arg_4_2.countDown, "@M:@S", "Thonburi", 24, nil, nil, nil, colorTips.red)

		var_4_6:setPosition(ccp(150 + var_4_0.countDownTimerX, 12))
		arg_4_0.coutDown:addChild(var_4_6)
		arg_4_0.coutDown:setVisible(true)
	end

	local var_4_7, var_4_8 = arg_4_0:getForceNameAndColor(arg_4_2.attForceId1)
	local var_4_9, var_4_10 = arg_4_0:getForceNameAndColor(arg_4_2.attForceId2)
	local var_4_11, var_4_12 = arg_4_0:getForceNameAndColor(arg_4_2.defForceId)
	local var_4_13

	if conf.language == "vie" then
		var_4_13 = language.get(460016, var_4_8, " " .. var_4_7 .. " ", var_4_10, var_4_9 .. " ", var_4_12, " " .. var_4_11 .. " ", " " .. arg_4_2.cityName .. " ")
	else
		var_4_13 = language.get(460016, var_4_8, var_4_7, var_4_10, var_4_9, var_4_12, var_4_11, arg_4_2.cityName)
	end

	local var_4_14 = require("lua/component/HtmlView")
	local var_4_15 = var_4_14:create({
		rowWidth = 420,
		htmlText = var_4_13
	})

	arg_4_0.taskDesLabel:addChild(var_4_15)

	local var_4_16

	if arg_4_2.taskType == 1 then
		var_4_16 = language.get(460030, arg_4_2.selfForce)
	else
		local var_4_17 = language.get(460020 + arg_4_2.selfForceId)

		var_4_16 = language.get(460017, var_4_17, arg_4_2.nationKillNum)
	end

	log.info(var_4_16)
	arg_4_0.nationKillNum:setString(var_4_16)
	arg_4_0.curRankLabel:setString(language.get(460018, arg_4_2.rank))

	if arg_4_2.titlePic == "" then
		arg_4_2.titlePic = "weishanbang"
	end

	local var_4_18 = string.format("huizhan_text_%s.png", arg_4_2.titlePic)

	log.info("@@ rank pic ", var_4_18)

	local var_4_19 = CCSprite:createWithSpriteFrameName(var_4_18)

	if var_4_19 then
		arg_4_0.rankTitleSprite:setDisplayFrame(var_4_19:displayFrame())
	end

	if arg_4_2.taskType == 1 then
		arg_4_0.phantomNumLabel:setString(language.get(460031, arg_4_2.phantomNum))
	elseif arg_4_2.winOrLose == 0 then
		arg_4_0.phantomNumLabel:setString(language.get(460027))
		arg_4_0.battleRet_0:setVisible(true)
	else
		arg_4_0.phantomNumLabel:setString(language.get(460025))
	end

	if arg_4_2.canGetReward then
		arg_4_0.rewardButton:setVisible(true)
	end

	local var_4_20 = false

	if arg_4_2.rankRewardFood then
		arg_4_0.jijieTaskRewardNode:setVisible(true)
		arg_4_0.rankRewardFoodLabel:setString(arg_4_2.rankRewardFood)

		var_4_20 = true
	end

	if arg_4_2.phantomRewardExp and arg_4_2.phantomRewardExp > 0 then
		arg_4_0.phantomRewardNode:setVisible(true)
		arg_4_0.phantomRewardNumLabel:setString(arg_4_2.phantomRewardExp)

		var_4_20 = true
	end

	if arg_4_2.battleRewardExp and arg_4_2.battleRewardIron and arg_4_2.battleRewardExp > 0 and arg_4_2.battleRewardIron > 0 then
		arg_4_0.rankRewardLayer:setVisible(true)
		arg_4_0.rankExpRewardNumLabel:setString(tostring(arg_4_2.battleRewardExp))
		arg_4_0.rankIronRewardNumLabel:setString(tostring(arg_4_2.battleRewardIron))

		var_4_20 = true
	end

	if arg_4_2.rankRewardExp and arg_4_2.rankRewardIron and arg_4_2.rankRewardExp > 0 and arg_4_2.rankRewardIron > 0 then
		arg_4_0.battleRewardLayer:setVisible(true)
		arg_4_0.battleExpRewardNumLabel:setString(tostring(arg_4_2.rankRewardExp))
		arg_4_0.battleIronRewardNumLabel:setString(tostring(arg_4_2.rankRewardIron))

		var_4_20 = true
	end

	if not var_4_20 then
		arg_4_0.noReward:setVisible(true)
	end

	local var_4_21

	if arg_4_2.taskType == 1 then
		var_4_21 = language.get(460019, arg_4_2.forceNeed)
	else
		var_4_21 = language.get(460020, arg_4_2.nextLvNum)
	end

	if conf.language == "vie" then
		local var_4_22 = var_4_14:create({
			rowHeight = 0,
			anchorX = 0.5,
			rowWidth = 220,
			singleLine = false,
			htmlText = var_4_21
		})

		var_4_22:setPosition(ccp(60, 60))
		arg_4_0.forceNeedBg:addChild(var_4_22)
	else
		local var_4_23 = var_4_14:create({
			anchorX = 0.5,
			singleLine = true,
			htmlText = var_4_21
		})

		var_4_23:setPosition(ccp(161, 19.5))
		arg_4_0.forceNeedBg:addChild(var_4_23)
	end

	local var_4_24 = arg_4_0["huizhanLv_" .. arg_4_2.hzLv]

	if var_4_24 then
		var_4_24:setVisible(true)
	end

	if arg_4_2.hzLv > 1 then
		arg_4_0.lvPointer:setPosition(ccp(168, 76 + (arg_4_2.hzLv - 1) * 34))

		if arg_4_2.taskType == 2 then
			for iter_4_1 = 1, arg_4_2.hzLv - 1 do
				local var_4_25 = arg_4_0["huizhan_lv_text_" .. iter_4_1]

				if var_4_25 then
					var_4_25:setVisible(false)
				end
			end
		end
	end

	local var_4_26, var_4_27 = arg_4_0:getHuizhanForceNumbar(arg_4_2.attForce1 + arg_4_2.attForce2)

	var_4_26:setPosition(ccp(94, 32))
	arg_4_0.forceNumLayer:addChild(var_4_26)
	arg_4_0.attNum:setString(string.format("%s" .. language.get(95022), math.ceil((arg_4_2.attForce1 + arg_4_2.attForce2) / 10000)))
	arg_4_0.attNum:setPosition(ccp(94, var_4_27 + 12 + 32))

	local var_4_28, var_4_29 = arg_4_0:getHuizhanForceNumbar(arg_4_2.defForce)

	var_4_28:setPosition(ccp(157, 32))
	arg_4_0.forceNumLayer:addChild(var_4_28)
	arg_4_0.defNum:setString(string.format("%s" .. language.get(95022), math.ceil(arg_4_2.defForce / 10000)))
	arg_4_0.defNum:setPosition(ccp(157, var_4_29 + 12 + 32))

	if conf.language ~= "xm" then
		arg_4_0.taskDescLabel:setString(language.get(400049))
		arg_4_0.gatherRank:setString(language.get(400050))
		arg_4_0.gatherReward:setString(language.get(400051))
		tool.redefineCCControlButtonText(arg_4_0.rewardButton, language.get(400052))

		if conf.language == "kr" then
			arg_4_0.taskDesLabel:setPosition(ccp(arg_4_0.taskDesLabel:getPositionX(), arg_4_0.taskDesLabel:getPositionY() + 10))
		end

		if conf.language == "vie" then
			arg_4_0.taskDesLabel:setPosition(ccp(arg_4_0.taskDesLabel:getPositionX(), arg_4_0.taskDesLabel:getPositionY() + 10))
			tool.redefineCCControlButtenTextSize(arg_4_0.rewardButton, 18)
			arg_4_0.attNum:setFontSize(14)
			arg_4_0.defNum:setFontSize(14)
		end
	end
end

function var_0_0.getReward(arg_5_0)
	log.info("@@ 领取奖励")

	local function var_5_0(arg_6_0)
		local var_6_0 = arg_6_0.data or arg_6_0.action.data
		local var_6_1 = {}

		if var_6_0.battleRewardExp then
			table.insert(var_6_1, {
				id = 6,
				value = var_6_0.battleRewardExp
			})
		end

		if var_6_0.battleRewardIron then
			table.insert(var_6_1, {
				id = 4,
				value = var_6_0.battleRewardIron
			})
		end

		if var_6_0.rankRewardExp then
			table.insert(var_6_1, {
				id = 6,
				value = var_6_0.rankRewardExp
			})
		end

		if var_6_0.rankRewardIron then
			table.insert(var_6_1, {
				id = 4,
				value = var_6_0.rankRewardIron
			})
		end

		if var_6_0.rankRewardFood then
			table.insert(var_6_1, {
				id = 3,
				value = var_6_0.rankRewardFood
			})
		end

		if var_6_0.phantomRewardExp then
			table.insert(var_6_1, {
				id = 6,
				value = var_6_0.phantomRewardExp
			})
		end

		globalAction_gotResource(var_6_1)
		eventManager.dispatchEvent("onRefreshHuizhanPanel")
	end

	cmgr.sendRequest(var_5_0, actions.huizhanGetReward)
end

return var_0_0
