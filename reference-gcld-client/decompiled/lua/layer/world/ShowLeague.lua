showLeague = {}

local var_0_0 = 2021
local var_0_1 = 2022
local var_0_2 = 2023

function showLeague.showLeagueAction()
	local var_1_0 = smgr.getLayer("tipLayer")
	local var_1_1 = createBaseLayer()
	local var_1_2 = CCSprite:create("res/ui/world/league/jm_bg.png")

	var_1_2:setPosition(ccp(visibleSize.width * 0.5, visibleSize.height * 0.5))
	var_1_1:addChild(var_1_2)

	local function var_1_3(arg_2_0, arg_2_1, arg_2_2)
		log.info("showLeague onTouch")

		if arg_2_0 == CCTOUCHBEGAN then
			return true
		elseif arg_2_0 == CCTOUCHMOVED then
			return true
		elseif arg_2_0 == CCTOUCHENDED then
			var_1_0:removeChild(var_1_1, true)

			return true
		end
	end

	var_1_1:registerScriptTouchHandler(var_1_3, false, true)
	var_1_1:setTouchEnabled(true)
	var_1_0:addChild(var_1_1, 1000)

	if conf.language == "kr" then
		showLeague.addTitleKr(var_1_2)
	else
		showLeague.addTitle(var_1_2)
	end

	showLeague.addWord(var_1_2)
	showLeague.addMap(var_1_2)

	local function var_1_4()
		var_1_0:removeChild(var_1_1, true)
	end

	local function var_1_5()
		showLeague.addInfo(var_1_2)
	end

	local var_1_6 = CCArray:create()

	var_1_6:addObject(CCFadeIn:create(0.5))
	var_1_6:addObject(CCDelayTime:create(4))
	var_1_6:addObject(CCCallFuncN:create(var_1_5))
	var_1_6:addObject(CCDelayTime:create(4))
	var_1_6:addObject(CCFadeOut:create(0.5))
	var_1_6:addObject(CCCallFuncN:create(var_1_4))

	local var_1_7 = CCSequence:create(var_1_6)

	var_1_1:runAction(var_1_7)
end

function showLeague.addTitle(arg_5_0)
	local function var_5_0(arg_6_0)
		if arg_6_0 == 1 then
			return "res/ui/world/league/jm_title_wei.png"
		elseif arg_6_0 == 2 then
			return "res/ui/world/league/jm_title_shu.png"
		else
			return "res/ui/world/league/jm_title_wu.png"
		end
	end

	if worldControl.league then
		local var_5_1

		if worldControl.league.type == 1 then
			if user.player.forceId ~= worldControl.league.first then
				local var_5_2
				local var_5_3

				if user.player.forceId == worldControl.league.second then
					var_5_2 = user.forceIdToName[worldControl.league.third]
				else
					var_5_2 = user.forceIdToName[worldControl.league.second]
				end

				local var_5_4 = user.forceIdToName[worldControl.league.first]

				var_5_1 = language.get(470018, var_5_2, var_5_4)
			else
				local var_5_5 = user.forceIdToName[worldControl.league.second]
				local var_5_6 = user.forceIdToName[worldControl.league.third]

				var_5_1 = language.get(470019, var_5_5, var_5_6)
			end
		elseif worldControl.league.type == 2 then
			var_5_1 = language.get(470020)
		end

		local var_5_7 = CCStrokeLabelTTF:create(var_5_1, "", 35)

		var_5_7:setColor(ccc3(230, 200, 150))
		var_5_7:setPosition(ccp(arg_5_0:getContentSize().width / 2, arg_5_0:getContentSize().height - 10))
		arg_5_0:addChild(var_5_7)
	end
end

local function var_0_3(arg_7_0)
	local function var_7_0()
		arg_7_0:setVisible(false)
	end

	local var_7_1 = CCArray:create()

	var_7_1:addObject(CCDelayTime:create(4))
	var_7_1:addObject(CCFadeOut:create(0.5))
	var_7_1:addObject(CCCallFuncN:create(var_7_0))

	return (CCSequence:create(var_7_1))
end

local function var_0_4(arg_9_0)
	local function var_9_0()
		arg_9_0:setVisible(true)
	end

	local var_9_1 = CCArray:create()

	var_9_1:addObject(CCCallFuncN:create(var_9_0))
	var_9_1:addObject(CCFadeIn:create(0.5))

	return (CCSequence:create(var_9_1))
end

function showLeague.addWord(arg_11_0)
	local var_11_0 = CCSprite:create("res/ui/world/league/jm_tit_bg.png")
	local var_11_1 = CCSprite:create("res/ui/world/league/jm_tit_bg.png")
	local var_11_2 = CCSprite:create("res/ui/world/league/jm_tit_bg.png")

	var_11_0:setPosition(ccp(arg_11_0:getContentSize().width * 0.3, arg_11_0:getContentSize().height * 0.65))
	var_11_1:setPosition(ccp(arg_11_0:getContentSize().width * 0.35, arg_11_0:getContentSize().height * 0.5))
	var_11_2:setPosition(ccp(arg_11_0:getContentSize().width * 0.4, arg_11_0:getContentSize().height * 0.35))
	arg_11_0:addChild(var_11_0, 100, var_0_0)
	arg_11_0:addChild(var_11_1, 100, var_0_1)
	arg_11_0:addChild(var_11_2, 100, var_0_2)
	var_11_0:runAction(var_0_3(var_11_0))
	var_11_1:runAction(var_0_3(var_11_1))
	var_11_2:runAction(var_0_3(var_11_2))

	if worldControl.league then
		if worldControl.league.type == 1 then
			if user.player.forceId == worldControl.league.first then
				local var_11_3 = {}
				local var_11_4 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.second .. ".png")

				table.insert(var_11_3, var_11_4)

				local var_11_5 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.third .. ".png")

				table.insert(var_11_3, var_11_5)

				local var_11_6 = CCSprite:create("res/ui/world/league/word/jm_word_0011.png")

				table.insert(var_11_3, var_11_6)

				local var_11_7 = createRichNode(var_11_3, 0.5)

				var_11_7:setPosition(ccp(var_11_0:getContentSize().width / 2, var_11_0:getContentSize().height / 2))
				var_11_0:addChild(var_11_7)

				local var_11_8 = CCSprite:create("res/ui/world/league/word/jm_word_0010.png")

				var_11_8:setPosition(ccp(var_11_1:getContentSize().width / 2, var_11_1:getContentSize().height / 2))
				var_11_1:addChild(var_11_8)

				local var_11_9 = CCSprite:create("res/ui/world/league/word/jm_word_0009.png")

				var_11_9:setPosition(ccp(var_11_2:getContentSize().width / 2, var_11_2:getContentSize().height / 2))
				var_11_2:addChild(var_11_9)
			else
				local var_11_10 = {}
				local var_11_11 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.first .. ".png")

				table.insert(var_11_10, var_11_11)

				local var_11_12 = CCSprite:create("res/ui/world/league/word/jm_word_0014.png")

				table.insert(var_11_10, var_11_12)

				local var_11_13 = createRichNode(var_11_10, 0.5)

				var_11_13:setPosition(ccp(var_11_0:getContentSize().width / 2, var_11_0:getContentSize().height / 2))
				var_11_0:addChild(var_11_13)

				local var_11_14 = {}
				local var_11_15 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.second .. ".png")

				table.insert(var_11_14, var_11_15)

				local var_11_16 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.third .. ".png")

				table.insert(var_11_14, var_11_16)

				local var_11_17 = CCSprite:create("res/ui/world/league/word/jm_word_0013.png")

				table.insert(var_11_14, var_11_17)

				local var_11_18 = createRichNode(var_11_14, 0.5)

				var_11_18:setPosition(ccp(var_11_1:getContentSize().width / 2, var_11_1:getContentSize().height / 2))
				var_11_1:addChild(var_11_18)

				local var_11_19 = {}
				local var_11_20 = CCSprite:create("res/ui/world/league/word/jm_word_0012.png")

				table.insert(var_11_19, var_11_20)

				local var_11_21 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.first .. ".png")

				table.insert(var_11_19, var_11_21)

				local var_11_22 = CCSprite:create("res/ui/world/league/word/jm_0000.png")

				table.insert(var_11_19, var_11_22)

				local var_11_23 = createRichNode(var_11_19, 0.5)

				var_11_23:setPosition(ccp(var_11_2:getContentSize().width / 2, var_11_2:getContentSize().height / 2))
				var_11_2:addChild(var_11_23)
			end
		elseif worldControl.league.type == 2 then
			if user.player.forceId == worldControl.league.third then
				local var_11_24 = {}
				local var_11_25 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.first .. ".png")

				table.insert(var_11_24, var_11_25)

				local var_11_26 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.second .. ".png")

				table.insert(var_11_24, var_11_26)

				local var_11_27 = CCSprite:create("res/ui/world/league/word/jm_word_0005.png")

				table.insert(var_11_24, var_11_27)

				local var_11_28 = createRichNode(var_11_24, 0.5)

				var_11_28:setPosition(ccp(var_11_0:getContentSize().width / 2, var_11_0:getContentSize().height / 2))
				var_11_0:addChild(var_11_28)

				local var_11_29 = CCSprite:create("res/ui/world/league/word/jm_word_0004.png")

				var_11_29:setPosition(ccp(var_11_1:getContentSize().width / 2, var_11_1:getContentSize().height / 2))
				var_11_1:addChild(var_11_29)

				local var_11_30 = CCSprite:create("res/ui/world/league/word/jm_word_0003.png")

				var_11_30:setPosition(ccp(var_11_2:getContentSize().width / 2, var_11_2:getContentSize().height / 2))
				var_11_2:addChild(var_11_30)
			else
				local var_11_31 = {}
				local var_11_32 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.third .. ".png")

				table.insert(var_11_31, var_11_32)

				local var_11_33 = CCSprite:create("res/ui/world/league/word/jm_word_0008.png")

				table.insert(var_11_31, var_11_33)

				local var_11_34 = createRichNode(var_11_31, 0.5)

				var_11_34:setPosition(ccp(var_11_0:getContentSize().width / 2, var_11_0:getContentSize().height / 2))
				var_11_0:addChild(var_11_34)

				local var_11_35 = {}

				if user.player.forceId == worldControl.league.first then
					local var_11_36 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.second .. ".png")

					table.insert(var_11_35, var_11_36)

					local var_11_37 = CCSprite:create("res/ui/world/league/word/jm_word_0007.png")

					table.insert(var_11_35, var_11_37)

					local var_11_38 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.second .. ".png")

					table.insert(var_11_35, var_11_38)
				else
					local var_11_39 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.first .. ".png")

					table.insert(var_11_35, var_11_39)

					local var_11_40 = CCSprite:create("res/ui/world/league/word/jm_word_0007.png")

					table.insert(var_11_35, var_11_40)

					local var_11_41 = CCSprite:create("res/ui/world/league/word/jm_000" .. worldControl.league.first .. ".png")

					table.insert(var_11_35, var_11_41)
				end

				local var_11_42 = CCSprite:create("res/ui/world/league/word/jm_0000.png")

				table.insert(var_11_35, var_11_42)

				local var_11_43 = createRichNode(var_11_35, 0.5)

				var_11_43:setPosition(ccp(var_11_1:getContentSize().width / 2, var_11_1:getContentSize().height / 2))
				var_11_1:addChild(var_11_43)

				local var_11_44 = CCSprite:create("res/ui/world/league/word/jm_word_0006.png")

				var_11_44:setPosition(ccp(var_11_2:getContentSize().width / 2, var_11_2:getContentSize().height / 2))
				var_11_2:addChild(var_11_44)
			end
		end
	end
end

function showLeague.addMap(arg_12_0)
	local var_12_0 = ccp(60, 135)
	local var_12_1 = ccp(190, 195)
	local var_12_2 = ccp(190, 75)
	local var_12_3 = {
		["12"] = ccp(125, 165),
		["23"] = ccp(125, 105),
		["13"] = ccp(190, 135),
		["412"] = ccp(125, 145),
		["423"] = ccp(125, 125),
		["413"] = ccp(170, 135)
	}
	local var_12_4 = math.asin(0.46153846153846156) / 3.14 * 180
	local var_12_5 = {
		0 - var_12_4,
		180 - var_12_4,
		var_12_4 - 180,
		var_12_4
	}

	var_12_5[5] = -90
	var_12_5[6] = 90

	local var_12_6 = CCSprite:createWithSpriteFrameName("nationMap.png")

	var_12_6:setPosition(ccp(arg_12_0:getContentSize().width * 0.75, arg_12_0:getContentSize().height * 0.5))
	arg_12_0:addChild(var_12_6, 50)

	local var_12_7 = CCStrokeLabelTTF:create(user.forceIdToName[1], "", 25)
	local var_12_8 = CCStrokeLabelTTF:create(user.forceIdToName[2], "", 25)
	local var_12_9 = CCStrokeLabelTTF:create(user.forceIdToName[3], "", 25)

	var_12_7:setColor(colorForce[1])
	var_12_8:setColor(colorForce[2])
	var_12_9:setColor(colorForce[3])
	var_12_6:addChild(var_12_7)
	var_12_6:addChild(var_12_8)
	var_12_6:addChild(var_12_9)
	var_12_7:setPosition(var_12_1)
	var_12_8:setPosition(var_12_0)
	var_12_9:setPosition(var_12_2)

	local var_12_10 = {}

	if worldControl.league then
		if worldControl.league.type == 1 then
			for iter_12_0 = 1, 2 do
				var_12_10[iter_12_0] = CCSprite:create("res/ui/world/league/jm_jt.png")

				var_12_6:addChild(var_12_10[iter_12_0])
			end

			if worldControl.league.first == 1 then
				var_12_10[1]:setPosition(var_12_3["12"])
				var_12_10[2]:setPosition(var_12_3["13"])
				var_12_10[1]:setRotation(var_12_5[2])
				var_12_10[2]:setRotation(var_12_5[6])
			elseif worldControl.league.first == 2 then
				var_12_10[1]:setPosition(var_12_3["23"])
				var_12_10[2]:setPosition(var_12_3["12"])
				var_12_10[1]:setRotation(var_12_5[4])
				var_12_10[2]:setRotation(var_12_5[1])
			else
				var_12_10[1]:setPosition(var_12_3["13"])
				var_12_10[2]:setPosition(var_12_3["23"])
				var_12_10[1]:setRotation(var_12_5[5])
				var_12_10[2]:setRotation(var_12_5[3])
			end
		elseif worldControl.league.type == 2 then
			for iter_12_1 = 1, 4 do
				var_12_10[iter_12_1] = CCSprite:create("res/ui/world/league/jm_jt.png")

				var_12_6:addChild(var_12_10[iter_12_1])
			end

			var_12_10[1]:setPosition(var_12_3["12"])
			var_12_10[2]:setPosition(var_12_3["13"])
			var_12_10[3]:setPosition(var_12_3["23"])
			var_12_10[4]:setScale(0.7)

			if worldControl.league.third == 1 then
				var_12_10[4]:setPosition(var_12_3["423"])
				var_12_10[1]:setRotation(var_12_5[1])
				var_12_10[2]:setRotation(var_12_5[5])

				if worldControl.league.first == 2 then
					var_12_10[3]:setRotation(var_12_5[3])
					var_12_10[4]:setRotation(var_12_5[4])
				else
					var_12_10[3]:setRotation(var_12_5[4])
					var_12_10[4]:setRotation(var_12_5[3])
				end
			elseif worldControl.league.third == 2 then
				var_12_10[4]:setPosition(var_12_3["413"])
				var_12_10[1]:setRotation(var_12_5[2])
				var_12_10[3]:setRotation(var_12_5[3])

				if worldControl.league.first == 1 then
					var_12_10[2]:setRotation(var_12_5[5])
					var_12_10[4]:setRotation(var_12_5[6])
				else
					var_12_10[2]:setRotation(var_12_5[6])
					var_12_10[4]:setRotation(var_12_5[5])
				end
			else
				var_12_10[4]:setPosition(var_12_3["412"])
				var_12_10[2]:setRotation(var_12_5[6])
				var_12_10[3]:setRotation(var_12_5[4])

				if worldControl.league.first == 1 then
					var_12_10[1]:setRotation(var_12_5[1])
					var_12_10[4]:setRotation(var_12_5[2])
				else
					var_12_10[1]:setRotation(var_12_5[2])
					var_12_10[4]:setRotation(var_12_5[1])
				end
			end
		end
	end
end

function showLeague.addInfo(arg_13_0)
	local var_13_0 = CCSprite:create("res/ui/world/league/jm_tit_bg.png")
	local var_13_1 = CCSprite:create("res/ui/world/league/jm_tit_bg.png")
	local var_13_2 = CCSprite:create("res/ui/world/league/jm_tit_jmh.png")

	var_13_0:setPosition(ccp(arg_13_0:getContentSize().width * 0.35, arg_13_0:getContentSize().height * 0.55))
	var_13_1:setPosition(ccp(arg_13_0:getContentSize().width * 0.35, arg_13_0:getContentSize().height * 0.35))
	var_13_2:setPosition(ccp(arg_13_0:getContentSize().width * 0.2, arg_13_0:getContentSize().height * 0.75))
	arg_13_0:addChild(var_13_0, 100)
	arg_13_0:addChild(var_13_1, 100)
	arg_13_0:addChild(var_13_2, 100)
	var_13_0:setVisible(false)
	var_13_1:setVisible(false)

	local var_13_3 = var_13_0:getContentSize().height + 5
	local var_13_4 = 1023
	local var_13_5 = 1024
	local var_13_6 = 1025
	local var_13_7 = 1026
	local var_13_8 = 1027

	for iter_13_0 = 1, 2 do
		local var_13_9 = CCStrokeLabelTTF:create("", "", 25)

		var_13_9:setPosition(ccp(50, var_13_3 / 2))

		local var_13_10 = CCSprite:create("res/ui/world/league/jm_jt_vs.png")

		var_13_10:setPosition(ccp(100, var_13_3 / 2))

		local var_13_11 = CCStrokeLabelTTF:create("", "", 25)

		var_13_11:setPosition(ccp(150, var_13_3 / 2))

		local var_13_12 = CCSprite:create("res/ui/world/league/jm_tit_exp.png")

		var_13_12:setPosition(ccp(250, var_13_3 / 2))

		local var_13_13 = CCSprite:create("res/ui/world/league/jm_jt_small_02.png")

		var_13_13:setPosition(ccp(300, var_13_3 / 2))

		local var_13_14 = CCSprite:create("res/ui/world/league/jm_tit_jycp.png")

		var_13_14:setPosition(ccp(350, var_13_3 / 2))

		local var_13_15 = CCStrokeLabelTTF:create("+40", "Thonburi-Bold", 24, 2, ccc3(13, 13, 13))

		var_13_15:setColor(ccc3(0, 255, 0))
		var_13_15:setPosition(ccp(350, var_13_3 / 2))

		if iter_13_0 == 1 then
			var_13_0:addChild(var_13_9, 0, var_13_4)
			var_13_0:addChild(var_13_10)
			var_13_0:addChild(var_13_11, 0, var_13_5)
			var_13_0:addChild(var_13_12)
			var_13_0:addChild(var_13_13, 0, var_13_6)
			var_13_0:addChild(var_13_14, 0, var_13_7)
			var_13_0:addChild(var_13_15, 0, var_13_8)
		else
			var_13_1:addChild(var_13_9, 0, var_13_4)
			var_13_1:addChild(var_13_10)
			var_13_1:addChild(var_13_11, 0, var_13_5)
			var_13_1:addChild(var_13_12)
			var_13_1:addChild(var_13_13, 0, var_13_6)
			var_13_1:addChild(var_13_14, 0, var_13_7)
			var_13_1:addChild(var_13_15, 0, var_13_8)
		end
	end

	if worldControl.league and worldControl.league.effect1 then
		local var_13_16 = var_13_0:getChildByTag(var_13_8)
		local var_13_17 = var_13_1:getChildByTag(var_13_8)
		local var_13_18 = var_13_0:getChildByTag(var_13_6)
		local var_13_19 = var_13_1:getChildByTag(var_13_6)
		local var_13_20 = var_13_0:getChildByTag(var_13_4)
		local var_13_21 = var_13_1:getChildByTag(var_13_4)
		local var_13_22 = var_13_0:getChildByTag(var_13_5)
		local var_13_23 = var_13_1:getChildByTag(var_13_5)
		local var_13_24 = var_13_0:getChildByTag(var_13_7)
		local var_13_25 = var_13_1:getChildByTag(var_13_7)

		var_13_20:setString(user.forceIdToName[user.player.forceId])
		var_13_21:setString(user.forceIdToName[user.player.forceId])
		var_13_20:setColor(colorForce[user.player.forceId])
		var_13_21:setColor(colorForce[user.player.forceId])

		if worldControl.league.type == 1 then
			if user.player.forceId == worldControl.league.first then
				var_13_16:setVisible(false)
				var_13_17:setVisible(false)
				var_13_18:setVisible(false)
				var_13_19:setVisible(false)
				var_13_22:setString(user.forceIdToName[worldControl.league.second])
				var_13_23:setString(user.forceIdToName[worldControl.league.third])
				var_13_22:setColor(colorForce[worldControl.league.second])
				var_13_23:setColor(colorForce[worldControl.league.third])
			else
				var_13_24:setVisible(false)
				var_13_25:setVisible(false)
				var_13_22:setString(user.forceIdToName[worldControl.league.first])
				var_13_22:setColor(colorForce[worldControl.league.first])
				var_13_16:setString("+" .. worldControl.league.effect1 .. "%")
				var_13_16:setColor(ccc3(0, 255, 0))

				if user.player.forceId == worldControl.league.second then
					var_13_23:setString(user.forceIdToName[worldControl.league.third])
					var_13_23:setColor(colorForce[worldControl.league.third])
				else
					var_13_23:setString(user.forceIdToName[worldControl.league.second])
					var_13_23:setColor(colorForce[worldControl.league.second])
				end

				var_13_17:setString("-" .. worldControl.league.effect2 .. "%")
				var_13_17:setColor(ccc3(255, 0, 0))
				var_13_19:setDisplayFrame(CCSprite:create("res/ui/world/league/jm_jt_small_01.png"):displayFrame())
			end
		elseif worldControl.league.type == 2 then
			if user.player.forceId == worldControl.league.third then
				var_13_24:setVisible(false)
				var_13_25:setVisible(false)
				var_13_22:setString(user.forceIdToName[worldControl.league.first])
				var_13_23:setString(user.forceIdToName[worldControl.league.second])
				var_13_22:setColor(colorForce[worldControl.league.first])
				var_13_23:setColor(colorForce[worldControl.league.second])
				var_13_16:setString("+" .. worldControl.league.effect5 .. "%")
				var_13_16:setColor(ccc3(0, 255, 0))
				var_13_17:setString("+" .. worldControl.league.effect5 .. "%")
				var_13_17:setColor(ccc3(0, 255, 0))
			else
				var_13_24:setVisible(false)
				var_13_25:setVisible(false)
				var_13_22:setString(user.forceIdToName[worldControl.league.third])
				var_13_22:setColor(colorForce[worldControl.league.third])
				var_13_16:setString("-" .. worldControl.league.effect4 .. "%")
				var_13_16:setColor(ccc3(255, 0, 0))
				var_13_18:setDisplayFrame(CCSprite:create("res/ui/world/league/jm_jt_small_01.png"):displayFrame())

				if user.player.forceId == worldControl.league.second then
					var_13_23:setString(user.forceIdToName[worldControl.league.first])
					var_13_23:setColor(colorForce[worldControl.league.first])
				else
					var_13_23:setString(user.forceIdToName[worldControl.league.second])
					var_13_23:setColor(colorForce[worldControl.league.second])
				end

				var_13_17:setString("+" .. worldControl.league.effect3 .. "%")
				var_13_17:setColor(ccc3(0, 255, 0))
			end
		end
	end

	var_13_0:runAction(var_0_4(var_13_0))
	var_13_1:runAction(var_0_4(var_13_1))
end
