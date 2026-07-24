local var_0_0 = class("HuizhanNotice", function()
	return createBaseLayer()
end)

function var_0_0.getForceFrame(arg_2_0, arg_2_1)
	local var_2_0

	if arg_2_1 == 1 then
		var_2_0 = "nation_flag_blue.png"
	elseif arg_2_1 == 2 then
		var_2_0 = "nation_flag_red.png"
	elseif arg_2_1 == 3 then
		var_2_0 = "nation_flag_green.png"
	end

	log.info("@@ 势力战旗 ", arg_2_1, var_2_0)

	if var_2_0 then
		local var_2_1 = CCSprite:create("res/ui/playerInfo/" .. var_2_0)

		if var_2_1 then
			return var_2_1:displayFrame()
		end
	end
end

function var_0_0.ctor(arg_3_0, arg_3_1)
	require("lua/common/CCBNode"):create(arg_3_0)

	arg_3_0.data = arg_3_1

	if arg_3_1.winLose then
		for iter_3_0, iter_3_1 in pairs(arg_3_1.winLose) do
			local var_3_0 = arg_3_0:getForceFrame(iter_3_1.forceId)
			local var_3_1 = user.forceIdToName[iter_3_1.forceId]

			if var_3_0 then
				arg_3_0["flag_" .. iter_3_0]:setDisplayFrame(var_3_0)
				arg_3_0["succPro" .. iter_3_0]:setString(iter_3_1.winningPercentage)
				arg_3_0["succNum" .. iter_3_0]:setString(iter_3_1.winNum)

				local var_3_2 = CCLabelTTF:create(var_3_1, "", 60)

				tool.fixLabelByWidth(var_3_2, 100)
				var_3_2:setColor(colorForce[0])
				var_3_2:setPosition(85, 150)
				arg_3_0["flag_" .. iter_3_0]:addChild(var_3_2)
			end
		end
	end

	arg_3_0.date:setString(arg_3_1.hzDate)
	arg_3_0.time:setString(arg_3_1.hzTime)
	arg_3_0.cityNameLabel:setString(arg_3_1.cityName)
	arg_3_0.attExpNum:setString(tostring(arg_3_1.attTitleRewardExp))
	arg_3_0.attIronNum:setString(tostring(arg_3_1.attTitleRewardIron))
	arg_3_0.attSuccExpNum:setString(tostring(arg_3_1.attWinRewardExp))
	arg_3_0.attSuccIronNum:setString(tostring(arg_3_1.attWinRewardIron))
	arg_3_0.defExpNum:setString(tostring(arg_3_1.defTitleRewardExp))
	arg_3_0.defIronNum:setString(tostring(arg_3_1.defTitleRewardIron))
	arg_3_0.defSuccExpNum:setString(tostring(arg_3_1.defWinRewardExp))
	arg_3_0.defSuccIronNum:setString(tostring(arg_3_1.defWinRewardIron))

	if conf.language == "vie" then
		arg_3_0.date:setPosition(ccp(arg_3_0.date:getPositionX() + 70, arg_3_0.date:getPositionY()))
		arg_3_0.time:setPosition(ccp(arg_3_0.time:getPositionX() - 150, arg_3_0.time:getPositionY()))
		arg_3_0.rewardTipBtn:setPosition(ccp(arg_3_0.rewardTipBtn:getPositionX() + 70, arg_3_0.rewardTipBtn:getPositionY()))
	end

	if conf.language == "tha" then
		arg_3_0.rewardTipBtn:setPosition(ccp(arg_3_0.rewardTipBtn:getPositionX() + 70, arg_3_0.rewardTipBtn:getPositionY()))

		for iter_3_2 = 1, 3 do
			arg_3_0["succPro" .. iter_3_2]:setPosition(ccp(arg_3_0["succPro" .. iter_3_2]:getPositionX() + 15, arg_3_0["succPro" .. iter_3_2]:getPositionY()))
			arg_3_0["percent" .. iter_3_2]:setPosition(ccp(arg_3_0["percent" .. iter_3_2]:getPositionX() + 20, arg_3_0["percent" .. iter_3_2]:getPositionY()))
		end
	end
end

function var_0_0.onTipsClick(arg_4_0)
	log.info("@@ 显示会战规则")

	local var_4_0 = require("lua/component/TipPanel")

	if conf.language == "vie" then
		var_4_0:createWithStyle(arg_4_0, {
			language.get(460001),
			language.get(460002),
			language.get(460003),
			language.get(460004),
			language.get(460005),
			language.get(460006)
		}, "2")
		var_4_0:setPosition(ccp(1030, 518))
	else
		var_4_0:create(arg_4_0, {
			language.get(460001),
			language.get(460002),
			language.get(460003),
			language.get(460004),
			language.get(460005),
			language.get(460006)
		})
		var_4_0:setPosition(ccp(914, 518))
	end
end

function var_0_0.onRewardTipsClick(arg_5_0)
	local var_5_0 = {}

	if conf.language == "vie" then
		tipFrameWidth = 150
		winRewardLabelX = 100
	else
		tipFrameWidth = 0
		winRewardLabelX = 0
	end

	log.info("@@ 显示奖励tip")

	local var_5_1 = 700 + tipFrameWidth
	local var_5_2 = 274
	local var_5_3 = require("lua/component/TipPanel")

	var_5_3:createEmpty(arg_5_0, var_5_1, var_5_2)

	local var_5_4 = CCLabelTTF:create(language.get(460010), "Thonburi", 24)

	var_5_4:setAnchorPoint(ccp(0, 0.5))
	var_5_4:setPosition(ccp(17, var_5_2 - 29))
	var_5_3:addChild(var_5_4)

	local var_5_5 = CCLabelTTF:create(language.get(460011), "Thonburi", 24)

	var_5_5:setAnchorPoint(ccp(0, 0.5))
	var_5_5:setPosition(ccp(17, var_5_2 - 71))
	var_5_3:addChild(var_5_5)

	local var_5_6 = CCLabelTTF:create(language.get(460012), "Thonburi", 24)

	var_5_6:setAnchorPoint(ccp(0, 0.5))
	var_5_6:setPosition(ccp(167, var_5_2 - 71))
	var_5_3:addChild(var_5_6)

	local var_5_7 = CCLabelTTF:create(language.get(460013), "Thonburi", 24)

	var_5_7:setAnchorPoint(ccp(0, 0.5))
	var_5_7:setPosition(ccp(440 + winRewardLabelX, var_5_2 - 71))
	var_5_3:addChild(var_5_7)

	local var_5_8 = var_5_2 - 100

	if arg_5_0.data and arg_5_0.data.hzTopRewardTips then
		for iter_5_0, iter_5_1 in pairs(arg_5_0.data.hzTopRewardTips) do
			local var_5_9 = CCLabelTTF:create(iter_5_1.hzLvName, "Thonburi", 24)

			var_5_9:setAnchorPoint(ccp(0, 0.5))
			var_5_9:setPosition(ccp(17, var_5_8))

			local var_5_10 = colorQuality[iter_5_0 + 1]

			if var_5_10 then
				var_5_9:setColor(var_5_10)
			end

			var_5_3:addChild(var_5_9)

			local var_5_11 = language.get(460014, iter_5_1.titleRewardExp, iter_5_1.titleRewardIron)
			local var_5_12 = CCLabelTTF:create(var_5_11, "Thonburi", 24)

			var_5_12:setAnchorPoint(ccp(0, 0.5))
			var_5_12:setPosition(ccp(167, var_5_8))
			var_5_3:addChild(var_5_12)

			local var_5_13 = language.get(460014, iter_5_1.winRewardExp, iter_5_1.winRewardIron)
			local var_5_14 = CCLabelTTF:create(var_5_13, "Thonburi", 24)

			var_5_14:setAnchorPoint(ccp(0, 0.5))
			var_5_14:setPosition(ccp(440 + winRewardLabelX, var_5_8))
			var_5_3:addChild(var_5_14)

			var_5_8 = var_5_8 - 12 - 17
		end
	end

	local var_5_15 = CCLabelTTF:create(language.get(460015), "Thonburi", 24)

	var_5_15:setAnchorPoint(ccp(0, 0.5))
	var_5_15:setPosition(ccp(17, var_5_8))
	var_5_3:addChild(var_5_15)
	var_5_3:setPosition(ccp(914, 518))
end

return var_0_0
